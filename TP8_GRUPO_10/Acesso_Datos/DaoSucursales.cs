using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Reflection.Emit;
using Entidades;



namespace AccesoDatos
{
    public class DaoSucursales
    {
        ///Atributos de la clase
        private AccesoBD accesoDatos = new AccesoBD();
        private const string consultaBaseSQL = "SELECT Id_Sucursal, NombreSucursal AS Nombre, DescripcionSucursal AS Descripcion, DescripcionProvincia AS Provincia, DireccionSucursal AS Direccion FROM Sucursal INNER JOIN Provincia ON Id_ProvinciaSucursal = Id_Provincia";
        SqlCommand sqlCommand;

        ///----------------------------------------------------------  Funciones de la clase  --------------------------------------------------------------------------

        //Constructor de la clase
        public DaoSucursales() { }

        public DataTable getTablaSucursales()
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("Sucursal", consultaBaseSQL);
            return dataTable;
        }

        public SqlDataReader getListaProvincias()
        {
            SqlDataReader sqlDataReader = accesoDatos.ObtenerLista();
            return sqlDataReader;
        }

        public void ArmarParametro_EliminarSucursal(ref SqlCommand command, Sucursal IDsucursal)
        {
            SqlParameter param = new SqlParameter();
            param = command.Parameters.Add("@Id_Sucursal", SqlDbType.Int);
            param.Value = IDsucursal.IdSucursal;
        }

        public int EliminarSucursal(Sucursal IDsucursal)
        {
            sqlCommand = new SqlCommand();
            ArmarParametro_EliminarSucursal(ref sqlCommand, IDsucursal);
            ValidarOCrearProcedimientoEliminarSucursal();
            int resultado = accesoDatos.EjecutarProcedimientoAlmacenado("EliminarSucursal", sqlCommand);
            return resultado;
        }

        public void ValidarOCrearProcedimientoEliminarSucursal()
        {
            SqlConnection conexion = accesoDatos.ObtenerConexion();
            using (conexion)
            {
                // Verificar si existe el procedimiento
                string consultaExiste = @"
                    SELECT COUNT(*) 
                    FROM sys.objects 
                    WHERE type = 'P' AND name = 'EliminarSucursal'";

                SqlCommand cmdExiste = new SqlCommand(consultaExiste, conexion);
                int cantidad = (int)cmdExiste.ExecuteScalar();

                if (cantidad == 0)
                {
                    // Crear el procedimiento si no existe
                    string crearProc = @"
                        CREATE PROCEDURE EliminarSucursal
                            @Id_Sucursal INT
                        AS
                        BEGIN
                            DELETE FROM Sucursal WHERE Id_Sucursal = @Id_Sucursal
                        END";

                    SqlCommand cmdCrear = new SqlCommand(crearProc, conexion);
                    cmdCrear.ExecuteNonQuery();
                }
            }
        }
    }
}
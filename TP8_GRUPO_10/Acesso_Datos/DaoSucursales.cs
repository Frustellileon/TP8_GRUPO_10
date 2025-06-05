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

        public DataTable getTablaFiltrada(Sucursal IDSucursal)
        {
            const string consulta = consultaBaseSQL + " WHERE Id_Sucursal = @Id_Sucursal";
            
            sqlCommand = new SqlCommand(consulta);
            ArmarParametro_EliminarSucursal(ref sqlCommand, IDSucursal);

            DataTable dataTable = accesoDatos.ObtenerTablaFiltrada("Sucursal", sqlCommand);
            return dataTable;
        }

        public DataTable getTablaFiltroAvanzado(string filtroAvanzado)
        {
            string consultaAvanzada = consultaBaseSQL;
            consultaAvanzada += filtroAvanzado;

            DataSet ds = new DataSet();

            SqlDataAdapter adaptador = new SqlDataAdapter(consultaAvanzada, accesoDatos.ObtenerConexion());
            adaptador.Fill(ds, "Sucursal");

            return ds.Tables["Sucursal"];                        
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

        private void CargarParametrosAgregarSucursales(ref SqlCommand cmd, Sucursal sucu)
        {
            //Creo el sqlParameter
            SqlParameter sqlParameter = new SqlParameter();

            //Añado los parametros
            sqlParameter = cmd.Parameters.Add("@NombreSucursal", SqlDbType.VarChar, 100);
            sqlParameter.Value = sucu.nombreSucursal;
            sqlParameter = cmd.Parameters.Add("@DescripcionSucursal", SqlDbType.VarChar, 100);
            sqlParameter.Value = sucu.descripcionSucursal;
            sqlParameter = cmd.Parameters.Add("@IdProvinciaSucursal", SqlDbType.Int);
            sqlParameter.Value = sucu.IdProvincia_Sucursal;
            sqlParameter = cmd.Parameters.Add("@DireccionSucursal", SqlDbType.VarChar, 100);
            sqlParameter.Value = sucu.direccionSucursal;
        }

        private void CargarPrametrosVerificacionExistencia(ref SqlCommand comando, Sucursal sucursal)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = comando.Parameters.Add("@NombreSucursal", SqlDbType.VarChar, 100);
            parametro.Value = sucursal.nombreSucursal;
            parametro = comando.Parameters.Add("@IdProvincia", SqlDbType.Int);
            parametro.Value = sucursal.IdProvincia_Sucursal;
            parametro = comando.Parameters.Add("@DireccionSucursal", SqlDbType.VarChar, 100);
            parametro.Value = sucursal.direccionSucursal;

        }

        public bool AgregarSucursal(Sucursal sucu)
        {
            //Variables
            const string consulta = "INSERT INTO Sucursal ([NombreSucursal], [DescripcionSucursal], [Id_ProvinciaSucursal], [DireccionSucursal]) VALUES (@NombreSucursal, @DescripcionSucursal, @IdProvinciaSucursal, @DireccionSucursal)";

            //Creo el sqlCommand
            SqlCommand sqlComand = new SqlCommand(consulta);

            //Cargo los parametros
            CargarParametrosAgregarSucursales(ref sqlComand, sucu);

            //Devuelvo
            return accesoDatos.AgregarSucursal(sqlComand);
        }

        public bool VerificarExistencia(Sucursal sucursal)
        {
            string consultaVerificacion = "SELECT * FROM Sucursal WHERE NombreSucursal = @NombreSucursal AND Id_ProvinciaSucursal= @IdProvincia AND DireccionSucursal = @DireccionSucursal";
            bool ban = false;
            
            SqlCommand comando = new SqlCommand(consultaVerificacion, accesoDatos.ObtenerConexion());
            CargarPrametrosVerificacionExistencia(ref comando, sucursal);
            SqlDataReader lector = comando.ExecuteReader();

            if(lector.Read())
            {
                ban = true;
            }

            accesoDatos.CerrarConexion();

            return ban;
        }
    }
}
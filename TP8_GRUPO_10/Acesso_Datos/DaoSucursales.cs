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
        string consultaBaseSQL = "SELECT Id_Sucursal, NombreSucursal AS Nombre, DescripcionSucursal AS Descripcion, DescripcionProvincia AS Provincia, DireccionSucursal AS Direccion FROM Sucursal INNER JOIN Provincia ON Id_ProvinciaSucursal = Id_Provincia";
        SqlCommand sqlCommand;

        ///----------------------------------------------------------  Funciones de la clase  --------------------------------------------------------------------------

        //Constructor de la clase
        public DaoSucursales() { }

        public DataTable getTablaSucursales()
        {
            DataTable dataTable = accesoDatos.ObtenerTabla("Sucursal", consultaBaseSQL);
            return dataTable;
        }

    }
}
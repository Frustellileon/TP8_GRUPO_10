using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;


namespace AccesoDatos
{
    internal class AccesoBD
    {
        ///---------------------------------------------------- Propiedades -------------------------------------------------------------------------------
        private string rutaConeccion = "Data Source=localhost\\sqlexpress; Initial Catalog=BDSucursales;Integrated Security=True";
        private bool estadoConeccion = false;
        private SqlConnection coneccion;
        private SqlDataAdapter dataAdapter;
        private SqlCommand sqlCommand;
        private DataSet dataSet;
        private int filasAfectadas;

        ///--------------------------------------------------- Constructores ------------------------------------------------------------------------------
        public AccesoBD()
        {

        }

        ///------------------------------------------------------ Getters ---------------------------------------------------------------------------------
        public string GetRutaConeccion()
        {
            return rutaConeccion;
        }

        public bool GetEstadoConeccion()
        {
            return estadoConeccion;
        }

        public SqlConnection GetConeccion()
        {
            return coneccion;
        }
        public SqlDataAdapter GetDataAdapter()
        {
            return dataAdapter;
        }
        public SqlCommand GetSqlCommand()
        {
            return sqlCommand;
        }
        public int GetFilasAfectadas()
        {
            return filasAfectadas;
        }

        public DataSet GetDataSet()
        {
            return dataSet;
        }



        ///------------------------------------------------------ Setters ---------------------------------------------------------------------------------
        public void SetRutaConeccion(string ruta)
        {
            rutaConeccion = ruta;
        }

        public void SetEstadoConeccion(bool estado)
        {
            estadoConeccion = estado;
        }

        public void SetConeccion(SqlConnection conexion)
        {
            coneccion = conexion;
        }
        public void SetDataAdapter(SqlDataAdapter adapter)
        {
            dataAdapter = adapter;
        }
        public void SetSqlCommand(SqlCommand command)
        {
            sqlCommand = command;
        }
        public void SetFilasAfectadas(int filas)
        {
            filasAfectadas = filas;
        }
        public void SetDataSet(DataSet ds)
        {
            dataSet = ds;
        }


        ///------------------------------------------------------ Metodos ---------------------------------------------------------------------------------
        public SqlConnection ObtenerConexion()
        {
            coneccion = new SqlConnection(rutaConeccion);
            try
            {
                coneccion.Open();
                estadoConeccion = true;
                return coneccion;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public SqlDataAdapter ObtenerDataAdapter(string consulta, SqlConnection sqlConnection)
        {

            try
            {
                dataAdapter = new SqlDataAdapter(consulta, sqlConnection);
                return dataAdapter;
            }

            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(string NombreTabla, string consulta)
        {

            coneccion = ObtenerConexion();
            estadoConeccion = true;
            if (coneccion == null)
            {
                throw new Exception("No se pudo establecer la conexión a la base de datos.");
            }
            using (coneccion)
            {
                dataAdapter = ObtenerDataAdapter(consulta, coneccion);
                if (dataAdapter != null)
                {
                    dataSet = new DataSet();
                    dataAdapter.Fill(dataSet, NombreTabla);
                }
                else
                {
                    throw new Exception("No se pudo obtener el DataAdapter para la consulta proporcionada.");
                }
                estadoConeccion = false;
            }
            return dataSet.Tables[NombreTabla];
        }
    }
    
}

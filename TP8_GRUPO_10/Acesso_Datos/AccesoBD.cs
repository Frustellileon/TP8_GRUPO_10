using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Common;
using System.Data;
using Entidades;


namespace AccesoDatos
{
    internal class AccesoBD
    {
        ///---------------------------------------------------- Propiedades -------------------------------------------------------------------------------
        private string rutaConeccion = "Data Source=localhost\\sqlexpress; Initial Catalog=BDSucursales;Integrated Security=True";
        private bool estadoConexion = false;
        private SqlConnection conexion;
        private SqlDataAdapter dataAdapter;
        private SqlCommand sqlCommand;
        private SqlDataReader sqlDataReader;
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
            return estadoConexion;
        }

        public SqlConnection GetConeccion()
        {
            return conexion;
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
            estadoConexion = estado;
        }

        public void SetConeccion(SqlConnection Conexion)
        {
            conexion = Conexion;
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
            conexion = new SqlConnection(rutaConeccion);
            try
            {
                conexion.Open();
                estadoConexion = true;
                return conexion;
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
            conexion = ObtenerConexion();
            estadoConexion = true;
            if (conexion == null)
            {
                throw new Exception("No se pudo establecer la conexión a la base de datos.");
            }
            using (conexion)
            {
                dataAdapter = ObtenerDataAdapter(consulta, conexion);
                if (dataAdapter != null)
                {
                    dataSet = new DataSet();
                    dataAdapter.Fill(dataSet, NombreTabla);
                }
                else
                {
                    throw new Exception("No se pudo obtener el DataAdapter para la consulta proporcionada.");
                }
                estadoConexion = false;
            }
            return dataSet.Tables[NombreTabla];
        }

        public SqlDataReader ObtenerLista()
        {
            conexion = ObtenerConexion();
            estadoConexion = true;
            string consulta = "SELECT Id_Provincia, DescripcionProvincia FROM Provincia ORDER BY DescripcionProvincia";

            if (conexion == null)
            {
                throw new Exception("No se pudo establecer la conexión a la base de datos.");
            }

            SqlCommand comando = new SqlCommand(consulta, conexion);
            sqlDataReader = comando.ExecuteReader(CommandBehavior.CloseConnection);

            estadoConexion = false;

            return sqlDataReader;
        }

        public int EjecutarProcedimientoAlmacenado(string nombreProcedimiento, SqlCommand command)
        {
            filasAfectadas = 0;
            conexion = ObtenerConexion();
            if (conexion == null)
            {
                throw new Exception("No se pudo establecer la conexión a la base de datos.");
            }
            else
            {
                using (conexion)
                {
                    sqlCommand = new SqlCommand();
                    sqlCommand = command;
                    sqlCommand.Connection = conexion;
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.CommandText = nombreProcedimiento; // Nombre del procedimiento almacenado            
                    filasAfectadas = sqlCommand.ExecuteNonQuery();
                }

                return filasAfectadas;
            }
        }

        public bool AgregarSucursal(SqlCommand cmd)
        {
            //Abro conexion
            conexion = ObtenerConexion();

            //Creo el sqlComand y ejecuto
            cmd.Connection = conexion;
            cmd.ExecuteNonQuery();

            //Cierro
            conexion.Close();
            estadoConexion = false;

            //Devuelvo true
            return true;
        }


        public void CerrarConexion()
        {   
            if (estadoConexion)
            {
                conexion.Close();
                estadoConexion = false;
            }
        }
        //prueba merge

        public DataTable ObtenerTablaFiltrada(string nombreTabla, SqlCommand consulta)
        {
            //Creo el data set
            DataSet dataSet = new DataSet();

            //Obtengo lo necesario usando los metodos anteriores
            SqlConnection connection = ObtenerConexion();
            consulta.Connection = connection;
            SqlDataAdapter dataAdapter = new SqlDataAdapter(consulta);

            //Relleno el dataset
            dataAdapter.Fill(dataSet, nombreTabla);

            //Cierro
            connection.Close();
            estadoConexion = false;

            //Devuelvo la tabla
            return dataSet.Tables[nombreTabla];
        }

    }
}

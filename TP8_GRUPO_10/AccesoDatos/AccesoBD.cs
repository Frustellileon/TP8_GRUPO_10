using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace AccesoDatos
{
    internal class AccesoBD
    {
        ///---------------------------------------------------- Propiedades -------------------------------------------------------------------------------
        private string rutaConeccion = "Data Source=localhost\\sqlexpress; Initial Catalog=BDSucursales;Integrated Security=True";
        private bool estadoConeccion = false;

        ///--------------------------------------------------- Constructores ------------------------------------------------------------------------------
        public AccesoBD()
        {

        }

        ///------------------------------------------------------ Getters ---------------------------------------------------------------------------------
        public string GetRutaConeccion()
        {
            return rutaConeccion;
        }

        public bool GetestadoConeccion()
        {
            return estadoConeccion;
        }

        ///------------------------------------------------------ Setters ---------------------------------------------------------------------------------
        public void SetRutaConeccion(string ruta)
        {
            rutaConeccion = ruta;
        }

        ///------------------------------------------------------ Metodos ---------------------------------------------------------------------------------
    }
}

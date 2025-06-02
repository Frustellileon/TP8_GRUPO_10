using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using AccesoDatos;
using Entidades;



namespace Negocios
{
    public class NegocioSucursales
    {
        public DataTable getTabla()
        {
            //Instancia de la clase DaoSucursales para acceder a los datos
            DaoSucursales datos = new DaoSucursales();
            return datos.getTablaSucursales();
        }

    }
}

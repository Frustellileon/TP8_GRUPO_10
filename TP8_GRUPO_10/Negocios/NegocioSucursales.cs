using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using AccesoDatos;
using System.Windows.Forms;



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

        public SqlDataReader getLista()
        {
            DaoSucursales datos = new DaoSucursales();
            return datos.getListaProvincias();
        }

        public bool eliminarSucursal(int id)
        {
            DaoSucursales dao = new DaoSucursales();
            Sucursal sucursal = new Sucursal();
            sucursal.IdSucursal = id;
            int filasAfectadas = dao.EliminarSucursal(sucursal);
            if (filasAfectadas == 1)
                return true;
            else
                return false;
        }

        public bool CargarSucursal(Sucursal sucu)
        {
            //Creo la variable dao
            DaoSucursales dao = new DaoSucursales();

            //Devuelvo
            return dao.AgregarSucursal(sucu);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;

namespace Vistas
{
    public partial class ListadoSucursales : System.Web.UI.Page
    {
        // Instancia de la clase NegocioSucursales para acceder a los datos de las sucursales
        NegocioSucursales negocioSucursales = new NegocioSucursales();

        protected void Page_Load(object sender, EventArgs e)
        {
            System.Web.UI.ValidationSettings.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                // Cargar la lista de sucursales al cargar la página por primera vez
                gvListadoSucursales.DataSource = negocioSucursales.getTabla();
                gvListadoSucursales.DataBind();

            }
            else
            {
                
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

        }
    }
}
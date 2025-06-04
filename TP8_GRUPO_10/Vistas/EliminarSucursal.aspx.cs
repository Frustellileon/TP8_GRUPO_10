using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;

namespace Vistas
{
    public partial class EliminarSucursales : System.Web.UI.Page
    {
        NegocioSucursales negocioSucursales = new NegocioSucursales();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (negocioSucursales.eliminarSucursal(Convert.ToInt32(txtIngresarSucursal.Text.Trim())) == true)
                {
                    lblMensaje.Text = "La sucursal se ha eliminado con éxito.";
                }
                else
                {
                    lblMensaje.Text = "No existe la sucursal ingresada.";
                }
                // Limpio el textbox
                txtIngresarSucursal.Text = string.Empty;
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
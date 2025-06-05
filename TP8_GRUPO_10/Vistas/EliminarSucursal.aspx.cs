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
            if(!IsPostBack)
            {
                lblMensaje.Text = string.Empty;
            }

        }
        
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            int idSucursal;
            if (!int.TryParse(txtIngresarSucursal.Text.Trim(), out idSucursal))
            {
                rvSucursales.IsValid = false;
                rvSucursales.ErrorMessage = "Ingrese un número válido entre 1 y 200.";
                return;
            }

            /// Verificamos si el número está dentro del rango lógico
            if (idSucursal < 1 || idSucursal > 200)
            {
                rvSucursales.IsValid = false;
                rvSucursales.ErrorMessage = "El número debe estar entre 1 y 200.";
                return;
            }

            if (negocioSucursales.eliminarSucursal(idSucursal))
            {
                lblMensaje.Text = "La sucursal se ha eliminado con éxito.";
            }
            else
            {
                lblMensaje.Text = "No existe la sucursal ingresada.";
            }

            txtIngresarSucursal.Text = string.Empty;
        }        
    }
}
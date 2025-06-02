using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;

namespace Vistas
{
    public partial class AgregarSucursal : System.Web.UI.Page
    {
        NegocioSucursales negocioSucursales = new NegocioSucursales();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDDLProvincia();
            }
        }

        private void CargarDDLProvincia()
        {
            ddlProvincia.DataSource = negocioSucursales.getLista();
            ddlProvincia.DataTextField = "DescripcionProvincia";
            ddlProvincia.DataValueField = "Id_Provincia";
            ddlProvincia.DataBind();

            ddlProvincia.Items.Insert(0, new ListItem("--Seleccione una provincia--", "0"));
        }

        // Método para limpiar los campos del formulario, todavía no lo implementé
        private void LimpiarCampos()
        {
            txtNombreSucursal.Text = "";
            txtDescripcion.Text = "";
            txtDireccion.Text = "";
            ddlProvincia.SelectedIndex = 0;
        }
    }
}

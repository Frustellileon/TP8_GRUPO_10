using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Entidades;
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
            else
            {
                lblSucursalAgregada.Text = string.Empty;
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

        //Evento Click
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Creo variables
                Sucursal sucu = new Sucursal();
                NegocioSucursales negocio = new NegocioSucursales();

                //Cargo lo de los textBox en un objeto sucursal
                sucu.nombreSucursal = txtNombreSucursal.Text.Trim();
                sucu.descripcionSucursal = txtDescripcion.Text.Trim();
                sucu.direccionSucursal = txtDireccion.Text.Trim();
                sucu.IdProvincia_Sucursal = Convert.ToInt32(ddlProvincia.SelectedValue);

                if (negocio.VerificarSucursalExistente(sucu))
                {
                    lblSucursalAgregada.ForeColor = Color.Red;
                    lblSucursalAgregada.Text = "La sucursal ya se encuentra agregada en el sistema";
                    return;
                }


                //LLamo a la funcion de agregar sucursal pasandole la variable sucursal
                if (negocio.CargarSucursal(sucu))
                {
                    //Muestro un mensaje de confirmación
                    lblSucursalAgregada.ForeColor = Color.SpringGreen;
                    lblSucursalAgregada.Text = "¡Sucursal agregada con éxito!";
                }
                else
                {
                    //Muestro un mensaje de error
                    lblSucursalAgregada.ForeColor = Color.Red;
                    lblSucursalAgregada.Text = "La sucursal no pudo ser agregada";
                }

                //LLamo a la funcion de limpiar campos
                LimpiarCampos();
            }
        }
    }
}

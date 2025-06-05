using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
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
                CargarTodasLasSucursales();
            }
            else
            {
                
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Sucursal sucursal = new Sucursal();
                NegocioSucursales negocio = new NegocioSucursales();

                sucursal.IdSucursal = Convert.ToInt32(txtFiltroId.Text.Trim());

                DataTable tablaFiltrada = negocio.getTablaFiltrada(sucursal);

                if (tablaFiltrada.Rows.Count == 0)
                {
                    lblNotFound.Text = "Sucursal no existente.";
                    gvListadoSucursales.DataSource = null;
                    gvListadoSucursales.DataBind();
                }
                else
                {
                    lblNotFound.Text = ""; // Oculta mensaje si sí encontró
                    gvListadoSucursales.DataSource = tablaFiltrada;
                    gvListadoSucursales.DataBind();
                }

                txtFiltroId.Text = string.Empty;
            }
        }

        private void CargarTodasLasSucursales()
        {
            gvListadoSucursales.DataSource = negocioSucursales.getTabla();
            gvListadoSucursales.DataBind();
        }

        protected void btnMostrarTodos_Click(object sender, EventArgs e)
        {
            CargarTodasLasSucursales();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
           
        }

        private string VerificarFiltroAvanzado()
        {
            string filtro = " WHERE ";

            if (Helper.txtRellenado(txtIdSucursal.Text))
            {
                string filtroID = ddlIdSucursal.SelectedValue;

                switch (filtroID)
                {
                    case "igual a":
                        filtro += "IdSucursal = " + txtIdSucursal.Text;
                        break;
                    case "mayor a":
                        filtro += "IdSucursal > " + txtIdSucursal.Text;
                        break;
                    default:
                        filtro += "IdSucursal < " + txtIdSucursal.Text;
                        break;
                }
            }

            if (Helper.txtRellenado(txtNombre.Text))
            {
                string filtroNombre = ddlNombre.SelectedValue;

                if (Helper.txtRellenado(txtIdSucursal.Text))
                {
                    filtro += " AND ";
                }
                departments
                switch (filtroNombre)
                {
                    case "contiene":
                        filtro += "NombreSucursal LIKE '%" + txtNombre.Text + "%'";
                        break;

                    case "empieza con":
                        filtro += "NombreSucursal LIKE '" + txtNombre.Text + "%'";
                        break;

                    default:
                        filtro += "NombreSucursal LIKE '%" + txtNombre.Text + "'";
                        break;
                }

            }

            if (Helper.txtRellenado(txtDescripcion.Text))
            {
                string filtroDescripcion = ddlDescripcion.SelectedValue;

                if(Helper.txtRellenado(txtIdSucursal.Text) ||
                   Helper.txtRellenado(txtNombre.Text))
                {
                    filtro += " AND ";
                }

                switch (filtroDescripcion)
                {
                    case "contiene":
                        filtro += "DescripcionSucursal LIKE '%" + txtDescripcion.Text + "%'";
                        break;

                    case "empieza con":
                        filtro += "DescripcionSucursal LIKE '" + txtDescripcion.Text + "%'";
                        break;

                    default:
                        filtro += "DescripcionSucursal LIKE '%" + txtDescripcion.Text + "'";
                        break;
                }

            }
            return filtro; 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NegocioSucursales negocio = new NegocioSucursales();


            string filtroAvanzado = VerificarFiltroAvanzado();

            txtPrueba.Text = filtroAvanzado;
        }
    }
}
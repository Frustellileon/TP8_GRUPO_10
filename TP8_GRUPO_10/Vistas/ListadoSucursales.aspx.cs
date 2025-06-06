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
                lblFiltrosVacios.Text = string.Empty;
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

            lblFiltrosVacios.Text = string.Empty;
        }

        private bool FiltrosVacios()
        {
            if(!Helper.txtRellenado(txtIdSucursal.Text) &&
               !Helper.txtRellenado(txtNombre.Text) &&
               !Helper.txtRellenado(txtDescripcion.Text))
            {   
                return true;
            }

            return false;
        }

        private string VerificarFiltroAvanzado()
        {
            if (FiltrosVacios())
            {
                return string.Empty;
            }

            string filtro = " WHERE ";
            string parametro;                                                   
                                                                                
            if (Helper.txtRellenado(txtIdSucursal.Text))                        
            {
                parametro = ddlIdSucursal.SelectedValue;

                switch (parametro)
                {
                    case "igual a":
                        filtro += "Id_Sucursal = " + txtIdSucursal.Text;
                        break;
                    case "mayor a":
                        filtro += "Id_Sucursal > " + txtIdSucursal.Text;
                        break;
                    default:
                        filtro += "Id_Sucursal < " + txtIdSucursal.Text;        
                        break;                                                   
                }                                                                
            }
                                                                                             //
            if (Helper.txtRellenado(txtNombre.Text))
            {
                parametro = ddlNombre.SelectedValue;

                if (Helper.txtRellenado(txtIdSucursal.Text))
                {
                    filtro += " AND ";
                }
                
                switch (parametro)
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
                                                                                             //
            if (Helper.txtRellenado(txtDescripcion.Text))
            {
                parametro = ddlDescripcion.SelectedValue;

                if(Helper.txtRellenado(txtIdSucursal.Text) ||
                   Helper.txtRellenado(txtNombre.Text))
                {
                    filtro += " AND ";
                }

                switch (parametro)
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
        

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (FiltrosVacios())
            {
                lblFiltrosVacios.Text = "No se llenó ningún filtro particular.";
                return;
            }
            else
            {
                lblFiltrosVacios.Text = string.Empty;
            }

            NegocioSucursales negocio = new NegocioSucursales();
            string filtroAvanzado = VerificarFiltroAvanzado();
            gvListadoSucursales.DataSource = negocio.getTablaFiltroAvanzado(filtroAvanzado);
            gvListadoSucursales.DataBind();

            lblNotFound.Text = string.Empty;
            txtFiltroId.Text = string.Empty;

        }

        void LimpiarFiltrosAvanzados()
        {
            txtIdSucursal.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            ddlIdSucursal.SelectedIndex = 0;
            ddlNombre.SelectedIndex = 0;
            ddlDescripcion.SelectedIndex = 0;
        }

        protected void btnLimpiarFA_Click(object sender, EventArgs e)
        {
            if (FiltrosVacios())
            {
                lblFiltrosVacios.Text = "No se llenó ningún filtro particular.";
                return;
            }
            else
            {
                LimpiarFiltrosAvanzados();
                CargarTodasLasSucursales();
            }
            lblFiltrosVacios.Text = string.Empty;
        }
    }
}
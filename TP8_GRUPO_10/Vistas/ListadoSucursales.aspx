<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursales.aspx.cs" Inherits="Vistas.ListadoSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 151px;
        }
        .auto-style4 {
            width: 172px;
        }
        .auto-style5 {
            width: 202px;
        }
        .auto-style6 {
            width: 237px;
        }
        .auto-style7 {
            width: 269px;
        }
        .auto-style8 {
            width: 16px;
        }
        .auto-style9 {
            width: 64px;
        }
        .auto-style10 {
            width: 237px;
            height: 30px;
        }
        .auto-style11 {
            width: 269px;
            height: 30px;
        }
        .auto-style12 {
            width: 16px;
            height: 30px;
        }
        .auto-style13 {
            width: 64px;
            height: 30px;
        }
        .auto-style14 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style3">&nbsp;</td>
                                <td class="auto-style4">
                                    <asp:HyperLink ID="hlAgregarSucursal" runat="server" NavigateUrl="~/AgregarSucursal.aspx">Agregar Sucursal</asp:HyperLink>
                                </td>
                                <td class="auto-style5">
                                    <asp:HyperLink ID="hpListadoSucursales" runat="server" NavigateUrl="~/ListadoSucursales.aspx">Listado de Sucursales</asp:HyperLink>
                                </td>
                                <td>
                                    <asp:HyperLink ID="hpEliminarSucursal" runat="server" NavigateUrl="~/EliminarSucursal.aspx">Eliminar Sucursal</asp:HyperLink>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <asp:Label ID="lblListadoSucursales" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Listado de sucursales"></asp:Label>
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Búsqueda ingrese ID sucursal:</td>
                            <td class="auto-style11">
                                <asp:TextBox ID="txtFiltroId" runat="server" ValidationGroup="Filtro" Width="250px" TextMode="Number"></asp:TextBox>
                            </td>
                            <td class="auto-style12">
                                <asp:RequiredFieldValidator ID="rfvFiltro" runat="server" ControlToValidate="txtFiltroId" ErrorMessage="Debe ingresar un ID al filtro." ValidateRequestMode="Enabled" ValidationGroup="Filtro">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style13">
                                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" ValidationGroup="Filtro" />
                            </td>
                            <td class="auto-style14">
                                <asp:Button ID="btnMostrarTodos" runat="server" Text="MostrarTodos" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td>
                                <asp:ValidationSummary ID="vsFiltro" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Filtro" />
                            </td>
                        </tr>
            </table>
        </div>
        <asp:GridView ID="gvListadoSucursale" runat="server">
        </asp:GridView>
    </form>
</body>
</html>

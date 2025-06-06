<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoSucursales.aspx.cs" Inherits="Vistas.ListadoSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 112%;
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
        .auto-style16 {
            width: 26px;
        }
        .auto-style17 {
            width: 64px;
        }
        .auto-style25 {
            width: 86px;
        }
        .auto-style26 {
            width: 158px;
        }
        .auto-style31 {
            width: 626px;
        }
        .auto-style32 {
            width: 177px;
        }
        .auto-style33 {
            height: 30px;
            width: 121px;
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
                                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" ValidationGroup="Filtro" OnClick="btnFiltrar_Click" />
                            </td>
                            <td class="auto-style14">
                                <asp:Button ID="btnMostrarTodos" runat="server" Text="MostrarTodos" OnClick="btnMostrarTodos_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style7">
                                <asp:Label ID="lblNotFound" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td>
                                <asp:ValidationSummary ID="vsFiltro" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Filtro" />
                            </td>
                        </tr>
            </table>
        </div>
        <asp:GridView ID="gvListadoSucursales" runat="server">
        </asp:GridView>
        <asp:Panel ID="Panel1" runat="server" Width="1402px">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style33">
                        &nbsp;</td>
                    <td class="auto-style26">
                        &nbsp;</td>
                    <td class="auto-style16">
                        &nbsp;</td>
                    <td class="auto-style17">
                        &nbsp;</td>
                    <td class="auto-style32">
                        &nbsp;</td>
                    <td class="auto-style25">
                        &nbsp;</td>
                    <td class="auto-style31">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style33">
                        <asp:Label ID="lblIdSucursal" runat="server" Text="ID Sucursal"></asp:Label>
                    </td>
                    <td class="auto-style26">
                        <asp:DropDownList ID="ddlIdSucursal" runat="server" Height="20px" Width="79px">
                            <asp:ListItem Value="igual a">Igual a:</asp:ListItem>
                            <asp:ListItem Value="mayor a">Mayor a:</asp:ListItem>
                            <asp:ListItem Value="menor a">Menor a:</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtIdSucursal" runat="server" Width="54px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revIDSucursal" runat="server" ControlToValidate="txtIdSucursal" ErrorMessage="El ID deve ser numerico y entero." ValidationExpression="^\d+$" ValidationGroup="GrupoFA">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style16">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                    </td>
                    <td class="auto-style17">
                        <asp:DropDownList ID="ddlNombre" runat="server" Height="20px">
                            <asp:ListItem Value="contiene">Contiene:</asp:ListItem>
                            <asp:ListItem Value="empieza con">Empieza con:</asp:ListItem>
                            <asp:ListItem Value="termina con">Termina con:</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtNombre" runat="server" Width="145px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revNombreS_valido" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="El nombre de sucursal ingresado contiene caracteres invalidos." ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑüÜ '.\-]+$" ValidationGroup="GrupoFA">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style25">
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripción"></asp:Label>
                    </td>
                    <td class="auto-style31">
                        <asp:DropDownList ID="ddlDescripcion" runat="server" Height="20px">
                            <asp:ListItem Value="contiene">Contiene:</asp:ListItem>
                            <asp:ListItem Value="empieza con">Empieza con:</asp:ListItem>
                            <asp:ListItem Value="termina con">Termina con:</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtDescripcion" runat="server" Width="145px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revDescripcion_valido" runat="server" ControlToValidate="txtDescripcion" Display="Dynamic" ErrorMessage="La descripción ingresada contiene caracteres inválidos." ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑüÜ .,;'\-()]+$" ValidationGroup="GrupoFA">*</asp:RegularExpressionValidator>
                        &nbsp;&nbsp;<asp:Button ID="btnBuscar" runat="server" BackColor="#FFFFCC" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="GrupoFA" Width="91px" />
                        &nbsp;<asp:Button ID="btnLimpiarFA" runat="server" BackColor="#FFFFCC" OnClick="btnLimpiarFA_Click" Text="Limpiar Filtros" Width="129px" />
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style33">&nbsp;</td>
                    <td class="auto-style26">
                        <asp:Label ID="lblFiltrosVacios" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style16">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                    <td class="auto-style32">
                        &nbsp;</td>
                    <td class="auto-style25">&nbsp;</td>
                    <td class="auto-style31">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ValidationSummary ID="vsFiltrosAvanzados" runat="server" ValidationGroup="GrupoFA" Width="240px" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

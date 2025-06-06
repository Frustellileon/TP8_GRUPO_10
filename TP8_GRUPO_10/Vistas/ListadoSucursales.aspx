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
        .auto-style5 {
            width: 391px;
        }
        body {
            background-color: #f3f3f3; 
            padding: 40px; 
        }
        table.auto-style1 {
            margin: 0 auto 14 auto; /* Centra la tabla horizontalmente en la página. */
            background-color: #ffffff; /* Le da el fondo blanco. */
            border-radius: 12px; /* Redondea las esquinas. */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Crea una sombra sutil para darle un efecto "flotante". */
            padding: 30px; /* Añade espacio interno para que el contenido no se pegue a los bordes del rectángulo blanco. */
            width: 1175px; /* Fija un ancho para el contenedor. */
            height: 57px;
        }

        .auto-style40 {
            width: 908px;
        }
        .auto-style41 {
            width: 1184px;
        }
        .auto-style42 {
            width: 1184px;
            height: 30px;
        }
        .auto-style43 {
            width: 353px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style3">&nbsp;</td>
                                <td class="auto-style43">
                                    <asp:HyperLink ID="hlAgregarSucursal" runat="server" NavigateUrl="~/AgregarSucursal.aspx">Agregar Sucursal</asp:HyperLink>
                                </td>
                                <td class="auto-style5">
                                    <asp:HyperLink ID="hpListadoSucursales" runat="server" NavigateUrl="~/ListadoSucursales.aspx">Listado de Sucursales</asp:HyperLink>
                                </td>
                                <td class="auto-style40">
                                    <asp:HyperLink ID="hpEliminarSucursal" runat="server" NavigateUrl="~/EliminarSucursal.aspx">Eliminar Sucursal</asp:HyperLink>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style41">
                                <asp:Label ID="lblListadoSucursales" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Listado de sucursales" Width="400px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style41">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style42">Búsqueda ingrese ID sucursal:
                                <asp:TextBox ID="txtFiltroId" runat="server" ValidationGroup="Filtro" Width="162px" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFiltro" runat="server" ControlToValidate="txtFiltroId" ErrorMessage="Debe ingresar un ID al filtro." ValidateRequestMode="Enabled" ValidationGroup="Filtro">*</asp:RequiredFieldValidator>
                            &nbsp;<asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" ValidationGroup="Filtro" OnClick="btnFiltrar_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnMostrarTodos" runat="server" Text="MostrarTodos" OnClick="btnMostrarTodos_Click" />
                            &nbsp;&nbsp;
                                <asp:ValidationSummary ID="vsFiltro" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="Filtro" />
                                <asp:Label ID="lblNotFound" runat="server"></asp:Label>
                            </td>
                        </tr>
                        </table>
        </div>
        <asp:Panel ID="Panel2" runat="server">
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:GridView ID="gvListadoSucursales" runat="server">
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblIdSucursal" runat="server" Text="ID Sucursal"></asp:Label>
                        &nbsp;<asp:DropDownList ID="ddlIdSucursal" runat="server" Height="20px" Width="105px">
                            <asp:ListItem Value="igual a">Igual a:</asp:ListItem>
                            <asp:ListItem Value="mayor a">Mayor a:</asp:ListItem>
                            <asp:ListItem Value="menor a">Menor a:</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:TextBox ID="txtIdSucursal" runat="server" Width="54px"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="revIDSucursal" runat="server" ControlToValidate="txtIdSucursal" ErrorMessage="El ID deve ser numerico y entero." ValidationExpression="^\d+$" ValidationGroup="GrupoFA">*</asp:RegularExpressionValidator>
                        &nbsp;&nbsp;
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                        &nbsp;Cambios e&nbsp;<asp:TextBox ID="txtNombre" runat="server" Width="145px"></asp:TextBox>
                        &nbsp;<asp:RegularExpressionValidator ID="revNombreS_valido" runat="server" ControlToValidate="txtNombre" Display="Dynamic" ErrorMessage="El nombre de sucursal ingresado contiene caracteres invalidos." ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑüÜ '.\-]+$" ValidationGroup="GrupoFA">*</asp:RegularExpressionValidator>
                        &nbsp;&nbsp;
                        <asp:Label ID="lblDescripcion" runat="server" Text="Descripción"></asp:Label>
                        &nbsp;<asp:DropDownList ID="ddlDescripcion" runat="server" Height="20px" style="margin-bottom: 0px">
                            <asp:ListItem Value="contiene">Contiene:</asp:ListItem>
                            <asp:ListItem Value="empieza con">Empieza con:</asp:ListItem>
                            <asp:ListItem Value="termina con">Termina con:</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:TextBox ID="txtDescripcion" runat="server" Width="145px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revDescripcion_valido" runat="server" ControlToValidate="txtDescripcion" Display="Dynamic" ErrorMessage="La descripción ingresada contiene caracteres inválidos." ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑüÜ .,;'\-()]+$" ValidationGroup="GrupoFA">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="btnBuscar" runat="server" BackColor="#FFFFCC" Height="29px" OnClick="btnBuscar_Click" Text="Buscar" ValidationGroup="GrupoFA" Width="70px" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnLimpiarFA" runat="server" BackColor="#FFFFCC" Height="27px" OnClick="btnLimpiarFA_Click" Text="Limpiar Filtros" Width="129px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;<asp:Label ID="lblFiltrosVacios" runat="server"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ValidationSummary ID="vsFiltrosAvanzados" runat="server" ValidationGroup="GrupoFA" Width="240px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

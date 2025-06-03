<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarSucursal.aspx.cs" Inherits="Vistas.AgregarSucursal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
    body {
        font-family: Arial, sans-serif;
        background-color: #f3f3f3;
        padding: 40px;
    }

    table.auto-style1 {
        margin: 0 auto;
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 30px;
        width: 700px;
    }

    asp\:TextBox, asp\:DropDownList, asp\:Button {
        margin-top: 5px;
        margin-bottom: 10px;
    }

    .auto-style6, .auto-style14, .auto-style11 {
        font-weight: bold;
        font-size: 14px;
        color: #333;
    }

    asp\:Button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 8px 16px;
        font-size: 14px;
        cursor: pointer;
        border-radius: 5px;
    }

    asp\:Button:hover {
        background-color: #45a049;
    }

    .titulo {
        text-align: center;
        font-size: 26px;
        font-weight: bold;
        color: #444;
        margin-bottom: 20px;
    }

    .subtitulo {
        text-align: center;
        font-size: 20px;
        color: #666;
        margin-bottom: 10px;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Panel ID="Panel1" runat="server">
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
                    </asp:Panel>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style8"></td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">
                                <asp:Label ID="lblGrupo" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="GRUPO Nº 10"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">
                                <asp:Label ID="lblAgregarSucursal" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Agregar Sucursal"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style13"></td>
                            <td class="auto-style14">
                                <asp:Label ID="lblNombreSucursal" runat="server" Text="Nombre Sucursal:"></asp:Label>
                            </td>
<<<<<<< HEAD
                            <td class="auto-style15">
                                <asp:TextBox ID="txtNombreSucursal" runat="server" Height="22px" Width="230px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombreSucursal" runat="server" ControlToValidate="txtNombreSucursal" Display="Dynamic" ErrorMessage="Ingrese un nombre de sucursal." ValidationGroup="GrupoA">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revNombreS_valido" runat="server" ControlToValidate="txtNombreSucursal" Display="Dynamic" ErrorMessage="El nombre de sucursal ingresado contiene caracteres invalidos." ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑüÜ '.\-]+$" ValidationGroup="GrupoA">*</asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="revNombreS_largo" runat="server" ControlToValidate="txtNombreSucursal" Display="Dynamic" ErrorMessage="El nombre de sucursal ingresado es demaciado corto/largo." ValidationExpression="^[\s\S]{3,50}$" ValidationGroup="GrupoA">*</asp:RegularExpressionValidator>
                            <td>
                                &nbsp;</td>
                            <td class="auto-style15"></td>
                            <td class="auto-style15"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">
                                <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDescripcion" runat="server" Height="22px" Width="230px" ValidationGroup="GrupoA"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" Display="Dynamic" ErrorMessage="Ingrese una descripción." ValidationGroup="GrupoA">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revDescripcion_valido" runat="server" ControlToValidate="txtDescripcion" Display="Dynamic" ErrorMessage="La descripción ingresada contiene caracteres inválidos." ValidationExpression="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑüÜ .,;'\-()]+$" ValidationGroup="GrupoA">*</asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="revDescripcion_largo" runat="server" ControlToValidate="txtDescripcion" Display="Dynamic" ErrorMessage="La descripción ingresada es demasiado corta/larga." ValidationExpression="^[\s\S]{4,200}$" ValidationGroup="GrupoA">*</asp:RegularExpressionValidator>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10"></td>
                            <td class="auto-style11">
                                <asp:Label ID="lblProvincia" runat="server" Text="Provincia:"></asp:Label>
                            </td>
                            <td class="auto-style12">
                                <asp:DropDownList ID="ddlProvincia" runat="server" Height="26px" Width="238px" ValidationGroup="GrupoA">
                                </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDdlProvincia" runat="server" ControlToValidate="ddlProvincia" ErrorMessage="Elija una opción de provincia." InitialValue="0" Display="Dynamic" ValidationGroup="GrupoA">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style12"></td>
                            <td class="auto-style12"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">
                                <asp:Label ID="lblDireccion" runat="server" Text="Direccion:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDireccion" runat="server" Height="22px" Width="230px" ValidationGroup="GrupoA"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" Display="Dynamic" ErrorMessage="Ingrese una dirección." ValidationGroup="GrupoA">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revDireccion_valida" runat="server" ControlToValidate="txtDireccion" Display="Dynamic" ErrorMessage="La dirección ingresada solo puede contener letras, números, espacios, comas, puntos o guiones, y debe incluir al menos un número." ValidationExpression="^(?=.*\d)[a-zA-Z0-9\s,.-]+$" ValidationGroup="GrupoA">*</asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="revDireccion_largo" runat="server" ControlToValidate="txtDireccion" Display="Dynamic" ErrorMessage="La dirección ingresada es demasiado corta/larga." ValidationExpression="^[\s\S]{5,100}$" ValidationGroup="GrupoA">*</asp:RegularExpressionValidator>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>
                                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" ValidationGroup="GrupoA" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style9">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="GrupoA" />
                            </td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

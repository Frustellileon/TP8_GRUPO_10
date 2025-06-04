<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarSucursal.aspx.cs" Inherits="Vistas.EliminarSucursales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <style type="text/css">
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 40px;
    }

    table.auto-style1 {
        margin: 0 auto;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        padding: 30px;
        width: 700px;
    }

    .auto-style6 {
        font-size: 16px;
        font-weight: bold;
        color: #333;
        padding-bottom: 10px;
    }

    asp\:TextBox {
        padding: 5px;
        font-size: 14px;
        width: 100%;
        border: 1px solid #ccc;
        border-radius: 4px;
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

    asp\:Label {
        font-size: 14px;
    }

    asp\:ValidationSummary {
        color: #cc0000;
        font-size: 13px;
        margin-top: 10px;
    }

    asp\:RangeValidator, asp\:RequiredFieldValidator {
        color: #cc0000;
        font-size: 13px;
    }

    .titulo {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        color: #444;
        margin-bottom: 20px;
    }

</style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td class="auto-style9">
                        <asp:HyperLink ID="hlAgregarSucursal" runat="server" NavigateUrl="~/AgregarSucursal.aspx">Agregar Sucursal</asp:HyperLink>
                    </td>
                    <td class="auto-style13">
                        <asp:HyperLink ID="hlListadoDeSucursales" runat="server" NavigateUrl="~/ListadoSucursales.aspx">Listado de Sucursales</asp:HyperLink>
                    </td>
                    <td class="auto-style12">
                        <asp:HyperLink ID="hlEliminarSucursal" runat="server" NavigateUrl="~/EliminarSucursal.aspx">Eliminar Sucursal</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblEliminarSucursal" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Eliminar Sucursal"></asp:Label>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                    <td class="auto-style17"></td>
                    <td class="auto-style18"></td>
                    <td class="auto-style19"></td>
                    <td class="auto-style19"></td>
                    <td class="auto-style19"></td>
                </tr>
                <tr>
                    <td class="auto-style6">Ingresar ID sucursal:</td>
                    <td class="auto-style7">
                        <asp:RequiredFieldValidator ID="rfvIngresarSucursal" runat="server" ControlToValidate="txtIngresarSucursal" Display="Dynamic" ErrorMessage="No ha ingresado ningún valor" ValidationGroup="GrupoEliminar">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style9">
                        <asp:TextBox ID="txtIngresarSucursal" runat="server" ValidationGroup="GrupoEliminar" TextMode="Number"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" ValidationGroup="GrupoEliminar" />
                    </td>
                    <td class="auto-style12">
                        <asp:RangeValidator ID="rvSucursales" runat="server" ControlToValidate="txtIngresarSucursal" Display="Dynamic" ErrorMessage="Número fuera de rango permitido." MaximumValue="200" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="lblMensaje" runat="server" ForeColor="#FF3300"></asp:Label>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:ValidationSummary ID="ValidationSummaryEliminar" runat="server" ValidationGroup="GrupoEliminar" />
                    </td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

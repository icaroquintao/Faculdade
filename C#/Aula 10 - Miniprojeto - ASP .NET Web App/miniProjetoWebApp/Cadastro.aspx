<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="Cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastro</title>
    <style type="text/css">
        .auto-style2 {
            height: 10px;
        }
        .auto-style3 {
            font-size: medium;
            font-weight: normal;
        }
        .auto-style4 {
            font-weight: normal;
        }
        .auto-style5 {
            height: 10px;
            width: 153px;
        }
        .auto-style6 {
            height: 10px;
            width: 198px;
        }
    </style>
</head>
<body>
    <br />
    <h2> Cadastro de novas categorias</h2>
    <form id="form1" runat="server">
    <div>
        <br />
        <br /><br />
        <table style="height: 80px; width: 380px" >
            <tr class="auto-style2">
                <td class="auto-style5">
                    <asp:Label ID="Label4" runat="server" Text="Id da categoria"  Font-Names="Arial"></asp:Label>
                </td>
                <td class="auto-style6"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="auto-style2">
                <td  class="auto-style5">
                    <asp:Label ID="Label3" runat="server" Text="Nome da categoria"  Font-Names="Arial"></asp:Label>
                </td>
                <td  class="auto-style6"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Text="Cadastrar" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
    </div>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="Maroon" Text="Label" Visible="False"></asp:Label>

    <br /><br /><br />
    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" PostBackUrl="~/Principal.aspx">Voltar</asp:LinkButton>

    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logon.aspx.cs" Inherits="Logon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Autenticação</title>
    <style type="text/css">
        .auto-style2 {
            height: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Sistema Web Loja" Font-Bold="True" Font-Names="Arial"></asp:Label>
        <br /><br />
       <table style="height: 80px; width: 235px" >
            <tr class="auto-style2">
                <td class="auto-style2">Id: </td>
                <td class="auto-style2"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="auto-style2">
                <td  class="auto-style2">Senha: </td>
                <td  class="auto-style2"><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Font-Bold="True" Text="Entrar" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
    </div>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="#990000" Text="Label" Visible="False"></asp:Label>
    </form>
</body>
</html>

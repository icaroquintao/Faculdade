<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Comprados.aspx.cs" Inherits="Comprados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2>
        <br />
        Produtos comprados anteriormente pelo usuário</h2>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" Text="Label"></asp:Label>
        </p>

   
    <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" PostBackUrl="~/Principal.aspx">Voltar</asp:LinkButton>

    </form>
</body>
</html>

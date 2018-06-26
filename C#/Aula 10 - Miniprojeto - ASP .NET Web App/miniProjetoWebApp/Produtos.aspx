<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Produtos.aspx.cs" Inherits="Produtos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h2>
            <br />
            Produtos que esta loja on-line vende<br />
        </h2>
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        <p>
            &nbsp;</p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#990000" Text="Label"></asp:Label>

        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" PostBackUrl="~/Principal.aspx">Voltar</asp:LinkButton>
        <br />
    
    </div>
    </form>
</body>
</html>

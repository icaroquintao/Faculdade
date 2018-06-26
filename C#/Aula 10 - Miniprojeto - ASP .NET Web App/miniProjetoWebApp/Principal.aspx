<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Principal.aspx.cs" Inherits="Principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu do sistema</title>
</head>
<body>
    <blockquote>
    <form id="form1" runat="server">

    <div>
    
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" 
            style="font-family: Verdana; font-size: x-large; font-weight: 700" 
            Text="Menu do Sistema"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Comprados.aspx" 
            style="font-family: Verdana; font-size: large">Consulta de produtos comprados anteriormente</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Cadastro.aspx" 
            style="font-family: Verdana; font-size: large">Cadastrar uma nova categoria de produtos</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Produtos.aspx" 
            style="font-family: Verdana; font-size: large">Listar todos os produtos vendidos por esta loja</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Sobre.aspx" 
            style="font-family: Verdana; font-size: large">Sobre os autores do sistema Web</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Sair.aspx" 
            style="font-family: Verdana; font-size: large">Sair do sistema Web</asp:LinkButton>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />    
    </div>

    </form>
</blockquote>

</body>
</html>

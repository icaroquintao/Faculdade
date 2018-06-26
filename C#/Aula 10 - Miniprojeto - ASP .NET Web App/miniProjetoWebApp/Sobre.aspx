<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sobre.aspx.cs" Inherits="Sobre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>
            <br />
            <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/4.png" Height="102px" Width="116px" />
            &nbsp;
            <asp:Label ID="Label3" runat="server" Text="Autor: Prof. Manuel F. Paradela Ledón."  Font-Names="Arial" Font-Size="Large"></asp:Label>
        <br />
        <h2>
            <br />
        
        <asp:Label ID="Label1" runat="server" Text="Gabarito do miniprojeto solicitado."  Font-Size="Medium" Font-Names="Arial"></asp:Label>
        <h2>
        <asp:Label ID="Label2" runat="server" Text="08/10/2015"  Font-Names="Arial" Font-Size="Medium"></asp:Label>


        <br />
        <br />

        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" Font-Names="Calibri" Font-Size="Small" PostBackUrl="~/Principal.aspx">Voltar</asp:LinkButton>
        <br />

    <div>
    
    </div>
    </form>
</body>
</html>

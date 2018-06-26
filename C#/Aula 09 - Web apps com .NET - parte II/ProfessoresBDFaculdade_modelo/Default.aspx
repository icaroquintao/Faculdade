<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="font-family: Verdana; font-size: 12px;">
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
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Consulta.aspx" 
            style="font-family: Verdana; font-size: large">Consulta de professores</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Cadastro.aspx" 
            style="font-family: Verdana; font-size: large">Cadastrar ou atualizar dados de professores</asp:LinkButton>
        <br />
    
    </div>
    <p>
        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Eliminar.aspx" 
            style="font-family: Verdana; font-size: large">Eliminar um professor</asp:LinkButton>
        </p>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        Este Web app processa um banco de dados que deverá ser colocado <br />
        no servidor Web, no endereço a seguir: C:\temp\Escola.mdb. </p>
</body>
</html>

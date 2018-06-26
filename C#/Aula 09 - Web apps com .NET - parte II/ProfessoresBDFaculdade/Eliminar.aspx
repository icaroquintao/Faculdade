<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Eliminar.aspx.cs" Inherits="Eliminar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: medium; font-family: Verdana;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="auto-style1"><strong>
        <br />
        Eliminar um professor</strong></span><br class="auto-style1" />
        <br class="auto-style1" />
        <span class="auto-style1">Digite o código do professor a eliminar:&nbsp; </span>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1"></asp:TextBox>
        <br class="auto-style1" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-weight: 700; height: 26px;" Text="Eliminar" />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="#000066"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx" 
            style="font-family: Verdana; font-size: large">Voltar</asp:LinkButton>
        <br />
        <br class="auto-style1" />
    
    </div>
    </form>
</body>
</html>

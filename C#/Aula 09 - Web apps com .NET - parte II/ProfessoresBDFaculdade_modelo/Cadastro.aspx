<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="Cadastro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: Verdana;
            font-size: x-large;
        }
        .style2
        {
            width: 215px;
        }
        .style3
        {
            width: 570px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style1"><strong>Cadastro de professores</strong></span><br />
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="style2">
        <asp:Label ID="Label1" runat="server" 
            style="font-family: Verdana; font-size: medium" Text="Código do professor:"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TextBox1" runat="server" 
            style="font-family: Verdana; font-size: medium" Width="75px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
        <asp:Label ID="Label2" runat="server" 
            style="font-family: Verdana; font-size: medium" Text="Nome do professor:"></asp:Label>
&nbsp;</td>
                <td class="style3">
                    <asp:TextBox ID="TextBox2" runat="server" 
            style="font-family: Verdana; font-size: medium" Width="241px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
        <asp:Label ID="Label3" runat="server" 
            style="font-family: Verdana; font-size: medium" Text="Sexo do professor (M/F):"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TextBox3" runat="server" 
            style="font-family: Verdana; font-size: medium" Width="29px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
        <asp:Label ID="Label6" runat="server" 
            style="font-family: Verdana; font-size: medium" Text="Salário do professor R$:"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TextBox4" runat="server" 
            style="font-family: Verdana; font-size: medium" Width="90px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <br />
&nbsp;<asp:Button ID="Button1" 
            runat="server" onclick="Button1_Click" 
            style="font-weight: 700; font-size: large" Text="Inserir" Height="29px" />
        &nbsp;&nbsp; <asp:Button ID="Button2" 
            runat="server" onclick="Button2_Click" 
            style="font-weight: 700; font-size: large" Text="Alterar" Height="29px" />
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" 
            style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #009999" 
            Text="Professor adicionado/alterado com sucesso" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Label5" runat="server" 
            style="font-family: Arial, Helvetica, sans-serif; font-size: medium; color: #FF0000" 
            Text="Não foi possível adicionar/alterar o Professor." Visible="False"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx" 
            style="font-family: Verdana; font-size: large">Voltar</asp:LinkButton>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>

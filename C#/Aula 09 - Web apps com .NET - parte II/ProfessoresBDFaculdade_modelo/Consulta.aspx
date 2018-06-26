<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Consulta.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: large;
            font-family: Verdana;
        }
        #form1
        {
            height: 352px;
            width: 851px;
        }
        .style2
        {
            font-size: x-large;
            font-family: Verdana;
        }
    </style>
</head>
<body style="font-family: Verdana">
    <form id="form1" runat="server">
    <div style="font-family: Arial, Helvetica, sans-serif; font-size: large; font-weight: bold">
    
        <strong>
    
        <span class="style2">Consulta - tabela professores</span><span class="style1"> - 
        BD &#39;Escola.mdb&#39;, formato Access.</span></strong><br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx" 
            style="font-size: large">Voltar</asp:LinkButton>
        <br />
        <br />
        Consultar professores do sexo: <br /><br />
        <asp:Panel ID="Panel1" runat="server" Height="98px" Width="196px">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                style="font-size: small">
                <asp:ListItem Selected="True">Todos</asp:ListItem>
                <asp:ListItem>Masculino</asp:ListItem>
                <asp:ListItem>Feminino</asp:ListItem>
            </asp:RadioButtonList>
        </asp:Panel>
    
    </div>
    <br/>
        Opcionalmente, digite uma parte do nome / sobrenome:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br/><br/><br/>
    <asp:Button ID="Button1" runat="server" 
        style="font-family: Verdana; font-size: large" Text="Buscar" Height="29px" 
        Width="80px" />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" style="font-weight: 700"></asp:Label>
    <br />
    <br />

    <asp:Panel ID="Panel2" runat="server" BorderStyle="Outset" Height="303px" 
        ScrollBars="Both"></asp:Panel>

        
        <br />
        <br />
        <br />

        
    </form>

            
        </body>
</html>

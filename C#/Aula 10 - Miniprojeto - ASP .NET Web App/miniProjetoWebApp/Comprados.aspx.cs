using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient; //namespace para processamento de BDs

public partial class Comprados : System.Web.UI.Page
{
    private MySqlConnection conexao;
    private MySqlCommand stm;
    private MySqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Id"] == null) Response.Redirect("Logon.aspx");
        string Iduser =  Convert.ToString(Session["Id"]);
        Label1.Visible = false;
        try
        {
            conexao = new MySqlConnection("server=localhost; port=3306; user id=root; password=root; database= lojaonline");
            conexao.Open();

            string sql = "SELECT produtos.*, comprasefetuadas.* from produtos INNER JOIN comprasefetuadas ON produtos.idprod=comprasefetuadas.idproduto WHERE comprasefetuadas.idusuario=@id ORDER BY produtos.nomeprod";

            stm = new MySqlCommand(sql, conexao);
            stm.Parameters.AddWithValue("@id", Iduser);
            stm.Prepare();

            dr = stm.ExecuteReader();

            String strHTML = "";
            if (dr.HasRows)
            { //mostramos o cabeçalho da <table> somente se temos registros
                strHTML = "<TABLE name=produts border=1 width='65%'> <TR style='font-size: 14px; font-family: verdana; text-align: center; font-weight: 900; color: #009;'>"
                    + "<TD>&nbsp;Código&nbsp;</TD><TD style='text-align: left'>&nbsp;Nome&nbsp;</TD>"
                    + "<TD>&nbsp;Preço&nbsp;</TD><TD>&nbsp;Quantidade&nbsp;</TD></TR>";
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Este usuário não comprou produtos ainda nesta loja on-line";
            }

            while (dr.Read())
            {
                String codigo = dr.GetString("idprod");
                String nome = dr.GetString("nomeprod");
                String preco = dr.GetString("preco");
                String qtde = dr.GetString("qtdecomprada");
                strHTML += "<TR><TD style='font-size: 12px; font-family: verdana; text-align: center;'>" + codigo
                        + "</TD><TD style='font-size: 12px; font-family: verdana; text-align: left;'>&nbsp;&nbsp;"
                        + nome + "</TD><TD style='font-size: 12px; font-family: verdana; text-align: center;'>"
                        + preco + "</TD><TD style='font-size: 12px; font-family: verdana; text-align: center;'>"
                        + qtde + "</TD></TR>";
            }

            strHTML += "</TABLE> <br/><br/><br/>";
            LiteralControl lc = new LiteralControl(strHTML);
            Panel1.Controls.Add(lc);
            stm.Dispose();
            dr.Close();
            conexao.Close();
        }
        catch (Exception exc)
        {
            Label1.Visible = true;
            Label1.Text = "Erro no processamento do BD - " + exc.Message;
        }

    }
}
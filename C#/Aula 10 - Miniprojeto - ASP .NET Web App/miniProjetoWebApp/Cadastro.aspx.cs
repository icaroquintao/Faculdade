using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using MySql.Data.MySqlClient; //namespace para processamento de BDs

public partial class Cadastro : System.Web.UI.Page
{
    private MySqlConnection conexao;
    private MySqlCommand stm;

    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Visible = false;
        if (Session["Id"] == null) Response.Redirect("Logon.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label2.Visible = true;
        String paramCodigo = "";
        String paramNomecateg = "";
        try
        {
            paramCodigo = Request["TextBox1"];
            paramNomecateg = Request["TextBox2"];
            if (paramCodigo == null) paramCodigo = "";
            if (paramNomecateg == null) paramNomecateg = "";
        }
        catch (Exception) { };

        try
        {
            conexao = new MySqlConnection(
                "server=localhost; port=3306; user id=root; password=root; database= lojaonline");
            conexao.Open();

            string sql = "INSERT INTO categorias (idcategoria,nomecategoria) VALUES (@idcat,@nomecat)";
            stm = new MySqlCommand(sql, conexao);
            stm.Parameters.AddWithValue("@idcat", paramCodigo);
            stm.Parameters.AddWithValue("@nomecat", paramNomecateg);
            stm.Prepare();
            int qtde = stm.ExecuteNonQuery();

            if (qtde == 0)
            {
                Label2.Text = "Não foi possível cadastrar uma nova categoria com esses dados!";
                Label2.ForeColor = Color.DarkRed;
            }
            else
            {
                Label2.Text = "Cadastro da nova categoria efetuado com sucesso!";
                Label2.ForeColor = Color.Green;
            }

            stm.Dispose();
            conexao.Close();
        }
        catch (Exception exc)
        {
            Label2.ForeColor = Color.DarkRed;
            Label2.Text = "Não foi possível cadastrar uma nova categoria com esses dados. Verifique o Id.";
        }
    }
}
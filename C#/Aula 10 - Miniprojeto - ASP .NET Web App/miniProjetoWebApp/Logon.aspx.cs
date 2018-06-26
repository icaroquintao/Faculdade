using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient; //namespace para processamento de BDs

public partial class Logon : System.Web.UI.Page
{

    private MySqlConnection conexao;
    private MySqlCommand stm;
    private MySqlDataReader rs;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label2.Visible = false;

        String paramId = "";
        String paramSenha = "";

        try
        {
            paramId = Request["TextBox1"];
            paramSenha = Request["TextBox2"];
            if (paramId == null) paramId = "";
            if (paramSenha == null) paramSenha = "";
        }
        catch (Exception) { };


        try
        {
            conexao = new MySqlConnection(
                "server=localhost; port=3306; user id=root; password=root; database= lojaonline");
            conexao.Open();

            string sql = "SELECT * FROM usuarios where idusuario=@id and senhausuario=@senha";

            stm = new MySqlCommand(sql, conexao);
            stm.Parameters.AddWithValue("@id", TextBox1.Text);
            stm.Parameters.AddWithValue("@senha", TextBox2.Text);
            stm.Prepare();

            rs = stm.ExecuteReader();

            if (rs.Read())
            {
                Label2.Visible = false;
                Label2.Text = "";
                Session["Id"] = TextBox1.Text;
                Session["Senha"] = TextBox2.Text;
                Response.Redirect("Principal.aspx");
            }
            else
            {
                Label2.Text = "Usuário não autorizado.";
                Label2.Visible = true;
                Session.RemoveAll();
            }

            rs.Close();
            stm.Dispose();
            conexao.Close();
        }
        catch (Exception exc)
        {
            Label2.Visible = true;
            Label2.Text = "Erro processando o BD: " + exc.Message;
        }


    }
}
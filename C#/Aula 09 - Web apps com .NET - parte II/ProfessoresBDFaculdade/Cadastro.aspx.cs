using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb; //namespace para processamento de BDs

public partial class Cadastro : System.Web.UI.Page
{

    private OleDbConnection conexao;
    private OleDbCommand stm;
    private OleDbDataReader rs;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    { //INSERIR UM PROFESSOR
        Label4.Visible = false;
        Label5.Visible = false;

        String paramCodigo = "";
        String paramNome = "";
        String paramSexo = "";
        String paramSalario = "";
        try
        {
            paramCodigo = Request["TextBox1"];
            paramNome = Request["TextBox2"];
            paramSexo = Request["TextBox3"];
            paramSalario = Request["TextBox4"];
            if (paramCodigo == null) paramCodigo = "";
            if (paramNome == null) paramNome = "";
            if (paramSexo == null) paramSexo = "";
            if (paramSalario == null) paramSalario = "";
        }
        catch (Exception) { };


        try
        {
            conexao = new OleDbConnection(
                "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:/temp/Escola.mdb");
            conexao.Open();

            string sql = "INSERT INTO professores VALUES (" + paramCodigo + ",'" + paramNome + "','" + paramSexo + "'," + paramSalario + ")";
            stm = new OleDbCommand(sql, conexao);
            int qtde = stm.ExecuteNonQuery();

            if(qtde==0) {
              Label4.Visible = false;
              Label5.Visible = true; //erro
            }
            else {
              Label4.Visible = true;  //inserido com sucesso
              Label5.Visible = false; 
            }

            stm.Dispose(); 
            conexao.Close();
        }
        catch (Exception exc)
        {
            Label4.Visible = false;
            Label5.Visible = true; //erro
        }


    }

    protected void Button2_Click(object sender, EventArgs e)
    { //ALTERAR UM PROFESSOR
        Label4.Visible = false;
        Label5.Visible = false;

        String paramCodigo = "";
        String paramNome = "";
        String paramSexo = "";
        String paramSalario = "";
        try
        {
            paramCodigo = Request["TextBox1"];
            paramNome = Request["TextBox2"];
            paramSexo = Request["TextBox3"];
            paramSalario = Request["TextBox4"];
            if (paramCodigo == null) paramCodigo = "";
            if (paramNome == null) paramNome = "";
            if (paramSexo == null) paramSexo = "";
            if (paramSalario == null) paramSalario = "";
        }
        catch (Exception) { };

        try
        {
            conexao = new OleDbConnection(
                "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:/temp/Escola.mdb");
            conexao.Open();

            int qtde;
            
            /*
            //Usando o método tradicional:
            string sql = "UPDATE professores SET nomeprof='" + paramNome 
                + "', sexo='" + paramSexo + "', salario=" 
                + paramSalario + " WHERE codprof=" + paramCodigo;
            stm = new OleDbCommand(sql, conexao);   
            */

            //Usando prepared statements:
            string sql = "UPDATE professores SET nomeprof=? , sexo=?, salario=? WHERE codprof=?";
            stm = new OleDbCommand(sql, conexao);
            stm.Parameters.Add("nomp", OleDbType.VarChar, 100); //O método OleDbCommand.Prepare exige que todos os parâmetros de comprimento variável tenham um valor Size não nulo explicitamente definido. 
            stm.Parameters.Add("sexp", OleDbType.VarChar, 1); 
            stm.Parameters.Add("salp", OleDbType.Single);
            stm.Parameters.Add("codp", OleDbType.Integer);
            stm.Parameters[0].Value = paramNome;
            stm.Parameters[1].Value = paramSexo;
            stm.Parameters[2].Value = Convert.ToSingle(paramSalario);
            stm.Parameters[3].Value = Convert.ToInt16(paramCodigo);
            stm.Prepare();
            
            qtde = stm.ExecuteNonQuery();

            if (qtde == 0)
            {
                Label4.Visible = false;
                Label5.Text = "Naõ foi possível alterar o professor com código: " + paramCodigo + ".";
                Label5.Visible = true; //erro
            }
            else
            {
                Label4.Text = "Registro alterado com sucesso: professor código " + paramCodigo + ".";
                Label4.Visible = true;  //inserido com sucesso
                Label5.Visible = false;
            }

            stm.Dispose();
            conexao.Close();
        }
        catch (Exception exc)
        {
            Label4.Visible = false;
            Label5.Visible = true; //erro
            Label5.Text = exc.Message;
        }


    }
}
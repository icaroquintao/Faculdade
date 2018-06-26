using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb; //namespace para processamento de BDs

public partial class _Default : System.Web.UI.Page
{
    private String paramSexo;   //variáveis para receber os parâmetros enviados para esta página
    private String paramNome;

    private OleDbConnection conexao;
    private OleDbCommand stm;
    private OleDbDataReader rs;
    OleDbDataReader dr;

    protected void Page_Load(object sender, EventArgs e) {
        paramSexo = "";
        paramNome = "";
        try {
          paramSexo = Request["RadioButtonList1"];
          paramNome = Request["TextBox1"];
          if (paramSexo == null) paramSexo = "";
          if (paramNome == null) paramNome = "";
        }
        catch(Exception){};

        Label1.Text = "Registros encontrados:";
        String filtro1 = "", filtro2 = "";

        if (paramSexo.Equals("Todos")) {
                filtro1 = " TRUE ";
        }
        else if (paramSexo.Equals("Masculino")) {
                filtro1 = " (sexo='M') ";
        }
        else if (paramSexo.Equals("Feminino"))
        {
            filtro1 = " (sexo='F') ";
        }
        else
        {
            filtro1 = " FALSE ";
            Label1.Text = "";
        }

        filtro2 = " (nomeprof LIKE '%" + paramNome + "%') ";

        try {
          conexao = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:/temp/Escola.mdb");
          conexao.Open();

          string sql = "select * from professores WHERE " 
              + filtro1 + " AND " + filtro2 + " ORDER BY nomeprof";
          stm = new OleDbCommand(sql, conexao);
          dr = stm.ExecuteReader();

          String strHTML = "";
          if (dr.HasRows) { //mostramos o cabeçalho da <table> somente se temos registros
              strHTML = "<TABLE name=profs border=1 width='65%'> <TR style='font-size: 14px; font-family: verdana; text-align: center; font-weight: 900; color: #009;'>" 
                  + "<TD>&nbsp;Código&nbsp;</TD><TD>&nbsp;Nome&nbsp;</TD>"
                  + "<TD>&nbsp;Sexo&nbsp;</TD><TD>&nbsp;Salário&nbsp;</TD></TR>";
          }

          while (dr.Read()) {
              int codigo = dr.GetInt16(0); //codprof
              String nome = dr.GetString(1); //nome
              String sexo = dr.GetString(2); //sexo
              float salario = dr.GetFloat(3); //salário
              strHTML += "<TR><TD style='font-size: 12px; font-family: verdana; text-align: center;'>" + codigo
                      + "</TD><TD style='font-size: 12px; font-family: verdana; text-align: left;'>&nbsp;&nbsp;"
                      + nome + "</TD><TD style='font-size: 12px; font-family: verdana; text-align: center;'>"
                      + sexo + "</TD><TD style='font-size: 12px; font-family: verdana; text-align: center;'>" 
                      + salario + "</TD></TR>";
          }

          strHTML += "</TABLE> <br/><br/><br/>";
          LiteralControl lc = new LiteralControl(strHTML);
          Panel2.Controls.Add(lc);
          stm.Dispose();
          dr.Close();
          conexao.Close();
        } catch (Exception exc) {
            Label1.Text = "Erro no processamento do BD - " + exc.Message;
        }
    }

}
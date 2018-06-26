using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class geraTexto : System.Web.UI.Page
{
    private MySqlConnection conexao;
    private MySqlCommand stm;
    private MySqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            conexao = new MySqlConnection("server=localhost; port=3306; user id=root; password=manager; database= lojaonline");
            conexao.Open();

            string sql = "SELECT * from produtos";

            stm = new MySqlCommand(sql, conexao);
            dr = stm.ExecuteReader();

            String strTexto = "";
            int qtdeprods = 0;            

            while (dr.Read())
            {
                qtdeprods++;
                String codigo = dr.GetString("idprod");
                String nome = dr.GetString("nomeprod");
                String preco = dr.GetString("preco");
                String idcateg = dr.GetString("idcategoria");
                strTexto += codigo + "<<" + nome + "<<" + preco + "<<" + idcateg + "<<";
            }

            strTexto = "" + qtdeprods + "<<" + strTexto;
            Response.Write(strTexto);
            stm.Dispose();
            dr.Close();
            conexao.Close();
        }
        catch (Exception exc)
        {
            Response.Write("Erro: " + exc.Message);
        }
    }


}


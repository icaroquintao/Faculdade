using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb; //namespace para processamento de BDs

public partial class Eliminar : System.Web.UI.Page
{

    private OleDbConnection conexao;
    private OleDbCommand stm;
    private OleDbDataReader rs;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    { // ELIMINAR UM PROFESSOR
        String paramCodigo = "";
        try
        {
            paramCodigo = Request["TextBox1"];
            if (paramCodigo == null) paramCodigo = "-1";
        }
        catch (Exception) { };

        try
        {
            conexao = new OleDbConnection(
                "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:/temp/Escola.mdb");
            conexao.Open();

            //Pelo método tradicional:
            //stm = new OleDbCommand("DELETE FROM Professores WHERE codprof = " + paramCodigo, conexao);

            //Usando prepared statement:
            //"The OLE DB .NET Provider does not support named parameters for passing parameters to an SQL statement 
            //or a stored procedure called by an OleDbCommand when CommandType is set to Text. In this case, 
            //the question mark (?) placeholder must be used." Example: SELECT * FROM Customers WHERE CustomerID = ?
            //https://msdn.microsoft.com/en-us/library/system.data.oledb.oledbcommand.parameters.aspx
            //https://msdn.microsoft.com/en-us/library/system.data.oledb.oledbcommand.prepare(v=vs.110).aspx
            stm = new OleDbCommand("DELETE FROM Professores WHERE codprof = ?", conexao);
            stm.Parameters.Add("codp", OleDbType.Integer);
            stm.Parameters[0].Value = Convert.ToInt16(paramCodigo);
            stm.Prepare();

            int qtde = stm.ExecuteNonQuery();

            if (qtde == 0)
            {
                Label1.Text = "Naõ foi possível eliminar o professor com código: " + paramCodigo + ".";
            }
            else
            {
                Label1.Text = "Professor eliminado com sucesso: professor código " + paramCodigo + ".";
            }

            stm.Dispose();
            conexao.Close();
        }
        catch (Exception exc)
        {
            Label1.Text = "Erro: " + exc.Message;
        }

    }
}
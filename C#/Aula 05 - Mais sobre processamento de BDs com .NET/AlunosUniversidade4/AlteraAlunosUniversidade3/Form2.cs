using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AlteraAlunosUniversidade3
{
    public partial class Form2 : Form
    {
        private System.Data.OleDb.OleDbConnection conexao = null;
        private System.Data.OleDb.OleDbCommand stm = null;
        private System.Data.OleDb.OleDbDataReader rs = null;
        private String sql="";
        
        public Form2()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try {
                conexao = new System.Data.OleDb.OleDbConnection
                    ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:/temp/Universidade3.mdb");
                conexao.Open();
            } catch (Exception exsql) { }
        }

        private void panel1_Paint(object sender, EventArgs e)
        {
        }

        private void button3_Click(object sender, EventArgs e)
        {   // Botão btnResultados
            try
            {
                string id1 = txtIdade1.Text;
                string id2 = txtIdade2.Text;
                string strSsexo = "";
                if (rbMasculino.Checked) strSsexo = " sexo = 'M' AND ";
                    else if (rbFeminino.Checked) strSsexo = " sexo = 'F' AND ";
                        else strSsexo = "";

                sql = "select * from alunos WHERE " + strSsexo 
                    + " idade>=" + id1 + " AND idade<=" + id2 
                    + " ORDER BY nome";
                stm = new System.Data.OleDb.OleDbCommand(sql, conexao);
                rs = stm.ExecuteReader();
                string strSaida = "";
                while (rs.Read())
                {
                    string dados = "RGM: " + rs.GetString(0) 
                        + ", " + rs.GetString(1) + ", idade: " + rs.GetInt32(3)
                        + ", sexo: " + rs.GetString(4)
                        + ", curso: " + rs.GetString(2);
                    strSaida += dados + "\r\n";
                }
                txtResultados.Text = strSaida;
            }
            catch (Exception exsql) { MessageBox.Show("Erro na consulta"); }
            if(stm!=null)stm.Dispose();
            if(rs!=null)rs.Close();
        }



    }
}

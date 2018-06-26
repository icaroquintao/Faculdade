using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExSimplesAccess
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string abrev = textBox1.Text.ToString();
            string nomecurso = textBox2.Text.ToString();
            string sql = "INSERT INTO Cursos (abrevcurso,nomecurso) VALUES ('" + abrev + "','" + nomecurso + "')";

            try { 
                //suponhamos o BD em C:\temp
                System.Data.OleDb.OleDbConnection conexao =
                    new System.Data.OleDb.OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:/temp/Universidade3.mdb");
                conexao.Open();

                System.Data.OleDb.OleDbCommand comando =
                    new System.Data.OleDb.OleDbCommand(sql, conexao);

                int res = comando.ExecuteNonQuery();
                if (res != 0) label3.Text = "Curso inserido com sucesso!"; 
                         else label3.Text = "Erro. O curso não foi inserido."; 

                comando.Dispose();
                conexao.Close();
            }
            catch (Exception exc) { label3.Text = "Erro. O curso não foi inserido."; }

        }
    }
}

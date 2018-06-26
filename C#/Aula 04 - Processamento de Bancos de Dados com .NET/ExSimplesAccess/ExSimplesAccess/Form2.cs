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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Mostrar na listBox2 os alunos do curso selecionado no listBox1:
            try
            {
                listBox2.Items.Clear(); //limpamos a segunda lista
                string cursoSelec = (string)((DataRowView)listBox1.SelectedItem)[0];

                string sql = "SELECT * FROM Alunos WHERE abrevcurso = '" + cursoSelec + "'";

                //suponhamos o BD em C:\tempo
                System.Data.OleDb.OleDbConnection conexao =
                    new System.Data.OleDb.OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:/temp/Universidade3.mdb");
                conexao.Open();

                System.Data.OleDb.OleDbCommand comando =
                    new System.Data.OleDb.OleDbCommand(sql, conexao);

                System.Data.OleDb.OleDbDataReader dr = comando.ExecuteReader();

                while (dr.Read())
                {
                    string dadosAluno = dr.GetString(0)
                        + ", " + dr.GetString(1) + ", " + dr.GetString(2)
                        + ", " + dr.GetInt32(3) + ", " + dr.GetString(4);
                    listBox2.Items.Add(dadosAluno);
                }

                dr.Close();
                comando.Dispose();
                conexao.Close();
            }
            catch (Exception exc) { MessageBox.Show(exc.Message); }
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'universidade3DataSet.Cursos' table. You can move, or remove it, as needed.
            this.cursosTableAdapter.Fill(this.universidade3DataSet.Cursos);

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}

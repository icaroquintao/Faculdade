using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace EscolaBDMySQL
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MySqlConnection conexao = null;
            MySqlCommand comando = null;
            MySqlDataReader dr = null;
            try
            {
                listBox1.Items.Clear();
                conexao = new MySqlConnection("server=localhost; User Id=root; database=escola; password=manager");
                conexao.Open(); 
                comando = new MySqlCommand("SELECT * FROM profes", conexao);
                dr = comando.ExecuteReader();
                while (dr.Read())
                {
                    listBox1.Items.Add(dr.GetString(0) + ", " + dr.GetString(1) + ", área: " + dr.GetString(2) + ", e-mail: " + dr.GetString(3) + ", F. " + dr.GetString(4));
                }
                dr.Close();
                comando.Dispose();
                conexao.Close();  
            } 
            finally {  }


        }

        private void cursosBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.cursosBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.escolaDataSet);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'escolaDataSet.cursos' table. You can move, or remove it, as needed.
            this.cursosTableAdapter.Fill(this.escolaDataSet.cursos);

        }
    }
}

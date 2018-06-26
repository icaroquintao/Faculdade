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




namespace ProjetoAula06
{
        
    public partial class Form3 : Form
    {
        MySqlConnection conexao = new MySqlConnection("server=localhost; port=3306; user id=root; password=manager; database= concessionaria");
        MySqlCommand command;
        MySqlDataReader rs;
        MySqlDataAdapter data_adapter;

        public Form3()
        {
            InitializeComponent();
            try
            {
                conexao.Open();
                populaDataGrid();
                
            }
            catch (Exception ex0)
            {
                MessageBox.Show(null, "Erro na conexão" + ex0.Message, "Erro");
            }

        }
        public void populaDataGrid()
        {
            dataGridView1.DataSource = null;
            data_adapter = new MySqlDataAdapter("SELECT * FROM Marcas ORDER BY id Desc", conexao);
            DataSet DS = new DataSet();
            data_adapter.Fill(DS);
            dataGridView1.DataSource = DS.Tables[0]; //posição 0 dos adaptadores inseridos
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                command = new MySqlCommand("INSERT INTO marcas (marca)" +
                            " VALUES (@marca)", conexao);
                              
                command.Parameters.AddWithValue("@marca", txtMarca1.Text);
                
                command.Prepare();
                int res = command.ExecuteNonQuery();
                if (res > 0)
                {
                    MessageBox.Show(null, "Cadastrado realizado com sucesso!", "Cadastro de Marca");
                     populaDataGrid();
                     txtMarca1.Text = "";
                }
                else
                {
                    MessageBox.Show(null, "O cadastro não foi efetuado. Verifique os dados.", "Cadastro de Marca");
                }

                command.Dispose();

            }
            catch (Exception ex2) { MessageBox.Show(null, "Não foi possível cadastrar.", "Cadastro de Marca"); }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                command = new MySqlCommand("UPDATE marcas SET " +
                            "marca=@marca2 " +
                            " WHERE marca = @marca1", conexao);

                command.Parameters.AddWithValue("@marca1", txtMarca1.Text);
                command.Parameters.AddWithValue("@marca2", txtMarca2.Text);


                command.Prepare();
                int res = command.ExecuteNonQuery();
                if (res > 0)
                {
                    MessageBox.Show(null, "Alteração realizada com sucesso!", "Alteração de Marca");
                    populaDataGrid();
                    txtMarca1.Text = "";
                }
                else
                {
                    MessageBox.Show(null, "A alteração não foi efetuada. Verifique os dados.", "Alteração de Marca");
                }

                command.Dispose();

            }
            catch (Exception ex2) { MessageBox.Show(null, "Não foi possível Alteração.", "Cadastro de Marca"); }
        }


              


    }
    
    
}




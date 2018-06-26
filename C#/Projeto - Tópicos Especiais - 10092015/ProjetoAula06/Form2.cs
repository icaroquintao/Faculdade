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
    public partial class Form2 : Form
    {

        MySqlConnection conexao = new MySqlConnection("server=localhost; port=3306; user id=root; password=manager; database= concessionaria");
        MySqlCommand command;
        MySqlDataReader rs;
        MySqlDataAdapter data_adapter;
        public Form2()
        {
            InitializeComponent();
                       
            try
            {
                conexao.Open();
                populaMarca();
            }
            catch (Exception ex0)
            {
                MessageBox.Show(null, "Erro na conexão" + ex0.Message, "Erro");
            }
        }

        public void populaMarca()
        {

            command = new MySqlCommand("SELECT id, marca FROM marcas", conexao);

            command.Prepare();
            rs = command.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Columns.Add("id", typeof(string));
            dt.Columns.Add("marca", typeof(string));
            dt.Load(rs);

            comboMarca.ValueMember = "id";
            comboMarca.DisplayMember = "marca";
            comboMarca.DataSource = dt;

            // conexao.Close();

        }
               


        public void limparCampos()
        {
            txtPlaca.Text = "";
            txtModelo.Text = "";
            intAno.Text = "";
            floatPreco.Text = "";
        }

        private void button3_Click(object sender, EventArgs e)
        {  //OPÇÃO ALTERAR VEÍCULO
            try
            {

                command = new MySqlCommand("UPDATE veiculos SET " +
                            " marca=@marca, modelo=@modelo, ano=@ano, preco=@preco  " +
                            " WHERE placa = @placa", conexao);
                
                command.Parameters.AddWithValue("@placa", txtPlaca.Text);
                command.Parameters.AddWithValue("@marca", comboMarca.SelectedValue);
                command.Parameters.AddWithValue("@modelo", txtModelo.Text);
                command.Parameters.AddWithValue("@ano", intAno.Text);
                command.Parameters.AddWithValue("@preco", floatPreco.Text);

                command.Prepare();
                int res = command.ExecuteNonQuery();
                if (res > 0)
                {
                    MessageBox.Show(null, "Alteração realizada com sucesso!", "Alteração do Veículo");
                    limparCampos();
                    populaMarca();
                }
                else
                {
                    MessageBox.Show(null, "A alteração não foi efetuada. Verifique os dados.", "Alteração do Veículo");
                }

                command.Dispose();

            }
            catch (Exception ex0) { MessageBox.Show(null, "Não foi possível alterar.", "Alteração do Veículo"); }
        }

        private void button1_Click(object sender, EventArgs e)
        {
                dataGridView1.DataSource = null;
                data_adapter = new MySqlDataAdapter("SELECT * FROM veiculos WHERE marca =" + comboMarca.SelectedValue, conexao);
                DataSet DS = new DataSet();
                data_adapter.Fill(DS);
                dataGridView1.DataSource = DS.Tables[0]; //posição 0 dos adaptadores inseridos

        }

        private void button2_Click(object sender, EventArgs e)
        { //excluir veículo
            try
            {

                command = new MySqlCommand("DELETE FROM veiculos WHERE placa = @placa", conexao);

                command.Parameters.AddWithValue("@placa", txtPlaca.Text);
                command.Prepare();

                int res = command.ExecuteNonQuery();
                if (res > 0)
                {
                    MessageBox.Show(null, "Eliminação realizada com sucesso!", "Eliminação do Veículo");
                    limparCampos();
                    populaMarca();
                }
                else
                {
                    MessageBox.Show(null, "A eliminação não foi efetuada. Verifique os dados.", "Eliminação do Veículo");
                }

                command.Dispose();

            }
            catch (Exception ex0) { MessageBox.Show(null, "Não foi possível eliminar.", "Eliminação do Veículo"); }
        }







    }
}

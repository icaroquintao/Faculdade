using System;
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
    public partial class Form4 : Form
    {
        MySqlConnection conexao = new MySqlConnection("server=localhost; port=3306; user id=root; password=manager; database= concessionaria");
        MySqlCommand command;
        MySqlDataReader rs;
        MySqlDataAdapter data_adapter;

        public Form4()
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

        private void comboMarca_SelectedIndexChanged(object sender, System.EventArgs e)
        {

            String ID = comboMarca.SelectedValue.ToString();
        }
     

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                command = new MySqlCommand("INSERT INTO veiculos (placa,marca,modelo,ano,preco)" +
                            " VALUES (@placa,@marca, @modelo,@ano,@preco)", conexao);

                //command = new MySqlCommand("INSERT INTO veiculos (placa)" +
                 //           "VALUES (@placa)", conexao);

                command.Parameters.AddWithValue("@placa", txtPlaca.Text);
                command.Parameters.AddWithValue("@marca", comboMarca.SelectedValue);
                command.Parameters.AddWithValue("@modelo", txtModelo.Text);
                command.Parameters.AddWithValue("@ano", intAno.Text);
                command.Parameters.AddWithValue("@preco", floatPreco.Text);

                command.Prepare();
                int res = command.ExecuteNonQuery();
                if (res > 0)
                {
                    MessageBox.Show(null, "Cadastrado realizado com sucesso!", "Cadastro do Veículo");
                    limparCampos();
                    populaMarca();
                }
                else
                {
                    MessageBox.Show(null, "O cadastro não foi efetuado. Verifique os dados.", "Cadastro do Veículo");
                }

                command.Dispose();
                
            }
            catch (Exception ex1) { MessageBox.Show(null, "Não foi possível cadastrar.", "Cadastro do Veículo"); }
        }

        private void Form4_Load(object sender, System.EventArgs e)
        {

        }

















    }
}

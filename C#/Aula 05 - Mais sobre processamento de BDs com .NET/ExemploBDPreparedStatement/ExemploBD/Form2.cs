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

namespace ExemploBD
{
    public partial class Form2 : Form
    {
        MySqlConnection conexao
           = new MySqlConnection("server=localhost; port=3306; user id=root; password=123; database= consultorio");
        MySqlCommand command;
        MySqlDataReader rs;
        MySqlDataAdapter data_adapter;

        public Form2()
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

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                command = new MySqlCommand("INSERT INTO pacientes (cpf,nome,nascimento,endereco)" +
                            " VALUES (@cpf,@nome,@nascimento,@endereco)", conexao);

                command.Parameters.AddWithValue("@cpf", txtcpf.Text);
                command.Parameters.AddWithValue("@nome", txtnome.Text);
                command.Parameters.AddWithValue("@nascimento", txtnascimento.Text);
                command.Parameters.AddWithValue("@endereco", txtendereco.Text);

                command.Prepare();
                int res = command.ExecuteNonQuery();
                if (res > 0)
                {
                    MessageBox.Show(null, "Cadastrado satisfatoriamente.", "Cadastro do Paciente");
                    limparCampos();
                    populaDataGrid();
                }
                else
                {
                    MessageBox.Show(null, "O cadastro não foi efetuado. Verifique os dados.", "Cadastro do Paciente");
                }

                command.Dispose();
            }
            catch (Exception ex1) { MessageBox.Show(null, "Não foi possível cadastrar. Verifique se CPF repetido.", "Cadastro Paciente"); }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                command = new MySqlCommand("UPDATE pacientes SET " +
                            "nome=@nome, nascimento=@nascimento, endereco=@endereco " +
                            "WHERE cpf = @cpf", conexao);

                command.Parameters.AddWithValue("@cpf", txtcpf.Text);
                command.Parameters.AddWithValue("@nome", txtnome.Text);
                command.Parameters.AddWithValue("@nascimento", txtnascimento.Text);
                command.Parameters.AddWithValue("@endereco", txtendereco.Text);

                command.Prepare();
                int res = command.ExecuteNonQuery();
                if (res > 0)
                {
                    MessageBox.Show(null, "Atualizado satisfatoriamente.", "Cadastro do Paciente");
                    limparCampos();
                    populaDataGrid();
                }
                else
                {
                    MessageBox.Show(null, "A alteração não foi efetuada. Verifique os dados.", "Alteração do Paciente");
                }

                command.Dispose();
            }
            catch (Exception ex2) {
                MessageBox.Show(null, "A alteração não foi efetuada. Verifique os dados.", "Cadastro do Paciente");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            { 
            command = new MySqlCommand("DELETE FROM pacientes " +
                        "WHERE cpf = @cpf", conexao);

            command.Parameters.AddWithValue("@cpf", txtcpf.Text);           

            command.Prepare();
            int res = command.ExecuteNonQuery();
            if (res > 0)
            {
                MessageBox.Show(null, "CPF " + txtcpf.Text + " excluído com sucesso", "Paciente");
                limparCampos();
                populaDataGrid();
            }
            else
            {
                MessageBox.Show(null, "O CPF não foi encontrado!", "Paciente");
            }

            command.Dispose();
            }
            catch (Exception ex3)
            {
                MessageBox.Show(null, "A eliminação não foi efetuada. Verifique os dados.", "Eliminação do Paciente");
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            { 
            command = new MySqlCommand("SELECT * FROM pacientes WHERE cpf = @cpf", conexao);

            command.Parameters.AddWithValue("@cpf", txtcpf.Text);

            command.Prepare();
            rs = command.ExecuteReader();
            if (rs.Read())
            {
                txtnome.Text = rs.GetString("nome");
                txtnascimento.Text = rs.GetString("nascimento");
                txtendereco.Text = rs.GetString("endereco");
            }
            else
            {
                MessageBox.Show(null, "CPF não cadastrado", "Cad Paciente");
            }
            rs.Close();
            command.Dispose();
            }
            catch (Exception ex4)
            {
                MessageBox.Show(null, "Não foi possível efetuar a consulta.", "Consulta dados do Paciente");
            }
        }

        public void limparCampos() {
            txtcpf.Text="";
            txtnome.Text = "";
            txtnascimento.Text = "";
            txtendereco.Text = "";
        }

        public void populaDataGrid()
        {
            dataGridView1.DataSource = null;
            data_adapter = new MySqlDataAdapter("SELECT * FROM pacientes", conexao);
            DataSet DS = new DataSet();
            data_adapter.Fill(DS); 
            dataGridView1.DataSource = DS.Tables[0]; //posição 0 dos adaptadores inseridos
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

    }

    

}

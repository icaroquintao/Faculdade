using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TesteToolbarMenuAbrirjanela
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            somar();
        }

        private void somarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            somar();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            somar();
        }


        private void somar()
        {
            try
            {
                float a = Convert.ToSingle(textBox1.Text);
                float b = Convert.ToSingle(textBox2.Text);
                label1.Text = "Soma = " + (a + b).ToString("0.00");
            }
            catch (Exception ex) { }
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void sairToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void sobreToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Sobre fr = new Sobre();
            fr.ShowDialog();
        }

        private void cadastropartBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.cadastropartBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this._cadastropart_unicid_e_demitidosDataSet);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the '_cadastropart_unicid_e_demitidosDataSet.cadastropart' table. You can move, or remove it, as needed.
            this.cadastropartTableAdapter.Fill(this._cadastropart_unicid_e_demitidosDataSet.cadastropart);

        }

    }
}

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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void alunosBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.alunosBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.universidade3DataSet);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'universidade3DataSet.Alunos' table. You can move, or remove it, as needed.
            this.alunosTableAdapter.Fill(this.universidade3DataSet.Alunos);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form2 fr = new Form2();
            fr.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form3 fr = new Form3();
            fr.ShowDialog();
        }
    }
}

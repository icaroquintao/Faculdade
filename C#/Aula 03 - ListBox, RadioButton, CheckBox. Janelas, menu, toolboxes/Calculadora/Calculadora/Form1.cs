using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Calculadora
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void toolStripLabel1_Click(object sender, EventArgs e)
        {
            calcular();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            calcular();
        }


        private void calcularToolStripMenuItem_Click(object sender, EventArgs e)
        {
            calcular();
        }

        public void calcular()
        {
            //lógica de cálculo:
            try
            {
                float a = 0, b = 0, res = 0;
                a = Convert.ToSingle(textBox1.Text);
                if (!radioButton6.Checked)
                {
                   b = Convert.ToSingle(textBox2.Text);
                }
                if (radioButton1.Checked) res = a + b;
                if (radioButton2.Checked) res = a - b;
                if (radioButton3.Checked) res = a * b;
                if (radioButton4.Checked) res = a / b;
                if (radioButton5.Checked) res = (a + b) / 2;
                if (radioButton6.Checked) res = (a * a);
                label4.Text = "Resultado: " + res.ToString("0.00");
            }
            catch (Exception excep)
            {
                label4.Text = "Por favor, digite valores corretos!"; 
            }
        }

        private void toolStripLabel2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void sairToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void toolStripLabel3_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Autor: Prof. Ledón", "Sobre");
        }

        private void sobreToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Autor: Prof. Ledón", "Sobre");
        }

    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SelecionaCarro
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //botão Calcular:
            float preco = 0f;
            if (listBox1.SelectedIndex == -1)
            {
                label2.Text = "Por favor, selecione o modelo.";
            }
            else {
                switch (listBox1.SelectedIndex)
                {
                    case 0:
                        preco = 31000f;
                        break;
                    case 1:
                        preco = 37000f;
                        break;
                    case 2:
                        preco = 35500f;
                        break;
                    case 3:
                        preco = 61000f;
                        break;
                    case 4:
                        preco = 70000f;
                        break;
                     case 5:
                        preco = 85600;
                        break;
                }

                if (radioButton2.Checked) preco += 2000f;  //4 portas, acrescentar R$2.000,00
                if (checkBox1.Checked) preco -= 0.05f * preco; //à vista tem 5% de desconto

                label2.Text = "Preço: R$ " + preco.ToString("0.00");
            } // fim do else
        }//fim do método button1_Click
    
    }//fim da classe Form1

}//fim do namespace SelecionaCarro



using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ExListas
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();     
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int pos = listBox1.SelectedIndex;
            if (pos != -1) {
                listBox2.Items.Add(listBox1.SelectedItem);
                listBox1.Items.RemoveAt(pos);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int pos = listBox2.SelectedIndex;
            if (pos != -1) {
                listBox1.Items.Add(listBox2.SelectedItem);
                listBox2.Items.RemoveAt(pos);
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProjetoAula06
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


         private void veículoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form4 p = new Form4();
            p.MdiParent = this;
            p.Show();
        }

         private void marcaToolStripMenuItem_Click(object sender, EventArgs e)
         {
             Form3 p = new Form3();
             p.MdiParent = this;
             p.Show();
         }

         private void veículoToolStripMenuItem1_Click(object sender, EventArgs e)
         {
             Form2 p = new Form2();
             p.MdiParent = this;
             p.Show();
         }

         private void sobreToolStripMenuItem_Click(object sender, EventArgs e)
         {
             Form5 p = new Form5();
             p.MdiParent = this;
             p.Show();
         }
    }
}

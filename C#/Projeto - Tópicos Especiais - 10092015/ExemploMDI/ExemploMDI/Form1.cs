using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExemploMDI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void sairToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void janelaDaClasseFormFilho1ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormFilho1 frm = new FormFilho1();
            frm.MdiParent = this;
            frm.Show();
        }

        private void janelaDaClasseFormFilho1ToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            FormFilho2 frm = new FormFilho2();
            frm.MdiParent = this;
            frm.Show();
        }

        private void emCascataToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.Cascade);
        }

        private void ladoALadoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.TileVertical);
        }

        private void ladoALadoHorizontalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.TileHorizontal);
        }

        private void organizaÍconesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.LayoutMdi(MdiLayout.ArrangeIcons);
        }

    }
}

namespace ExemploMDI
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.arquivoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.sairToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.novaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.janelaDaClasseFormFilho1ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.janelaDaClasseFormFilho1ToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.janelasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.emCascataToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ladoALadoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ladoALadoHorizontalToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.organizaÍconesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.arquivoToolStripMenuItem,
            this.novaToolStripMenuItem,
            this.janelasToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(489, 24);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // arquivoToolStripMenuItem
            // 
            this.arquivoToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.sairToolStripMenuItem});
            this.arquivoToolStripMenuItem.Name = "arquivoToolStripMenuItem";
            this.arquivoToolStripMenuItem.Size = new System.Drawing.Size(61, 20);
            this.arquivoToolStripMenuItem.Text = "Arquivo";
            // 
            // sairToolStripMenuItem
            // 
            this.sairToolStripMenuItem.Name = "sairToolStripMenuItem";
            this.sairToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.sairToolStripMenuItem.Text = "Sair";
            this.sairToolStripMenuItem.Click += new System.EventHandler(this.sairToolStripMenuItem_Click);
            // 
            // novaToolStripMenuItem
            // 
            this.novaToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.janelaDaClasseFormFilho1ToolStripMenuItem,
            this.janelaDaClasseFormFilho1ToolStripMenuItem1});
            this.novaToolStripMenuItem.Name = "novaToolStripMenuItem";
            this.novaToolStripMenuItem.Size = new System.Drawing.Size(47, 20);
            this.novaToolStripMenuItem.Text = "Nova";
            // 
            // janelaDaClasseFormFilho1ToolStripMenuItem
            // 
            this.janelaDaClasseFormFilho1ToolStripMenuItem.Name = "janelaDaClasseFormFilho1ToolStripMenuItem";
            this.janelaDaClasseFormFilho1ToolStripMenuItem.Size = new System.Drawing.Size(219, 22);
            this.janelaDaClasseFormFilho1ToolStripMenuItem.Text = "Janela da classe FormFilho1";
            this.janelaDaClasseFormFilho1ToolStripMenuItem.Click += new System.EventHandler(this.janelaDaClasseFormFilho1ToolStripMenuItem_Click);
            // 
            // janelaDaClasseFormFilho1ToolStripMenuItem1
            // 
            this.janelaDaClasseFormFilho1ToolStripMenuItem1.Name = "janelaDaClasseFormFilho1ToolStripMenuItem1";
            this.janelaDaClasseFormFilho1ToolStripMenuItem1.Size = new System.Drawing.Size(219, 22);
            this.janelaDaClasseFormFilho1ToolStripMenuItem1.Text = "Janela da classe FormFilho2";
            this.janelaDaClasseFormFilho1ToolStripMenuItem1.Click += new System.EventHandler(this.janelaDaClasseFormFilho1ToolStripMenuItem1_Click);
            // 
            // janelasToolStripMenuItem
            // 
            this.janelasToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.emCascataToolStripMenuItem,
            this.ladoALadoToolStripMenuItem,
            this.ladoALadoHorizontalToolStripMenuItem,
            this.organizaÍconesToolStripMenuItem});
            this.janelasToolStripMenuItem.Name = "janelasToolStripMenuItem";
            this.janelasToolStripMenuItem.Size = new System.Drawing.Size(56, 20);
            this.janelasToolStripMenuItem.Text = "Janelas";
            // 
            // emCascataToolStripMenuItem
            // 
            this.emCascataToolStripMenuItem.Name = "emCascataToolStripMenuItem";
            this.emCascataToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.emCascataToolStripMenuItem.Text = "Em cascata";
            this.emCascataToolStripMenuItem.Click += new System.EventHandler(this.emCascataToolStripMenuItem_Click);
            // 
            // ladoALadoToolStripMenuItem
            // 
            this.ladoALadoToolStripMenuItem.Name = "ladoALadoToolStripMenuItem";
            this.ladoALadoToolStripMenuItem.Size = new System.Drawing.Size(191, 22);
            this.ladoALadoToolStripMenuItem.Text = "Lado a lado vertical";
            this.ladoALadoToolStripMenuItem.Click += new System.EventHandler(this.ladoALadoToolStripMenuItem_Click);
            // 
            // ladoALadoHorizontalToolStripMenuItem
            // 
            this.ladoALadoHorizontalToolStripMenuItem.Name = "ladoALadoHorizontalToolStripMenuItem";
            this.ladoALadoHorizontalToolStripMenuItem.Size = new System.Drawing.Size(191, 22);
            this.ladoALadoHorizontalToolStripMenuItem.Text = "Lado a lado horizontal";
            this.ladoALadoHorizontalToolStripMenuItem.Click += new System.EventHandler(this.ladoALadoHorizontalToolStripMenuItem_Click);
            // 
            // organizaÍconesToolStripMenuItem
            // 
            this.organizaÍconesToolStripMenuItem.Name = "organizaÍconesToolStripMenuItem";
            this.organizaÍconesToolStripMenuItem.Size = new System.Drawing.Size(229, 22);
            this.organizaÍconesToolStripMenuItem.Text = "Organiza ícones minimizados";
            this.organizaÍconesToolStripMenuItem.Click += new System.EventHandler(this.organizaÍconesToolStripMenuItem_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(489, 342);
            this.Controls.Add(this.menuStrip1);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Esta janela é um MDI contêiner";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem arquivoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem sairToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem novaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem janelaDaClasseFormFilho1ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem janelaDaClasseFormFilho1ToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem janelasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem emCascataToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ladoALadoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ladoALadoHorizontalToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem organizaÍconesToolStripMenuItem;
    }
}


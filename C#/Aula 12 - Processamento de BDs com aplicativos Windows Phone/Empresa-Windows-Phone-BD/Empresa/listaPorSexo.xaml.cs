using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;

namespace Empresa
{
    public partial class listaPorSexo : PhoneApplicationPage
    {
        public listaPorSexo()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        { //botão ? para listar por sexo
            int sexo = lstSexos.SelectedIndex;
            txtRes.Text = listarDoSexo(sexo);
        }

        public String listarDoSexo(int sexo)
        {
            using (var ctx = new
            empresaContext("Data Source=isostore:/Banco.sdf"))
            {
                String osexo = "";
                if(sexo==0) osexo = "M"; else osexo = "F";
                List<Trabalhadores> umalista = ctx.Trabalhadores.ToList();
                umalista.Sort((x, y) => string.Compare(x.Nome, y.Nome)); //ordena pelos nomes
                String str = "Trabalhadores do sexo " + osexo + ":\n\n";
                for (int i = 0; i < umalista.Count; i++)
                {
                    if(umalista.ElementAt(i).Sexo.Equals(osexo)) {
                        str += "" + umalista.ElementAt(i).Cpf + ", "
                        + umalista.ElementAt(i).Nome + ", "
                        + umalista.ElementAt(i).Salario + ", "
                        + umalista.ElementAt(i).Sexo + "\n";
                    }
                }
                return (str);
            }
        } // listarDoSexo



    }
}
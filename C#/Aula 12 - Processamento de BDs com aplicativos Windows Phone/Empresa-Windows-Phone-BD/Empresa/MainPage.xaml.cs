using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Empresa.Resources;

namespace Empresa
{
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        public MainPage()
        {
            InitializeComponent();
        }

        protected override void OnNavigatedTo(NavigationEventArgs e)
        {

            //Se for necessário apagar o banco de dados, executamos:
            /*
            using (var ctx = new universidadeSqlCEContext("Data Source=isostore:/Banco.sdf"))
            {
            ctx.DeleteDatabase();
            }
            */
            using (var ctx = new empresaContext("Data Source=isostore:/Banco.sdf"))
            {
                try
                {
                    if (!ctx.DatabaseExists())
                    {
                        //Se o BD não existe, criamos o banco:
                        ctx.CreateDatabase();
                    }
                }
                catch (Exception errcd)
                {
                    txtRes.Text = "Erro: " + errcd.Message;
                }
            }
        }


        private void btnInserir_Click(object sender, RoutedEventArgs e)
        {
            //Adicionamos um trabalhador, com dados digitados pelo usuário:
            using (var ctx = new empresaContext("Data Source=isostore:/Banco.sdf"))
            {
                try
                {
                    Trabalhadores novoRegistro = new Trabalhadores
                     {
                         Cpf = cpf.Text,
                         Nome = nome.Text,
                         Salario = Convert.ToDouble(salario.Text),
                         Sexo = sexo.Text,
                     };
                    ctx.Trabalhadores.InsertOnSubmit(novoRegistro);
                    ctx.SubmitChanges();
                    txtRes.Text = "Trabalhador inserido!";
                }
                catch (Exception errcd)
                {
                    txtRes.Text = "Erro: verifique os dados digitados e que este CPF não exista no banco de dados.";
                }
            }
        }//fim do click no botão Inserir

        public String dadosDeTodosOsTrabalhadores()
        {
            using (var ctx = new
            empresaContext("Data Source=isostore:/Banco.sdf"))
            {
                //Retorna os dados de todos os trabalhadores cadastrados:
                List<Trabalhadores> umalista = ctx.Trabalhadores.ToList();
                umalista.Sort((x, y) => string.Compare(x.Nome, y.Nome)); //ordena pelos nomes
                String str = "\nQtde. trabalhadores: " + ctx.Trabalhadores.ToList().Count + "\n\n";
                for (int i = 0; i < umalista.Count; i++)
                {
                    str += "" + umalista.ElementAt(i).Cpf + ", "
                    + umalista.ElementAt(i).Nome + ", "
                    + umalista.ElementAt(i).Salario + ", "
                    + umalista.ElementAt(i).Sexo + "\n";
                }
                return (str);
            }
        }

        private void btnMostrar_Click(object sender, RoutedEventArgs e)
        {
            txtRes.Text = dadosDeTodosOsTrabalhadores();
        }

        private void btnApagar_Click(object sender, RoutedEventArgs e)
        {
            //Eliminamos um trabalhador que tenha o CPF digitado pelo usuário:
            using (var ctx = new empresaContext("Data Source=isostore:/Banco.sdf"))
            {
                try
                {
                         IEnumerable<Trabalhadores> query = (from c in ctx.Trabalhadores
                                where c.Cpf == cpf.Text
                                select c).ToList();
                         ctx.Trabalhadores.DeleteAllOnSubmit(query);
                         System.Data.Linq.ChangeSet cs = ctx.GetChangeSet();
                         int qtde = cs.Deletes.Count;
                         if (qtde > 0) txtRes.Text = "O CPF foi encontrado: o trabalhador foi eliminado com sucesso.";
                         else txtRes.Text = "O trabalhador não foi eliminado.";
                         ctx.SubmitChanges();
                }
                catch (Exception errcd)
                {
                    txtRes.Text = "Erro: verifique que este CPF exista no banco de dados.";
                }
            }
        } //fim da lógica do botão Apagar

        private void btnAlterar_Click(object sender, RoutedEventArgs e)
        {
            //Alteramos os dados de um trabalhador que tenha o CPF digitado pelo usuário:
            using (var ctx = new empresaContext("Data Source=isostore:/Banco.sdf"))
            {
                try
                {
                    var umtrabalhador =
                        (from c in ctx.Trabalhadores
                         where c.Cpf == cpf.Text
                         select c).First();

                    umtrabalhador.Nome = nome.Text;
                    umtrabalhador.Salario = Convert.ToDouble(salario.Text);
                    umtrabalhador.Sexo = sexo.Text;

                    System.Data.Linq.ChangeSet cs = ctx.GetChangeSet();  
                    int qtde = cs.Updates.Count;
                    if (qtde > 0) txtRes.Text = "O CPF foi encontrado: o trabalhador foi alterado com sucesso.";
                    else txtRes.Text = "O trabalhador não foi alterado.";

                    ctx.SubmitChanges();
               }
                catch (Exception errcd)
                {
                    txtRes.Text = "Erro: verifique os dados digitados e que este CPF exista no banco de dados.";
                }
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        { 
            //Botão ? para listar por sexo
            NavigationService.Navigate(new Uri("/listaPorSexo.xaml", UriKind.Relative));
        }

    }
}
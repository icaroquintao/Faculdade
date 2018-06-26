using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppAlunoPessoa
{
    class Program
    {
        static void Main(string[] args)
        {
            String oRgmAluno;
            Console.WriteLine("Digite o RGM do aluno:");
            oRgmAluno = Console.ReadLine();
            Aluno al = new Aluno("José Alves", oRgmAluno, "123.456.789-3");
            Console.WriteLine(al.Rgm + ", " + al.Nome + ", " + al.Cpf);
            al.Rgm = "12344-8";  //alteramos a propriedade Rgm
            al.Nome = "Ana Lopes Souza";  //alteramos a propriedade Nome
            Console.WriteLine("Depois de alterar os dados do aluno:");
            Console.WriteLine(al.Rgm + ", " + al.Nome + ", " + al.Cpf);
            Console.ReadLine();
        }
    }

    public class Pessoa
    {
        private String nome;

        public Pessoa(String nome)   //método construtor
        {
            this.nome = nome;
        }

        public String Nome   //esta é a propriedade Nome
        {
            get {
                return nome;
            }
            set
            {
                nome = value;
            }
        }

    }//fim da classe Pessoa

    public class Aluno : Pessoa
    {

        private String rgm, cpf;

        public Aluno(String nome, String umrgm, String cpf) : base(nome)
        {
            this.cpf = cpf;
            rgm = umrgm;  //usando a propriedade Rgm
        }

        public String Rgm   //esta é a propriedade Rgm
        {   
            get
            {
                return rgm;
            }

            set
            {
                rgm = value;  //palavra reservada value
            }

        }   //fim da propriedade Rgm

        public String Cpf   //esta é a propriedade Cpf
        {
            get
            {
                return cpf;
            }

            set
            {
                cpf = value;  //palavra reservada value
            }
        }   //fim da propriedade Cpf

    }//fim da classe Aluno

}

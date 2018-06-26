using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using PhoneApp1.Resources;
using System.Threading;
using System.Threading.Tasks;
using System.Net;
using System.Text;

namespace PhoneApp1
{
    public partial class MainPage : PhoneApplicationPage
    {

        public static String responseString = "";
        private int quantSegundos = 0;
        private System.Windows.Threading.DispatcherTimer tiempo;

        // Constructor
        public MainPage()
        {
            InitializeComponent();

            // Sample code to localize the ApplicationBar
            //BuildLocalizedApplicationBar();
        }



        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            txtresp.Text = "Solicitação enviada. Por favor, aguarde...";
            MyThreadClass myThread;
            var t = Task.Run(() =>
            {
                myThread = new MyThreadClass();
                myThread.inicia();
            });


            tiempo = new System.Windows.Threading.DispatcherTimer();
            tiempo.Interval = TimeSpan.FromSeconds(1); //intervalo de 1 seg

            tiempo.Tick += dispatcherTimer_Tick;
            tiempo.Start();

        }




        void dispatcherTimer_Tick(object sender, object e)
        {
            quantSegundos++;
            if (quantSegundos == 9)
            {
                txtresp.Text = "Não foi possível completar a solicitação. Por favor, verifique a conexão de seu aparelho com a Internet e a intensidade do sinal de rede.";
                tiempo.Stop();
            }
            if (!responseString.Equals(""))
            {
                txtresp.Text = responseString;
                tiempo.Stop();
            }
        }



        class MyThreadClass
        {
            private static ManualResetEvent allDone = new ManualResetEvent(false);

            public void inicia()
            {
                string sURL = "http://cpa.cruzeirodosulvirtual.com.br:8080/avl1410/geraResposta.jsp";

                try
                {
                    // Create a new HttpWebRequest object.
                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(sURL);
                    request.ContentType = "application/x-www-form-urlencoded";
                    request.Method = "POST"; // Set the Method property to 'GET' 
                    // start the asynchronous operation
                    request.BeginGetRequestStream(new AsyncCallback(GetRequestStreamCallback), request);
                    allDone.WaitOne();
                }
                catch (Exception qualquer)
                {
                    responseString = "Não foi possível completar a solicitação. \n\nPor favor, verifique a conexão de seu aparelho com a Internet e a intensidade do sinal da rede de dados." + qualquer.Message;
                }
            }

            private void GetRequestStreamCallback(IAsyncResult asynchronousResult)
            {
                try
                {
                    HttpWebRequest request = (HttpWebRequest)asynchronousResult.AsyncState;
                    System.IO.Stream postStream = request.EndGetRequestStream(asynchronousResult);

                    string postData = " ";
                    // Convert the string into a byte array.
                    byte[] byteArray = Encoding.UTF8.GetBytes(postData);
                    // Write to the request stream.
                    postStream.Write(byteArray, 0, postData.Length);
                    postStream.Dispose();

                    // Start the asynchronous operation to get the response
                    request.BeginGetResponse(new AsyncCallback(GetResponseCallback), request);
                }
                catch (Exception qualquer)
                {
                    responseString = "Não foi possível completar a solicitação. \n\nPor favor, verifique a conexão de seu aparelho com a Internet e a intensidade do sinal da rede de dados." + qualquer.Message;
                }

            }

            private void GetResponseCallback(IAsyncResult asynchronousResult)
            {
                try
                {
                    HttpWebRequest request = (HttpWebRequest)asynchronousResult.AsyncState;

                    // End the operation
                    HttpWebResponse response = (HttpWebResponse)request.EndGetResponse(asynchronousResult);
                    System.IO.Stream streamResponse = response.GetResponseStream();
                    System.IO.StreamReader streamRead = new System.IO.StreamReader(streamResponse, Encoding.GetEncoding("iso-8859-1"));
                    responseString = streamRead.ReadToEnd();

                    // Close the stream object

                    streamResponse.Dispose();
                    streamRead.Dispose();
                    // Release the HttpWebResponse
                    response.Dispose();
                    allDone.Set();
                }
                catch (Exception qualquer)
                {
                    responseString = "Não foi possível completar a solicitação. \n\nPor favor, verifique a conexão de seu aparelho com a Internet e a intensidade do sinal da rede de dados."
                                            + "\n\nTexto original do erro: " + qualquer.Message;
                }
            }

        }

    }

}





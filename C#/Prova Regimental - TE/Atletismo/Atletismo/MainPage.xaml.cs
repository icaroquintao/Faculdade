using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Atletismo.Resources;

namespace Atletismo
{
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        public MainPage()
        {
            InitializeComponent();
        }

        protected override void OnNavigatedTo (NavigationEventArgs e)  {
            using (var ctx = new atletismoContext("Data Source=isostore:/Banco.sdf"))
            {
                try
                {
                    if (!ctx.DatabaseExists())
                    {

                    }
                }
                catch (Exception exbd)
                {

                }
         } // using
        } //   método OnNavigatedTo

    } //classe MainPage

} // namespace


﻿#pragma checksum "C:\D\Aulas      -    2015 - 2º semestre\TE\Aula 12 - TE - 2015 - Windows Phone - parte 2 - BDs\Empresa-Windows-Phone-BD\Empresa\MainPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "EAAB7170F30D7B1E54FA17FE9EF10D60"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Microsoft.Phone.Controls;
using System;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Automation.Peers;
using System.Windows.Automation.Provider;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Resources;
using System.Windows.Shapes;
using System.Windows.Threading;


namespace Empresa {
    
    
    public partial class MainPage : Microsoft.Phone.Controls.PhoneApplicationPage {
        
        internal System.Windows.Controls.Grid LayoutRoot;
        
        internal System.Windows.Controls.StackPanel TitlePanel;
        
        internal System.Windows.Controls.Grid ContentPanel;
        
        internal System.Windows.Controls.TextBlock lblcpf;
        
        internal System.Windows.Controls.TextBox cpf;
        
        internal System.Windows.Controls.TextBlock lblnome;
        
        internal System.Windows.Controls.TextBox nome;
        
        internal System.Windows.Controls.TextBlock lblcpf_Copy;
        
        internal System.Windows.Controls.TextBox salario;
        
        internal System.Windows.Controls.TextBlock lblcpf_Copy1;
        
        internal System.Windows.Controls.TextBox sexo;
        
        internal System.Windows.Controls.Button btnInserir;
        
        internal System.Windows.Controls.Button btnApagar;
        
        internal System.Windows.Controls.Button btnAlterar;
        
        internal System.Windows.Controls.Button btnMostrar;
        
        internal System.Windows.Controls.TextBlock txtRes;
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Windows.Application.LoadComponent(this, new System.Uri("/Empresa;component/MainPage.xaml", System.UriKind.Relative));
            this.LayoutRoot = ((System.Windows.Controls.Grid)(this.FindName("LayoutRoot")));
            this.TitlePanel = ((System.Windows.Controls.StackPanel)(this.FindName("TitlePanel")));
            this.ContentPanel = ((System.Windows.Controls.Grid)(this.FindName("ContentPanel")));
            this.lblcpf = ((System.Windows.Controls.TextBlock)(this.FindName("lblcpf")));
            this.cpf = ((System.Windows.Controls.TextBox)(this.FindName("cpf")));
            this.lblnome = ((System.Windows.Controls.TextBlock)(this.FindName("lblnome")));
            this.nome = ((System.Windows.Controls.TextBox)(this.FindName("nome")));
            this.lblcpf_Copy = ((System.Windows.Controls.TextBlock)(this.FindName("lblcpf_Copy")));
            this.salario = ((System.Windows.Controls.TextBox)(this.FindName("salario")));
            this.lblcpf_Copy1 = ((System.Windows.Controls.TextBlock)(this.FindName("lblcpf_Copy1")));
            this.sexo = ((System.Windows.Controls.TextBox)(this.FindName("sexo")));
            this.btnInserir = ((System.Windows.Controls.Button)(this.FindName("btnInserir")));
            this.btnApagar = ((System.Windows.Controls.Button)(this.FindName("btnApagar")));
            this.btnAlterar = ((System.Windows.Controls.Button)(this.FindName("btnAlterar")));
            this.btnMostrar = ((System.Windows.Controls.Button)(this.FindName("btnMostrar")));
            this.txtRes = ((System.Windows.Controls.TextBlock)(this.FindName("txtRes")));
        }
    }
}


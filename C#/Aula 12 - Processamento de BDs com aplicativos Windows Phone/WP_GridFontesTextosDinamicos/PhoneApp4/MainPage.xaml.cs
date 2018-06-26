using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using PhoneApp4.Resources;

namespace PhoneApp4
{
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        public MainPage()
        {
            InitializeComponent();
            this.Title = "Grid Sample";
            titulo.Text = "Grade com textos e fontes";

            int numlines = 40;
            
            myGridVisual.HorizontalAlignment = HorizontalAlignment.Left;
            myGridVisual.VerticalAlignment = VerticalAlignment.Top;
            myGridVisual.ShowGridLines = true;

            ColumnDefinition colDef1 = new ColumnDefinition();
            ColumnDefinition colDef2 = new ColumnDefinition();
            ColumnDefinition colDef3 = new ColumnDefinition();
            myGridVisual.ColumnDefinitions.Add(colDef1);
            myGridVisual.ColumnDefinitions.Add(colDef2);
            myGridVisual.ColumnDefinitions.Add(colDef3);

            for (int i = 0; i < numlines; i++)
            {
                RowDefinition rowDef1 = new RowDefinition();
                myGridVisual.RowDefinitions.Add(rowDef1);

                // Adiciona a primeira célula desta linha
                TextBlock txt2 = new TextBlock();
                txt2.Text = "  Linha " + (i + 1)   +   "  "; ;
                txt2.FontSize = 14;
                txt2.TextWrapping = TextWrapping.Wrap;
                txt2.FontWeight = FontWeights.Bold;
                Grid.SetRow(txt2, i);
                Grid.SetColumn(txt2, 0);

                // Adiciona a segunda célula desta linha
                TextBlock txt3 = new TextBlock();
                txt3.Text = "Texto da segunda coluna, negrito, size 12, longo para provocar wrapping";
                txt3.FontSize = 12;
                txt3.TextWrapping = TextWrapping.Wrap;
                //txt3.FontWeight = FontWeights.Bold;
                Grid.SetRow(txt3, i);
                Grid.SetColumn(txt3, 1);

                // Adiciona a terceira célula desta linha
                TextBlock txt4 = new TextBlock();
                txt4.Text = "  Coluna3  "; ;
                txt4.FontSize = 12;
                txt4.TextWrapping = TextWrapping.Wrap;
                Grid.SetRow(txt4, i);
                Grid.SetColumn(txt4, 2);

                myGridVisual.Children.Add(txt2);
                myGridVisual.Children.Add(txt3);
                myGridVisual.Children.Add(txt4);
            }

            this.UpdateLayout();
        }

    }
}
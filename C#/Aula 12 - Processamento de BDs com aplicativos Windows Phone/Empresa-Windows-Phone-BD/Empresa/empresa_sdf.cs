﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     O código foi gerado por uma ferramenta.
//     Versão de Tempo de Execução:4.0.30319.34014
//
//     As alterações ao arquivo poderão causar comportamento incorreto e serão perdidas se
//     o código for gerado novamente.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Empresa
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="C:\\D\\Aulas   -    2014 - 2º semestre\\TE\\empresa.sdf")]
	public partial class empresaContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		

    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertTrabalhadores(Trabalhadores instance);
    partial void UpdateTrabalhadores(Trabalhadores instance);
    partial void DeleteTrabalhadores(Trabalhadores instance);
    partial void InsertVeiculos(Veiculos instance);
    partial void UpdateVeiculos(Veiculos instance);
    partial void DeleteVeiculos(Veiculos instance);
    #endregion
		
		public empresaContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		/*
         * public empresaContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
         * */
		
		public empresaContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
        /*
		public empresaContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		*/

		public System.Data.Linq.Table<Trabalhadores> Trabalhadores
		{
			get
			{
				return this.GetTable<Trabalhadores>();
			}
		}
		
		public System.Data.Linq.Table<Veiculos> Veiculos
		{
			get
			{
				return this.GetTable<Veiculos>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="trabalhadores")]
	public partial class Trabalhadores : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _Cpf;
		
		private string _Nome;
		
		private double _Salario;
		
		private string _Sexo;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnCpfChanging(string value);
    partial void OnCpfChanged();
    partial void OnNomeChanging(string value);
    partial void OnNomeChanged();
    partial void OnSalarioChanging(double value);
    partial void OnSalarioChanged();
    partial void OnSexoChanging(string value);
    partial void OnSexoChanged();
    #endregion
		
		public Trabalhadores()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="cpf", Storage="_Cpf", DbType="NVarChar(14) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string Cpf
		{
			get
			{
				return this._Cpf;
			}
			set
			{
				if ((this._Cpf != value))
				{
					this.OnCpfChanging(value);
					this.SendPropertyChanging();
					this._Cpf = value;
					this.SendPropertyChanged("Cpf");
					this.OnCpfChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="nome", Storage="_Nome", DbType="NVarChar(150) NOT NULL", CanBeNull=false)]
		public string Nome
		{
			get
			{
				return this._Nome;
			}
			set
			{
				if ((this._Nome != value))
				{
					this.OnNomeChanging(value);
					this.SendPropertyChanging();
					this._Nome = value;
					this.SendPropertyChanged("Nome");
					this.OnNomeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="salario", Storage="_Salario", DbType="Float NOT NULL")]
		public double Salario
		{
			get
			{
				return this._Salario;
			}
			set
			{
				if ((this._Salario != value))
				{
					this.OnSalarioChanging(value);
					this.SendPropertyChanging();
					this._Salario = value;
					this.SendPropertyChanged("Salario");
					this.OnSalarioChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="sexo", Storage="_Sexo", DbType="NVarChar(1) NOT NULL", CanBeNull=false)]
		public string Sexo
		{
			get
			{
				return this._Sexo;
			}
			set
			{
				if ((this._Sexo != value))
				{
					this.OnSexoChanging(value);
					this.SendPropertyChanging();
					this._Sexo = value;
					this.SendPropertyChanged("Sexo");
					this.OnSexoChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="veiculos")]
	public partial class Veiculos : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private string _Placa;
		
		private string _Marcamodelo;
		
		private int _Ano;
		
		private long _Quilometragem;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnPlacaChanging(string value);
    partial void OnPlacaChanged();
    partial void OnMarcamodeloChanging(string value);
    partial void OnMarcamodeloChanged();
    partial void OnAnoChanging(int value);
    partial void OnAnoChanged();
    partial void OnQuilometragemChanging(long value);
    partial void OnQuilometragemChanged();
    #endregion
		
		public Veiculos()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="placa", Storage="_Placa", DbType="NVarChar(8) NOT NULL", CanBeNull=false, IsPrimaryKey=true)]
		public string Placa
		{
			get
			{
				return this._Placa;
			}
			set
			{
				if ((this._Placa != value))
				{
					this.OnPlacaChanging(value);
					this.SendPropertyChanging();
					this._Placa = value;
					this.SendPropertyChanged("Placa");
					this.OnPlacaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="marcamodelo", Storage="_Marcamodelo", DbType="NVarChar(100) NOT NULL", CanBeNull=false)]
		public string Marcamodelo
		{
			get
			{
				return this._Marcamodelo;
			}
			set
			{
				if ((this._Marcamodelo != value))
				{
					this.OnMarcamodeloChanging(value);
					this.SendPropertyChanging();
					this._Marcamodelo = value;
					this.SendPropertyChanged("Marcamodelo");
					this.OnMarcamodeloChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="ano", Storage="_Ano", DbType="Int NOT NULL")]
		public int Ano
		{
			get
			{
				return this._Ano;
			}
			set
			{
				if ((this._Ano != value))
				{
					this.OnAnoChanging(value);
					this.SendPropertyChanging();
					this._Ano = value;
					this.SendPropertyChanged("Ano");
					this.OnAnoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Name="quilometragem", Storage="_Quilometragem", DbType="BigInt NOT NULL")]
		public long Quilometragem
		{
			get
			{
				return this._Quilometragem;
			}
			set
			{
				if ((this._Quilometragem != value))
				{
					this.OnQuilometragemChanging(value);
					this.SendPropertyChanging();
					this._Quilometragem = value;
					this.SendPropertyChanged("Quilometragem");
					this.OnQuilometragemChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
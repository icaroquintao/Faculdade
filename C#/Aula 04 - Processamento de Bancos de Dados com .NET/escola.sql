/*
SQLyog Community Edition- MySQL GUI v7.02 
MySQL - 5.5.8 : Database - escola
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`escola` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `escola`;


/*Table structure for table `alunos` */

DROP TABLE IF EXISTS `alunos`;

CREATE TABLE `alunos` (
  `rgm` varchar(7) NOT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `idade` int(3) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `semestre` int(3) DEFAULT NULL,
  `curso` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`rgm`)
) ;

/*Data for the table `alunos` */

insert  into `alunos`(`rgm`,`nome`,`idade`,`sexo`,`semestre`,`curso`) values ('12345-1','Ana Silva',22,'F',8,'CCP'),('12345-2','Rosa Lopes',34,'F',8,'CCP'),('12345-3','Luiz Peres',21,'M',2,'TADS'),('12345-4','Pedro Alves',45,'M',2,'TADS'),('12345-5','Jorge Lopes',26,'M',2,'TSI'),('12345-6','Bruno Cenati',25,'M',4,'TSI'),('12345-7','Leila Souza',21,'F',4,'TADS'),('12399-9','Luma Lopes',19,'F',5,'CCP');

/*Table structure for table `cursos` */

DROP TABLE IF EXISTS `cursos`;

CREATE TABLE `cursos` (
  `abrev` varchar(4) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`abrev`)
) ;

/*Data for the table `cursos` */

insert  into `cursos`(`abrev`,`descricao`) values ('ARQ','Arquitetura'),('CCP','Ciência da Computação'),('FIS','Física - Bacharelado'),('GEO','Geofrafia'),('LET','Letras'),('TADS','Tecnologia em Análise e Desenvolvimento de Sistemas'),('TSI','Tecnologia em Sistemas para Internet');

/*Table structure for table `profes` */

DROP TABLE IF EXISTS `profes`;

CREATE TABLE `profes` (
  `matricula` varchar(11) NOT NULL,
  `nome` varchar(65) DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefone` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ;

/*Data for the table `profes` */

insert  into `profes`(`matricula`,`nome`,`area`,`email`,`telefone`) values ('1','João','CETEC','um@yahoo.com','1234-5671'),('2','Pedro','CETEC','dois@yahoo.com','1234-5672'),('3','Ana','CHS','tres@yahoo.com','1234-5673'),('4','Rosa','CAN','quatro@yahoo.com','1234-5674'),('5','Luiz','CBS','cinco@yahoo.com','1234-5675'),('6','Luisa','CETEC','seis@yahoo.com','1234-5676');

/*Table structure for table `tabelasequencial` */

DROP TABLE IF EXISTS `tabelasequencial`;

CREATE TABLE `tabelasequencial` (
  `cod` int(5) NOT NULL,
  `texto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ;



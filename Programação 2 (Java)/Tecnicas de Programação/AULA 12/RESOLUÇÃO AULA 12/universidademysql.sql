/*
SQLyog Community v9.33 GA
MySQL - 5.5.28 : Database - universidademysql
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE `universidademysql`;
USE `universidademysql`;

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `NúmDepto` mediumint(8) unsigned DEFAULT NULL,
  `NomeDepto` varchar(60) DEFAULT NULL,
  `NomeCentro` varchar(10) DEFAULT NULL
) ;

/*Data for the table `departamentos` */

insert  into `departamentos`(`NúmDepto`,`NomeDepto`,`NomeCentro`) values (1,'Informática','CETEC'),(2,'Matemática','CETEC'),(3,'Educação Artística','CCSH');

/*Table structure for table `disciplinas` */

DROP TABLE IF EXISTS `disciplinas`;

CREATE TABLE `disciplinas` (
  `NumDisciplina` smallint(6) DEFAULT NULL,
  `NomeDisciplina` varchar(60) DEFAULT NULL
) ;

/*Data for the table `disciplinas` */

insert  into `disciplinas`(`NumDisciplina`,`NomeDisciplina`) values (1,'Programacao I'),(2,'Física'),(3,'Tópicos Avançados de Programação'),(4,'Técnicas de Programação II'),(5,'TOO'),(9,'Hipermídia'),(12345,'Programacao lógica'),(49,'Métodos Numéricos Avançados'),(345,'Pedagogia III'),(12,'Pedagogia II'),(1414,'Lógica VI');

/*Table structure for table `planejamentoaulas` */

DROP TABLE IF EXISTS `planejamentoaulas`;

CREATE TABLE `planejamentoaulas` (
  `NúmProf` smallint(6) DEFAULT NULL,
  `NúmTurma` smallint(6) DEFAULT NULL,
  `NúmDisciplina` smallint(6) DEFAULT NULL,
  `Observações` varchar(50) DEFAULT NULL
) ;

/*Data for the table `planejamentoaulas` */

insert  into `planejamentoaulas`(`NúmProf`,`NúmTurma`,`NúmDisciplina`,`Observações`) values (1,1,1,'Nas semanas alternas usam a sala de vídeo'),(1,2,1,''),(2,1,2,''),(2,3,2,''),(2,4,4,''),(3,1,3,''),(3,2,3,'Laboratório de Informática sempre que for possível'),(3,3,1,''),(3,3,3,'');

/*Table structure for table `professores` */

DROP TABLE IF EXISTS `professores`;

CREATE TABLE `professores` (
  `NúmProf` smallint(6) DEFAULT NULL,
  `NomeProf` varchar(100) DEFAULT NULL,
  `SalárioProf` float DEFAULT NULL,
  `SexoProf` char(1) DEFAULT NULL,
  `NúmDepto` mediumint(8) unsigned DEFAULT NULL,
  `Categoria` char(1) DEFAULT NULL
) ;

/*Data for the table `professores` */

insert  into `professores`(`NúmProf`,`NomeProf`,`SalárioProf`,`SexoProf`,`NúmDepto`,`Categoria`) values (3,'Pepe Garcia',3456,'M',2,'d'),(9,'Rosa Peres',1200,'F',2,'m'),(4,'Ana Silva Lopes',2000,'F',1,'m'),(2,'Pedrinho Souza',1200,'M',2,'d'),(11,'Joao da Silva',2000,'M',2,'e'),(14,'Ana Lopes',1790,'F',1,'m'),(15,'Miguel Lopes',2300,'M',3,'d');

/*Table structure for table `turmas` */

DROP TABLE IF EXISTS `turmas`;

CREATE TABLE `turmas` (
  `NúmTurma` smallint(6) DEFAULT NULL,
  `NomeTurma` varchar(6) DEFAULT NULL,
  `Sala` varchar(5) DEFAULT NULL,
  `Período` char(1) DEFAULT NULL
) ;

/*Data for the table `turmas` */

insert  into `turmas`(`NúmTurma`,`NomeTurma`,`Sala`,`Período`) values (0,'TPD-4A','444-C','N'),(1,'TPD-2A','301-B','M'),(2,'CCp-2B','508-C','N'),(3,'TPD-2B','512-C','N'),(4,'TPD-3B','314-C','N');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

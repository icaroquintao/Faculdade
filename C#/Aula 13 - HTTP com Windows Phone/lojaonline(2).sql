/*
SQLyog Community v9.33 GA
MySQL - 5.6.26-log : Database - lojaonline
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lojaonline` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lojaonline`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `idcategoria` int(2) NOT NULL,
  `nomecategoria` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `categorias` */

insert  into `categorias`(`idcategoria`,`nomecategoria`) values (101,'Informática - acessórios'),(102,'Casa e banho'),(103,'Eletrodomésticos'),(104,'Saúde'),(105,'Beleza'),(106,'Telefonia fixa'),(107,'Celulares e tablets'),(108,'Computadores de mesa'),(109,'Notebooks'),(110,'Perfumes'),(111,'Relógios'),(112,'Cozinha');

/*Table structure for table `comprasefetuadas` */

DROP TABLE IF EXISTS `comprasefetuadas`;

CREATE TABLE `comprasefetuadas` (
  `idusuario` int(8) NOT NULL,
  `idproduto` int(6) NOT NULL,
  `qtdecomprada` int(5) DEFAULT NULL,
  PRIMARY KEY (`idusuario`,`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comprasefetuadas` */

insert  into `comprasefetuadas`(`idusuario`,`idproduto`,`qtdecomprada`) values (456,1,1),(456,10,5),(12345,11,1),(12345,15,1),(54321,4,2),(54321,6,1),(55555,9,1);

/*Table structure for table `produtos` */

DROP TABLE IF EXISTS `produtos`;

CREATE TABLE `produtos` (
  `idprod` int(6) NOT NULL,
  `nomeprod` varchar(255) NOT NULL,
  `preco` float DEFAULT NULL,
  `idcategoria` int(2) DEFAULT NULL,
  PRIMARY KEY (`idprod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `produtos` */

insert  into `produtos`(`idprod`,`nomeprod`,`preco`,`idcategoria`) values (1,'Dell Inspiron 15R',3500,109),(2,'Dell Inspiron 14R',2900,109),(3,'Dell Inspiron 14E',2750,109),(4,'HP Pavilion v066br',2710,109),(5,'HP Pavilion 4-n050br',2609,109),(6,'HP Pavilion 4-n050br',2069,109),(7,'Samsung Galaxy S4',980,107),(8,'Samsung Galaxy S5',1499,107),(9,'Samsung Galaxy S6',2699,107),(10,'Motorola Moto Maxx',2399,107),(11,'Motorola Moto X Play',1349,107),(12,'Motorola Moto G  2a Gen',1349,107),(13,'Motorola Moto E 2a Gen',535,107),(14,'Geladeira Refrigerador Consul Degelo Seco 261 litros CRA30',971,103),(15,'Geladeira Refrigerador 1 Porta Electrolux RE31 - 214 Litros',899.91,103);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idusuario` int(8) NOT NULL,
  `senhausuario` varchar(20) DEFAULT NULL,
  `nomeusuario` varchar(150) DEFAULT NULL,
  `cpfusuario` varchar(14) DEFAULT '000.000.000-00',
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

insert  into `usuarios`(`idusuario`,`senhausuario`,`nomeusuario`,`cpfusuario`) values (456,'ledon','Jorge Ledón','666.777.888-99'),(10000,'mypass45','George Souza','777.777.777-77'),(12345,'alfa','Luiz Alves','123.456.789-12'),(54321,'xjh652','Pedro Peres','888.888.888-88'),(55555,'beta','Ana Lopes','999.999.999-99');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

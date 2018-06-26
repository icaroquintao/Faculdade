/*
SQLyog Community v9.33 GA
MySQL - 5.6.26-log : Database - lojacolchoes
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lojacolchoes` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lojacolchoes`;

/*Table structure for table `modeloscolchoes` */

DROP TABLE IF EXISTS `modeloscolchoes`;

CREATE TABLE `modeloscolchoes` (
  `idmodelo` int(5) NOT NULL,
  `nomemodelo` varchar(200) NOT NULL,
  `preco` float NOT NULL,
  PRIMARY KEY (`idmodelo`,`preco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `modeloscolchoes` */

insert  into `modeloscolchoes`(`idmodelo`,`nomemodelo`,`preco`) values (1001,'King Koil Liner',5900),(1002,'Probel Confort',3700),(1003,'Englander X',5200),(1004,'Sealy Boulevard',6700);

/*Table structure for table `vendas` */

DROP TABLE IF EXISTS `vendas`;

CREATE TABLE `vendas` (
  `idvendedor` int(5) NOT NULL,
  `idmodelo` int(5) NOT NULL,
  `quantvendida` int(5) DEFAULT NULL,
  PRIMARY KEY (`idvendedor`,`idmodelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vendas` */

insert  into `vendas`(`idvendedor`,`idmodelo`,`quantvendida`) values (11,1001,4),(11,1002,3),(11,1003,0),(11,1004,2),(12,1001,5),(12,1002,10),(13,1001,1),(13,1002,1),(13,1003,1),(13,1004,1),(14,1001,1),(14,1002,2),(14,1003,3),(14,1004,4),(15,1001,9),(15,1004,7);

/*Table structure for table `vendedores` */

DROP TABLE IF EXISTS `vendedores`;

CREATE TABLE `vendedores` (
  `idvendedor` int(5) NOT NULL,
  `nomevendedor` varchar(200) NOT NULL,
  `salariomensal` float NOT NULL,
  PRIMARY KEY (`idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vendedores` */

insert  into `vendedores`(`idvendedor`,`nomevendedor`,`salariomensal`) values (11,'Ana Paula Lopes',1700),(12,'Caio Silva',2000),(13,'Luma Lima',2100),(14,'Pedro Ximenez',1800),(15,'Luis Martinez',1750);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

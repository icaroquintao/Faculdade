/*
SQLyog Community v12.08 (64 bit)
MySQL - 5.6.17 : Database - concessionaria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`concessionaria` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `concessionaria`;

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(40) NOT NULL,
  PRIMARY KEY (`id`,`marca`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `marcas` */

insert  into `marcas`(`id`,`marca`) values (1,'Alfa Romeo'),(2,'Audi'),(3,'BMW'),(4,'Chevrolet'),(5,'Citroen'),(6,'Fiat'),(7,'Ford'),(8,'Hyundai'),(9,'Kia'),(10,'Nissan'),(11,'Renault'),(12,'VW');

/*Table structure for table `veiculos` */

DROP TABLE IF EXISTS `veiculos`;

CREATE TABLE `veiculos` (
  `referencia` varchar(50) NOT NULL,
  `marca` int(11) NOT NULL,
  `modelo` varchar(40) NOT NULL,
  `ano` int(5) NOT NULL,
  `preco` float NOT NULL,
  PRIMARY KEY (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `veiculos` */

insert  into `veiculos`(`referencia`,`marca`,`modelo`,`ano`,`preco`) values ('AJDK0987',7,'Fiesta',2012,51000),('BBNM0987',7,'Focus',2010,49000),('HDE4768A',6,'Palio',2001,25600),('MM98AU34',6,'Linea',2012,66000),('MNOPLE98',6,'500',2011,48000),('WSE43OLA',2,'A3',2005,65500);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`,`marca`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `marcas` */

INSERT  INTO `marcas`(`id`,`marca`) VALUES (1,'Alfa Romeo'),(2,'Audi'),(3,'BMW'),(4,'Chevrolet'),(5,'Citroen'),(6,'Fiat'),(7,'Ford'),(8,'Hyundai'),(9,'Kia'),(10,'Nissan'),(11,'Renault'),(12,'VW');

/*Table structure for table `veiculos` */

DROP TABLE IF EXISTS `veiculos`;

CREATE TABLE `veiculos` (
  `placa` VARCHAR(7) NOT NULL,
  `marca` INT(11) NOT NULL,
  `modelo` VARCHAR(40) NOT NULL,
  `ano` INT(5) NOT NULL,
  `preco` FLOAT NOT NULL,
  PRIMARY KEY (`placa`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `veiculos` */

INSERT  INTO `veiculos`(`placa`,`marca`,`modelo`,`ano`,`preco`) VALUES ('AJD0987',7,'Fiesta',2012,51000),('BBN0987',7,'Focus',2010,49000),('HDE4768',6,'Palio',2001,25600),('MMJ0912',6,'Linea',2012,66000),('MNG1298',6,'500',2011,48000),('WSE43O3',2,'A3',2005,65500);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

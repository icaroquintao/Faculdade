/*
SQLyog Community v12.08 (64 bit)
MySQL - 5.6.17 : Database - alunos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`alunos` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `alunos`;

/*Table structure for table `dados` */

DROP TABLE IF EXISTS `dados`;

CREATE TABLE `dados` (
  `rgm` varchar(10) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `nota1` float(3,1) DEFAULT NULL,
  `nota2` float(3,1) DEFAULT NULL,
  PRIMARY KEY (`rgm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='		';

/*Data for the table `dados` */

insert  into `dados`(`rgm`,`nome`,`nota1`,`nota2`) values ('111111','Maria da Silva',0.0,1.0),('222222','Pedro Oliveira',0.0,1.0),('333333','José Oliveira',0.0,5.0),('444444','Lucas de Jesus',8.0,6.0),('555555','Leonardo Pereira',9.0,8.0),('666666','Ivone Silva',9.0,9.0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

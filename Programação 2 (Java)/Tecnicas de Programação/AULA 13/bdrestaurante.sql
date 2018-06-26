/*
SQLyog Community v12.08 (64 bit)
MySQL - 5.6.17 : Database - bdrestaurante
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bdrestaurante` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bdrestaurante`;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `codigo` int(5) NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `preco` float NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`codigo`,`tipo`,`nome`,`preco`) values (101,'b','cerveja long neck importada',7.5),(102,'e','salada de repolho em conserva',5.5),(103,'p','peixe - robalo',24.7),(104,'s','fatia de bolo da vovó',8.8),(105,'e','batatas cozidas com maionese',4.55),(106,'e','salada de vagem',7.05),(107,'e','maionese de batata, azeitonas e ovos',6.25),(108,'b','taça de vinho tinto da casa',12.8),(109,'e','maionese com ovos e maçã',5.5),(110,'p','picanha nobre',25.55),(111,'s','pizza doce de chocolate',9.55),(112,'b','agua gasificada',3.05),(113,'b','refrigerante lata',3.55),(114,'e','salada de estação',9.9),(115,'p','bife de mignon à parmegiana',22.9),(116,'s','doce de laranja',7.25),(117,'p','camarões no molho vermelho',29.9),(118,'b','cerveja lata nacional',4.05),(119,'s','creme catalã',9.9),(120,'b','suco de frutas natural',5.7),(121,'b','agua mineral natural',2.75),(122,'p','pernil de porco assado',19.7),(123,'s','sorvete - duas bolas',4.5),(124,'p','omelete com batatas',7.8),(125,'p','frango com batatas fritas',17.8);

/*Table structure for table `tiposofertas` */

DROP TABLE IF EXISTS `tiposofertas`;

CREATE TABLE `tiposofertas` (
  `tipo` varchar(1) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tiposofertas` */

insert  into `tiposofertas`(`tipo`,`descricao`) values ('b','bebida'),('e','entrada'),('p','prato principal'),('s','sobremesa');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

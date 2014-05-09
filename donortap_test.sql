# ************************************************************
# Sequel Pro SQL dump
# Versión 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.33)
# Base de datos: donortap
# Tiempo de Generación: 2014-05-09 04:52:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla candidates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `candidates`;

CREATE TABLE `candidates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_ocupation` int(11) unsigned NOT NULL,
  `id_location` int(11) unsigned NOT NULL,
  `id_political_party` int(11) unsigned NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ocupation` (`id_ocupation`),
  KEY `id_location` (`id_location`),
  KEY `id_political_party` (`id_political_party`),
  CONSTRAINT `candidates_ibfk_1` FOREIGN KEY (`id_ocupation`) REFERENCES `ocupations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidates_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `candidates_ibfk_3` FOREIGN KEY (`id_political_party`) REFERENCES `political_parties` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;

INSERT INTO `candidates` (`id`, `id_ocupation`, `id_location`, `id_political_party`, `name`, `lastname`)
VALUES
	(1,1,1,1,'Diego','Giraldo'),
	(2,2,2,2,'Carolina','Sanchez'),
	(3,3,3,3,'Ruben','Salcedo'),
	(4,4,4,4,'Camilo','Villegas'),
	(5,5,5,5,'Andres','Canales');

/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla contributions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contributions`;

CREATE TABLE `contributions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_donor` int(11) unsigned NOT NULL,
  `id_candidate` int(11) unsigned NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_donor` (`id_donor`),
  KEY `id_candidate` (`id_candidate`),
  CONSTRAINT `contributions_ibfk_1` FOREIGN KEY (`id_donor`) REFERENCES `donors` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `contributions_ibfk_2` FOREIGN KEY (`id_candidate`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `contributions` WRITE;
/*!40000 ALTER TABLE `contributions` DISABLE KEYS */;

INSERT INTO `contributions` (`id`, `id_donor`, `id_candidate`, `amount`)
VALUES
	(1,1,1,120),
	(2,2,2,150),
	(3,3,3,200),
	(4,4,4,100),
	(5,5,5,50),
	(6,6,1,250),
	(7,7,2,70),
	(8,8,3,300),
	(9,9,4,350),
	(10,10,5,20),
	(11,10,5,10),
	(12,9,4,35),
	(13,8,3,65),
	(14,7,2,135),
	(15,6,1,240),
	(16,5,5,170),
	(17,4,4,120),
	(18,3,3,500),
	(19,2,2,450),
	(20,1,1,400);

/*!40000 ALTER TABLE `contributions` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla donors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `donors`;

CREATE TABLE `donors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_ocupation` int(11) unsigned NOT NULL,
  `id_location` int(11) unsigned NOT NULL,
  `id_political_party` int(11) unsigned NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ocupation` (`id_ocupation`),
  KEY `id_location` (`id_location`),
  KEY `id_political_party` (`id_political_party`),
  CONSTRAINT `donors_ibfk_1` FOREIGN KEY (`id_ocupation`) REFERENCES `ocupations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `donors_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `donors_ibfk_3` FOREIGN KEY (`id_political_party`) REFERENCES `political_parties` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `donors` WRITE;
/*!40000 ALTER TABLE `donors` DISABLE KEYS */;

INSERT INTO `donors` (`id`, `id_ocupation`, `id_location`, `id_political_party`, `name`, `lastname`, `telephone`)
VALUES
	(1,1,1,1,'Margarita','Villa','876'),
	(2,2,2,2,'Manuel','Alzate','8345'),
	(3,3,3,3,'Javier','Garcia','234'),
	(4,4,4,4,'Jose','Giraldo','4564'),
	(5,5,5,5,'Rodrigo','Peralta','2342'),
	(6,6,6,1,'Hugo','Sarmiento','567'),
	(7,7,7,2,'Marcela','Noriega','234'),
	(8,9,9,3,'Pablo','Duran','567'),
	(9,10,10,4,'Paola','Pacheco','345'),
	(10,4,5,5,'Olga','Jimenez','567');

/*!40000 ALTER TABLE `donors` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla locations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `locations`;

CREATE TABLE `locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;

INSERT INTO `locations` (`id`, `location`)
VALUES
	(1,'Manizales'),
	(2,'Pereira'),
	(3,'Armenia'),
	(4,'Medellin'),
	(5,'Bogota'),
	(6,'Cali'),
	(7,'Bucaramanga'),
	(8,'Pasto'),
	(9,'Cartagena'),
	(10,'Santa Marta');

/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla ocupations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ocupations`;

CREATE TABLE `ocupations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ocupation` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ocupations` WRITE;
/*!40000 ALTER TABLE `ocupations` DISABLE KEYS */;

INSERT INTO `ocupations` (`id`, `ocupation`)
VALUES
	(1,'Abogado'),
	(2,'Ingeniero'),
	(3,'Agronomo'),
	(4,'Comerciante'),
	(5,'Medico'),
	(6,'Administrador'),
	(7,'Agricultor'),
	(8,'Campesino'),
	(9,'Economista'),
	(10,'Estadista');

/*!40000 ALTER TABLE `ocupations` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla political_parties
# ------------------------------------------------------------

DROP TABLE IF EXISTS `political_parties`;

CREATE TABLE `political_parties` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `political_party` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `political_parties` WRITE;
/*!40000 ALTER TABLE `political_parties` DISABLE KEYS */;

INSERT INTO `political_parties` (`id`, `political_party`)
VALUES
	(1,'Conservador'),
	(2,'Liberal'),
	(3,'Uribista'),
	(4,'Polo Democratico'),
	(5,'Partido Verde');

/*!40000 ALTER TABLE `political_parties` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_ocupation` int(11) unsigned NOT NULL,
  `id_location` int(11) unsigned NOT NULL,
  `id_political_party` int(11) unsigned NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `pledge` tinyint(1) DEFAULT '0',
  `user_contact` tinyint(1) DEFAULT '0',
  `id_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ocupation` (`id_ocupation`),
  KEY `id_location` (`id_location`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_ocupation`) REFERENCES `ocupations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`id`) REFERENCES `political_parties` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `id_ocupation`, `id_location`, `id_political_party`, `name`, `lastname`, `telephone`, `pledge`, `user_contact`, `id_user`)
VALUES
	(1,1,1,1,'andres','rosales','123',0,1,1),
	(2,1,2,2,'Lukas','Rueda','976',1,0,2),
	(3,2,3,3,'Mauricio','Segura','1234',0,1,2),
	(4,3,4,4,'Rodrigo','Bocanegra','2345654',1,0,1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

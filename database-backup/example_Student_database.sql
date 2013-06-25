# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: 127.0.0.1 (MySQL 5.1.44)
# Database: example
# Generation Time: 2011-06-01 08:22:03 -0400
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table invoice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `invoiceId` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `invoiceDate` datetime DEFAULT NULL,
  `itemId1` int(11) DEFAULT NULL,
  `itemId2` int(11) DEFAULT NULL,
  `itemId3` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoiceId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(45) NOT NULL,
  `itemPrice` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`itemId`,`itemName`,`itemPrice`)
VALUES
	(1,'Widget 1',1.01),
	(2,'Widget 2',2.01),
	(3,'Widget 3',3.01);

/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orderItem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orderItem`;

CREATE TABLE `orderItem` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL COMMENT '	',
  `itemId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderItemId`),
  KEY `orderId` (`orderId`),
  KEY `itemId` (`itemId`),
  CONSTRAINT `orderItem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `orderItem_ibfk_2` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

LOCK TABLES `orderItem` WRITE;
/*!40000 ALTER TABLE `orderItem` DISABLE KEYS */;
INSERT INTO `orderItem` (`orderItemId`,`orderId`,`itemId`,`quantity`)
VALUES
	(1,1,1,3),
	(2,1,2,1),
	(3,1,3,1),
	(4,2,2,4),
	(6,3,2,5),
	(7,3,3,1),
	(8,4,1,1),
	(9,4,2,2),
	(10,5,1,2),
	(11,6,3,3),
	(12,7,2,5),
	(13,8,1,4),
	(14,9,3,2),
	(15,10,2,1),
	(16,11,1,5),
	(17,12,3,1),
	(18,12,1,2);

/*!40000 ALTER TABLE `orderItem` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`orderId`,`userId`,`orderDate`)
VALUES
	(1,1,'2010-12-10 00:00:00'),
	(2,1,'2011-01-09 00:00:00'),
	(3,2,'2011-03-03 00:00:00'),
	(4,2,'2011-02-18 00:00:00'),
	(5,3,'2011-04-01 00:00:00'),
	(6,4,'2011-01-27 00:00:00'),
	(7,4,'2011-01-30 00:00:00'),
	(8,4,'2011-02-04 00:00:00'),
	(9,4,'2011-02-15 00:00:00'),
	(10,4,'2011-02-28 00:00:00'),
	(11,4,'2011-03-21 00:00:00'),
	(12,5,'2010-12-28 00:00:00');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userAddress
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userAddress`;

CREATE TABLE `userAddress` (
  `userAddressId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `userAddressTypeId` int(11) NOT NULL,
  `userAddress1` varchar(100) DEFAULT NULL,
  `userCity` varchar(50) DEFAULT NULL,
  `userState` varchar(50) DEFAULT NULL,
  `userZip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userAddressId`),
  KEY `userId` (`userId`),
  KEY `userAddressTypeId` (`userAddressTypeId`),
  CONSTRAINT `userAddress_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `userAddress_ibfk_2` FOREIGN KEY (`userAddressTypeId`) REFERENCES `userAddressType` (`userAddressTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table userAddressType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userAddressType`;

CREATE TABLE `userAddressType` (
  `userAddressTypeId` int(11) NOT NULL,
  `userAddressType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userAddressTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `userAddressType` WRITE;
/*!40000 ALTER TABLE `userAddressType` DISABLE KEYS */;
INSERT INTO `userAddressType` (`userAddressTypeId`,`userAddressType`)
VALUES
	(1,'Home'),
	(2,'Work');

/*!40000 ALTER TABLE `userAddressType` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userEmail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userEmail`;

CREATE TABLE `userEmail` (
  `userEmailId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `userEmailTypeId` int(11) NOT NULL,
  PRIMARY KEY (`userEmailId`),
  KEY `userId` (`userId`),
  KEY `userEmailTypeId` (`userEmailTypeId`),
  CONSTRAINT `userEmail_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `userEmail_ibfk_2` FOREIGN KEY (`userEmailTypeId`) REFERENCES `userEmailType` (`userEmailTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `userEmail` WRITE;
/*!40000 ALTER TABLE `userEmail` DISABLE KEYS */;
INSERT INTO `userEmail` (`userEmailId`,`userId`,`userEmail`,`userEmailTypeId`)
VALUES
	(1,1,'jdoe@fullsailtest.com',1),
	(2,1,'jdoe@gmail.com',2),
	(3,2,'janed@fullsailtest.com',1),
	(4,3,'sj@gmail.com',2);

/*!40000 ALTER TABLE `userEmail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userEmailType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userEmailType`;

CREATE TABLE `userEmailType` (
  `userEmailTypeId` int(11) NOT NULL,
  `userEmailType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userEmailTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `userEmailType` WRITE;
/*!40000 ALTER TABLE `userEmailType` DISABLE KEYS */;
INSERT INTO `userEmailType` (`userEmailTypeId`,`userEmailType`)
VALUES
	(1,'Personal'),
	(2,'Work');

/*!40000 ALTER TABLE `userEmailType` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userPhone
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userPhone`;

CREATE TABLE `userPhone` (
  `userPhoneId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `userPhone` varchar(50) DEFAULT NULL,
  `userPhoneTypeId` int(11) NOT NULL COMMENT '	',
  PRIMARY KEY (`userPhoneId`),
  KEY `userPhoneTypeId` (`userPhoneTypeId`),
  KEY `userId` (`userId`),
  CONSTRAINT `userPhone_ibfk_1` FOREIGN KEY (`userPhoneTypeId`) REFERENCES `userPhoneType` (`userPhoneTypeId`),
  CONSTRAINT `userPhone_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `userPhone` WRITE;
/*!40000 ALTER TABLE `userPhone` DISABLE KEYS */;
INSERT INTO `userPhone` (`userPhoneId`,`userId`,`userPhone`,`userPhoneTypeId`)
VALUES
	(1,1,'212-555-1212',1);

/*!40000 ALTER TABLE `userPhone` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userPhoneType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userPhoneType`;

CREATE TABLE `userPhoneType` (
  `userPhoneTypeId` int(11) NOT NULL,
  `userPhoneType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userPhoneTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `userPhoneType` WRITE;
/*!40000 ALTER TABLE `userPhoneType` DISABLE KEYS */;
INSERT INTO `userPhoneType` (`userPhoneTypeId`,`userPhoneType`)
VALUES
	(1,'Home'),
	(2,'Work'),
	(3,'Cell');

/*!40000 ALTER TABLE `userPhoneType` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `userTypeId` int(11) NOT NULL,
  `userStatusId` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `age` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  KEY `username_UNIQUE` (`username`),
  KEY `userTypeId` (`userTypeId`),
  KEY `userStatusId` (`userStatusId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userTypeId`) REFERENCES `userType` (`userTypeId`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`userStatusId`) REFERENCES `userStatus` (`userStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userId`,`firstname`,`lastname`,`username`,`password`,`userTypeId`,`userStatusId`,`DOB`,`age`,`createdDate`)
VALUES
	(1,'John','Doe','jdoe','password',2,1,'1980-09-09',21,'2011-03-17 23:38:27'),
	(2,'Jane','Smith','jsmith','password',1,1,'1980-01-21',21,'2011-03-17 23:38:27'),
	(3,'Sally','Jones','sjones','password',1,1,'1973-07-10',37,'2011-03-17 23:38:27'),
	(4,'Jack','Dole','jdole','password',1,1,'1970-05-01',41,'2011-03-17 23:38:27'),
	(5,'Sam','Jackson','sj1','password',1,1,'1985-01-02',42,'2011-03-17 23:38:27'),
	(8,'Paul','Kinds','pk1','password',1,1,'1975-03-03',36,'2011-03-17 23:38:27'),
	(9,'Kevin','Smith','ks1','password',1,1,'1983-07-02',18,'2011-03-17 23:38:27'),
	(10,'Mike','Omaha','mo1','password',1,1,'1998-04-21',13,'2011-03-17 23:38:27'),
	(11,'Paul','Matin','pm1','password',1,1,'1990-09-08',21,'2011-03-17 23:43:51'),
	(12,'Rango','Matinez','rm1','password',1,1,'1991-03-27',20,'2011-03-17 23:49:29'),
	(13,'Sam','Matinez','sm1','password',1,1,'1986-06-06',25,'2011-03-17 23:50:29'),
	(14,'James','Khole','jk1','password',1,1,'1970-10-31',41,'2011-03-17 23:50:29'),
	(15,'David','Slone','dslone','password',1,1,'1965-10-31',45,'2011-03-22 19:45:00');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `usersCreatedDateInsert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
SET NEW.createdDate = NOW();
SET NEW.age = round(DATEDIFF(NOW(),new.DOB)/365);
END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table userStatus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userStatus`;

CREATE TABLE `userStatus` (
  `userStatusId` int(11) NOT NULL,
  `userStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userStatusId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `userStatus` WRITE;
/*!40000 ALTER TABLE `userStatus` DISABLE KEYS */;
INSERT INTO `userStatus` (`userStatusId`,`userStatus`)
VALUES
	(1,'Active'),
	(2,'Deleted');

/*!40000 ALTER TABLE `userStatus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table userType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userType`;

CREATE TABLE `userType` (
  `userTypeId` int(11) NOT NULL,
  `userType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `userType` WRITE;
/*!40000 ALTER TABLE `userType` DISABLE KEYS */;
INSERT INTO `userType` (`userTypeId`,`userType`)
VALUES
	(1,'Client'),
	(2,'Administrator');

/*!40000 ALTER TABLE `userType` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

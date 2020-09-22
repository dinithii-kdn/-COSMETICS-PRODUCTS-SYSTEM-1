-- MySQL dump 10.10
--
-- Host: localhost    Database: studentstutorial
-- ------------------------------------------------------
-- Server version	5.0.22-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `currentpassword` varchar(45) default NULL,
  `newpass` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--


/*!40000 ALTER TABLE `login` DISABLE KEYS */;
LOCK TABLES `login` WRITE;
INSERT INTO `login` VALUES (1,'Admin@123','Admin@12345');
UNLOCK TABLES;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

--
-- Table structure for table `sports_details`
--

DROP TABLE IF EXISTS `sports_details`;
CREATE TABLE `sports_details` (
  `id` int(11) NOT NULL auto_increment,
  `choosesports` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sports_details`
--


/*!40000 ALTER TABLE `sports_details` DISABLE KEYS */;
LOCK TABLES `sports_details` WRITE;
INSERT INTO `sports_details` VALUES (1,'Cricket'),(2,'Hockey'),(3,'Tenis'),(4,'Cricket'),(5,'Cricket'),(6,'Football'),(7,'Hockey');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sports_details` ENABLE KEYS */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `date_time` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--


/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
LOCK TABLES `transaction` WRITE;
INSERT INTO `transaction` VALUES (2,'Kishor Kadam',500.00,'2019-01-02'),(3,'Kishor Kadam',1500.00,'2019-01-01');
UNLOCK TABLES;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


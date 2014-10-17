CREATE DATABASE  IF NOT EXISTS `happymats` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `happymats`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: happymats
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) NOT NULL,
  `Description` varchar(225) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Closet','Furniture',3,150,'2014-10-15 07:32:06',NULL,''),(2,'qwere','q',1,1,'2014-10-16 16:14:48',NULL,''),(3,'HP-0001','Chair',4,4,'2014-10-16 18:22:57',NULL,''),(4,'Product 1','Helo',1,1,'2014-10-16 20:01:38',NULL,''),(5,'HP-0002','Glass Table',1,400,'2014-10-17 04:00:25',NULL,''),(6,'HP-0003','Glass Table',1,1400,'2014-10-17 04:01:40',NULL,''),(7,'HP-0003','Glass Table',1,1400,'2014-10-17 04:01:55',NULL,''),(8,'HP-0005','Glass Vase',1,1234,'2014-10-17 04:04:04',NULL,''),(9,'HP-0005','Glass Vase',1,1234,'2014-10-17 04:04:49',NULL,''),(10,'hp-0006','Wooden',1,543,'2014-10-17 04:05:16',NULL,'');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sender` varchar(225) NOT NULL,
  `Description` varchar(225) NOT NULL,
  `Location` varchar(225) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'Client','Purchase new closet','QC','2014-10-15 07:34:16',NULL,''),(2,'Client','Purchase new bed','Description','2014-10-15 07:35:35',NULL,'');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases_records`
--

DROP TABLE IF EXISTS `purchases_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchase_id` (`purchase_id`),
  UNIQUE KEY `purchase_id_2` (`purchase_id`),
  UNIQUE KEY `record_id` (`record_id`),
  CONSTRAINT `purchases_records_ibfk_4` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  CONSTRAINT `purchases_records_ibfk_3` FOREIGN KEY (`record_id`) REFERENCES `products` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases_records`
--

LOCK TABLES `purchases_records` WRITE;
/*!40000 ALTER TABLE `purchases_records` DISABLE KEYS */;
INSERT INTO `purchases_records` VALUES (1,1,1,200,1,'2014-10-15 07:36:37',NULL,'');
/*!40000 ALTER TABLE `purchases_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(225) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Location` varchar(225) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime DEFAULT NULL,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'sales 1',1,'Qc','2014-10-16 20:00:01',NULL,''),(2,'sales 2',2,'Makati','2014-10-16 20:00:22',NULL,''),(3,'SALES 3',3,'Marikina','2014-10-17 02:18:07',NULL,''),(4,'SALES 3',3,'Marikina','2014-10-17 02:20:20',NULL,''),(5,'SALES 3',3,'Marikina','2014-10-17 02:20:35',NULL,''),(6,'SALES 3',3,'Marikina','2014-10-17 02:20:52',NULL,''),(7,'SALES 3',3,'Marikina','2014-10-17 02:21:19',NULL,''),(8,'SAlES 4',1,'QC','2014-10-17 03:52:23',NULL,''),(9,'SAlES 4',1,'QC','2014-10-17 03:53:47',NULL,''),(10,'SAlES 4',1,'QC','2014-10-17 03:53:55',NULL,''),(11,'RC-0090',1,'QC','2014-10-17 04:05:25',NULL,''),(12,'RC-0009',1,'QC','2014-10-17 04:06:46',NULL,''),(13,'RC-003',2,'asdasd','2014-10-17 04:07:33',NULL,''),(14,'RC-0019',3,'Binan','2014-10-17 04:08:30',NULL,'');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_products`
--

DROP TABLE IF EXISTS `sales_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime NOT NULL,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `sales_id` (`sales_id`),
  KEY `record_id` (`record_id`),
  CONSTRAINT `sales_products_ibfk_2` FOREIGN KEY (`record_id`) REFERENCES `products` (`ID`),
  CONSTRAINT `sales_products_ibfk_1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_products`
--

LOCK TABLES `sales_products` WRITE;
/*!40000 ALTER TABLE `sales_products` DISABLE KEYS */;
INSERT INTO `sales_products` VALUES (1,1,3,1,1,'2014-10-16 20:23:04','0000-00-00 00:00:00',''),(2,12,2,1,1,'2014-10-17 04:07:38','0000-00-00 00:00:00',''),(5,1,3,1,1,'2014-10-17 04:12:24','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `sales_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) DEFAULT NULL,
  `FirstName` varchar(225) NOT NULL,
  `LastName` varchar(225) NOT NULL,
  `DateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DateModified` datetime NOT NULL,
  `isActive` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-17 12:14:42

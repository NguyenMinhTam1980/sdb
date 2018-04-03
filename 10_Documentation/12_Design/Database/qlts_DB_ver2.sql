CREATE DATABASE  IF NOT EXISTS `dashboard-asset-dev` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dashboard-asset-dev`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 10.0.0.9    Database: dashboard-asset-dev
-- ------------------------------------------------------
-- Server version	5.5.46-log

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'MONITOR','Màn hình máy tính','2017-02-07 14:29:37','2017-02-16 18:35:52','0000-00-00 00:00:00',0),(2,'KEYBOARD','Bàn phím máy tính','2017-02-07 14:29:37','2017-02-10 16:11:46',NULL,0),(3,'MOUSE','Chuột máy tính','2017-02-07 14:29:37','2017-02-07 14:29:37',NULL,0),(4,'CASE','Case máy tính','2017-02-07 14:29:37','2017-02-07 14:29:37',NULL,0),(5,'MOBILE','Điện thoại di động','2017-02-07 14:29:37','2017-02-07 14:29:37','0000-00-00 00:00:00',0),(6,'IPAD','IPAD SAMSUNG','2017-02-07 14:29:37','2017-02-16 15:12:36',NULL,0),(7,'SWITCH','SWITCH','2017-02-07 14:29:37','2017-02-16 15:02:58',NULL,0),(8,'UPS','UPS nguồn','2017-02-07 14:29:37','2017-02-10 16:12:16',NULL,0),(9,'RAM','RAM máy tính','2017-02-07 14:29:37','2017-02-17 16:51:36',NULL,0),(10,'MACHINE','Thiết bị văn phòng','2017-02-07 14:29:37','2017-02-07 14:29:37',NULL,0),(11,'HDD','Ổ cứng','2017-02-07 14:29:37','2017-02-07 14:29:37','0000-00-00 00:00:00',0),(12,'PROJECTOR','Projector','2017-02-07 14:29:37','2017-02-07 14:29:37','0000-00-00 00:00:00',0),(13,'DVD','Ổ đĩa','2017-02-07 14:29:37','2017-02-07 14:29:37',NULL,0),(14,'CHARGE','Sạc laptop','2017-02-07 14:29:37','2017-02-07 14:29:37',NULL,0),(15,'PERIPH','Thiết bị ngoại vi','2017-02-07 14:29:37','2017-02-07 14:29:37',NULL,0),(16,'CAMERA','Camera Remote','2017-02-07 14:29:37','2017-02-07 14:29:37',NULL,0),(17,'LAPTOP','Laptop','2017-02-15 18:20:56','2017-02-15 18:21:05','0000-00-00 00:00:00',0),(18,'hienhoa','hienhoa234234','2017-02-16 13:45:16','2017-02-16 13:45:22','2017-02-16 17:11:30',1),(19,'admin','admin','2017-02-16 17:23:44','2017-02-16 17:23:44','2017-02-17 08:31:14',1),(20,'admin','adminádfas','2017-02-16 18:35:38','2017-02-16 18:35:43','2017-02-17 08:14:46',1),(21,'admin','admin','2017-02-17 08:41:51','2017-02-17 08:41:51','2017-02-17 08:41:55',1),(22,'admin','adminádfasdfa','2017-02-17 08:54:03','2017-02-17 08:54:10','2017-02-17 08:54:24',1),(23,'admin','adminsdfasdf','2017-02-17 09:14:13','2017-02-17 09:14:23','2017-02-17 09:14:26',1),(24,'choicun','chổi cùn','2017-02-17 10:56:18','2017-02-17 10:56:18','2017-02-17 10:56:26',1),(25,'ChoiCun','Chổi cùn','2017-02-17 10:56:45','2017-02-17 10:56:45','2017-02-17 10:58:01',1),(26,'MORNITOR','MÀN HÌNH','2017-02-17 11:02:31','2017-02-17 11:02:31','2017-02-17 11:03:12',1),(27,'add1','add1','2017-02-17 11:54:31','2017-02-17 11:54:31','2017-02-17 16:47:34',1),(28,'test2','test2','2017-02-17 13:14:14','2017-02-17 13:14:14','2017-02-17 16:18:04',1),(29,'test3','test3','2017-02-17 13:22:00','2017-02-17 13:22:00','2017-02-17 13:46:46',1),(30,'test4','test4','2017-02-17 13:22:22','2017-02-17 13:22:22','2017-02-17 13:46:44',1),(31,'test5','test5','2017-02-17 13:23:30','2017-02-17 13:23:30','2017-02-17 13:46:39',1),(32,'test6','test6','2017-02-17 13:27:06','2017-02-17 13:27:06','2017-02-17 13:46:42',1),(33,'test7','test7','2017-02-17 13:28:29','2017-02-17 13:28:29','2017-02-17 13:46:36',1),(34,'test8','test8','2017-02-17 13:31:03','2017-02-17 13:31:03','2017-02-17 13:46:27',1),(35,'test9','test9','2017-02-17 13:31:37','2017-02-17 13:31:37','2017-02-17 13:46:23',1),(36,'test10','test10','2017-02-17 13:32:26','2017-02-17 13:32:26','2017-02-17 13:46:21',1),(37,'test11','test11','2017-02-17 13:36:32','2017-02-17 13:36:32','2017-02-17 13:46:17',1),(38,'test12','test12','2017-02-17 13:44:02','2017-02-17 13:44:02','2017-02-17 13:46:09',1),(39,'test3','test3','2017-02-17 14:11:47','2017-02-17 14:11:47','2017-02-17 16:17:44',1),(40,'test4','test4s','2017-02-17 14:12:14','2017-02-17 15:17:04','2017-02-17 15:17:14',1),(41,'admin','admin','2017-02-17 16:54:23','2017-02-17 16:54:23',NULL,0),(42,'test','ádfasdf','2017-02-17 16:54:30','2017-02-17 16:54:30',NULL,0),(43,'admin234','asfasdasdf','2017-02-18 08:35:50','2017-02-18 08:35:50',NULL,0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardware_management`
--

DROP TABLE IF EXISTS `hardware_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardware_management` (
  `management_id` int(11) NOT NULL AUTO_INCREMENT,
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `allocated_date` datetime DEFAULT NULL,
  `retrieved_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`management_id`),
  KEY `fk_hardwares` (`hardware_id`),
  KEY `fk_employees` (`user_id`),
  CONSTRAINT `fk_employees` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_hardwares` FOREIGN KEY (`hardware_id`) REFERENCES `hardwares` (`hardware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardware_management`
--

LOCK TABLES `hardware_management` WRITE;
/*!40000 ALTER TABLE `hardware_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `hardware_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardwares`
--

DROP TABLE IF EXISTS `hardwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardwares` (
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_id_lu` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `os` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `buy_date` datetime NOT NULL,
  `waranty_date` datetime NOT NULL,
  `price` int(11) NOT NULL,
  `production_id` tinyint(4) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL,
  `depreciated_months` tinyint(4) NOT NULL,
  `expired_date` datetime NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `deleted_reason` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  `ref01` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref02` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref03` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref04` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref05` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`hardware_id`),
  KEY `fk_category` (`category_id`),
  KEY `fk_production` (`production_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `fk_production` FOREIGN KEY (`production_id`) REFERENCES `productions` (`production_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardwares`
--

LOCK TABLES `hardwares` WRITE;
/*!40000 ALTER TABLE `hardwares` DISABLE KEYS */;
INSERT INTO `hardwares` VALUES ('SCPT021','SCPT021',NULL,'2QV2F2S5977866196','Case DELL',NULL,NULL,4,'2012-11-21 00:00:00','0000-00-00 00:00:00',0,2,'Chi tiết: CPU53,Mã TSCĐ: MVT53',1,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('SKB010',NULL,NULL,'CN-01HF2Y-71616-275-08VV-A00','Bàn phím DELL',NULL,NULL,2,'2013-01-14 00:00:00','0000-00-00 00:00:00',0,2,NULL,1,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('SLAP001',NULL,NULL,'','Laptop DELL ',NULL,NULL,17,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,2,'Mã TSCĐ: MVT34',4,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('SMCS024',NULL,NULL,'CN-011D3V-73826-583-D9Z5','Chuột DELL',NULL,NULL,3,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,2,NULL,1,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('SMOR002','',NULL,'HA17HYDQ100419B','Màn hình SAMSUNG 17 inch',NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,1,'Chi tiết: MN29,Mã TSCĐ: MVT29',1,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('SMOR044','SMOR044',NULL,'CN-0YDGTD-74261-29G-263B','Màn hình DELL 21 inch',NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,2,'Chi tiết: MN58,Mã TSCĐ: MVT58',1,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('SUPS008','SUPS008',NULL,'21212010201000714','UPS Santak',NULL,NULL,8,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,4,NULL,1,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL),('SUPS0102',NULL,NULL,'1212233','usp dang su dung',NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,4,NULL,2,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hardwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_id` varchar(10) CHARACTER SET utf8 NOT NULL,
  `log_time` datetime DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('vuongnm','123','2017-12-12 17:40:30','k co gi');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productions`
--

DROP TABLE IF EXISTS `productions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productions` (
  `production_id` tinyint(4) NOT NULL,
  `production_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`production_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productions`
--

LOCK TABLES `productions` WRITE;
/*!40000 ALTER TABLE `productions` DISABLE KEYS */;
INSERT INTO `productions` VALUES (1,'SAMSUNG',NULL,NULL,NULL,0),(2,'DELL',NULL,NULL,NULL,0),(3,'MICROSOFT',NULL,NULL,NULL,0),(4,'SANTAK',NULL,NULL,NULL,0),(5,'LOGITECH',NULL,NULL,NULL,0),(6,'APPLE',NULL,NULL,NULL,0),(7,'SHARP',NULL,NULL,NULL,0),(8,'PARASONIC',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `productions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_id_lu` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `barcode` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `serial` varchar(50) CHARACTER SET utf8 NOT NULL,
  `hardware_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `os` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `supplier` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `buy_date` datetime NOT NULL,
  `waranty_date` datetime NOT NULL,
  `price` int(11) NOT NULL,
  `production_id` tinyint(4) NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `depreciated_months` tinyint(4) NOT NULL,
  `expired_date` datetime NOT NULL,
  `Hw_note` text CHARACTER SET utf8,
  `deleted_reason` text CHARACTER SET utf8,
  `Hw_created_at` datetime DEFAULT NULL,
  `Hw_updated_at` datetime DEFAULT NULL,
  `Hw_deleted_at` datetime DEFAULT NULL,
  `Hw_deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  `ref01` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref02` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref03` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref04` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref05` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,'SMOR044','SMOR044','','CN-0YDGTD-74261-29G-263B','Màn hình DELL 21 inch',NULL,NULL,1,'2013-01-14 00:00:00','0000-00-00 00:00:00',0,2,'Chi tiết: MN58, Mã TSCĐ: MVT58',2,2,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL),(2,'SMOR002',NULL,NULL,'HA17HYDQ100419B','Màn hình SAMSUNG 17 inch',NULL,NULL,1,'2008-02-12 00:00:00','0000-00-00 00:00:00',0,1,'Chi tiết: MN29,Mã TSCĐ: MVT29',2,0,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL),(3,'SLAP001',NULL,NULL,'','Laptop DELL ',NULL,NULL,17,'2009-07-28 00:00:00','0000-00-00 00:00:00',0,2,'Mã TSCĐ: MVT34',5,3,0,'0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `department` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `skype` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_level` tinyint(2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'DEV_DZ_069','vuongnm','25559471fd86ba02a90918d6d42d50f0',NULL,'Phòng DEV','vuongnm@gmail.com','','',0,NULL,NULL,NULL,0),(5,NULL,'thangnb','46dc6d171b61c076797f6bc446eb9505',NULL,'Phòng DEV','thangnb@gmail.com','','',1,NULL,NULL,NULL,0),(6,NULL,'tamnm','c533ac18622a3d5331deecde7dda08d9',NULL,'Phòng DEV','tamnm@gmail.com','','',1,NULL,NULL,NULL,0),(7,NULL,'nghiadt','fbd832144a82fa223c38101c7730257b',NULL,'Phòng DEV','nghiadt@gmail.com','','',1,NULL,NULL,NULL,0),(8,NULL,'sonnv','18b3e721aca564fa9b678679adff6683',NULL,'Phòng DEV','sonnv@gmail.com','','',1,NULL,NULL,NULL,0);
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

-- Dump completed on 2017-02-20 14:20:00

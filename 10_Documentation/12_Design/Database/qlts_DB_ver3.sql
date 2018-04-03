CREATE DATABASE  IF NOT EXISTS `dashboard-asset-dev` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dashboard-asset-dev`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 10.0.0.9    Database: dashboard-asset-dev
-- ------------------------------------------------------
-- Server version	5.5.46-log

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;


--
-- Table structure for table `hardware_management`
--

DROP TABLE IF EXISTS `hardware_management`;

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

--
-- Table structure for table `hardwares`
--

DROP TABLE IF EXISTS `hardwares`;

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

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_id` varchar(10) CHARACTER SET utf8 NOT NULL,
  `log_time` datetime DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;


--
-- Table structure for table `productions`
--

DROP TABLE IF EXISTS `productions`;

CREATE TABLE `productions` (
  `production_id` tinyint(4) NOT NULL,
  `production_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`production_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;

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
  `allocated_retrieved_at` datetime DEFAULT NULL,
  `hw_note` text CHARACTER SET utf8,
  `request_note` text CHARACTER SET utf8,
  `hw_created_at` datetime DEFAULT NULL,
  `hw_updated_at` datetime DEFAULT NULL,
  `hw_deleted_at` datetime DEFAULT NULL,
  `hw_deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  `ref01` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref02` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref03` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref04` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref05` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;


--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

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


--
-- Dumping data for table `users`
--


-- Dump completed on 2017-02-21 14:48:55

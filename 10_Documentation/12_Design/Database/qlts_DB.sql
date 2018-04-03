

CREATE DATABASE Dashboard_Asset_dev;
USE Dashboard_Asset_dev;
--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  `category_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `productions`
--

CREATE TABLE `productions` (
  `production_id` tinyint(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `production_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
-- --------------------------------------------------------

--
-- Table structure for table `hardwares`
--

CREATE TABLE `hardwares` (
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL PRIMARY KEY,
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
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  `ref01` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref02` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref03` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref04` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref05` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  CONSTRAINT fk_category FOREIGN KEY(category_id) REFERENCES categories (category_id),
  CONSTRAINT fk_production FOREIGN KEY(production_id) REFERENCES productions (production_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


-- --------------------------------------------------------

--
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_level` tinyint(2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
-- --------------------------------------------------------

--
-- Table structure for table `hardware_management`
--

CREATE TABLE `hardware_management` (
  `management_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `allocated_date` datetime DEFAULT NULL,
  `retrieved_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
   CONSTRAINT fk_hardwares FOREIGN KEY(hardware_id) REFERENCES hardwares (hardware_id),
   CONSTRAINT fk_employees FOREIGN KEY(user_id) REFERENCES users (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `user_id` int(11) NOT NULL,
  `hardware_id` varchar(10) NOT NULL,
  `log_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `request_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `hardware_id` varchar(10) NOT NULL,
  `hardware_id_lu` varchar(10) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `serial` varchar(50) NOT NULL,
  `hardware_name` varchar(255) NOT NULL,
  `os` varchar(50) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `buy_date` datetime NOT NULL,
  `waranty_date` datetime NOT NULL,
  `price` int(11) NOT NULL,
  `production_id` tinyint(4) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `depreciated_months` tinyint(4) NOT NULL,
  `expired_date` datetime NOT NULL,
  `Hw_note` text,
  `deleted_reason` text,
  `Hw_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Hw_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Hw_deleted_at` datetime DEFAULT NULL,
  `Hw_deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  `ref01` varchar(255) DEFAULT NULL,
  `ref02` varchar(255) DEFAULT NULL,
  `ref03` varchar(255) DEFAULT NULL,
  `ref04` varchar(255) DEFAULT NULL,
  `ref05` varchar(255) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;



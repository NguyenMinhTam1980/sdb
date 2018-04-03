CREATE DATABASE IF NOT EXISTS `dashboard-asset-dev` DEFAULT CHARACTER SET UTF8 COLLATE utf8_unicode_ci;
USE `dashboard-asset-dev`;

-- ----------------------------------- --
-- --------- Xóa các bảng ------------ --
-- ----------------------------------- --
DROP TABLE IF EXISTS logs RESTRICT ;
DROP TABLE IF EXISTS hardware_management CASCADE;
DROP TABLE IF EXISTS requests CASCADE;
DROP TABLE IF EXISTS hardwares CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS productions CASCADE;
DROP TABLE IF EXISTS groups_users CASCADE;
DROP TABLE IF EXISTS groups_roles CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS groups CASCADE;
DROP TABLE IF EXISTS roles CASCADE;

-- ----------------------------------- --
-- -------- Tạo mới các bảng --------- --
-- ----------------------------------- --

-- Tạo bảng categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `deleted_at` DATETIME DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tạo bảng productions
CREATE TABLE IF NOT EXISTS `productions` (
  `production_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `production_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `deleted_at` DATETIME DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`production_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tạo bảng hardwares
CREATE TABLE IF NOT EXISTS `hardwares` (
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_id_lu` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `os` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `buy_date` DATETIME NOT NULL,
  `waranty_date` DATETIME NOT NULL,
  `price` int(11) NOT NULL,
  `production_id` tinyint(4) DEFAULT NULL,
  `description` TEXT COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `depreciated_months` tinyint(4) NOT NULL,
  `expired_date` DATETIME NOT NULL,
  `note` TEXT COLLATE utf8_unicode_ci,
  `deleted_reason` TEXT COLLATE utf8_unicode_ci,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `deleted_at` DATETIME DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  `ref01` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref02` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref03` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref04` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref05` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`hardware_id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tạo bảng requests
CREATE TABLE IF NOT EXISTS `requests` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_id_lu` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `os` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `buy_date` DATETIME NOT NULL,
  `waranty_date` DATETIME NOT NULL,
  `price` int(11) NOT NULL,
  `production_id` tinyint(4) DEFAULT NULL,
  `description` TEXT COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `depreciated_months` tinyint(4) NOT NULL,
  `expired_date` DATETIME NOT NULL,
  `allocated_retrieved_at` DATETIME DEFAULT NULL,
  `hw_note` text CHARACTER SET utf8,
  `request_note` text CHARACTER SET utf8,
  `hw_created_at` DATETIME DEFAULT NULL,
  `hw_updated_at` DATETIME DEFAULT NULL,
  `hw_deleted_at` DATETIME DEFAULT NULL,
  `hw_deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  `requested_by` int(11) NOT NULL,
  `ref02` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref03` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref04` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref05` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` DATETIME DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tạo bảng users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `skype` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `deleted_at` DATETIME DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;


-- Tạo bảng hardware_management
CREATE TABLE IF NOT EXISTS `hardware_management` (
  `management_id` int(11) NOT NULL AUTO_INCREMENT,
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `allocated_date` datetime DEFAULT NULL,
  `retrieved_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `deleted_at` DATETIME DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`management_id`),
  KEY `fk_hardwares` (`hardware_id`),
  KEY `fk_users` (`user_id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_hardwares` FOREIGN KEY (`hardware_id`) REFERENCES `hardwares` (`hardware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tạo bảng groups
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` INT(4) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `deleted_at` DATETIME DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tạo bảng roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` INT(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` DATETIME DEFAULT NULL,
  `updated_at` DATETIME DEFAULT NULL,
  `deleted_at` DATETIME DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tạo bảng groups_roles
CREATE TABLE IF NOT EXISTS `groups_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(4) NOT NULL,
  `role_id` INT(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_role_UNIQUE` (`group_id`,`role_id`),
  KEY `fk_groups` (`group_id`),
  KEY `fk_roles` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tạo bảng groups_users
CREATE TABLE IF NOT EXISTS `groups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id_UNIQUE` (`group_id`,`user_id`),
  KEY `fk_group` (`group_id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Tạo bảng logs
CREATE TABLE IF NOT EXISTS `logs` (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `log_time` DATETIME DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------------- --
-- -------- Truncate các bảng -------- --
-- ----------------------------------- --
SET foreign_key_checks = 0;
TRUNCATE logs;
TRUNCATE hardware_management;
TRUNCATE requests;
TRUNCATE hardwares;
TRUNCATE categories;
TRUNCATE productions;
TRUNCATE groups_users;
TRUNCATE users;
TRUNCATE groups_roles;
TRUNCATE groups;
TRUNCATE roles;
SET foreign_key_checks = 1;

-- Thêm account superadmin cho bảng user
INSERT INTO `users`(users.id, users.user_id, users.full_name, users.username, users.password, users.department, users.email, users.phone, users.skype) VALUES 
('1','superadmin','superadmin','superadmin','32250170a0dca92d53ec9624f336ca24','admin','superadmin@ruby.com','123123','123');
-- Thêm quyền mặc định cho superadmin: Thêm thiết bị, sửa thiết bị, xóa thiết bị, duyệt yêu cầu, phân quyền
INSERT INTO `roles` (`id`, `role_name`, `description`, `link`, `method`, `created_at`, `updated_at`, `deleted_at`, `deleted_flag`) VALUES
	(1, 'Thêm thiết bị', 'Thêm mới thiết bị', '/hardwares/add-new-hardware', 'GET,POST', NULL, NULL, NULL, 0),
	(2, 'Sửa thiết bị', 'Sửa thông tin thiết bị', '/hardwares/edit', 'GET,POST', NULL, NULL, NULL, 0),
	(3, 'Xóa thiết bị', 'Xóa thiết bị', '/hardwares/delete', 'POST', NULL, NULL, NULL, 0),
	(4, 'Duyệt thiết bị', 'Duyệt thiết bị', '/hardwares/pending', '', NULL, NULL, NULL, 0),
	(7, 'Phân quyền', 'Phân quyền nhóm người dùng', '/permission', 'GET,POST', NULL, NULL, NULL, 0);
-- Thêm nhóm cho superadmin
INSERT INTO groups(groups.group_id, groups.group_name, groups.created_at) VALUES ('1','superadmin', '2017-01-01 12:00:00');
-- Thêm superadmin vào nhóm superadmin
INSERT INTO groups_users(groups_users.group_id, groups_users.user_id) VALUES ('1','1');
-- Thêm quyền cho nhóm superadmin
INSERT INTO groups_roles(groups_roles.group_id, groups_roles.role_id) VALUES ('1','7');

-- 20170329 ThangNB - Bổ sung quyền truy cập quản lý người dùng
INSERT INTO `roles` (`id`, `role_name`, `description`, `link`, `method`, `created_at`, `updated_at`, `deleted_at`, `deleted_flag`) VALUES
(5, 'Quản lý người dùng', 'Quản lý người dùng', '/admin/users', 'GET,POST', NULL, NULL, NULL, 0);

-- 20170407 VuongNM Bổ sung thông tin bảng người dùng
ALTER TABLE users 
ADD COLUMN gender tinyint(1) AFTER password,
ADD COLUMN identification_no VARCHAR(15) AFTER gender,
ADD COLUMN birthday DATETIME AFTER identification_no,
ADD COLUMN position VARCHAR(255) COLLATE utf8_unicode_ci AFTER department;

-- 20170414 NghiaDT bổ sung link ảnh avatar
ALTER TABLE users 
ADD COLUMN avatar VARCHAR(255) AFTER skype;

ALTER TABLE `requests`
ADD allo_user_id INT(11);

ALTER TABLE `hardware_management`
ADD allo_user_id INT(11);

-- 20170417 NghiaDT cập nhật quyền quản lý người dùng
UPDATE roles
SET link = '/admin/user' WHERE id = 5;

UPDATE roles
SET link = '/hardwares/pending' WHERE id = 4;

-- 20170418 NghiaDT thay đổi cấu trúc bảng hardwares và requests
ALTER TABLE hardwares 
CHANGE COLUMN description description TEXT CHARACTER SET utf8 COLLATE utf8_unicode_ci,
CHANGE COLUMN depreciated_months depreciated_months TINYINT(4) DEFAULT null,
CHANGE COLUMN expired_date expired_date DATETIME DEFAULT null,
CHANGE COLUMN waranty_date waranty_date DATETIME NULL;

ALTER TABLE requests
CHANGE COLUMN description description TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL ,
CHANGE COLUMN depreciated_months depreciated_months TINYINT(4) NULL ,
CHANGE COLUMN expired_date expired_date DATETIME NULL,
CHANGE COLUMN waranty_date waranty_date DATETIME NULL;

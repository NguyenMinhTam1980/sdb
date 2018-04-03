-- --------------------------------------------------------
-- Host:                         10.0.0.9
-- Server version:               5.5.46-log - MySQL Community Server (GPL) by Remi
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for asset
CREATE DATABASE IF NOT EXISTS `asset` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `asset`;

-- Dumping structure for procedure asset.addGroupRole
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `addGroupRole`(group_id INT(4), role_id INT(4))
BEGIN
	INSERT INTO groups_roles(groups_roles.group_id, groups_roles.role_id)
	VALUES (group_id, role_id);
END//
DELIMITER ;

-- Dumping structure for procedure asset.addNewCategory
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `addNewCategory`(
				       categoryId VARCHAR(10), 
					   categoryName VARCHAR(255) CHARSET UTF8, 
					   createdAt DATETIME,  
					   updatedAt DATETIME  
				   )
BEGIN
	INSERT INTO categories(category_id, category_name, created_at, updated_at)
    VALUES(categoryId, categoryName, createdAt, updatedAt);
END//
DELIMITER ;

-- Dumping structure for procedure asset.addNewGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `addNewGroup`(
	IN `name` VARCHAR(255) CHARACTER SET utf8,
	IN `currentTime` DATETIME
)
BEGIN
	INSERT INTO groups(groups.group_name, groups.created_at)
	VALUES (name, currentTime);
END//
DELIMITER ;

-- Dumping structure for procedure asset.addNewLog
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `addNewLog`(username VARCHAR(255), hardwareId VARCHAR(10), createdAt DATETIME, logContent TEXT CHARSET UTF8)
BEGIN
	INSERT INTO logs(username, hardware_id, log_time, content)
    VALUES (username, hardwareId, createdAt, logContent);
END//
DELIMITER ;

-- Dumping structure for procedure asset.addNewProduction
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `addNewProduction`(productionName  VARCHAR(255) CHARACTER SET utf8, created_time DATETIME)
BEGIN
	INSERT INTO productions(production_name, created_at) VALUES (productionName, created_time);
END//
DELIMITER ;

-- Dumping structure for procedure asset.addNewUser
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `addNewUser`(fullName VARCHAR(255) CHARACTER SET utf8, username VARCHAR(255), pass VARCHAR(255), department VARCHAR(50), email VARCHAR(255), phone VARCHAR(15), skype VARCHAR(50), currentTime DATETIME)
BEGIN
	INSERT INTO users(full_name, username, password, department, email, phone, skype, created_at, updated_at)
    VALUES (fullName, username, md5(pass), department, email, phone, skype, currentTime, currentTime);
END//
DELIMITER ;

-- Dumping structure for procedure asset.addUserToGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `addUserToGroup`(group_id TINYINT(4), user_id INT(11))
BEGIN
	INSERT INTO groups_users(groups_users.group_id, groups_users.user_id)
	VALUES (group_id, user_id);	
END//
DELIMITER ;

-- Dumping structure for procedure asset.allocateHardware
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `allocateHardware`(
					   hardwareId VARCHAR(10), 
					   userId INT(11), 
					   allocatedDate DATETIME, 
					   allocatedReason TEXT, 
					   createdAt DATETIME, 
					   updatedAt DATETIME
				   )
BEGIN
	-- cấp phát tài sản
    INSERT INTO hardware_management (hardware_id, user_id, allocated_date, note, created_at, updated_at)
    VALUES (hardwareId, userId, allocatedDate, allocatedReason, createdAt, updatedAt);
END//
DELIMITER ;

-- Dumping structure for table asset.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
REPLACE INTO `categories` (`category_id`, `category_name`, `created_at`, `updated_at`, `deleted_at`, `deleted_flag`) VALUES
	('BLV', 'Bàn làm việc', '2017-03-29 08:45:10', '2017-03-29 08:45:10', NULL, 0),
	('BOA', 'Bảng nhựa', '2017-03-29 08:45:36', '2017-03-29 08:45:36', NULL, 0),
	('CBN', 'Tủ đựng đồ', '2017-03-29 08:45:46', '2017-03-29 08:45:46', NULL, 0),
	('CDR', 'Ổ đĩa', '2017-03-29 08:43:50', '2017-03-29 08:43:50', NULL, 0),
	('CMR', 'Camera Remote', '2017-03-29 08:44:57', '2017-03-29 08:44:57', NULL, 0),
	('CPT', 'Case', '2017-03-29 08:47:00', '2017-03-29 08:47:00', NULL, 0),
	('DDI', 'Điện thoại di động', '2017-03-29 08:46:13', '2017-03-29 08:46:13', NULL, 0),
	('GHE', 'Ghế ngồi', '2017-03-29 08:45:23', '2017-03-29 08:45:23', NULL, 0),
	('HDD', 'Ổ cứng IBM', '2017-03-29 08:42:38', '2017-03-29 08:42:38', NULL, 0),
	('KEY', 'Bàn phím', '2017-03-29 08:46:43', '2017-03-29 08:46:43', NULL, 0),
	('LAP', 'Laptop', '2017-03-29 08:45:59', '2017-03-29 08:45:59', NULL, 0),
	('MCS', 'Chuột máy tính', '2017-03-29 08:46:33', '2017-03-29 08:46:33', '2017-03-29 14:03:39', 1),
	('MNT', 'Monitor', '2017-03-29 08:43:35', '2017-03-29 08:43:35', NULL, 0),
	('Monitor', 'Màn hình IBM', '2017-03-29 08:42:58', '2017-03-29 08:42:58', '2017-03-29 08:42:14', 1),
	('MOR', 'Màn hình', '2017-03-28 14:38:42', '2017-03-29 09:17:18', NULL, 0),
	('MSC', 'Chuột máy tính', '2017-03-29 14:03:47', '2017-03-29 14:03:47', NULL, 0),
	('RAM', 'RAM', '2017-03-29 08:43:59', '2017-03-29 08:43:59', NULL, 0),
	('SMOR', 'Màn hình cho phòng server', '2017-03-29 09:16:32', '2017-03-29 09:16:32', '2017-03-29 09:16:24', 1),
	('SRM', 'Điều khiển điều hòa', '2017-03-29 13:53:29', '2017-03-29 13:53:29', NULL, 0),
	('SWT', 'Switch', '2017-03-29 08:44:37', '2017-03-29 08:44:37', NULL, 0),
	('TBNV-CHA', 'Sạc laptop', '2017-03-29 08:42:23', '2017-03-29 08:42:23', NULL, 0),
	('TBNV-MIC', 'Microphone', '2017-03-29 08:40:20', '2017-03-29 08:40:20', NULL, 0),
	('TBNV-ORR', 'Divoom', '2017-03-29 08:39:31', '2017-03-29 08:39:31', NULL, 0),
	('TBNV-SPK', 'Loa', '2017-03-29 08:40:08', '2017-03-29 08:40:08', NULL, 0),
	('TBNV-WBC', 'Webcame', '2017-03-29 08:39:53', '2017-03-29 08:39:53', NULL, 0),
	('TBVP-AFU', 'Máy lọc không khí', '2017-03-28 14:39:09', '2017-03-28 14:39:09', NULL, 0),
	('TBVP-AIR', 'Điều hòa', '2017-03-29 08:39:05', '2017-03-29 08:39:05', NULL, 0),
	('TBVP-DIS', 'Cây lọc nước lạnh', '2017-03-29 08:35:43', '2017-03-29 08:36:06', NULL, 0),
	('TBVP-FAN', 'Quạt điện', '2017-03-29 08:38:18', '2017-03-29 08:38:18', NULL, 0),
	('TBVP-FAX', 'Máy fax', '2017-03-29 08:37:45', '2017-03-29 08:37:45', NULL, 0),
	('TBVP-FRD', 'Tủ lạnh', '2017-03-29 08:38:46', '2017-03-29 08:38:46', NULL, 0),
	('TBVP-HEA', 'Máy sưởi', '2017-03-29 08:37:27', '2017-03-29 08:37:27', NULL, 0),
	('TBVP-MCC', 'Máy chấm công', '2017-03-29 08:37:07', '2017-03-29 08:37:07', NULL, 0),
	('TBVP-MCW', 'Lò vi sóng', '2017-03-29 08:36:50', '2017-03-29 08:36:50', NULL, 0),
	('TBVP-PRJ', 'Máy chiếu', '2017-03-28 14:39:29', '2017-03-28 14:39:29', NULL, 0),
	('TBVP-PRT', 'Máy in', '2017-03-29 08:36:27', '2017-03-29 08:36:27', NULL, 0),
	('TBVP-SHR', 'Máy hủy tài liệu', '2017-03-29 08:38:03', '2017-03-29 08:38:03', NULL, 0),
	('TBVP-TIV', 'Tivi', '2017-03-29 08:38:33', '2017-03-29 08:38:33', NULL, 0),
	('UPS', 'UPS', '2017-03-29 08:46:22', '2017-03-29 08:46:22', NULL, 0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for procedure asset.deleteCategory
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `deleteCategory`(deletedAt DATETIME, categoryId VARCHAR(10))
BEGIN    
    UPDATE categories
    SET deleted_flag = 1, deleted_at = deletedAt
    WHERE category_id = categoryId
    AND deleted_flag = 0;     
END//
DELIMITER ;

-- Dumping structure for procedure asset.deleteExpiredRequest
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `deleteExpiredRequest`(createdDate DATETIME)
BEGIN
	UPDATE requests SET request_status = 2 WHERE created_at < str_to_date(createdDate, '%Y-%m-%d %H:%i:%s') AND request_status = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.deleteGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `deleteGroup`(id INT(4))
BEGIN
	UPDATE groups SET groups.deleted_flag = 1
	WHERE groups.group_id = id;
END//
DELIMITER ;

-- Dumping structure for procedure asset.deleteHardware
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `deleteHardware`(hardwareId VARCHAR(10), deletedAt DATETIME)
BEGIN
	UPDATE hardwares
	SET status = 5, deleted_flag = 1, deleted_at = deletedAt
	WHERE hardware_id = hardwareId;
END//
DELIMITER ;

-- Dumping structure for procedure asset.deleteUser
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `deleteUser`(strUsername VARCHAR(255))
BEGIN 
	UPDATE users
    SET users.deleted_flag = 1
    WHERE users.username = strUsername;
END//
DELIMITER ;

-- Dumping structure for procedure asset.editCategory
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `editCategory`(
				       categoryId VARCHAR(10),
					   categoryName VARCHAR(255) CHARSET UTF8, 
					   updatedAt DATETIME  
				   )
BEGIN
	UPDATE categories
    SET category_name = categoryName, updated_at = updatedAt
    WHERE category_id = categoryId;
END//
DELIMITER ;

-- Dumping structure for procedure asset.editUser
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `editUser`(fullName VARCHAR(255) CHARACTER SET utf8, strUsername VARCHAR(255), pass VARCHAR(255), 
strDepartment VARCHAR(50), strEmail VARCHAR(255), strPhone VARCHAR(15), strSkype VARCHAR(50), currentTime DATETIME)
BEGIN
	UPDATE users
    SET full_name = fullName COLLATE utf8_unicode_ci, 
    password = CASE WHEN pass IS NOT NULL THEN md5(pass) ELSE password END,
    department = strDepartment, email = strEmail, phone = strPhone, skype = strSkype, updated_at = currentTime
    WHERE deleted_flag = 0
    AND username = strUsername;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getAllCategories
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getAllCategories`()
BEGIN 
	SELECT category_id, category_name	
    FROM categories
    WHERE deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getAllDepartments
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getAllDepartments`()
BEGIN  
	SELECT DISTINCT department
    FROM users 
    WHERE deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getAllGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getAllGroup`()
BEGIN
	SELECT groups.group_id, groups.group_name FROM groups
	WHERE groups.deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getAllGroupByUser
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getAllGroupByUser`(user_id INT(11))
BEGIN
	SELECT groups_users.group_id
	FROM groups_users WHERE groups_users.user_id = user_id;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getAllHardwareStatus
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getAllHardwareStatus`()
BEGIN
	SELECT hw.status
    FROM hardwares hw
    GROUP BY hw.status;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getAllRole
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getAllRole`()
BEGIN
	SELECT roles.id, roles.role_name, roles.link, roles.method FROM roles
	WHERE roles.deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getAllRoleByGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getAllRoleByGroup`()
BEGIN
	SELECT groups.group_id, groups.group_name, groups_roles.role_id
	FROM groups LEFT JOIN groups_roles
	ON groups.group_id = groups_roles.group_id;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getAllUserByGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getAllUserByGroup`(
	IN `id` INT(4)

)
BEGIN
	SELECT users.id, users.full_name, users.department 
		FROM groups_users LEFT JOIN users ON groups_users.user_id = users.id
	WHERE groups_users.group_id = id;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getAllUsers
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getAllUsers`()
BEGIN
	SELECT id, user_id, full_name, username
    FROM users 
    WHERE deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getCategoryById
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getCategoryById`(
					   categoryId VARCHAR(10)
				   )
BEGIN
	SELECT categories.category_id, categories.category_name
	FROM categories
	WHERE categories.category_id = categoryId
    AND categories.deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getDeletedGroupByName
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getDeletedGroupByName`(
	IN `group_name` VARCHAR(255)

)
BEGIN
	SELECT groups.group_id FROM groups
	WHERE groups.group_name = group_name AND groups.deleted_flag = 1;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getExistedUsername
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getExistedUsername`(username VARCHAR(255))
BEGIN 
	SELECT username 
	FROM users user
	WHERE user.deleted_flag = 0
	AND user.username = username;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getGroupByName
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getGroupByName`(
	IN `name` VARCHAR(255)
)
BEGIN
	SELECT groups.group_id, groups.group_name FROM groups
	WHERE groups.group_name = name AND groups.deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getHardwareByHardwareId
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getHardwareByHardwareId`(hardwareId VARCHAR(10))
BEGIN 
SELECT 	hardware_id, hardware_id_lu, barcode, serial, hardware_name, 
		os, supplier, category_id, buy_date, waranty_date, price, production_id, description, 
		status, depreciated_months, expired_date, note, 
		created_at, updated_at, deleted_at, deleted_flag
FROM hardwares
WHERE hardware_id = hardwareId;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getHardwareDetailById
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getHardwareDetailById`(hardwareId VARCHAR(10))
BEGIN
	SELECT  hw.hardware_id, hw.hardware_id_lu, hw.barcode, hw.hardware_name, cate.category_name, hw.os, hw. supplier, 
    DATE_FORMAT(hw.buy_date, '%d/%m/%Y') AS buy_date, DATE_FORMAT(hw.waranty_date,'%d/%m/%Y') AS waranty_date, hw.serial,
    hw.price, pr.production_id, pr.production_name, hw.description, hwm.user_id, hwm.username, hwm.full_name, rq.user_id AS rq_user_id, 
    rq.username AS rq_username, rq.full_name AS rq_full_name, hw.depreciated_months, DATE_FORMAT(hwm.allocated_date, '%d/%m/%Y') AS allocated_date,
    DATE_FORMAT(hw.expired_date, '%d/%m/%Y') AS expired_date, DATE_FORMAT((rq.allocated_retrieved_at), '%d/%m/%Y') AS allocated_retrieved_at, 
    hw.note, hw.status as statusBefore , rq.request_note, rq.status as statusAfter
    FROM hardwares hw 
		INNER JOIN categories cate ON hw.category_id = cate.category_id
        LEFT JOIN productions pr ON hw.production_id = pr.production_id
		LEFT JOIN (SELECT hm.hardware_id, MAX(hm.allocated_date) AS allocated_date, MAX(hm.created_at) AS created_at, 
						  MAX(hm.retrieved_date) AS retrieved_date, user.full_name, user.id AS user_id, user.department, user.username
					FROM hardware_management hm INNER JOIN users user ON hm.user_id = user.id 
					WHERE hm.allocated_date IS NOT NULL
					AND hm.retrieved_date IS NULL
					GROUP BY hm.hardware_id) hwm 
			ON hw.hardware_id = hwm.hardware_id
		LEFT JOIN (SELECT r.hardware_id, r.user_id, u.full_name, u.username, r.allocated_retrieved_at, r.status, r.request_note
				   FROM requests r LEFT JOIN users u 
                   ON r.user_id = u.id
                   WHERE r.request_status = 0
                   AND r.hardware_id = hardwareId) rq
			ON hw.hardware_id = rq.hardware_id                    
    WHERE hw.hardware_id = hardwareId AND hw.deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getHardwareIdByCategoryId
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getHardwareIdByCategoryId`(categoryId VARCHAR(10))
BEGIN
	SELECT hardware_id
	FROM hardwares 
	WHERE deleted_flag = 0
	AND category_id = categoryId;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getHistoryAlocation
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getHistoryAlocation`(hardwareId VARCHAR(10))
BEGIN 
SELECT DISTINCT hm.hardware_id, hw.hardware_name, hm.user_id, user.full_name, 
	   DATE_FORMAT(hm.allocated_date, '%d/%m/%Y') AS allocated_date, DATE_FORMAT(hm.retrieved_date, '%d/%m/%Y') AS retrieved_date
FROM hardware_management hm
	LEFT JOIN hardwares hw ON hw.hardware_id = hm.hardware_id
    LEFT JOIN users user ON hm.user_id = user.id
WHERE hm.hardware_id = hardwareId
AND hm.deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getListCategories
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getListCategories`(cateLimit INT(10), cateOffset INT(10))
BEGIN 
	SELECT category_id, category_name
    FROM categories
    WHERE deleted_flag = 0
    ORDER BY updated_at DESC
    LIMIT cateLimit
    OFFSET cateOffset;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getListUsers
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getListUsers`(fullName VARCHAR(255) CHARACTER SET utf8, department VARCHAR(50), limitRecord INT(5), offsetRecord INT(5))
BEGIN

	SET fullName = CONCAT('%', fullName, '%');
    
    IF department = '' THEN SET department = NULL;
    END IF;

	SELECT user.user_id, user.username, user.full_name, user.department, user.email, user.skype, user.phone
    FROM users user
    WHERE user.deleted_flag = 0
    AND user.full_name LIKE fullName COLLATE utf8_unicode_ci
    AND (user.department = department OR ISNULL(department))
    ORDER BY user.updated_at
    LIMIT limitRecord OFFSET offsetRecord;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getMaxRetrievedDate
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getMaxRetrievedDate`(hardwareIdArr VARCHAR(255))
BEGIN
	SELECT hardware_id, DATE_FORMAT(MAX(retrieved_date), '%d/%m/%Y') AS max_retrieved_date
	FROM hardware_management
	WHERE FIND_IN_SET(hardware_id , hardwareIdArr)
	GROUP BY hardware_id;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getProductionByName
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getProductionByName`(productionName VARCHAR(255) CHARACTER SET utf8)
BEGIN
	SELECT production_id, production_name FROM productions
	WHERE production_name = productionName AND deleted_flag = '0';
END//
DELIMITER ;

-- Dumping structure for procedure asset.getRequestedHardwares
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getRequestedHardwares`(requestedStatus int(1), userId INT(11), rqLimit int(2), rqOffset int(2))
BEGIN
	-- lấy ra danh sách request 
	SELECT rq.hardware_id, rq.hardware_name, hw.status as statusBefore, rq.status as statusAfter,
		   u.username, rq.request_status, u.full_name
	FROM requests rq  
		 LEFT JOIN hardwares hw ON hw.hardware_id = rq.hardware_id
		 LEFT JOIN users u ON rq.user_id = u.id  
    WHERE rq.request_status = 0
	AND (rq.request_status = requestedStatus OR ISNULL(requestedStatus))
    AND (rq.requested_by = userId OR ISNULL(userId))
    ORDER BY rq.created_at DESC
    LIMIT rqLimit OFFSET rqOffset;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getRoleFromPath
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getRoleFromPath`(path VARCHAR(255))
BEGIN
	SELECT roles.id, roles.method FROM roles
	WHERE roles.link = path;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getSearchedGroups
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getSearchedGroups`(
	IN `groupName` VARCHAR(255)
)
BEGIN
	SET groupName = CONCAT('%', groupName, '%');
    SELECT g.group_id, g.group_name
	FROM groups g
	WHERE g.deleted_flag = 0
	AND g.group_name LIKE groupName;
	
END//
DELIMITER ;

-- Dumping structure for procedure asset.getSearchedHardwares
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getSearchedHardwares`(
					   categoryId VARCHAR(10), 
					   hardwareId VARCHAR(10), 
					   hardwareName VARCHAR(255),
					   hwSerial VARCHAR(50), 
					   hardwareStatus TINYINT, 
					   department VARCHAR(50),
					   userId INT(11), 
					   fromDate DATETIME, 
					   toDate DATETIME, 
					   rqLimit int(2), 
					   rqOffset int(2)
				   )
BEGIN 

SET hardwareId = CONCAT('%', hardwareId, '%');
SET hardwareName = CONCAT('%', hardwareName, '%');
SET hwSerial = CONCAT('%', hwSerial, '%');

IF categoryId = '' THEN SET categoryId = NULL;
END IF;

IF hardwareStatus = '' THEN SET hardwareStatus = NULL;
END IF;

IF userId = '' THEN SET userId = NULL;
END IF;

IF department = '' THEN SET department = NULL;
END IF;

-- Nếu là màn hình tìm kiếm thì có phân trang
IF (rqLimit > 0) THEN 
	SELECT hw.hardware_id, hw.hardware_name, DATE_FORMAT(hwm.allocated_date,'%d/%m/%Y') AS allocated_date, hwm.full_name, hwm.user_id, cate.category_name, 
		   hw.status, pr.production_name, hw.supplier, hw.price, DATE_FORMAT(hw.waranty_date,'%d/%m/%Y') AS waranty_date, DATE_FORMAT(hw.expired_date,'%d/%m/%Y') AS expired_date, hwm.department, 
		   hw.os, hw.serial, hw.note, hw.description
	FROM hardwares hw 
		INNER JOIN categories cate
		ON hw.category_id = cate.category_id
		LEFT JOIN productions pr ON pr.production_id = hw.production_id
		LEFT JOIN (SELECT hm.hardware_id, MAX(hm.allocated_date) AS allocated_date, MAX(hm.created_at) AS created_at, 
						  MAX(hm.retrieved_date) AS retrieved_date, user.full_name, user.id AS user_id, user.department
					FROM hardware_management hm INNER JOIN users user ON hm.user_id = user.id 
					WHERE hm.allocated_date IS NOT NULL
					AND hm.retrieved_date IS NULL
					GROUP BY hm.hardware_id) hwm ON hw.hardware_id = hwm.hardware_id
	WHERE hw.deleted_flag = 0
	AND (hw.category_id = categoryId OR ISNULL(categoryId))
	AND hw.hardware_id LIKE hardwareId
	AND hw.hardware_name LIKE hardwareName
	AND hw.serial LIKE hwSerial
	AND (hwm.department = department OR ISNULL(department))
	AND (hw.status = hardwareStatus OR ISNULL(hardwareStatus))
	AND (hwm.user_id = userId OR ISNULL(userId))
	AND (hwm.allocated_date >= STR_TO_DATE(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
	AND (hwm.allocated_date <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate))
	LIMIT rqLimit OFFSET rqOffset; 
	
-- Nếu là export thì lấy ra tất cả các bản ghi
ELSE  
	SELECT cate.category_name, hw.hardware_id, hw.hardware_name, hw.status as Trạng_thái, hw.price, pr.production_name, hw.supplier,
 DATE_FORMAT(hw.waranty_date,'%d/%m/%Y') AS waranty_date, DATE_FORMAT(hw.expired_date,'%d/%m/%Y') AS expired_date, hwm.full_name, hwm.department, 
 DATE_FORMAT(hwm.allocated_date,'%d/%m/%Y') AS allocated_date,  hw.description, hw.serial, hw.os,  hw.note
       
FROM hardwares hw 
	INNER JOIN categories cate
    ON hw.category_id = cate.category_id
    LEFT JOIN productions pr ON pr.production_id = hw.production_id
	LEFT JOIN (SELECT hm.hardware_id, MAX(hm.allocated_date) AS allocated_date, MAX(hm.created_at) AS created_at, 
					  MAX(hm.retrieved_date) AS retrieved_date, user.full_name, user.id AS user_id, user.department
				FROM hardware_management hm INNER JOIN users user ON hm.user_id = user.id 
                WHERE hm.allocated_date IS NOT NULL
                AND hm.retrieved_date IS NULL
                GROUP BY hm.hardware_id) hwm ON hw.hardware_id = hwm.hardware_id
WHERE hw.deleted_flag = 0
AND (hw.category_id = categoryId OR ISNULL(categoryId))
AND hw.hardware_id LIKE hardwareId
AND hw.hardware_name LIKE hardwareName
AND hw.serial LIKE hwSerial
AND (hwm.department = department OR ISNULL(department))
AND (hw.status = hardwareStatus OR ISNULL(hardwareStatus))
AND (hwm.user_id = userId OR ISNULL(userId))
AND (hwm.allocated_date >= STR_TO_DATE(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
AND (hwm.allocated_date <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate));
    
    END IF;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getSearchedHardwareToAllocate
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getSearchedHardwareToAllocate`(
					   requestedType TINYINT, 
					   categoryId VARCHAR(10), 
					   hardwareId VARCHAR(10), 
					   hardwareName VARCHAR(255), 
					   hardwareStatus TINYINT, 
					   userId INT(11), 
					   fromDate DATETIME, 
					   toDate DATETIME, 
					   rqLimit int(2), 
					   rqOffset int(2)
				   )
BEGIN 

SET hardwareId = CONCAT('%', hardwareId, '%');
SET hardwareName = CONCAT('%', hardwareName, '%');

IF categoryId = '' THEN SET categoryId = NULL;
END IF;

IF hardwareStatus = '' THEN SET hardwareStatus = NULL;
END IF;

IF userId = '' THEN SET userId = NULL;
END IF;

SELECT hw.hardware_id, hw.hardware_name, hw.status, DATE_FORMAT(hwm.allocated_date, '%d/%m/%Y') AS allocated_date, hwm.full_name, hwm.user_id
FROM hardwares hw  
		INNER JOIN categories cate
		ON hw.category_id = cate.category_id
		LEFT JOIN productions pr ON pr.production_id = hw.production_id
		LEFT JOIN (SELECT hm.hardware_id, MAX(hm.allocated_date) AS allocated_date, MAX(hm.created_at) AS created_at, 
						  MAX(hm.retrieved_date) AS retrieved_date, user.full_name, user.id AS user_id, user.department
					FROM hardware_management hm INNER JOIN users user ON hm.user_id = user.id 
					WHERE hm.allocated_date IS NOT NULL
					AND hm.retrieved_date IS NULL
					GROUP BY hm.hardware_id) hwm ON hw.hardware_id = hwm.hardware_id
WHERE hw.deleted_flag = 0
AND hw.hardware_id NOT IN (SELECT hardware_id FROM requests WHERE request_status = 0 )
 AND IF (requestedType = 2, hw.status IN (1, 3), hw.status = 2) 
 AND (hw.category_id = categoryId OR ISNULL(categoryId))
 AND hw.hardware_id LIKE hardwareId
 AND hw.hardware_name LIKE hardwareName
 AND (hw.status = hardwareStatus OR ISNULL(hardwareStatus))
 AND (hwm.user_id = userId OR ISNULL(userId))
 AND (hwm.allocated_date >= str_to_date(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
 AND (hwm.allocated_date <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate))
 LIMIT rqLimit OFFSET rqOffset; 
END//
DELIMITER ;

-- Dumping structure for procedure asset.getSearchedUsers
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getSearchedUsers`(
	IN `fullName` VARCHAR(255),
	IN `groupId` INT(4),
	IN `department` VARCHAR(50),
	IN `currentGroup` INT(4)

)
BEGIN

	SET fullName = CONCAT('%', fullName, '%');
    
    IF groupId = '' THEN SET groupId = NULL;
    END IF;
    IF department = '' THEN SET department = NULL;
    END IF;

	SELECT user.id, user.user_id, user.full_name, user.department, gr_u.group_name
	FROM users user 
	LEFT JOIN (SELECT gu.user_id, g.group_name, g.group_id
				FROM groups_users gu LEFT JOIN groups g
				ON g.group_id = gu.group_id
				WHERE g.deleted_flag = 0
				AND gu.group_id <> currentGroup) gr_u
				
	ON user.id = gr_u.user_id
	WHERE user.deleted_flag = 0
	AND (user.full_name LIKE fullName OR ISNULL(fullName))
	AND (gr_u.group_id = groupId OR ISNULL(groupId))
	AND (user.department = department OR ISNULL(department));
END//
DELIMITER ;

-- Dumping structure for procedure asset.getSearchLog
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getSearchLog`(categoryId VARCHAR(10),  startDate DATETIME, endDate DATETIME, limitRecord TINYINT(4), offsetRecord TINYINT(4))
BEGIN
	IF categoryId = '' THEN SET categoryId = null;
	END IF;
    
	SELECT `logs`.hardware_id, `logs`.username, DATE_FORMAT(`logs`.log_time, '%d/%m/%Y') AS log_time, `logs`.content
	FROM `logs` 
    LEFT JOIN (SELECT hw.hardware_id, cate.category_id
			   FROM hardwares hw
			   INNER JOIN categories cate
			   ON hw.category_id = cate.category_id) hardware
	ON `logs`.hardware_id = hardware.hardware_id
	WHERE (hardware.category_id = categoryId OR ISNULL(categoryId))
	AND (`logs`.log_time >= STR_TO_DATE(startDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(startDate))
	AND (logs.log_time <= STR_TO_DATE(endDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(endDate))
	ORDER BY logs.log_time DESC
	LIMIT limitRecord OFFSET offsetRecord;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getStatisticalCategories
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getStatisticalCategories`(
					   categoriesId TEXT, 
					   warrantyStatus VARCHAR(10),
					   fromDate DATETIME, 
					   toDate DATETIME
				   )
BEGIN

IF categoriesId = '' THEN SET categoriesId = NULL;
END IF;
                         
IF warrantyStatus = 'all' THEN SET warrantyStatus = NULL;
END IF;

SELECT cate.category_id, cate.category_name, hw.created_at,
		SUM(CASE WHEN hw.statusBefore = 2 THEN 1 ELSE 0 END) AS usingNum,
        SUM(CASE WHEN hw.statusBefore IN (1, 3) THEN 1 ELSE 0 END) AS emptyNum,
        SUM(CASE WHEN hw.statusAfter = 5 THEN 1 ELSE 0 END) AS deletedPending,
        COUNT(hw.hardware_id) AS total
FROM categories cate
LEFT JOIN (SELECT h.hardware_id, h.category_id, h.created_at, h.status as statusBefore, r.status as statusAfter, h.waranty_date
			FROM hardwares h LEFT JOIN (SELECT hardware_id, status, MAX(created_at) FROM requests GROUP BY hardware_id) r
			ON h.hardware_id = r.hardware_id
			WHERE h.deleted_flag = 0
			AND IF (warrantyStatus = 'under', h.waranty_date > STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i:%s'),
			IF (warrantyStatus = 'expired', h.waranty_date < STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i:%s'), ISNULL(warrantyStatus)))
			AND (h.created_at >= STR_TO_DATE(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
			AND (h.created_at <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate))) hw
ON cate.category_id = hw.category_id
WHERE cate.deleted_flag = 0
AND (FIND_IN_SET(cate.category_id, categoriesId) OR ISNULL(categoriesId))
GROUP BY cate.category_id;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getTotalCategories
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getTotalCategories`()
BEGIN 
	SELECT COUNT(category_id) as total
    FROM categories
	WHERE deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getTotalExpiredRequest
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getTotalExpiredRequest`(userId INT(11), createdDate DATETIME)
BEGIN 
	SELECT COUNT(request_id) AS total 
	FROM requests
	WHERE request_status = 0
	AND (requested_by = userId OR ISNULL(userId))
    AND (DATE_FORMAT(created_at, '%Y-%m-%d') = STR_TO_DATE(createdDate, '%Y-%m-%d'));
END//
DELIMITER ;

-- Dumping structure for procedure asset.getTotalGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getTotalGroup`(groupName VARCHAR(255))
BEGIN
	SET groupName = CONCAT('%', groupName, '%');
    SELECT COUNT(g.group_id) AS group_count
	FROM groups g
	WHERE g.deleted_flag = 0
	AND g.group_name LIKE groupName;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getTotalRequestedHardwares
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getTotalRequestedHardwares`(requestedStatus int(1), userId INT(11))
BEGIN
	SELECT COUNT(rq.request_id) AS total
    FROM requests rq
    WHERE rq.request_status = 0
	AND (rq.request_status = requestedStatus OR ISNULL(requestedStatus))
    AND (rq.requested_by = userId OR ISNULL(userId));
END//
DELIMITER ;

-- Dumping structure for procedure asset.getTotalSearchedHardwares
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getTotalSearchedHardwares`(
					   categoryId VARCHAR(10), 
					   hardwareId VARCHAR(10), 
					   hardwareName VARCHAR(255),
					   hwSerial VARCHAR(50), 
					   hardwareStatus TINYINT, 
					   department VARCHAR(50),
					   userId INT(11), 
					   fromDate DATETIME, 
					   toDate DATETIME
				   )
BEGIN 

SET hardwareId = CONCAT('%', hardwareId, '%');
SET hardwareName = CONCAT('%', hardwareName, '%');
SET hwSerial = CONCAT('%', hwSerial, '%');

IF categoryId = '' THEN SET categoryId = NULL;
END IF;

IF hardwareStatus = '' THEN SET hardwareStatus = NULL;
END IF;

IF userId = '' THEN SET userId = NULL;
END IF;

IF department = '' THEN SET department = NULL;
END IF;

SELECT COUNT(hw.hardware_id) AS total
FROM hardwares hw 
		INNER JOIN categories cate
		ON hw.category_id = cate.category_id
		LEFT JOIN productions pr ON pr.production_id = hw.production_id
		LEFT JOIN (SELECT hm.hardware_id, MAX(hm.allocated_date) AS allocated_date, MAX(hm.created_at) AS created_at, 
						  MAX(hm.retrieved_date) AS retrieved_date, user.full_name, user.id AS user_id, user.department
					FROM hardware_management hm INNER JOIN users user ON hm.user_id = user.id 
					WHERE hm.allocated_date IS NOT NULL
					AND hm.retrieved_date IS NULL
					GROUP BY hm.hardware_id) hwm ON hw.hardware_id = hwm.hardware_id
	WHERE hw.deleted_flag = 0
	AND (hw.category_id = categoryId OR ISNULL(categoryId))
	AND hw.hardware_id LIKE hardwareId
	AND hw.hardware_name LIKE hardwareName
	AND hw.serial LIKE hwSerial
	AND (hwm.department = department OR ISNULL(department))
	AND (hw.status = hardwareStatus OR ISNULL(hardwareStatus))
	AND (hwm.user_id = userId OR ISNULL(userId))
	AND (hwm.allocated_date >= STR_TO_DATE(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
	AND (hwm.allocated_date <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate));
END//
DELIMITER ;

-- Dumping structure for procedure asset.getTotalSearchedHardwaresToAllocate
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getTotalSearchedHardwaresToAllocate`(requestedType TINYINT, categoryId VARCHAR(10), hardwareId VARCHAR(10), hardwareName VARCHAR(255), 
hardwareStatus TINYINT, userId INT(11), fromDate DATETIME, toDate DATETIME)
BEGIN

SET hardwareId = CONCAT('%', hardwareId, '%');
SET hardwareName = CONCAT('%', hardwareName, '%');

IF categoryId = '' THEN SET categoryId = NULL;
END IF;

IF hardwareStatus = '' THEN SET hardwareStatus = NULL;
END IF;

IF userId = '' THEN SET userId = NULL;
END IF;

SELECT COUNT(hw.hardware_id) as total
FROM hardwares hw  
		INNER JOIN categories cate
		ON hw.category_id = cate.category_id
		LEFT JOIN productions pr ON pr.production_id = hw.production_id
		LEFT JOIN (SELECT hm.hardware_id, MAX(hm.allocated_date) AS allocated_date, MAX(hm.created_at) AS created_at, 
						  MAX(hm.retrieved_date) AS retrieved_date, user.full_name, user.id AS user_id, user.department
					FROM hardware_management hm INNER JOIN users user ON hm.user_id = user.id 
					WHERE hm.allocated_date IS NOT NULL
					AND hm.retrieved_date IS NULL
					GROUP BY hm.hardware_id) hwm ON hw.hardware_id = hwm.hardware_id
WHERE hw.deleted_flag = 0
AND hw.hardware_id NOT IN (SELECT hardware_id FROM requests WHERE request_status = 0 )
 AND IF (requestedType = 2, hw.status IN (1, 3), hw.status = 2) 
 AND (hw.category_id = categoryId OR ISNULL(categoryId))
 AND hw.hardware_id LIKE hardwareId
 AND hw.hardware_name LIKE hardwareName
 AND (hw.status = hardwareStatus OR ISNULL(hardwareStatus))
 AND (hwm.user_id = userId OR ISNULL(userId))
 AND (hwm.allocated_date >= str_to_date(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
 AND (hwm.allocated_date <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate)); 
END//
DELIMITER ;

-- Dumping structure for procedure asset.getTotalSearchedLog
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getTotalSearchedLog`(categoryId VARCHAR(10), startDate DATETIME, endDate DATETIME)
BEGIN
	IF categoryId = '' THEN SET categoryId = null;
	END IF;
    
	SELECT COUNT(`logs`.hardware_id) AS total
	FROM `logs` 
    LEFT JOIN (SELECT hw.hardware_id, cate.category_id
			   FROM hardwares hw
			   INNER JOIN categories cate
			   ON hw.category_id = cate.category_id) hardware
	ON `logs`.hardware_id = hardware.hardware_id
	WHERE (hardware.category_id = categoryId OR ISNULL(categoryId))
	AND (`logs`.log_time >= STR_TO_DATE(startDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(startDate))
	AND (logs.log_time <= STR_TO_DATE(endDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(endDate));
END//
DELIMITER ;

-- Dumping structure for procedure asset.getTotalStatisticalHardwares
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getTotalStatisticalHardwares`(categoriesId TEXT, warrantyStatus VARCHAR(10), fromDate DATETIME, toDate DATETIME)
BEGIN

IF categoriesId = '' THEN SET categoriesId = NULL;
END IF;
                 
IF warrantyStatus = 'all' THEN SET warrantyStatus = NULL;
END IF;

SELECT COUNT(hw.hardware_id) AS total
FROM (SELECT h.hardware_id, h.category_id, h.created_at, h.status as statusBefore, r.status as statusAfter, h.waranty_date
			FROM hardwares h LEFT JOIN (SELECT hardware_id, status, MAX(created_at) FROM requests GROUP BY hardware_id) r
			ON h.hardware_id = r.hardware_id
      WHERE h.deleted_flag = 0) hw
LEFT JOIN categories cate
ON cate.category_id = hw.category_id
WHERE cate.deleted_flag = 0
AND (FIND_IN_SET(cate.category_id, categoriesId) OR ISNULL(categoriesId))
AND IF (warrantyStatus = 'under', hw.waranty_date > STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i:%s'),
IF (warrantyStatus = 'expired', hw.waranty_date < STR_TO_DATE(NOW(), '%Y-%m-%d %H:%i:%s'), ISNULL(warrantyStatus)))
AND (hw.created_at >= STR_TO_DATE(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
AND (hw.created_at <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate));
END//
DELIMITER ;

-- Dumping structure for procedure asset.getTotalUsers
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getTotalUsers`(fullName VARCHAR(255) CHARACTER SET utf8, department VARCHAR(50))
BEGIN  
	SET fullName = CONCAT('%', fullName, '%');
    
    IF department = '' THEN SET department = NULL;
    END IF;
    
	SELECT COUNT(user.username) as total
    FROM users user
    WHERE user.deleted_flag = 0
    AND user.full_name LIKE fullName COLLATE utf8_unicode_ci
    AND (user.department = department OR ISNULL(department));
END//
DELIMITER ;

-- Dumping structure for procedure asset.getUserByUsernamePassword
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getUserByUsernamePassword`(username VARCHAR(255), pass VARCHAR(255))
BEGIN
	SELECT users.id, users.username, users.full_name
	FROM users
	WHERE users.deleted_flag = 0
	AND users.username = username
	AND users.password = md5(pass);
END//
DELIMITER ;

-- Dumping structure for procedure asset.getUsernameById
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getUsernameById`(userId INT(11))
BEGIN
	SELECT username
    FROM users
    WHERE id = userId AND deleted_flag = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.getUserPermision
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `getUserPermision`(userId TINYINT(2))
BEGIN 
	SELECT user.id, gr_role.role_id
	FROM users user
		INNER JOIN (SELECT DISTINCT gu.user_id, gr.role_id
				   FROM groups_roles gr INNER JOIN groups_users gu
				   ON gr.group_id = gu.group_id) gr_role
		ON gr_role.user_id = user.id
	WHERE user.deleted_flag = 0
	AND user.id = userId;
END//
DELIMITER ;

-- Dumping structure for table asset.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(4) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.groups: ~1 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
REPLACE INTO `groups` (`group_id`, `group_name`, `created_at`, `updated_at`, `deleted_at`, `deleted_flag`) VALUES
	(1, 'superadmin', '2017-01-01 12:00:00', NULL, NULL, 0),
	(2, 'Admin', '2017-03-28 13:52:55', NULL, NULL, 0),
	(3, 'Devolopers', '2017-03-28 14:47:45', NULL, NULL, 0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table asset.groups_roles
CREATE TABLE IF NOT EXISTS `groups_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(4) NOT NULL,
  `role_id` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_role_UNIQUE` (`group_id`,`role_id`),
  KEY `fk_groups` (`group_id`),
  KEY `fk_roles` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.groups_roles: ~1 rows (approximately)
/*!40000 ALTER TABLE `groups_roles` DISABLE KEYS */;
REPLACE INTO `groups_roles` (`id`, `group_id`, `role_id`) VALUES
	(1, 1, 7),
	(21, 2, 1),
	(24, 2, 2),
	(25, 2, 3),
	(27, 2, 4),
	(26, 3, 3);
/*!40000 ALTER TABLE `groups_roles` ENABLE KEYS */;

-- Dumping structure for table asset.groups_users
CREATE TABLE IF NOT EXISTS `groups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id_UNIQUE` (`group_id`,`user_id`),
  KEY `fk_group` (`group_id`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.groups_users: ~1 rows (approximately)
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
REPLACE INTO `groups_users` (`id`, `group_id`, `user_id`) VALUES
	(1, 1, 1),
	(8, 1, 3),
	(2, 2, 3),
	(5, 2, 7),
	(4, 3, 4),
	(6, 3, 5),
	(7, 3, 6);
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;

-- Dumping structure for table asset.hardwares
CREATE TABLE IF NOT EXISTS `hardwares` (
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_id_lu` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `os` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `buy_date` datetime NOT NULL,
  `waranty_date` datetime NOT NULL,
  `price` int(11) NOT NULL,
  `production_id` tinyint(4) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
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
  CONSTRAINT `fk_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.hardwares: ~0 rows (approximately)
/*!40000 ALTER TABLE `hardwares` DISABLE KEYS */;
REPLACE INTO `hardwares` (`hardware_id`, `hardware_id_lu`, `barcode`, `serial`, `hardware_name`, `os`, `supplier`, `category_id`, `buy_date`, `waranty_date`, `price`, `production_id`, `description`, `status`, `depreciated_months`, `expired_date`, `note`, `deleted_reason`, `created_at`, `updated_at`, `deleted_at`, `deleted_flag`, `ref01`, `ref02`, `ref03`, `ref04`, `ref05`) VALUES
	('AFU001', '', '', '160600735', 'Máy lọc không khí Sharp FU-A80', '', 'Unknow', 'TBVP-AFU', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Trắng\nModel: FU-A80EA-W', 1, 0, '2011-03-31 00:00:00', 'Phòng DEV', NULL, '2017-03-29 14:44:40', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('AFU002', '', '', '160600750', 'Máy lọc không khí Sharp', '', 'Unknow', 'TBVP-AFU', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'model: FU-A80', 1, 0, '2011-03-31 00:00:00', 'Phòng hành chính', NULL, '2017-03-29 14:46:07', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('AFU003', '', '', '', 'Máy lọc không khí Sharp', '', 'Unknow', 'TBVP-AFU', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Màu trắng', 1, 0, '2011-03-31 00:00:00', 'Phòng DEV', NULL, '2017-03-29 14:54:53', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('BLV001', '', 'KT0004V12I08', '', 'Ram DDR2 Kingston', '', 'Unknow', 'BLV', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 5, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:21:03', NULL, '2017-03-29 15:19:28', 1, NULL, NULL, NULL, NULL, NULL),
	('BLV002', '', 'KT0004V12I08', '', 'Ram DDR2 Kingston', '', 'Unknow', 'BLV', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 5, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:22:39', NULL, '2017-03-29 15:19:28', 1, NULL, NULL, NULL, NULL, NULL),
	('CDR001', '', '75A212B0629231', '', 'Ổ đĩa DVD Asus', '', 'Unknow', 'CDR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'MN: DVD-E616A3', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 13:03:26', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CHA001', '', '', '', 'Sạc laptop SAMSUNG', '', 'Unknow', 'TBNV-CHA', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, '100-240V\n30W', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 13:26:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT001', 'SCPT021', '', '2QV2F2S5977866196', 'Case DELL', '', 'Unknow', 'CPT', '2012-11-21 00:00:00', '2012-11-21 00:00:00', 0, NULL, 'Chi tiết: CPU53;\nMã TSCĐ: MVT53', 1, 0, '2012-11-30 00:00:00', 'Màu đen', NULL, '2017-03-29 11:08:10', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT002', 'CPT0742', '', '9PYGS62', 'Case DELL', '', 'Unknow', 'CPT', '2016-03-09 00:00:00', '2016-03-09 00:00:00', 0, NULL, 'CPT0742 - 431-20160309, Core I3 4170U\nRam 3.6 -  4Gb, HĐ 500Gb', 1, 0, '2016-03-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:09:14', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT003', 'SCPT010', '', '', 'Case SAMSUNG đen', '', 'Unknow', 'CPT', '2011-11-15 00:00:00', '2011-11-15 00:00:00', 0, NULL, 'Mã TSCĐ: MVT39;\nChi tiết: CPU39', 1, 0, '2011-11-30 00:00:00', 'Màu đen', NULL, '2017-03-29 11:10:00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT004', 'SCPT012', '', 'DBJTC2S', 'Case DELL đen', '', 'Unknow', 'CPT', '2012-06-28 00:00:00', '2012-06-28 00:00:00', 0, NULL, 'Chi tiết: CPU42;\nMã TSCĐ: MVT42', 1, 0, '2012-06-30 00:00:00', 'Màu đen', NULL, '2017-03-29 11:10:47', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT005', 'SCPT023', '', 'CQV2F2S', 'Case DELL 21 inch', '', 'Unknow', 'CPT', '2012-12-03 00:00:00', '2012-12-03 00:00:00', 0, NULL, 'Chi tiết: CPU55;\nMã TSCĐ: MVT55', 1, 0, '2012-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:11:38', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT006', 'SCPT006', '', '', 'Case DELL màu đen', '', 'Unknow', 'CPT', '2011-03-22 00:00:00', '2011-03-22 00:00:00', 0, NULL, 'Mã TSCĐ: MVT35;\nChi tiết: CPU35;\nCore i5', 1, 0, '2011-03-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:12:16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT007', 'SCPT018', '00180-455-009-646', 'HZLKD2S', 'Case DELL', '', 'Unknow', 'CPT', '2012-08-30 00:00:00', '2012-08-30 00:00:00', 0, NULL, 'Mã TSCĐ: MVT48;\nChi tiết: CPU48', 1, 0, '2012-08-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:13:11', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT008', 'CPT0737', '', '9N5JS62', 'Case DELL', '', 'Unknow', 'CPT', '2016-03-09 00:00:00', '2016-03-09 00:00:00', 0, NULL, 'CPT0737-431-20160309\nCore i3 4170U, 4Gb, 500Gb HDD', 1, 0, '2016-03-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:14:04', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT009', 'SCPT026', '', 'F2H1G2S', 'Case DELL', '', 'Unknow', 'CPT', '2013-01-14 00:00:00', '2013-01-14 00:00:00', 0, NULL, 'Mã chi tiết: CPU58;\nMã TSCĐ: MVT58;\nCấu hình: VXL intel core i3 2120, RAM 4GB, 500GB, card onboard 1664MB\nHĐH: Win10 Pro 64bit', 1, 0, '2013-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:14:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT010', 'SCPT027', '', '31H1G2S', 'Case', '', 'Unknow', 'CPT', '2013-01-14 00:00:00', '2013-01-14 00:00:00', 0, 0, 'Mã chi tiết: CPU59;\nMã TSCĐ: MVT59;\nCấu hình: VXL intel core i3 2120, RAM 4GB, 500GB, card onboard 1664MB;\nHĐH: Win10 Pro 64bit', 1, 0, '2013-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:19:12', '2017-03-29 11:19:27', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT011', 'CPT0613', '', 'S2TVY42', 'Case DELL', '', 'Unknow', 'CPT', '2015-06-20 00:00:00', '2015-06-20 00:00:00', 0, NULL, 'Cấu hình: VXL intel core i3 4150, RAM 8GB, 500GB, card onboard 1664MB;\nHĐH: Win8.1 64bit', 1, 0, '2015-06-30 00:00:00', 'Màu đen', NULL, '2017-03-29 11:20:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT012', 'SCPT011', '', '', 'Case', '', 'Unknow', 'CPT', '2012-02-07 00:00:00', '2012-02-07 00:00:00', 0, 0, 'Mã TSCĐ: CPU40', 1, 0, '2012-02-29 00:00:00', 'Màu đen', NULL, '2017-03-29 11:20:56', '2017-03-29 11:21:49', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT013', 'SCPT025', '', '', 'Case DELL', '', 'Unknow', 'CPT', '2012-12-03 00:00:00', '2012-12-03 00:00:00', 0, NULL, 'Mã chi tiết: CPU57;\nMã TSCĐ: MVT57;\nCấu hình: VXL intel core i3', 1, 0, '2012-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:22:27', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT014', 'SCPT022', '', '', 'Case DELL', '', 'Unknow', 'CPT', '2012-11-21 00:00:00', '2012-11-21 00:00:00', 0, NULL, 'Mã chi tiết: CPU54;\nMã TSCĐ: MVT54;\nCấu hình: VXL intel core i3', 4, 0, '2012-11-30 00:00:00', 'Hỏng ổ cứng', NULL, '2017-03-29 11:23:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT015', 'SCPT020', '', '', 'Case DELL', '', 'Unknow', 'CPT', '2012-11-21 00:00:00', '2012-11-21 00:00:00', 0, NULL, 'Mã chi tiết: CPU52;\nMã TSCĐ: MVT52;\nCấu hình: VXL intel core i3', 4, 0, '2012-11-30 00:00:00', 'Hỏng card onboard', NULL, '2017-03-29 11:24:14', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT016', 'SCPT014', '', '', 'Case DELL', '', 'Unknow', 'CPT', '2012-08-02 00:00:00', '2012-08-02 00:00:00', 0, NULL, 'Mã chi tiết: CPU44;\nMã TSCĐ: MVT41;\nCấu hình: VXL intel core i3', 1, 0, '2012-08-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:25:06', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT017', 'SCPT005', '', '', 'Case máy tính', '', 'Unknow', 'CPT', '2011-03-22 00:00:00', '2011-03-22 00:00:00', 0, NULL, 'Mã TSCĐ: MVT34;\nCore-i5-650, Biostar H55HD, Ram-3: 2Gb(2), Card - Onboard, HDD:500Gb', 1, 0, '2011-03-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:25:46', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT018', 'CPT0748', '', '9KPFS62', 'Case máy tính', '', 'Unknow', 'CPT', '2016-03-09 00:00:00', '2016-03-09 00:00:00', 0, 0, 'core-i3-4170, Dell Inc 088DT1, Ram-3: 4Gb(2), Card - Onborad, HDD:500 Gb', 1, 0, '2016-03-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:26:25', '2017-03-29 11:26:37', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT019', 'CPT0740', '', '9FY9S62', 'Case máy tính', '', 'Unknow', 'CPT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'core-i3-4170, Dell Inc 088DT1, Ram-3: 4Gb(2), Card - Onborad, HDD:500 Gb', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:27:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT020', 'CPT0736', '', '6HKJS62', 'Case máy tính', '', 'Unknow', 'CPT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'core-i3-4170, Dell Inc 088DT1, Ram-3: 4Gb(1), Ram-3: 8Gb(1) Card - AMD Redeon HD : 5450, HDD:500 Gb', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:28:07', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT021', 'SCPT009', '', '', 'Case máy tính', '', 'Unknow', 'CPT', '2011-11-15 00:00:00', '2011-11-15 00:00:00', 0, NULL, 'Mã TSCĐ: MVT38;\ncore-i5-2400, Ram-3: 4Gb(1), P8H61-MLE, card-onboard, HDD: 500Gb', 1, 0, '2011-11-30 00:00:00', 'Màu đen', NULL, '2017-03-29 11:28:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT022', 'SCPT008', '', '', 'Case máy tính', '', 'Unknow', 'CPT', '2011-03-22 00:00:00', '2011-03-22 00:00:00', 0, NULL, 'Mã TSCĐ: MVT37;\ncore-i5, Ram-3: 2Gb(2), BIOSTAR H55-HD, Card - AMD- radeon 5450, HDD: 500Gb', 1, 0, '2011-03-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:29:44', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT023', 'SCPT015', '', '3XKKB25', 'Case máy tính', '', 'Unknow', 'CPT', '2012-03-08 00:00:00', '2012-03-08 00:00:00', 0, NULL, 'Mã TSCĐ: MVT45;\ncore-i3-2120, Ram-3: 2Gb(2), Dell inc-OGDG8Y, card-onboard, HDD: 500 Gb', 1, 0, '2012-03-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:30:21', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT024', 'SCPT016', '', '8TRKB2S', 'Case máy tính', '', 'Unknow', 'CPT', '2012-09-08 00:00:00', '2012-09-08 00:00:00', 0, NULL, 'Mã TSCĐ: MVT46;\nCấu hình: core-i3-2120, Ram-3: 2Gb(2), Dell inc-OGDG8Y, card-onboard, HDD: 500 Gb', 1, 0, '2012-09-30 00:00:00', 'Màu đen', NULL, '2017-03-29 11:30:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT025', 'SCPT002', '', '', 'Case máy in', '', 'Unknow', 'CPT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Mã TSCĐ: MVT28\nCấu hình: core 2 duo E4400, intel corporation-D945GCNL, Ram-2: 1Gb(2), HDD 300Gb, card - onboard', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:31:41', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT026', 'SCPT013', '', '6PHTC2S', 'Case máy tính', '', 'Unknow', 'CPT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Mã TSCĐ: MVT43\ndell - core-i3', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:32:23', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT027', 'CPT0699', '', '37B3V72', 'Case máy tính', '', 'Unknow', 'CPT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'core -i3-4170, Ram-3:4Gb(2), Dell Inc 088DT1, HDD: 500Gb, Card-onboard', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:33:06', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT028', 'SCPT017', '', '4YLKD2S', 'Case máy tính', '', 'Unknow', 'CPT', '2012-08-29 00:00:00', '2012-08-29 00:00:00', 0, NULL, 'Mã TSCĐ: MVT47; \ncore-i3-2120, Ram-3: 4Gb(2), Dell inc-OGDG8Y, card-onboard, HDD: 500 Gb', 1, 0, '2012-08-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:34:31', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT029', 'CPT0744', '', '6KN8S62', 'Case máy tính', '', 'Unknow', 'CPT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'core-i3-4170, Dell inc 088DT1, Ram-3:8Gb(1), card-onboard, HDD:500Gb', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:35:09', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT030', 'SSRV002', '', '', 'Case Server 9', '', 'Unknow', 'CPT', '2009-08-06 00:00:00', '2009-08-06 00:00:00', 0, NULL, 'OS: Cent;\nLoại máy: IBM', 1, 0, '2009-08-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:36:05', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('CPT031', 'SSRV001', '', '', 'Case Server 8', '', 'Unknow', 'CPT', '2009-08-06 00:00:00', '2009-08-06 00:00:00', 0, NULL, 'OS: Cent;\nLoại máy: IBM', 1, 0, '2009-08-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:36:36', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('DDI001', 'SDDI002', '', 'BCG-E2643B', 'Iphone 5', '', 'Unknow', 'DDI', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'IMEI: 359266064791944\nIC: 579C-E2643B', 1, 0, '2011-01-31 00:00:00', 'Màu đen + xám', NULL, '2017-03-29 12:49:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('DDI002', 'SMRT001', '', '', 'Smartphone Sam Sung', '', 'Unknow', 'DDI', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'model: E1050', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 12:50:43', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('DDI003', 'SMRT002', '', '', 'Smartphone Asus', '', 'Unknow', 'DDI', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Asus_2007, android: 4.2.2', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 12:51:26', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('DIS001', '', '', '', 'Cây nước nóng lạnh', '', 'Cty điện máy Báck Khoa', 'TBVP-DIS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Model: WD-180\nCông suất: 500W\nNơi mua: Cty Điện máy Bách khoa', 1, 0, '2011-03-31 00:00:00', 'Phòng DEV', NULL, '2017-03-29 14:55:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('FAN001', '', '', '', 'Quạt điện cơ 91', '', 'Unknow', 'TBVP-FAN', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Số tem: 6059230\n220V-34W', 1, 0, '2011-03-31 00:00:00', 'Phòng DEV', NULL, '2017-03-29 14:54:12', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('FAN002', '', '', '', 'Quạt Seiko', '', 'Unknow', 'TBVP-FAN', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Model: DCN108\nCông suất: 65W', 1, 0, '2011-03-31 00:00:00', 'Phòng DEV', NULL, '2017-03-29 14:56:30', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('FRD001', '', '', '', 'Tủ lạnh Sharp', '', 'Unknow', 'TBVP-FRD', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Tủ lạnh 120L', 1, 0, '2011-03-31 00:00:00', 'Nhà bếp', NULL, '2017-03-29 14:50:23', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('HEA001', '', '', '', 'Máy sưởi Halogen Heater', '', 'Unknow', 'TBVP-HEA', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Trắng\nmodel: KS-120', 1, 0, '2011-03-31 00:00:00', 'Phòng hành chính', NULL, '2017-03-29 14:48:27', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('HEA002', '', '', '', 'Máy sưởi dầu NONAN', '', 'Cty cổ phần đầu tư TM&DV biển sanh- số 1 Hồ Đắc Di', 'TBVP-HEA', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Model: SD-02\nĐiện áp: 220V-50Hz\nCông suất: 2900W\nĐơn vị: Cty Cổ phần đầu tư TM&DV Biển xanh - số 1 Hồ Đắc Di, Hà Nội', 1, 0, '2011-03-31 00:00:00', 'Phòng DEV', NULL, '2017-03-29 14:53:29', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY001', 'SKB010', '', '', 'Bàn phím DELL', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:41:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY002', 'SKB011', '', '', 'Bàn phím DELL đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:49:42', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY003', 'SKB012', '', '', 'Bàn phím DELL đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:50:11', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY004', 'SKB013', '', '0065802420075', 'Bàn phím DELL đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Màu đen;\nPN: 00658-486-4200753-21032', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:50:37', '2017-03-29 11:52:17', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY005', 'SKB014', 'LO4515-001248', '1449MG00CPQ8', 'Bàn phím Logitech xám', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu xám, \nPN: 820-004251;\nMN: Y-U009', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:51:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY006', 'SKB015', '', '', 'Bàn phím Logitech đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:52:48', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY007', 'SKB016', '', '', 'Bàn phím DELL', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'KB212-B; màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:53:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY008', 'SKB002', '', '', 'Bàn phím DELL đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:54:28', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY009', 'SKB003', '', '', 'Bàn phím DELL đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:55:09', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY010', 'SKB004', '', '', 'Bàn phím DELL đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:56:04', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY011', 'SKB005', '', '', 'Bàn phím DELL đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:56:43', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY012', 'SKB006', '', '0065802230503', 'Bàn phím Microsoft đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 11:57:18', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY013', 'SKB007', '', '', 'Bàn phím DELL đen', '', 'Unknow', 'KEY', '2017-03-01 00:00:00', '2017-03-01 00:00:00', 0, NULL, 'màu đen', 1, 0, '2017-03-31 00:00:00', '', NULL, '2017-03-29 12:00:47', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY014', 'SKB008', 'LO4515-001250', '1449MG00CPF8', 'Bàn phím Logitech đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:33:08', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY015', 'SKB009', '', '', 'Bàn phím DELL đen', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:33:48', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY016', 'SKB017', 'LO4515-001249', '1449MG00CPR8', 'Bàn phím Logitech K120', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:34:38', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY017', 'SKB019', '', '', 'Bàn phím DELL', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:35:10', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY018', 'SKB020', '', '', 'Bàn phím Logitech K120', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:36:06', '2017-03-29 12:36:47', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY019', 'SKB020', 'LO4515-001249', '', 'Bàn phím Logitech K120', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:37:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY020', 'SKB021', '', '', 'Bàn phím Dell', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:38:30', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY021', 'SKB022', '', '', 'Bàn phím Dell', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:39:02', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY022', 'SKB023', '', '', 'Bàn phím Dell', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:39:35', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY023', 'SKB024', '', '1449MG006AX8', 'Bàn phím Logitech', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:40:19', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY024', 'SKB025', '', '', 'Bàn phím Dell', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:41:03', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY025', 'SKB026', '', '', 'Bàn phím Dell', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:41:38', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY026', 'SKB027', '', '', 'Bàn phím Dell', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:42:08', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY027', 'SKB028', '', '', 'Bàn phím Microsoft', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:42:35', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY028', 'SKB029', '', '', 'Bàn phím Microsoft', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:43:19', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY029', 'SKB030', '', '', 'Bàn phím dell', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:43:52', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY030', 'SKB001', '', '', 'Bàn phím Mitsumi', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu trắng', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:44:27', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY031', 'SKB031', '', '', 'Bàn phím DELL', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Màu đen, DP/N: 0GVWNX', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:45:02', '2017-03-29 12:46:02', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('KEY032', 'SKB032', '', '', 'Bàn phím DELL', '', 'Unknow', 'KEY', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'KB212-B\nDP/N: 04G481,\nmàu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:45:50', '2017-03-29 12:46:17', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('LAP001', '', '', '4S3WX02', 'Laptop DELL 15.6 inch', '', 'Unknow', 'LAP', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màn hình 15.6 inch', 1, 0, '2011-01-31 00:00:00', 'Màu xám trắng', NULL, '2017-03-29 12:54:40', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('LAP002', '', '', '', 'Laptop DELL', '', 'Unknow', 'LAP', '2009-07-28 00:00:00', '2009-07-28 00:00:00', 0, NULL, 'Mã TSCĐ: MVT34, màu đen', 4, 0, '2009-07-31 00:00:00', 'Hỏng VGA', NULL, '2017-03-29 12:55:37', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('LAP003', '', '', 'EB10207315', 'Laptop LENOVO', '', 'Unknow', 'LAP', '2009-07-28 00:00:00', '2009-07-28 00:00:00', 0, 0, 'Mã TSCĐ: MVT33 (đủ phụ kiện)', 1, 0, '2009-07-31 00:00:00', 'Màu đen;\nHỏng VGA', NULL, '2017-03-29 12:56:15', '2017-03-29 12:57:57', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('LAP004', '', '', '', 'Laptop DELL trắng', '', 'Unknow', 'LAP', '2012-06-25 00:00:00', '2012-06-25 00:00:00', 0, NULL, 'Mã TSCĐ: MVT41', 1, 0, '2012-06-30 00:00:00', 'Màu trắng;\nHỏng bản lề màn hình', NULL, '2017-03-29 12:57:28', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('LAP005', '', '', 'SVT131A11W', 'Laptop Sony VAIO', '', 'Unknow', 'LAP', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Vẫn sử dụng được', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 12:58:50', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('LAP006', '', '', '6551384', 'Laptop LENOVO', '', 'Unknow', 'LAP', '2012-11-19 00:00:00', '2012-11-19 00:00:00', 0, NULL, 'Mã TSCĐ: MVT51(Laptop)', 1, 0, '2012-11-30 00:00:00', 'Màu đen', NULL, '2017-03-29 13:00:07', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('LAP007', '', '', '', 'Laptop MAC', '', 'Unknow', 'LAP', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Version Japan', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:00:39', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('LAP008', '', '', '', 'Laptop DELL', '', 'Unknow', 'LAP', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Mã TSCĐ: MVT61(Laptop)', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:01:27', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MCC001', '', '', '3000002229286', 'Máy chấm công vân tay', '', 'Unknow', 'TBVP-MCC', '2015-10-13 00:00:00', '2015-11-13 00:00:00', 0, NULL, 'Máy chấm công vân tay', 1, 1, '2015-11-30 00:00:00', 'Phòng hành chính', NULL, '2017-03-29 14:51:30', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MCW001', '', '', '', 'Lò vi sóng Sharp', '', 'Unknow', 'TBVP-MCW', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Lò vi sóng', 1, 0, '2011-03-31 00:00:00', 'Khu bếp', NULL, '2017-03-29 14:49:49', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MNT001', 'SMN001', '', '', 'Màn hình IBM', '', 'Unknow', 'MNT', '2007-06-15 00:00:00', '2007-06-15 00:00:00', 0, NULL, 'Mã TSCĐ: MVT21\nChi tiết: MN21', 1, 0, '2007-06-30 00:00:00', 'Màu đen', NULL, '2017-03-29 13:02:25', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR001', '', '', '', 'Màn hình DELL 21 inch', '', 'Unknow', 'MOR', '2013-01-14 00:00:00', '2013-01-14 00:00:00', 0, NULL, 'Chi tiết: MN58\nMã TSCĐ: MVT58', 5, 0, '2013-01-31 00:00:00', '', NULL, '2017-03-29 09:14:50', NULL, '2017-03-29 09:23:58', 1, NULL, NULL, NULL, NULL, NULL),
	('MOR002', '', '', '', 'Màn hình SAMSUNG 17 inch', '', 'Unknow', 'MOR', '2008-02-12 00:00:00', '2008-02-12 00:00:00', 0, NULL, 'Chi tiết: MN29; Mã TSCĐ: MVT29', 5, 0, '2008-02-29 00:00:00', '', NULL, '2017-03-29 09:19:28', NULL, '2017-03-29 09:23:58', 1, NULL, NULL, NULL, NULL, NULL),
	('MOR003', '', '', 'MPFRHYTBA01331V', 'Màn hình Samsung 17 inch', '', 'Unknow', 'MOR', '2011-11-15 00:00:00', '2011-11-15 00:00:00', 0, 0, 'Chi tiết: MN41; \nMã TSCĐ: MVT41', 1, 0, '2011-11-30 00:00:00', 'Màu đen', NULL, '2017-03-29 09:51:07', '2017-03-29 10:15:09', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR004', '', '', '', 'Màn hình DELL 21 inch', '', 'Unknow', 'MOR', '2012-10-15 00:00:00', '2012-10-15 00:00:00', 0, 0, 'Chi tiết: MN06', 1, 0, '2012-10-31 00:00:00', 'Màu đen', NULL, '2017-03-29 09:52:19', '2017-03-29 10:15:25', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR005', '', '', 'MQDMHYCC400008P', 'Màn hình SAMSUNG 21 inch', '', 'Unknow', 'MOR', '2012-05-28 00:00:00', '2012-05-28 00:00:00', 0, 0, 'Mã TSCĐ: MH03', 1, 0, '2012-05-31 00:00:00', 'Màu đen', NULL, '2017-03-29 09:53:02', '2017-03-29 10:15:35', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR006', '', '', 'ZZENH4LG800585V', 'Màn hình SAMSUNG 21.5 inch', '', 'Unknow', 'MOR', '2016-03-09 00:00:00', '2016-03-09 00:00:00', 0, 0, 'MOR0786-431-20160309, SS LED 21.5, LS22E310', 1, 0, '2016-03-31 00:00:00', 'Màu đen', NULL, '2017-03-29 09:53:56', '2017-03-29 10:15:47', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR007', '', '', '', 'Màn hình DELL 21 inch', '', 'Unknow', 'MOR', '2012-08-29 00:00:00', '2012-08-29 00:00:00', 0, 0, 'Chi tiết: MN47\nMã TSCĐ: MVT47', 1, 0, '2012-08-31 00:00:00', 'Màu đen', NULL, '2017-03-29 09:55:23', '2017-03-29 10:14:55', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR008', '', '', '', 'Màn hình DELL 21 inch', '', 'Unknow', 'MOR', '2008-08-30 00:00:00', '2008-08-30 00:00:00', 0, 0, 'Chi tiết: MN48\nMã TSCĐ: MVT48', 1, 0, '2008-08-31 00:00:00', 'Màu đen', NULL, '2017-03-29 09:56:00', '2017-03-29 10:14:44', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR009', '', '', '', 'Màn hình SAMSUNG 17 inch', '', 'Unknow', 'MOR', '2007-12-03 00:00:00', '2007-12-03 00:00:00', 0, NULL, 'Mã TSCĐ: MVT26\nChi tiết: MN26', 1, 0, '2007-12-31 00:00:00', 'màu đen', NULL, '2017-03-29 09:58:46', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR010', '', '', '', 'Màn hình DELL 21 inch', '', 'Unknow', 'MOR', '2012-11-21 00:00:00', '2012-11-21 00:00:00', 0, NULL, 'Mã TSCĐ: MVT53; Chi tiết: MN53', 1, 0, '2012-11-30 00:00:00', 'màu đen', NULL, '2017-03-29 09:59:42', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR011', '', '', '', 'Màn hình DELL 21 inch', '', 'Unknow', 'MOR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Mã TSCĐ: MH08', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:00:45', '2017-03-29 10:14:33', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR012', 'SMOR032', '', '', 'Màn hình DELL', '', 'Unknow', 'MOR', '2012-07-31 00:00:00', '2012-07-31 00:00:00', 0, 0, 'Mã chi tiết: MN49;\nMã TSCĐ: MVT43;\nKích thước: 21 inch', 1, 0, '2012-07-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:06:54', '2017-03-29 10:14:23', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR013', 'SMOR035', '', '', 'Màn hình DELL', '', 'Unknow', 'MOR', '2012-09-08 00:00:00', '2012-09-08 00:00:00', 0, 0, 'Mã chi tiết: MN46;\nMã TSCĐ: MVT46;\nKích thước 21 inch', 1, 0, '2012-09-30 00:00:00', 'màu đen', NULL, '2017-03-29 10:07:38', '2017-03-29 10:21:57', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR014', 'SMOR021', '', '', 'Màn hình DELL', '', 'Unknow', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, 0, 'Mã TSCĐ: MH15;\nKích thước 18 inch', 1, 0, '2015-12-31 00:00:00', 'màu đen', NULL, '2017-03-29 10:08:28', '2017-03-29 10:14:12', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR015', 'SMOR011', '', '', 'Màn hình DELL', '', 'Unknow', 'MOR', '2012-09-18 00:00:00', '2012-09-18 00:00:00', 0, 0, 'Mã TSCĐ: MH05;\nKích thước: 21 inch', 1, 0, '2012-09-30 00:00:00', 'màu đen', NULL, '2017-03-29 10:09:05', '2017-03-29 10:22:18', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR016', 'MOR0778', '', '', 'Màn hình SAMSUNG', '', 'Unknow', 'MOR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Kích thước 21 inch', 1, 0, '2011-01-31 00:00:00', 'màu đen', NULL, '2017-03-29 10:10:39', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR017', 'SMOR025', '', 'HA17HYDPB02101D', 'Màn hình SAMSUNG', '', 'Unknow', 'MOR', '2017-01-03 00:00:00', '2017-01-03 00:00:00', 0, 0, 'Mã TSCĐ: MVT27;\nKích thước 16 inch', 1, 0, '2017-01-31 00:00:00', 'màu đen', NULL, '2017-03-29 10:13:31', '2017-03-29 10:13:40', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR018', 'SMOR030', '', 'MPFRHYTBA00245A', 'Màn hình SAMSUNG', '', 'Unknow', 'MOR', '2017-01-03 00:00:00', '2017-01-03 00:00:00', 0, NULL, 'Mã chi tiết: MN40;\nMã TSCĐ: MVT40;\nKích thước 16 inch', 1, 0, '2017-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:16:57', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR019', 'SMOR016', '', '', 'Màn hình DELL', '', 'Unknow', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, NULL, 'Mã TSCĐ: MH10;\nKích thước 21 inch', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:18:03', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR020', 'SMOR003', '', 'HA17HMDL603365L', 'Màn hình SAMSUNG', '', 'Unknow', 'MOR', '2015-12-03 00:00:00', '2015-12-03 00:00:00', 0, NULL, 'Mã TSCĐ: MVT25;\nKích thước 16 inch', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:19:21', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR021', 'SMOR028', '', 'MPFRHYTBA01286E', 'Màn hình SAMSUNG', '', 'Unknow', 'MOR', '2011-11-15 00:00:00', '2011-11-15 00:00:00', 0, 0, 'Mã chi tiết: MN38;\nMã TSCĐ: MVT38;\nKích thước 16 inch', 1, 0, '2011-11-30 00:00:00', 'Màu đen', NULL, '2017-03-29 10:23:42', '2017-03-29 10:23:56', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR022', 'SMOR013', '', '', 'Màn hình DELL', '', 'Unknow', 'MOR', '2012-12-15 00:00:00', '2012-12-15 00:00:00', 0, NULL, 'Mã TSCĐ: MH07;\nKích thước 16 inch', 1, 0, '2012-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:24:47', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR023', 'SMOR027', '', 'MS57239C5160046', 'Màn hình CMS', '', 'Unknow', 'MOR', '2008-02-12 00:00:00', '2008-02-12 00:00:00', 0, 0, 'Mã chi tiết: MN30;\nMã TSCĐ: MVT30;\nKích thước 16 inch', 1, 0, '2008-02-29 00:00:00', 'Màu đen', NULL, '2017-03-29 10:25:34', '2017-03-29 10:25:44', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR024', 'SMOR004', '', 'MPFRHYCC201260M', 'Màn hình SAMSUNG', '', 'Unknow', 'MOR', '2012-02-23 00:00:00', '2012-02-23 00:00:00', 0, NULL, 'Mã TSCĐ: MN43;\nKích thước 16 inch', 1, 0, '2012-02-29 00:00:00', 'Màu đen', NULL, '2017-03-29 10:26:43', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR025', 'SMOR005', '', 'MPFRHYCC201523K', 'Màn hình SAMSUNG', '', 'Unknow', 'MOR', '2012-02-23 00:00:00', '2012-02-23 00:00:00', 0, 0, 'Mã TSCĐ: MN44;\nKích thước 16 inch', 1, 0, '2012-02-29 00:00:00', 'Màu đen', NULL, '2017-03-29 10:27:35', '2017-03-29 10:29:56', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR026', 'SMOR010', '', '50641E23V300R(B)ZL', 'Màn hình Dell', '', 'Unknow', 'MOR', '2012-09-18 00:00:00', '2012-09-18 00:00:00', 0, NULL, 'Mã TSCĐ:MH04;\nKích thước 21.5 inch', 1, 0, '2012-09-30 00:00:00', 'Màu đen', NULL, '2017-03-29 10:28:30', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR027', 'SMOR040', '', '', 'Màn hình Dell', '', 'Unknow', 'MOR', '2012-11-21 00:00:00', '2012-11-21 00:00:00', 0, NULL, 'Mã TSCĐ: MVT54;\nKích thước: 21.5 inch', 1, 0, '2012-11-30 00:00:00', 'Màu đen', NULL, '2017-03-29 10:29:42', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR028', 'MOR0784', '', 'ZZENH4LG700424U', 'Màn hình Sam Sung', '', 'Unknow', 'MOR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Kích thước 21 inch', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:34:14', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR029', 'SMOR031', '', '', 'Màn hình Dell', '', 'Unknow', 'MOR', '2012-06-28 00:00:00', '2012-06-28 00:00:00', 0, NULL, 'Mã TSCĐ: MVT42;\nKích thước 21 inch', 1, 0, '2012-06-30 00:00:00', 'Màu đen', NULL, '2017-03-29 10:35:18', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR030', 'SMOR041', '', '', 'Màn hình Dell', '', 'Unknow', 'MOR', '2012-12-03 00:00:00', '2012-12-03 00:00:00', 0, NULL, 'Mã TSCĐ: MVT55;\nKích thước 21 inch', 1, 0, '2012-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:36:05', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR031', 'SMOR007', '', 'MQDMHYCC200058W', 'Màn hình Sam Sung', '', 'Unknow', 'MOR', '2012-05-14 00:00:00', '2012-05-14 00:00:00', 0, NULL, 'Mã TSCĐ: MH01\nKích thước 21 inch', 1, 0, '2012-05-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:37:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR032', 'SMOR008', '', 'MQDMHYCC400040A', 'Màn hình Sam Sung', '', 'Unknow', 'MOR', '2012-05-28 00:00:00', '2012-05-28 00:00:00', 0, NULL, 'Mã TSCĐ: MH02;\nKích thước 21 inch', 1, 0, '2012-05-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:38:17', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR033', 'SMOR045', '', '', 'Màn hình Dell', '', 'Unknow', 'MOR', '2013-01-14 00:00:00', '2013-01-14 00:00:00', 0, NULL, 'Mã TSCĐ: MVT59;\nKích thước 21 inch', 1, 0, '2013-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:39:01', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR034', 'MOR0788', '', 'ZZENH4LG700474V', 'Màn hình Sam Sung', '', 'Unknow', 'MOR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Kích thước 21 inch', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:40:07', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR035', 'SMOR029', '', 'MPFRHYTBA01244B', 'Màn hình Sam Sung', '', 'Unknow', 'MOR', '2011-11-15 00:00:00', '2011-11-15 00:00:00', 0, NULL, 'Mã TSCĐ: MVT39;\nKích thước 17 inch', 1, 0, '2011-11-30 00:00:00', 'Màu đen', NULL, '2017-03-29 10:40:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR036', 'SMOR043', '', '', 'Màn hình Dell', '', 'Unknow', 'MOR', '2012-12-08 00:00:00', '2012-12-08 00:00:00', 0, NULL, 'Mã TSCĐ: MVT57;\nKích thước 21 inch', 1, 0, '2012-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:42:14', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR037', 'SMOR042', '', '', 'Màn hình Dell', '', 'Unknow', 'MOR', '2012-12-03 00:00:00', '2012-12-03 00:00:00', 0, NULL, 'Mã TSCĐ: MVT56;\nKích thước 21 inch', 1, 0, '2012-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:43:10', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR038', 'SMOR033', '', '', 'Màn hình Dell', '', 'Unknow', 'MOR', '2012-08-02 00:00:00', '2012-08-02 00:00:00', 0, NULL, 'Mã TSCĐ: MVT44\nKích thước 21 inch', 1, 0, '2012-08-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:43:50', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR039', 'SMOR038', '', '', 'Màn hình dell', '', 'Unknow', 'MOR', '2012-11-21 00:00:00', '2012-11-21 00:00:00', 0, NULL, 'Mã TSCĐ: MVT52;\nKích thước 21 inch', 1, 0, '2012-11-30 00:00:00', 'Màu đen', NULL, '2017-03-29 10:44:37', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR040', 'SMOR034', '', '', 'Màn hình Dell', '', 'Unknow', 'MOR', '2012-08-03 00:00:00', '2012-08-03 00:00:00', 0, NULL, 'Mã TSCĐ: MVT45;\nKích thước 21 inch', 1, 0, '2012-08-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:45:26', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR041', 'MOR0772', '', 'ZZENH4LG800275M', 'Màn hình SAMSUNG 22 inch', '', 'Unknow', 'MOR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Model: S22E310HY', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:47:09', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR042', 'MOR0781', '', 'ZZENH4LG700012', 'Màn hình SAMSUNG', '', 'Unknow', 'MOR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Kích thước 22 inch;\nModel: S22E310HY', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:48:12', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR043', 'SMOR020', '', '', 'Màn hình DELL 19.5 inch', '', 'Cty cổ phần Thế giới số', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, 0, 'Mã TSCĐ: MH14;\nModel: E2016H', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:49:21', '2017-03-29 10:56:50', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR044', 'SMOR018', '', '', 'Màn hình DELL 19.5 inch', '', 'Unknow', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, NULL, 'Mã TSCĐ: MH12;\nKích thước: 13x34x54', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:56:43', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR045', 'SMOR019', '', '', 'Màn hình DELL 19.5 inch', '', 'Unknow', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, NULL, 'Kích thước 19.5 inch', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:57:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR046', 'SMOR022', '', '', 'Màn hình DELL 19.5 inch', '', 'Unknow', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, 0, 'Kích thước 19.5 inch', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:58:52', '2017-03-29 11:00:00', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR047', 'SMOR023', '', '', 'Màn hình DELL 19.5 inch', '', 'Unknow', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, NULL, 'Kích thước 19.5 inch', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 10:59:51', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR048', 'SMOR017', '', '', 'Màn hình DELL 19.5 inch', '', 'Unknow', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, NULL, 'Kích thước 19.5 inch', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:00:41', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR049', 'SMOR015', '', '', 'Màn hình DELL 19.5 inch', '', 'Unknow', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, NULL, 'Kích thước 19.5 inch', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:01:25', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR050', 'SMOR024', '', '', 'Màn hình DELL 19.5 inch', '', 'Unknow', 'MOR', '2015-12-14 00:00:00', '2015-12-14 00:00:00', 0, NULL, 'Kích thước 19.5 inch', 1, 0, '2015-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:02:19', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR051', 'MOR0771', '', '22ENH4LG701023L', 'Màn hình SAMSUNG 22 inch', '', 'Unknow', 'MOR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Kích thước 22 inch;\nModel: S22E310HY', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:05:27', '2017-03-29 11:06:40', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MOR052', 'MOR0795', '', '', 'Màn hình SAMSUNG 22 inch', '', 'Unknow', 'MOR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Kích thước 22 inch;\nModel: S22E310HY', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:06:09', '2017-03-29 11:06:30', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC001', '', '', '11D3V-73826-583-D9Z5', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-01-31 00:00:00', '2011-01-31 00:00:00', 0, NULL, 'Unknow', 1, 0, '2011-01-31 00:00:00', 'Cấp cho TâmNM', NULL, '2017-03-29 14:08:49', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC002', '', '', 'P/N:X821908-003', 'Chuột Microsoft trắng', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Chuột MI trắng', 1, 0, '2011-03-31 00:00:00', 'Hường PT', NULL, '2017-03-29 14:11:31', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC003', '', '', 'P/N:X821908-003', 'Chuột Logitech', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, 0, 'Màu trắng', 1, 0, '2011-03-31 00:00:00', 'DịuDT', NULL, '2017-03-29 14:16:48', '2017-03-29 14:18:09', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC004', '', '', '1418HS00P1F8', 'Chuột Logitech', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nBarcode: L032414-006208\nPN: 810-002149', 1, 0, '2011-03-31 00:00:00', 'LanNT', NULL, '2017-03-29 14:17:53', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC005', '', '', '', 'Chuột Microsoft', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Trắng\nBC: 91705-523-1147762-31522\nPN: X821908-003', 1, 0, '2011-03-31 00:00:00', 'ChâuNM', NULL, '2017-03-29 14:19:11', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC006', '', '', '', 'Chuột Microsoft', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Trắng\nPN: X821908-003\nBC: 91705-5231146727-31522', 1, 0, '2011-03-31 00:00:00', 'Liên NTK', NULL, '2017-03-29 14:20:00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC007', '', '', 'X821908-003', 'Chuột Microsoft', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Trắng\nModel: P58-00066', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:21:00', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC008', '', '', '1325HS073EY8', 'Chuột Logitech', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nBC: 2013101759', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:22:01', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC009', '', '', 'X820471-002', 'Chuột Microsoft', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nBC: X820471-002', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:23:05', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC010', '', '', '1452HS025P28', 'Chuột Logitect', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nBC: L09515-004895', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:24:09', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC011', '', '', '9RRC7-48723-2A0-OELY', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nCN-09RRC7-48723-2A0-0ELY', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:25:11', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC012', '', '', '9RRC7-48723-22M-02R9', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nCN-09RRC7-48723-22M-02R9', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:25:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC013', '', '', 'KW2YH-71616-278-0EZ5', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nOKW2YH-71616-278-0EZ5', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:26:46', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC014', '', '', '', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:27:36', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC015', '', '', '', 'Chuột Logitech', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nBC: LO9515-004-899', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:28:30', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC016', '', '', '91705-492-4280914-01', 'Chuột Microsoft', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '91705-492-4280914-01026\nProduct-number: XB20471-002', 1, 0, '2011-03-31 00:00:00', '', NULL, '2017-03-29 14:29:19', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC017', '', '', 'CN-OKW2YH-71616-27P-', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'CN-OKW2YH-71616-27P-0F1F', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:29:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC018', '', '', 'CN-09RRC7-46729-569-', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'CN-09RRC7-46729-569-0VR3', 1, 0, '2011-03-31 00:00:00', 'Hết bảo hành', NULL, '2017-03-29 14:30:38', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC019', '', '', 'CN-011D3V-71581-21G-', 'Chuột DELL', '', 'UNknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'CN-011D3V-71581-21G-2JBV', 1, 0, '2011-03-31 00:00:00', 'Hết bảo hành', NULL, '2017-03-29 14:31:19', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC020', '', '', '', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'CN-09RRC7-48729-56J-042R', 1, 0, '2011-03-31 00:00:00', 'SơnNV', NULL, '2017-03-29 14:32:31', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC021', '', '', 'L0915-004892', 'Chuột Logitect', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nL0915-004892', 1, 0, '2011-03-31 00:00:00', 'ThangNB', NULL, '2017-03-29 14:33:16', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC022', '', '', '', 'Chuột DELL', '', 'UNknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nCN-09RRC7-848729-569-OUNP', 1, 0, '2011-03-31 00:00:00', 'TrungNC', NULL, '2017-03-29 14:33:55', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC023', '', '', '', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'CN-011D3V-71581-21G-2IP7', 1, 0, '2011-03-31 00:00:00', 'TùngVT', NULL, '2017-03-29 14:34:36', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC024', '', '', '', 'CHuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'CN-OKW2YH-71616-27P-OFOV', 1, 0, '2011-03-31 00:00:00', 'GiangDT', NULL, '2017-03-29 14:35:23', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC025', '', '', '', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'CN-09RRC7-48729-56S-OKBU', 1, 0, '2011-03-31 00:00:00', 'LinhTTM', NULL, '2017-03-29 14:36:04', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC026', '', '', '', 'Chuột Logitect', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '1452HS025NX8', 1, 0, '2011-03-31 00:00:00', 'PhươngDT', NULL, '2017-03-29 14:36:46', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC027', '', '', '', 'Chuột Logitect', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '1452HS025P38', 1, 0, '2011-03-31 00:00:00', 'VânNT', NULL, '2017-03-29 14:37:26', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC028', '', '', '', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'CN-09RRC7-48729-56T-0CA2', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:38:23', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC029', '', '', '', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'LCS615-004894', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:38:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC030', '', '', '', 'Chuột IBM', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Chuột IBM', 1, 0, '2011-03-31 00:00:00', 'Phòng Server', NULL, '2017-03-29 14:39:37', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC031', '', '', '', 'Chuột Microsoft', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Phòng SV', 1, 0, '2011-03-31 00:00:00', '', NULL, '2017-03-29 14:40:18', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC032', '', '', '', 'Chuột Microsoft', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Trắng\nP/N: X821908-003\nPID: 91705-523-1146871-31522', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:40:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('MSC033', '', '', '', 'Chuột DELL', '', 'Unknow', 'MSC', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Đen\nPID: CN-09RRC7-48729-56B-071H', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 14:41:29', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('ORR001', '', '', '', 'Divoom', '', 'Unnkow', 'TBNV-ORR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:49:27', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('PRJ001', '', '', 'SC6330040R', 'Máy chiếu Panasonic', '', 'Unknow', 'TBVP-PRJ', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'MN: PT-LB50EA', 1, 0, '2011-03-31 00:00:00', 'Phòng SV', NULL, '2017-03-29 14:45:26', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('PRT001', '', '', 'CNMKP28366', 'Máy in HP laser Jet 1320n', '', 'Unknow', 'TBVP-PRT', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Máy in 2 mặt đen trắng', 1, 0, '2011-03-31 00:00:00', 'Phòng hành chính', NULL, '2017-03-29 14:46:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('PRT002', '', '', 'CNHZ95LHFF', 'Máy in HP-laser Jet M1319f MFP', '', 'Unknow', 'TBVP-PRT', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Máy in 1 mặt đen trắn', 1, 0, '2011-03-31 00:00:00', 'Phòng hành chính', NULL, '2017-03-29 14:49:14', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM001', '', 'NDCF01C7T048', '', 'Ram Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, '256Mb', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:06:25', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM002', '', '', '', 'Ram', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Dung lượng: 512MB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:07:08', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM003', '', '', '', 'Ram', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR-3\nDung lượng: 256MB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:09:28', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM004', '', '', '', 'Ram DDR-3', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR-3\nDung lượng: 256MB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:11:26', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM005', '', '', '', 'Ram', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Dung lượng: 512MB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:12:02', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM006', '', '', '', 'Ram', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Dung lượng:: 512MB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:12:38', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM007', '', '', '', 'Ram DDR3', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR3\nDung lượng: 4GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:13:13', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM008', '', '4711148599610', '', 'Ram Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR3-1600\nDung lượng: 2GB\nHãng sản xuất: Kingston', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:14:08', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM009', '', 'KT0004L11T15', '', 'Ram Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR3\nDung lượng: 2GB\nHãng sản xuất: Kingston', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:14:44', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM010', '', 'KT0004C11T180', '', 'Ram Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB\nHãng sản xuất: Kingston', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:15:13', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM011', '', 'KT0004L11T04', '', 'Ram DDR3', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR3\nDung lượng: 2GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:16:17', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM012', '', '20120903260', '', 'Ram Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:16:47', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM013', '', '20120903216', '', 'Ram DDR2 Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:17:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM014', '', '20120901339', '', 'Ram DDR2 Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:18:15', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM015', '', 'K1N7HKHYC57638801216', '', 'Ram DDR3 Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR3\nDung lượng: 2GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:18:52', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM016', '', 'M378B5173QH0-CK0', '', 'Ram DDR3 Samsung', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR3\nDung lượng: 4GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:19:32', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM017', '', '20120601582', '', 'Ram DDR2 Samsung', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:20:14', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM018', '', 'KT0004V12I08', '', 'Ram DDR2 Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:21:54', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM019', '', '153526003192187', '', 'Ram DDR3 GSKill', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR3\nDung lượng: 4GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:24:02', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM020', '', '', '', 'Ram DDR3 HYNIX', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR3\nDung lượng: 2GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:24:39', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('RAM021', '', '10111200265', '', 'Ram DDR2 Kingston', '', 'Unknow', 'RAM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:25:28', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SCMR001', '', '', '1009HR040126', 'Hộp điều khiển Camera', '', 'Unknow', 'CMR', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Mã: 192.168.0.242-2F\nMàu: Đen\nModel: HR16\nNhà sản xuất: Tibet System Co., Ltd\ninput: AC100-240V, 50/60HZ', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:47:50', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SCPT032', 'SCRT004', '', '', 'Case máy tính dự án', '', 'Unknow', 'CPT', '2011-03-10 00:00:00', '2011-03-10 00:00:00', 0, NULL, 'Mã TSCĐ: MVT33;\nChi tiết: CPU33', 1, 0, '2011-03-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:37:33', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SCPT033', 'SCRT024', '', '', 'Case máy tính cửa từ', '', 'Unknow', 'CPT', '2012-12-03 00:00:00', '2012-12-03 00:00:00', 0, NULL, 'Mã TSCĐ: MVT56; \nChi tiết: CPU56; \nMua ở Hà Nội', 1, 0, '2012-12-31 00:00:00', 'Màu đen', NULL, '2017-03-29 11:38:31', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SCPT034', 'SMACM001', '', 'C07G5V8MDJDO', 'Case Mac Mini', '', 'Unknow', 'CPT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Case Mac mini\nDetail: 2.3/2X1GB/500/API', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 11:39:50', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SHDD001', 'SHDDIBM001', '', '1S44W223499GLAQ7', 'Ổ cứng IBM', '', 'Unknow', 'HDD', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Dung lượng: 300GB', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 12:53:25', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SHR001', '', '', '', 'Máy hủy tài liệu Primo', '', 'Unknow', 'TBVP-SHR', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Trạng thái tốt', 1, 0, '2011-03-31 00:00:00', 'Phòng hành chính', NULL, '2017-03-29 14:47:42', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SMIC001', 'SSPK001', '', '', 'Micro Phone', '', 'Unknow', 'TBNV-MIC', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu trắng', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:53:35', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SMOR001', '', '', '', 'Màn hình Samsung 17 inch', '', 'Unknow', 'MOR', '2011-11-15 00:00:00', '2011-11-15 00:00:00', 0, NULL, 'Chi tiết: MN41;\nMã TSCĐ: MVT41', 5, 0, '2011-11-30 00:00:00', '', NULL, '2017-03-29 09:23:07', NULL, '2017-03-29 09:23:58', 1, NULL, NULL, NULL, NULL, NULL),
	('SMOR002', '', '', '', 'Màn hình SAMSUNG 17 inch', '', 'Unknow', 'MOR', '2008-02-12 00:00:00', '2008-02-12 00:00:00', 0, NULL, 'Chi tiết: MN29;\nMã TSCĐ: MVT29', 5, 0, '2008-02-29 00:00:00', '', NULL, '2017-03-29 09:22:17', NULL, '2017-03-29 09:23:58', 1, NULL, NULL, NULL, NULL, NULL),
	('SMOR044', '', '', '', 'Màn hình DELL 21 inch', '', 'Unknow', 'MOR', '2013-01-14 00:00:00', '2013-01-14 00:00:00', 0, NULL, 'Chi tiết: MN58;\nMã TSCĐ: MVT58', 5, 0, '2013-01-31 00:00:00', '', NULL, '2017-03-29 09:20:57', NULL, '2017-03-29 09:23:58', 1, NULL, NULL, NULL, NULL, NULL),
	('SPK001', '', '', '131207B001416', 'Loa VOIP CONFERENCE STATION', '', 'Unknow', 'TBNV-SPK', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Model: CDCA-01IP', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 13:51:05', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SPRJ002', '', '', 'TBM133001023', 'Máy chiếu', '', 'Unknow', 'TBVP-PRJ', '2013-12-02 00:00:00', '2014-01-02 00:00:00', 0, NULL, 'Màu: Đen\nMã TSCĐ: MC02\nNgày mua: 2/12/2013', 1, 1, '2014-01-31 00:00:00', 'Phòng Server', NULL, '2017-03-29 14:52:26', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SRM002', '', '', '', 'Điều khiển điều hòa', '', 'Unknow', 'SRM', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Số lượng: 1', 1, 0, '2011-03-31 00:00:00', 'Phòng SV', NULL, '2017-03-29 15:00:17', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSRM001', 'SRM001', '', '', 'Điều khiển điều hòa Daikin', '', 'Unknow', 'SRM', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Nhãn hiệu: Daikin\nMàu: Trắng', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:52:56', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT002', 'SWFL001', '', '', 'Modem', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Modem', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:35:46', '2017-03-29 13:38:54', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT003', 'SSW001', '', 'TL-SL3452', 'TPLink 52 cổng', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Thiết bị chia cổng mạng.\nSố lượng cổng: 52', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 13:36:21', '2017-03-29 13:39:02', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT004', 'PCC001', '', '', 'Thiết bị chia nhánh màn hình', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Thiết bị chia nhánh hiển thị màn hình trong phòng Server', 1, 0, '2011-01-31 00:00:00', 'Màu xám', NULL, '2017-03-29 13:37:21', '2017-03-29 13:39:14', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT005', 'TPL001', '', '', 'Switch chia mạng', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'TPLink trắng', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:38:05', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT006', 'TPL002', '', '', 'Switch chia mạng', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'IP 10.0.0.100:9999', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:39:54', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT007', 'DLK001', '', '', 'Switch chia mạng DLink', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Nhãn hiệu: Dlink', 1, 0, '2011-01-31 00:00:00', 'Màu: Đen', NULL, '2017-03-29 13:40:31', '2017-03-29 13:41:32', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT008', 'TPL003', 'D85D4CA68844', '', 'Switch chia mạng', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Model No: TD-8840T', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:41:19', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT009', 'TPl004', '', '', 'Switch chia mạng 5 cổng', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Model No: TL-SF1005D\n5 Cổng', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:42:14', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT010', 'SFW001', '', '', 'Adapter Cisco', '', 'Unknow', 'SWT', '2009-10-29 00:00:00', '2009-10-29 00:00:00', 0, NULL, 'Ngày mua: 29/10/2009\n8 Cổng', 1, 0, '2009-10-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:42:52', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT011', 'DLK002', '', 'F306273017761', 'Switch chia mạng Dlink', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, '16 cổng', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 13:43:45', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT012', 'DLK003', '', 'F30H477005568', 'Switch chia mạng DLink', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Dlink\n16 cổng', 1, 0, '2011-01-31 00:00:00', 'Màu đen', NULL, '2017-03-29 13:44:44', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT013', 'SSWITCH16', 'INS160011056C00160', '', 'Switch', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, '16 cổng', 1, 0, '2011-01-31 00:00:00', 'Màu đen. Chưa rõ tình trạng', NULL, '2017-03-29 13:45:40', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SSWT014', '', '', '11176423843', 'TPLink 4 cổng', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Model: TL-SF1005D', 5, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:46:14', NULL, '2017-03-29 15:19:28', 1, NULL, NULL, NULL, NULL, NULL),
	('SWBC002', '', '', 'AN120300421', 'Thiết bị thu hình Sanwa', '', 'Unknow', 'TBNV-WBC', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Hãng sản xuất: Sanwa\nMàu: Đen', 1, 0, '2011-01-31 00:00:00', 'Chưa rõ tình trạng', NULL, '2017-03-29 13:54:58', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SWT001', '', '', 'INS800N11064CO1092', 'INFOSMART', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'model: INS800N, 8 port', 1, 0, '2011-01-31 00:00:00', 'Màu trắng. Chưa rõ nguyên nhân hỏng', NULL, '2017-03-29 13:34:35', '2017-03-29 13:38:36', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('SWT014', '', '', '11176423843', 'TPLink 4 cổng', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, 0, 'Model: TL-SF1005D', 1, 0, '2011-01-31 00:00:00', 'Màu trắng', NULL, '2017-03-29 13:48:02', '2017-03-29 13:48:19', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('TIV001', '', '', '', 'Tivi Sony 43"', '', 'Unknow', 'TBVP-TIV', '2016-11-01 00:00:00', '2017-01-01 00:00:00', 0, NULL, '\'- 1 điều khiển\nModel: KDL-43W 7500', 1, 2, '2017-01-31 00:00:00', 'Phòng họp', NULL, '2017-03-29 14:59:01', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('TIV002', '', '', '', 'Tivi Sony 40"', '', 'Unknow', 'TBVP-TIV', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Unknow', 1, 0, '2011-03-31 00:00:00', 'Phòng hành chính', NULL, '2017-03-29 14:59:40', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS001', '', '', '21212010201000714', 'Bộ lưu điện Santak', '', 'Uknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Unknow', 1, 0, '2011-03-31 00:00:00', 'TâmNM', NULL, '2017-03-29 15:01:21', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS002', '', '', '21211011701001020', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Unknow', 1, 0, '2011-03-31 00:00:00', 'DịuDT', NULL, '2017-03-29 15:02:07', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS003', '', '', '21206011701000385', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, 0, 'Unknow', 1, 0, '2011-03-31 00:00:00', 'LanNT', NULL, '2017-03-29 15:03:00', '2017-03-29 15:03:56', NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS004', '', '', '21211011701001023', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Unknow', 1, 0, '2011-03-31 00:00:00', 'ChâuNM', NULL, '2017-03-29 15:03:46', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS005', '', '', '21206010201002692', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Unknow', 1, 0, '2011-03-31 00:00:00', 'LiênNTK', NULL, '2017-03-29 15:04:31', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS006', '', '', '21211010201005073', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Unknow', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 15:05:25', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS007', '', '', '21206010201002697', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Unknow', 1, 0, '2011-03-31 00:00:00', 'HườngPT', NULL, '2017-03-29 15:06:24', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS008', '', '', '', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2017-10-14 00:00:00', '2018-10-14 00:00:00', 0, NULL, 'Barcode: 21510010201013310\nHạn BH: 14/10/2018', 1, 12, '2018-10-31 00:00:00', 'Vương', NULL, '2017-03-29 15:07:34', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS009', '', '', '', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Barcode: 21209010201001417\nHết bảo hành', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 15:08:11', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS010', '', '', '', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Barcode 21211010201004409\nHết bảo hành', 1, 0, '2011-03-31 00:00:00', 'KiênNT', NULL, '2017-03-29 15:09:01', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS011', '', '21211010201004967', '', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Barcode: 21211010201004967\nHết bảo hành', 1, 0, '2011-03-31 00:00:00', 'NghĩaDT', NULL, '2017-03-29 15:09:42', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS012', '', '', '\'21206011701000600', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'unknow', 1, 0, '2011-03-31 00:00:00', 'SơnNV', NULL, '2017-03-29 15:10:25', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS013', '', '', '120704601403469400-4', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Serial: 120704601403469400-4200401', 1, 0, '2011-03-31 00:00:00', 'ThangNB', NULL, '2017-03-29 15:11:12', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS014', '', '', '150630-902501529400-', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '150630-902501529400-42004-01', 1, 0, '2011-03-31 00:00:00', 'TrungNC', NULL, '2017-03-29 15:11:39', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS015', '', '', '150630-902605169400-', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '150630-902605169400-12004-01', 1, 0, '2011-03-31 00:00:00', 'TùngVT', NULL, '2017-03-29 15:12:47', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS016', '', '', '2120611701000100', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2017-03-31 00:00:00', '2017-03-31 00:00:00', 0, NULL, '2120611701000100', 1, 0, '2017-03-31 00:00:00', 'GiangDT', NULL, '2017-03-29 15:13:29', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS017', '', '', '120508-181202839400-', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '120508-181202839400-42004-01', 1, 0, '2011-03-31 00:00:00', 'LinhTTM', NULL, '2017-03-29 15:14:02', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS018', '', '', '120905-457100789400-', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '120905-457100789400-42004-01', 1, 0, '2011-03-31 00:00:00', 'PhươngDT', NULL, '2017-03-29 15:14:43', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS019', '', '', '21108010201001718', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '21108010201001718', 1, 0, '2011-03-31 00:00:00', 'VânNT', NULL, '2017-03-29 15:15:19', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS020', '', '', '11107010201006791', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '11107010201006791', 1, 0, '2011-03-31 00:00:00', 'Hỏng', NULL, '2017-03-29 15:15:52', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS021', '', '', '21206010201002594', 'Bộ lưu điện Santak', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, '21206010201002594', 1, 0, '2011-03-31 00:00:00', 'Chưa sử dụng', NULL, '2017-03-29 15:16:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('UPS022', '', '', '', 'Bộ lưu điện Santak Online 2KVA', '', 'Unknow', 'UPS', '2011-03-31 00:00:00', '2011-03-31 00:00:00', 0, NULL, 'Bộ lưu điện cho máy Server.\nModel: C2K, Input 220VAC, 50A', 1, 0, '2011-03-31 00:00:00', 'Phòng Server', NULL, '2017-03-29 15:17:22', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL),
	('WBC001', '', '', '', 'Webcam', '', 'Unknow', 'TBNV-WBC', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Màu đen', 1, 0, '2011-01-31 00:00:00', '', NULL, '2017-03-29 13:50:23', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `hardwares` ENABLE KEYS */;

-- Dumping structure for table asset.hardware_management
CREATE TABLE IF NOT EXISTS `hardware_management` (
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
  KEY `fk_users` (`user_id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_hardwares` FOREIGN KEY (`hardware_id`) REFERENCES `hardwares` (`hardware_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.hardware_management: ~0 rows (approximately)
/*!40000 ALTER TABLE `hardware_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `hardware_management` ENABLE KEYS */;

-- Dumping structure for procedure asset.hasGroupRole
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `hasGroupRole`(group_id INT(4), role_id INT(4))
BEGIN
	SELECT groups_roles.id FROM groups_roles
	WHERE groups_roles.group_id = group_id AND groups_roles.role_id = role_id;
END//
DELIMITER ;

-- Dumping structure for procedure asset.insertToRequest
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `insertToRequest`(hardwareId VARCHAR(10), hardwareIdLu VARCHAR(10), 
		hwBarcode VARCHAR(50), hwSerial VARCHAR(50), hardware_name VARCHAR(255) CHARSET UTF8, 
		hwOs VARCHAR(50), hwSupplier VARCHAR(255) CHARSET UTF8, categoryId VARCHAR(10), buyDate DATETIME, 
        warantyDate DATETIME, hwPrice INT(11), productionId TINYINT(4), hwDescription TEXT CHARSET UTF8,
        rqStatus TINYINT, userId INT(11), depreciatedMonths TINYINT(4), expiredDate DATETIME, requestedBy INT(11),
        alreAt DATETIME, hwNote TEXT CHARSET UTF8, rqNote TEXT CHARSET UTF8, hwCreatedAt DATETIME,
        hwUpdatedAt DATETIME, hwDeletedAt DATETIME, hwDeletedFlag TINYINT, createdAt DATETIME)
BEGIN 
INSERT INTO requests(hardware_id, hardware_id_lu, barcode, serial, hardware_name, 
			os, supplier, category_id, buy_date, waranty_date, price, production_id, description, 
			status, user_id, depreciated_months, expired_date, allocated_retrieved_at, hw_note,
            request_note, hw_created_at, hw_updated_at, hw_deleted_at, hw_deleted_flag, requested_by, created_at)
VALUES (hardwareId, hardwareIdLu, hwBarcode, hwSerial, hardware_name, 
		hwOs, hwSupplier, categoryId, buyDate, warantyDate, hwPrice, productionId, hwDescription,
        rqStatus, userId, depreciatedMonths, expiredDate, alreAt, hwNote, rqNote, hwCreatedAt,
        hwUpdatedAt, hwDeletedAt, hwDeletedFlag, requestedBy, createdAt);
END//
DELIMITER ;

-- Dumping structure for procedure asset.isCategoryExisted
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `isCategoryExisted`(categoryId VARCHAR(10))
BEGIN
	SELECT deleted_flag as flag FROM categories 
	WHERE categories.category_id = categoryId;
END//
DELIMITER ;

-- Dumping structure for procedure asset.isPendingHardware
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `isPendingHardware`(hw_id VARCHAR(10))
BEGIN
	SELECT COUNT(requests.request_id) as num FROM requests
	WHERE requests.hardware_id = hw_id AND requests.request_status = '0';
END//
DELIMITER ;

-- Dumping structure for table asset.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hardware_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `log_time` datetime DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
REPLACE INTO `logs` (`username`, `hardware_id`, `log_time`, `content`) VALUES
	('giangdt', 'MOR001', '2017-03-29 09:14:50', 'Thêm mới thiết bị\n Mã thiết bị: MOR001\nTên thiết bị: Màn hình DELL 21 inch\nNgày thêm: 2017-3-29 9:14:50\nNgười thêm: giangdt'),
	('giangdt', 'MOR002', '2017-03-29 09:19:28', 'Thêm mới thiết bị\n Mã thiết bị: MOR002\nTên thiết bị: Màn hình SAMSUNG 17 inch\nNgày thêm: 2017-3-29 9:19:28\nNgười thêm: giangdt'),
	('giangdt', 'SMOR044', '2017-03-29 09:20:57', 'Thêm mới thiết bị\n Mã thiết bị: SMOR044\nTên thiết bị: Màn hình DELL 21 inch\nNgày thêm: 2017-3-29 9:20:57\nNgười thêm: giangdt'),
	('giangdt', 'SMOR002', '2017-03-29 09:22:17', 'Thêm mới thiết bị\n Mã thiết bị: SMOR002\nTên thiết bị: Màn hình SAMSUNG 17 inch\nNgày thêm: 2017-3-29 9:22:17\nNgười thêm: giangdt'),
	('giangdt', 'SMOR001', '2017-03-29 09:23:07', 'Thêm mới thiết bị\n Mã thiết bị: SMOR001\nTên thiết bị: Màn hình Samsung 17 inch\nNgày thêm: 2017-3-29 9:23:7\nNgười thêm: giangdt'),
	('giangdt', 'SMOR001', '2017-03-29 09:23:58', 'Xóa tài sản có mã SMOR001. Duyệt bởi giangdt vào lúc 2017-3-29 9:23:58'),
	('giangdt', 'SMOR002', '2017-03-29 09:23:58', 'Xóa tài sản có mã SMOR002. Duyệt bởi giangdt vào lúc 2017-3-29 9:23:58'),
	('giangdt', 'SMOR044', '2017-03-29 09:23:58', 'Xóa tài sản có mã SMOR044. Duyệt bởi giangdt vào lúc 2017-3-29 9:23:58'),
	('giangdt', 'MOR002', '2017-03-29 09:23:58', 'Xóa tài sản có mã MOR002. Duyệt bởi giangdt vào lúc 2017-3-29 9:23:58'),
	('giangdt', 'MOR001', '2017-03-29 09:23:58', 'Xóa tài sản có mã MOR001. Duyệt bởi giangdt vào lúc 2017-3-29 9:23:58'),
	('giangdt', 'MOR003', '2017-03-29 09:51:07', 'Thêm mới thiết bị\n Mã thiết bị: MOR003\nTên thiết bị: Màn hình Samsung 17 inch\nNgày thêm: 2017-3-29 9:51:7\nNgười thêm: giangdt'),
	('giangdt', 'MOR004', '2017-03-29 09:52:19', 'Thêm mới thiết bị\n Mã thiết bị: MOR004\nTên thiết bị: Màn hình DELL 21 inch\nNgày thêm: 2017-3-29 9:52:19\nNgười thêm: giangdt'),
	('giangdt', 'MOR005', '2017-03-29 09:53:02', 'Thêm mới thiết bị\n Mã thiết bị: MOR005\nTên thiết bị: Màn hình SAMSUNG 21 inch\nNgày thêm: 2017-3-29 9:53:2\nNgười thêm: giangdt'),
	('giangdt', 'MOR006', '2017-03-29 09:53:56', 'Thêm mới thiết bị\n Mã thiết bị: MOR006\nTên thiết bị: Màn hình SAMSUNG 21.5 inch\nNgày thêm: 2017-3-29 9:53:56\nNgười thêm: giangdt'),
	('giangdt', 'MOR007', '2017-03-29 09:55:23', 'Thêm mới thiết bị\n Mã thiết bị: MOR007\nTên thiết bị: Màn hình DELL 21 inch\nNgày thêm: 2017-3-29 9:55:23\nNgười thêm: giangdt'),
	('giangdt', 'MOR008', '2017-03-29 09:56:00', 'Thêm mới thiết bị\n Mã thiết bị: MOR008\nTên thiết bị: Màn hình DELL 21 inch\nNgày thêm: 2017-3-29 9:56:0\nNgười thêm: giangdt'),
	('giangdt', 'MOR009', '2017-03-29 09:58:46', 'Thêm mới thiết bị\n Mã thiết bị: MOR009\nTên thiết bị: Màn hình SAMSUNG 17 inch\nNgày thêm: 2017-3-29 9:58:46\nNgười thêm: giangdt'),
	('giangdt', 'MOR010', '2017-03-29 09:59:42', 'Thêm mới thiết bị\n Mã thiết bị: MOR010\nTên thiết bị: Màn hình DELL 21 inch\nNgày thêm: 2017-3-29 9:59:42\nNgười thêm: giangdt'),
	('giangdt', 'MOR011', '2017-03-29 10:00:45', 'Thêm mới thiết bị\n Mã thiết bị: MOR011\nTên thiết bị: Màn hình DELL 21 inch\nNgày thêm: 2017-3-29 10:0:45\nNgười thêm: giangdt'),
	('giangdt', 'MOR012', '2017-03-29 10:06:54', 'Thêm mới thiết bị\n Mã thiết bị: MOR012\nTên thiết bị: Màn hình DELL\nNgày thêm: 2017-3-29 10:6:54\nNgười thêm: giangdt'),
	('giangdt', 'MOR013', '2017-03-29 10:07:38', 'Thêm mới thiết bị\n Mã thiết bị: MOR013\nTên thiết bị: Màn hình DELL\nNgày thêm: 2017-3-29 10:7:38\nNgười thêm: giangdt'),
	('giangdt', 'MOR014', '2017-03-29 10:08:28', 'Thêm mới thiết bị\n Mã thiết bị: MOR014\nTên thiết bị: Màn hình DELL\nNgày thêm: 2017-3-29 10:8:28\nNgười thêm: giangdt'),
	('giangdt', 'MOR015', '2017-03-29 10:09:05', 'Thêm mới thiết bị\n Mã thiết bị: MOR015\nTên thiết bị: Màn hình DELL\nNgày thêm: 2017-3-29 10:9:5\nNgười thêm: giangdt'),
	('giangdt', 'MOR016', '2017-03-29 10:10:39', 'Thêm mới thiết bị\n Mã thiết bị: MOR016\nTên thiết bị: Màn hình SAMSUNG\nNgày thêm: 2017-3-29 10:10:39\nNgười thêm: giangdt'),
	('giangdt', 'MOR017', '2017-03-29 10:13:31', 'Thêm mới thiết bị\n Mã thiết bị: MOR017\nTên thiết bị: Màn hình SAMSUNG\nNgày thêm: 2017-3-29 10:13:31\nNgười thêm: giangdt'),
	('giangdt', 'MOR017', '2017-03-29 10:13:40', 'Sửa thiết bị\n Mã thiết bị: MOR017\nTên thiết bị: Màn hình SAMSUNG\nNgày sửa: 2017-3-29 10:13:40\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR015', '2017-03-29 10:14:02', 'Sửa thiết bị\n Mã thiết bị: MOR015\nTên thiết bị: Màn hình DELL\nNgày sửa: 2017-3-29 10:14:2\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR014', '2017-03-29 10:14:12', 'Sửa thiết bị\n Mã thiết bị: MOR014\nTên thiết bị: Màn hình DELL\nNgày sửa: 2017-3-29 10:14:12\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR012', '2017-03-29 10:14:23', 'Sửa thiết bị\n Mã thiết bị: MOR012\nTên thiết bị: Màn hình DELL\nNgày sửa: 2017-3-29 10:14:23\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR011', '2017-03-29 10:14:33', 'Sửa thiết bị\n Mã thiết bị: MOR011\nTên thiết bị: Màn hình DELL 21 inch\nNgày sửa: 2017-3-29 10:14:33\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR008', '2017-03-29 10:14:44', 'Sửa thiết bị\n Mã thiết bị: MOR008\nTên thiết bị: Màn hình DELL 21 inch\nNgày sửa: 2017-3-29 10:14:44\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR007', '2017-03-29 10:14:55', 'Sửa thiết bị\n Mã thiết bị: MOR007\nTên thiết bị: Màn hình DELL 21 inch\nNgày sửa: 2017-3-29 10:14:55\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR003', '2017-03-29 10:15:09', 'Sửa thiết bị\n Mã thiết bị: MOR003\nTên thiết bị: Màn hình Samsung 17 inch\nNgày sửa: 2017-3-29 10:15:9\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR004', '2017-03-29 10:15:25', 'Sửa thiết bị\n Mã thiết bị: MOR004\nTên thiết bị: Màn hình DELL 21 inch\nNgày sửa: 2017-3-29 10:15:25\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR005', '2017-03-29 10:15:35', 'Sửa thiết bị\n Mã thiết bị: MOR005\nTên thiết bị: Màn hình SAMSUNG 21 inch\nNgày sửa: 2017-3-29 10:15:35\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR006', '2017-03-29 10:15:46', 'Sửa thiết bị\n Mã thiết bị: MOR006\nTên thiết bị: Màn hình SAMSUNG 21.5 inch\nNgày sửa: 2017-3-29 10:15:46\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR006', '2017-03-29 10:15:47', 'Sửa thiết bị\n Mã thiết bị: MOR006\nTên thiết bị: Màn hình SAMSUNG 21.5 inch\nNgày sửa: 2017-3-29 10:15:47\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR018', '2017-03-29 10:16:57', 'Thêm mới thiết bị\n Mã thiết bị: MOR018\nTên thiết bị: Màn hình SAMSUNG\nNgày thêm: 2017-3-29 10:16:57\nNgười thêm: giangdt'),
	('giangdt', 'MOR019', '2017-03-29 10:18:03', 'Thêm mới thiết bị\n Mã thiết bị: MOR019\nTên thiết bị: Màn hình DELL\nNgày thêm: 2017-3-29 10:18:3\nNgười thêm: giangdt'),
	('giangdt', 'MOR020', '2017-03-29 10:19:21', 'Thêm mới thiết bị\n Mã thiết bị: MOR020\nTên thiết bị: Màn hình SAMSUNG\nNgày thêm: 2017-3-29 10:19:21\nNgười thêm: giangdt'),
	('giangdt', 'MOR013', '2017-03-29 10:21:57', 'Sửa thiết bị\n Mã thiết bị: MOR013\nTên thiết bị: Màn hình DELL\nNgày sửa: 2017-3-29 10:21:57\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR015', '2017-03-29 10:22:18', 'Sửa thiết bị\n Mã thiết bị: MOR015\nTên thiết bị: Màn hình DELL\nNgày sửa: 2017-3-29 10:22:18\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR021', '2017-03-29 10:23:42', 'Thêm mới thiết bị\n Mã thiết bị: MOR021\nTên thiết bị: Màn hình SAMSUNG\nNgày thêm: 2017-3-29 10:23:42\nNgười thêm: giangdt'),
	('giangdt', 'MOR021', '2017-03-29 10:23:56', 'Sửa thiết bị\n Mã thiết bị: MOR021\nTên thiết bị: Màn hình SAMSUNG\nNgày sửa: 2017-3-29 10:23:56\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR022', '2017-03-29 10:24:47', 'Thêm mới thiết bị\n Mã thiết bị: MOR022\nTên thiết bị: Màn hình DELL\nNgày thêm: 2017-3-29 10:24:47\nNgười thêm: giangdt'),
	('giangdt', 'MOR023', '2017-03-29 10:25:34', 'Thêm mới thiết bị\n Mã thiết bị: MOR023\nTên thiết bị: Màn hình CMS\nNgày thêm: 2017-3-29 10:25:34\nNgười thêm: giangdt'),
	('giangdt', 'MOR023', '2017-03-29 10:25:44', 'Sửa thiết bị\n Mã thiết bị: MOR023\nTên thiết bị: Màn hình CMS\nNgày sửa: 2017-3-29 10:25:44\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR024', '2017-03-29 10:26:43', 'Thêm mới thiết bị\n Mã thiết bị: MOR024\nTên thiết bị: Màn hình SAMSUNG\nNgày thêm: 2017-3-29 10:26:43\nNgười thêm: giangdt'),
	('giangdt', 'MOR025', '2017-03-29 10:27:35', 'Thêm mới thiết bị\n Mã thiết bị: MOR025\nTên thiết bị: Màn hình SAMSUNG\nNgày thêm: 2017-3-29 10:27:35\nNgười thêm: giangdt'),
	('giangdt', 'MOR026', '2017-03-29 10:28:30', 'Thêm mới thiết bị\n Mã thiết bị: MOR026\nTên thiết bị: Màn hình Dell\nNgày thêm: 2017-3-29 10:28:30\nNgười thêm: giangdt'),
	('giangdt', 'MOR027', '2017-03-29 10:29:42', 'Thêm mới thiết bị\n Mã thiết bị: MOR027\nTên thiết bị: Màn hình Dell\nNgày thêm: 2017-3-29 10:29:42\nNgười thêm: giangdt'),
	('giangdt', 'MOR025', '2017-03-29 10:29:56', 'Sửa thiết bị\n Mã thiết bị: MOR025\nTên thiết bị: Màn hình SAMSUNG\nNgày sửa: 2017-3-29 10:29:56\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR028', '2017-03-29 10:34:14', 'Thêm mới thiết bị\n Mã thiết bị: MOR028\nTên thiết bị: Màn hình Sam Sung\nNgày thêm: 2017-3-29 10:34:14\nNgười thêm: giangdt'),
	('giangdt', 'MOR029', '2017-03-29 10:35:18', 'Thêm mới thiết bị\n Mã thiết bị: MOR029\nTên thiết bị: Màn hình Dell\nNgày thêm: 2017-3-29 10:35:18\nNgười thêm: giangdt'),
	('giangdt', 'MOR030', '2017-03-29 10:36:05', 'Thêm mới thiết bị\n Mã thiết bị: MOR030\nTên thiết bị: Màn hình Dell\nNgày thêm: 2017-3-29 10:36:5\nNgười thêm: giangdt'),
	('giangdt', 'MOR031', '2017-03-29 10:37:22', 'Thêm mới thiết bị\n Mã thiết bị: MOR031\nTên thiết bị: Màn hình Sam Sung\nNgày thêm: 2017-3-29 10:37:22\nNgười thêm: giangdt'),
	('giangdt', 'MOR032', '2017-03-29 10:38:17', 'Thêm mới thiết bị\n Mã thiết bị: MOR032\nTên thiết bị: Màn hình Sam Sung\nNgày thêm: 2017-3-29 10:38:17\nNgười thêm: giangdt'),
	('giangdt', 'MOR033', '2017-03-29 10:39:01', 'Thêm mới thiết bị\n Mã thiết bị: MOR033\nTên thiết bị: Màn hình Dell\nNgày thêm: 2017-3-29 10:39:1\nNgười thêm: giangdt'),
	('giangdt', 'MOR034', '2017-03-29 10:40:07', 'Thêm mới thiết bị\n Mã thiết bị: MOR034\nTên thiết bị: Màn hình Sam Sung\nNgày thêm: 2017-3-29 10:40:7\nNgười thêm: giangdt'),
	('giangdt', 'MOR035', '2017-03-29 10:40:59', 'Thêm mới thiết bị\n Mã thiết bị: MOR035\nTên thiết bị: Màn hình Sam Sung\nNgày thêm: 2017-3-29 10:40:59\nNgười thêm: giangdt'),
	('giangdt', 'MOR036', '2017-03-29 10:42:14', 'Thêm mới thiết bị\n Mã thiết bị: MOR036\nTên thiết bị: Màn hình Dell\nNgày thêm: 2017-3-29 10:42:14\nNgười thêm: giangdt'),
	('giangdt', 'MOR037', '2017-03-29 10:43:10', 'Thêm mới thiết bị\n Mã thiết bị: MOR037\nTên thiết bị: Màn hình Dell\nNgày thêm: 2017-3-29 10:43:10\nNgười thêm: giangdt'),
	('giangdt', 'MOR038', '2017-03-29 10:43:50', 'Thêm mới thiết bị\n Mã thiết bị: MOR038\nTên thiết bị: Màn hình Dell\nNgày thêm: 2017-3-29 10:43:50\nNgười thêm: giangdt'),
	('giangdt', 'MOR039', '2017-03-29 10:44:37', 'Thêm mới thiết bị\n Mã thiết bị: MOR039\nTên thiết bị: Màn hình dell\nNgày thêm: 2017-3-29 10:44:37\nNgười thêm: giangdt'),
	('giangdt', 'MOR040', '2017-03-29 10:45:26', 'Thêm mới thiết bị\n Mã thiết bị: MOR040\nTên thiết bị: Màn hình Dell\nNgày thêm: 2017-3-29 10:45:26\nNgười thêm: giangdt'),
	('giangdt', 'MOR041', '2017-03-29 10:47:09', 'Thêm mới thiết bị\n Mã thiết bị: MOR041\nTên thiết bị: Màn hình SAMSUNG 22 inch\nNgày thêm: 2017-3-29 10:47:9\nNgười thêm: giangdt'),
	('giangdt', 'MOR042', '2017-03-29 10:48:12', 'Thêm mới thiết bị\n Mã thiết bị: MOR042\nTên thiết bị: Màn hình SAMSUNG\nNgày thêm: 2017-3-29 10:48:12\nNgười thêm: giangdt'),
	('giangdt', 'MOR043', '2017-03-29 10:49:21', 'Thêm mới thiết bị\n Mã thiết bị: MOR043\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày thêm: 2017-3-29 10:49:21\nNgười thêm: giangdt'),
	('giangdt', 'MOR044', '2017-03-29 10:56:43', 'Thêm mới thiết bị\n Mã thiết bị: MOR044\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày thêm: 2017-3-29 10:56:43\nNgười thêm: giangdt'),
	('giangdt', 'MOR043', '2017-03-29 10:56:50', 'Sửa thiết bị\n Mã thiết bị: MOR043\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày sửa: 2017-3-29 10:56:50\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR045', '2017-03-29 10:57:32', 'Thêm mới thiết bị\n Mã thiết bị: MOR045\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày thêm: 2017-3-29 10:57:32\nNgười thêm: giangdt'),
	('giangdt', 'MOR046', '2017-03-29 10:58:52', 'Thêm mới thiết bị\n Mã thiết bị: MOR046\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày thêm: 2017-3-29 10:58:52\nNgười thêm: giangdt'),
	('giangdt', 'MOR047', '2017-03-29 10:59:51', 'Thêm mới thiết bị\n Mã thiết bị: MOR047\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày thêm: 2017-3-29 10:59:51\nNgười thêm: giangdt'),
	('giangdt', 'MOR046', '2017-03-29 11:00:00', 'Sửa thiết bị\n Mã thiết bị: MOR046\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày sửa: 2017-3-29 11:0:0\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR048', '2017-03-29 11:00:41', 'Thêm mới thiết bị\n Mã thiết bị: MOR048\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày thêm: 2017-3-29 11:0:41\nNgười thêm: giangdt'),
	('giangdt', 'MOR049', '2017-03-29 11:01:25', 'Thêm mới thiết bị\n Mã thiết bị: MOR049\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày thêm: 2017-3-29 11:1:25\nNgười thêm: giangdt'),
	('giangdt', 'MOR050', '2017-03-29 11:02:19', 'Thêm mới thiết bị\n Mã thiết bị: MOR050\nTên thiết bị: Màn hình DELL 19.5 inch\nNgày thêm: 2017-3-29 11:2:19\nNgười thêm: giangdt'),
	('giangdt', 'MOR051', '2017-03-29 11:05:27', 'Thêm mới thiết bị\n Mã thiết bị: MOR051\nTên thiết bị: Màn hình SAMSUNG 22 inch\nNgày thêm: 2017-3-29 11:5:27\nNgười thêm: giangdt'),
	('giangdt', 'MOR052', '2017-03-29 11:06:09', 'Thêm mới thiết bị\n Mã thiết bị: MOR052\nTên thiết bị: Màn hình SAMSUNG 22 inch\nNgày thêm: 2017-3-29 11:6:9\nNgười thêm: giangdt'),
	('giangdt', 'MOR052', '2017-03-29 11:06:30', 'Sửa thiết bị\n Mã thiết bị: MOR052\nTên thiết bị: Màn hình SAMSUNG 22 inch\nNgày sửa: 2017-3-29 11:6:30\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'MOR051', '2017-03-29 11:06:40', 'Sửa thiết bị\n Mã thiết bị: MOR051\nTên thiết bị: Màn hình SAMSUNG 22 inch\nNgày sửa: 2017-3-29 11:6:40\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'CPT001', '2017-03-29 11:08:10', 'Thêm mới thiết bị\n Mã thiết bị: CPT001\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:8:10\nNgười thêm: giangdt'),
	('giangdt', 'CPT002', '2017-03-29 11:09:14', 'Thêm mới thiết bị\n Mã thiết bị: CPT002\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:9:14\nNgười thêm: giangdt'),
	('giangdt', 'CPT003', '2017-03-29 11:10:00', 'Thêm mới thiết bị\n Mã thiết bị: CPT003\nTên thiết bị: Case SAMSUNG đen\nNgày thêm: 2017-3-29 11:10:0\nNgười thêm: giangdt'),
	('giangdt', 'CPT004', '2017-03-29 11:10:47', 'Thêm mới thiết bị\n Mã thiết bị: CPT004\nTên thiết bị: Case DELL đen\nNgày thêm: 2017-3-29 11:10:47\nNgười thêm: giangdt'),
	('giangdt', 'CPT005', '2017-03-29 11:11:38', 'Thêm mới thiết bị\n Mã thiết bị: CPT005\nTên thiết bị: Case DELL 21 inch\nNgày thêm: 2017-3-29 11:11:38\nNgười thêm: giangdt'),
	('giangdt', 'CPT006', '2017-03-29 11:12:16', 'Thêm mới thiết bị\n Mã thiết bị: CPT006\nTên thiết bị: Case DELL màu đen\nNgày thêm: 2017-3-29 11:12:16\nNgười thêm: giangdt'),
	('giangdt', 'CPT007', '2017-03-29 11:13:11', 'Thêm mới thiết bị\n Mã thiết bị: CPT007\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:13:11\nNgười thêm: giangdt'),
	('giangdt', 'CPT008', '2017-03-29 11:14:04', 'Thêm mới thiết bị\n Mã thiết bị: CPT008\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:14:4\nNgười thêm: giangdt'),
	('giangdt', 'CPT009', '2017-03-29 11:14:58', 'Thêm mới thiết bị\n Mã thiết bị: CPT009\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:14:58\nNgười thêm: giangdt'),
	('giangdt', 'CPT010', '2017-03-29 11:19:12', 'Thêm mới thiết bị\n Mã thiết bị: CPT010\nTên thiết bị: Màu đen\nNgày thêm: 2017-3-29 11:19:12\nNgười thêm: giangdt'),
	('giangdt', 'CPT010', '2017-03-29 11:19:27', 'Sửa thiết bị\n Mã thiết bị: CPT010\nTên thiết bị: Case\nNgày sửa: 2017-3-29 11:19:27\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'CPT011', '2017-03-29 11:20:22', 'Thêm mới thiết bị\n Mã thiết bị: CPT011\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:20:22\nNgười thêm: giangdt'),
	('giangdt', 'CPT012', '2017-03-29 11:20:56', 'Thêm mới thiết bị\n Mã thiết bị: CPT012\nTên thiết bị: Case\nNgày thêm: 2017-3-29 11:20:56\nNgười thêm: giangdt'),
	('giangdt', 'CPT012', '2017-03-29 11:21:49', 'Sửa thiết bị\n Mã thiết bị: CPT012\nTên thiết bị: Case\nNgày sửa: 2017-3-29 11:21:49\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'CPT013', '2017-03-29 11:22:27', 'Thêm mới thiết bị\n Mã thiết bị: CPT013\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:22:27\nNgười thêm: giangdt'),
	('giangdt', 'CPT014', '2017-03-29 11:23:22', 'Thêm mới thiết bị\n Mã thiết bị: CPT014\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:23:22\nNgười thêm: giangdt'),
	('giangdt', 'CPT015', '2017-03-29 11:24:14', 'Thêm mới thiết bị\n Mã thiết bị: CPT015\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:24:14\nNgười thêm: giangdt'),
	('giangdt', 'CPT016', '2017-03-29 11:25:06', 'Thêm mới thiết bị\n Mã thiết bị: CPT016\nTên thiết bị: Case DELL\nNgày thêm: 2017-3-29 11:25:6\nNgười thêm: giangdt'),
	('giangdt', 'CPT017', '2017-03-29 11:25:46', 'Thêm mới thiết bị\n Mã thiết bị: CPT017\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:25:46\nNgười thêm: giangdt'),
	('giangdt', 'CPT018', '2017-03-29 11:26:25', 'Thêm mới thiết bị\n Mã thiết bị: CPT018\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:26:25\nNgười thêm: giangdt'),
	('giangdt', 'CPT018', '2017-03-29 11:26:37', 'Sửa thiết bị\n Mã thiết bị: CPT018\nTên thiết bị: Case máy tính\nNgày sửa: 2017-3-29 11:26:37\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'CPT019', '2017-03-29 11:27:32', 'Thêm mới thiết bị\n Mã thiết bị: CPT019\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:27:32\nNgười thêm: giangdt'),
	('giangdt', 'CPT020', '2017-03-29 11:28:07', 'Thêm mới thiết bị\n Mã thiết bị: CPT020\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:28:7\nNgười thêm: giangdt'),
	('giangdt', 'CPT021', '2017-03-29 11:28:56', 'Thêm mới thiết bị\n Mã thiết bị: CPT021\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:28:56\nNgười thêm: giangdt'),
	('giangdt', 'CPT022', '2017-03-29 11:29:44', 'Thêm mới thiết bị\n Mã thiết bị: CPT022\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:29:44\nNgười thêm: giangdt'),
	('giangdt', 'CPT023', '2017-03-29 11:30:21', 'Thêm mới thiết bị\n Mã thiết bị: CPT023\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:30:21\nNgười thêm: giangdt'),
	('giangdt', 'CPT024', '2017-03-29 11:30:57', 'Thêm mới thiết bị\n Mã thiết bị: CPT024\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:30:57\nNgười thêm: giangdt'),
	('giangdt', 'CPT025', '2017-03-29 11:31:41', 'Thêm mới thiết bị\n Mã thiết bị: CPT025\nTên thiết bị: Case máy in\nNgày thêm: 2017-3-29 11:31:41\nNgười thêm: giangdt'),
	('giangdt', 'CPT026', '2017-03-29 11:32:23', 'Thêm mới thiết bị\n Mã thiết bị: CPT026\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:32:23\nNgười thêm: giangdt'),
	('giangdt', 'CPT027', '2017-03-29 11:33:06', 'Thêm mới thiết bị\n Mã thiết bị: CPT027\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:33:6\nNgười thêm: giangdt'),
	('giangdt', 'CPT028', '2017-03-29 11:34:31', 'Thêm mới thiết bị\n Mã thiết bị: CPT028\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:34:31\nNgười thêm: giangdt'),
	('giangdt', 'CPT029', '2017-03-29 11:35:09', 'Thêm mới thiết bị\n Mã thiết bị: CPT029\nTên thiết bị: Case máy tính\nNgày thêm: 2017-3-29 11:35:9\nNgười thêm: giangdt'),
	('giangdt', 'CPT030', '2017-03-29 11:36:05', 'Thêm mới thiết bị\n Mã thiết bị: CPT030\nTên thiết bị: Case Server 9\nNgày thêm: 2017-3-29 11:36:5\nNgười thêm: giangdt'),
	('giangdt', 'CPT031', '2017-03-29 11:36:36', 'Thêm mới thiết bị\n Mã thiết bị: CPT031\nTên thiết bị: Case Server 8\nNgày thêm: 2017-3-29 11:36:36\nNgười thêm: giangdt'),
	('giangdt', 'SCPT032', '2017-03-29 11:37:33', 'Thêm mới thiết bị\n Mã thiết bị: SCPT032\nTên thiết bị: Case máy tính dự án\nNgày thêm: 2017-3-29 11:37:33\nNgười thêm: giangdt'),
	('giangdt', 'SCPT033', '2017-03-29 11:38:31', 'Thêm mới thiết bị\n Mã thiết bị: SCPT033\nTên thiết bị: Case máy tính cửa từ\nNgày thêm: 2017-3-29 11:38:31\nNgười thêm: giangdt'),
	('giangdt', 'SCPT034', '2017-03-29 11:39:50', 'Thêm mới thiết bị\n Mã thiết bị: SCPT034\nTên thiết bị: Case Mac Mini\nNgày thêm: 2017-3-29 11:39:50\nNgười thêm: giangdt'),
	('giangdt', 'KEY001', '2017-03-29 11:41:58', 'Thêm mới thiết bị\n Mã thiết bị: KEY001\nTên thiết bị: Bàn phím DELL\nNgày thêm: 2017-3-29 11:41:58\nNgười thêm: giangdt'),
	('giangdt', 'KEY002', '2017-03-29 11:49:42', 'Thêm mới thiết bị\n Mã thiết bị: KEY002\nTên thiết bị: Bàn phím DELL đen\nNgày thêm: 2017-3-29 11:49:42\nNgười thêm: giangdt'),
	('giangdt', 'KEY003', '2017-03-29 11:50:11', 'Thêm mới thiết bị\n Mã thiết bị: KEY003\nTên thiết bị: Bàn phím DELL đen\nNgày thêm: 2017-3-29 11:50:11\nNgười thêm: giangdt'),
	('giangdt', 'KEY004', '2017-03-29 11:50:37', 'Thêm mới thiết bị\n Mã thiết bị: KEY004\nTên thiết bị: Bàn phím DELL đen\nNgày thêm: 2017-3-29 11:50:37\nNgười thêm: giangdt'),
	('giangdt', 'KEY004', '2017-03-29 11:51:02', 'Sửa thiết bị\n Mã thiết bị: KEY004\nTên thiết bị: Bàn phím DELL đen\nNgày sửa: 2017-3-29 11:51:2\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'KEY005', '2017-03-29 11:51:57', 'Thêm mới thiết bị\n Mã thiết bị: KEY005\nTên thiết bị: Bàn phím Logitech xám\nNgày thêm: 2017-3-29 11:51:57\nNgười thêm: giangdt'),
	('giangdt', 'KEY004', '2017-03-29 11:52:17', 'Sửa thiết bị\n Mã thiết bị: KEY004\nTên thiết bị: Bàn phím DELL đen\nNgày sửa: 2017-3-29 11:52:17\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'KEY006', '2017-03-29 11:52:48', 'Thêm mới thiết bị\n Mã thiết bị: KEY006\nTên thiết bị: Bàn phím Logitech đen\nNgày thêm: 2017-3-29 11:52:48\nNgười thêm: giangdt'),
	('giangdt', 'KEY007', '2017-03-29 11:53:33', 'Thêm mới thiết bị\n Mã thiết bị: KEY007\nTên thiết bị: Bàn phím DELL\nNgày thêm: 2017-3-29 11:53:33\nNgười thêm: giangdt'),
	('giangdt', 'KEY008', '2017-03-29 11:54:28', 'Thêm mới thiết bị\n Mã thiết bị: KEY008\nTên thiết bị: Bàn phím DELL đen\nNgày thêm: 2017-3-29 11:54:28\nNgười thêm: giangdt'),
	('giangdt', 'KEY009', '2017-03-29 11:55:09', 'Thêm mới thiết bị\n Mã thiết bị: KEY009\nTên thiết bị: Bàn phím DELL đen\nNgày thêm: 2017-3-29 11:55:9\nNgười thêm: giangdt'),
	('giangdt', 'KEY010', '2017-03-29 11:56:04', 'Thêm mới thiết bị\n Mã thiết bị: KEY010\nTên thiết bị: Bàn phím DELL đen\nNgày thêm: 2017-3-29 11:56:4\nNgười thêm: giangdt'),
	('giangdt', 'KEY011', '2017-03-29 11:56:43', 'Thêm mới thiết bị\n Mã thiết bị: KEY011\nTên thiết bị: Bàn phím DELL đen\nNgày thêm: 2017-3-29 11:56:43\nNgười thêm: giangdt'),
	('giangdt', 'KEY012', '2017-03-29 11:57:18', 'Thêm mới thiết bị\n Mã thiết bị: KEY012\nTên thiết bị: Bàn phím Microsoft đen\nNgày thêm: 2017-3-29 11:57:18\nNgười thêm: giangdt'),
	('giangdt', 'KEY013', '2017-03-29 12:00:47', 'Thêm mới thiết bị\n Mã thiết bị: KEY013\nTên thiết bị: Bàn phím DELL đen\nNgày thêm: 2017-3-29 12:0:47\nNgười thêm: giangdt'),
	('giangdt', 'KEY014', '2017-03-29 12:33:08', 'Thêm mới thiết bị\n Mã thiết bị: KEY014\nTên thiết bị: Bàn phím Logitech đen\nNgày thêm: 2017-3-29 12:33:8\nNgười thêm: giangdt'),
	('giangdt', 'KEY015', '2017-03-29 12:33:48', 'Thêm mới thiết bị\n Mã thiết bị: KEY015\nTên thiết bị: Bàn phím DELL đen\nNgày thêm: 2017-3-29 12:33:48\nNgười thêm: giangdt'),
	('giangdt', 'KEY016', '2017-03-29 12:34:38', 'Thêm mới thiết bị\n Mã thiết bị: KEY016\nTên thiết bị: Bàn phím Logitech K120\nNgày thêm: 2017-3-29 12:34:38\nNgười thêm: giangdt'),
	('giangdt', 'KEY017', '2017-03-29 12:35:10', 'Thêm mới thiết bị\n Mã thiết bị: KEY017\nTên thiết bị: Bàn phím DELL\nNgày thêm: 2017-3-29 12:35:10\nNgười thêm: giangdt'),
	('giangdt', 'KEY018', '2017-03-29 12:36:06', 'Thêm mới thiết bị\n Mã thiết bị: KEY018\nTên thiết bị: Bàn phím Logitech K120\nNgày thêm: 2017-3-29 12:36:6\nNgười thêm: giangdt'),
	('giangdt', 'KEY018', '2017-03-29 12:36:47', 'Sửa thiết bị\n Mã thiết bị: KEY018\nTên thiết bị: Bàn phím Logitech K120\nNgày sửa: 2017-3-29 12:36:47\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'KEY019', '2017-03-29 12:37:59', 'Thêm mới thiết bị\n Mã thiết bị: KEY019\nTên thiết bị: Bàn phím Logitech K120\nNgày thêm: 2017-3-29 12:37:59\nNgười thêm: giangdt'),
	('giangdt', 'KEY020', '2017-03-29 12:38:30', 'Thêm mới thiết bị\n Mã thiết bị: KEY020\nTên thiết bị: Bàn phím Dell\nNgày thêm: 2017-3-29 12:38:30\nNgười thêm: giangdt'),
	('giangdt', 'KEY021', '2017-03-29 12:39:02', 'Thêm mới thiết bị\n Mã thiết bị: KEY021\nTên thiết bị: Bàn phím Dell\nNgày thêm: 2017-3-29 12:39:2\nNgười thêm: giangdt'),
	('giangdt', 'KEY022', '2017-03-29 12:39:35', 'Thêm mới thiết bị\n Mã thiết bị: KEY022\nTên thiết bị: Bàn phím Dell\nNgày thêm: 2017-3-29 12:39:35\nNgười thêm: giangdt'),
	('giangdt', 'KEY023', '2017-03-29 12:40:19', 'Thêm mới thiết bị\n Mã thiết bị: KEY023\nTên thiết bị: Bàn phím Logitech\nNgày thêm: 2017-3-29 12:40:19\nNgười thêm: giangdt'),
	('giangdt', 'KEY024', '2017-03-29 12:41:03', 'Thêm mới thiết bị\n Mã thiết bị: KEY024\nTên thiết bị: Bàn phím Dell\nNgày thêm: 2017-3-29 12:41:3\nNgười thêm: giangdt'),
	('giangdt', 'KEY025', '2017-03-29 12:41:38', 'Thêm mới thiết bị\n Mã thiết bị: KEY025\nTên thiết bị: Bàn phím Dell\nNgày thêm: 2017-3-29 12:41:38\nNgười thêm: giangdt'),
	('giangdt', 'KEY026', '2017-03-29 12:42:08', 'Thêm mới thiết bị\n Mã thiết bị: KEY026\nTên thiết bị: Bàn phím Dell\nNgày thêm: 2017-3-29 12:42:8\nNgười thêm: giangdt'),
	('giangdt', 'KEY027', '2017-03-29 12:42:35', 'Thêm mới thiết bị\n Mã thiết bị: KEY027\nTên thiết bị: Bàn phím Microsoft\nNgày thêm: 2017-3-29 12:42:35\nNgười thêm: giangdt'),
	('giangdt', 'KEY028', '2017-03-29 12:43:19', 'Thêm mới thiết bị\n Mã thiết bị: KEY028\nTên thiết bị: Bàn phím Microsoft\nNgày thêm: 2017-3-29 12:43:19\nNgười thêm: giangdt'),
	('giangdt', 'KEY029', '2017-03-29 12:43:52', 'Thêm mới thiết bị\n Mã thiết bị: KEY029\nTên thiết bị: Bàn phím dell\nNgày thêm: 2017-3-29 12:43:52\nNgười thêm: giangdt'),
	('giangdt', 'KEY030', '2017-03-29 12:44:27', 'Thêm mới thiết bị\n Mã thiết bị: KEY030\nTên thiết bị: Bàn phím Mitsumi\nNgày thêm: 2017-3-29 12:44:27\nNgười thêm: giangdt'),
	('giangdt', 'KEY031', '2017-03-29 12:45:02', 'Thêm mới thiết bị\n Mã thiết bị: KEY031\nTên thiết bị: Bàn phím DELL\nNgày thêm: 2017-3-29 12:45:2\nNgười thêm: giangdt'),
	('giangdt', 'KEY032', '2017-03-29 12:45:50', 'Thêm mới thiết bị\n Mã thiết bị: KEY032\nTên thiết bị: Bàn phím DELL\nNgày thêm: 2017-3-29 12:45:50\nNgười thêm: giangdt'),
	('giangdt', 'KEY031', '2017-03-29 12:46:02', 'Sửa thiết bị\n Mã thiết bị: KEY031\nTên thiết bị: Bàn phím DELL\nNgày sửa: 2017-3-29 12:46:2\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'KEY032', '2017-03-29 12:46:17', 'Sửa thiết bị\n Mã thiết bị: KEY032\nTên thiết bị: Bàn phím DELL\nNgày sửa: 2017-3-29 12:46:17\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'SCMR001', '2017-03-29 12:47:50', 'Thêm mới thiết bị\n Mã thiết bị: SCMR001\nTên thiết bị: Hộp điều khiển Camera\nNgày thêm: 2017-3-29 12:47:50\nNgười thêm: giangdt'),
	('giangdt', 'DDI001', '2017-03-29 12:49:58', 'Thêm mới thiết bị\n Mã thiết bị: DDI001\nTên thiết bị: Iphone 5\nNgày thêm: 2017-3-29 12:49:58\nNgười thêm: giangdt'),
	('giangdt', 'DDI002', '2017-03-29 12:50:43', 'Thêm mới thiết bị\n Mã thiết bị: DDI002\nTên thiết bị: Smartphone Sam Sung\nNgày thêm: 2017-3-29 12:50:43\nNgười thêm: giangdt'),
	('giangdt', 'DDI003', '2017-03-29 12:51:26', 'Thêm mới thiết bị\n Mã thiết bị: DDI003\nTên thiết bị: Smartphone Asus\nNgày thêm: 2017-3-29 12:51:26\nNgười thêm: giangdt'),
	('giangdt', 'SHDD001', '2017-03-29 12:53:25', 'Thêm mới thiết bị\n Mã thiết bị: SHDD001\nTên thiết bị: Ổ cứng IBM\nNgày thêm: 2017-3-29 12:53:25\nNgười thêm: giangdt'),
	('giangdt', 'LAP001', '2017-03-29 12:54:40', 'Thêm mới thiết bị\n Mã thiết bị: LAP001\nTên thiết bị: Laptop DELL 15.6 inch\nNgày thêm: 2017-3-29 12:54:40\nNgười thêm: giangdt'),
	('giangdt', 'LAP002', '2017-03-29 12:55:37', 'Thêm mới thiết bị\n Mã thiết bị: LAP002\nTên thiết bị: Laptop DELL\nNgày thêm: 2017-3-29 12:55:37\nNgười thêm: giangdt'),
	('giangdt', 'LAP003', '2017-03-29 12:56:15', 'Thêm mới thiết bị\n Mã thiết bị: LAP003\nTên thiết bị: Laptop LENOVO\nNgày thêm: 2017-3-29 12:56:15\nNgười thêm: giangdt'),
	('giangdt', 'LAP004', '2017-03-29 12:57:28', 'Thêm mới thiết bị\n Mã thiết bị: LAP004\nTên thiết bị: Laptop DELL trắng\nNgày thêm: 2017-3-29 12:57:28\nNgười thêm: giangdt'),
	('giangdt', 'LAP003', '2017-03-29 12:57:57', 'Sửa thiết bị\n Mã thiết bị: LAP003\nTên thiết bị: Laptop LENOVO\nNgày sửa: 2017-3-29 12:57:57\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'LAP005', '2017-03-29 12:58:50', 'Thêm mới thiết bị\n Mã thiết bị: LAP005\nTên thiết bị: Laptop Sony VAIO\nNgày thêm: 2017-3-29 12:58:50\nNgười thêm: giangdt'),
	('giangdt', 'LAP006', '2017-03-29 13:00:07', 'Thêm mới thiết bị\n Mã thiết bị: LAP006\nTên thiết bị: Laptop LENOVO\nNgày thêm: 2017-3-29 13:0:7\nNgười thêm: giangdt'),
	('giangdt', 'LAP007', '2017-03-29 13:00:39', 'Thêm mới thiết bị\n Mã thiết bị: LAP007\nTên thiết bị: Laptop MAC\nNgày thêm: 2017-3-29 13:0:39\nNgười thêm: giangdt'),
	('giangdt', 'LAP008', '2017-03-29 13:01:27', 'Thêm mới thiết bị\n Mã thiết bị: LAP008\nTên thiết bị: Laptop DELL\nNgày thêm: 2017-3-29 13:1:27\nNgười thêm: giangdt'),
	('giangdt', 'MNT001', '2017-03-29 13:02:25', 'Thêm mới thiết bị\n Mã thiết bị: MNT001\nTên thiết bị: Màn hình IBM\nNgày thêm: 2017-3-29 13:2:25\nNgười thêm: giangdt'),
	('giangdt', 'CDR001', '2017-03-29 13:03:26', 'Thêm mới thiết bị\n Mã thiết bị: CDR001\nTên thiết bị: Ổ đĩa DVD Asus\nNgày thêm: 2017-3-29 13:3:26\nNgười thêm: giangdt'),
	('giangdt', 'RAM001', '2017-03-29 13:06:25', 'Thêm mới thiết bị\n Mã thiết bị: RAM001\nTên thiết bị: Ram Kingston\nNgày thêm: 2017-3-29 13:6:25\nNgười thêm: giangdt'),
	('giangdt', 'RAM002', '2017-03-29 13:07:08', 'Thêm mới thiết bị\n Mã thiết bị: RAM002\nTên thiết bị: Ram\nNgày thêm: 2017-3-29 13:7:8\nNgười thêm: giangdt'),
	('giangdt', 'RAM003', '2017-03-29 13:09:28', 'Thêm mới thiết bị\n Mã thiết bị: RAM003\nTên thiết bị: Ram\nNgày thêm: 2017-3-29 13:9:28\nNgười thêm: giangdt'),
	('giangdt', 'RAM004', '2017-03-29 13:11:26', 'Thêm mới thiết bị\n Mã thiết bị: RAM004\nTên thiết bị: Ram DDR-3\nNgày thêm: 2017-3-29 13:11:26\nNgười thêm: giangdt'),
	('giangdt', 'RAM005', '2017-03-29 13:12:02', 'Thêm mới thiết bị\n Mã thiết bị: RAM005\nTên thiết bị: Ram\nNgày thêm: 2017-3-29 13:12:2\nNgười thêm: giangdt'),
	('giangdt', 'RAM006', '2017-03-29 13:12:38', 'Thêm mới thiết bị\n Mã thiết bị: RAM006\nTên thiết bị: Ram\nNgày thêm: 2017-3-29 13:12:38\nNgười thêm: giangdt'),
	('giangdt', 'RAM007', '2017-03-29 13:13:13', 'Thêm mới thiết bị\n Mã thiết bị: RAM007\nTên thiết bị: Ram DDR3\nNgày thêm: 2017-3-29 13:13:13\nNgười thêm: giangdt'),
	('giangdt', 'RAM008', '2017-03-29 13:14:08', 'Thêm mới thiết bị\n Mã thiết bị: RAM008\nTên thiết bị: Ram Kingston\nNgày thêm: 2017-3-29 13:14:8\nNgười thêm: giangdt'),
	('giangdt', 'RAM009', '2017-03-29 13:14:44', 'Thêm mới thiết bị\n Mã thiết bị: RAM009\nTên thiết bị: Ram Kingston\nNgày thêm: 2017-3-29 13:14:44\nNgười thêm: giangdt'),
	('giangdt', 'RAM010', '2017-03-29 13:15:13', 'Thêm mới thiết bị\n Mã thiết bị: RAM010\nTên thiết bị: Ram Kingston\nNgày thêm: 2017-3-29 13:15:13\nNgười thêm: giangdt'),
	('giangdt', 'RAM011', '2017-03-29 13:16:17', 'Thêm mới thiết bị\n Mã thiết bị: RAM011\nTên thiết bị: Ram DDR3\nNgày thêm: 2017-3-29 13:16:17\nNgười thêm: giangdt'),
	('giangdt', 'RAM012', '2017-03-29 13:16:47', 'Thêm mới thiết bị\n Mã thiết bị: RAM012\nTên thiết bị: Ram Kingston\nNgày thêm: 2017-3-29 13:16:47\nNgười thêm: giangdt'),
	('giangdt', 'RAM013', '2017-03-29 13:17:33', 'Thêm mới thiết bị\n Mã thiết bị: RAM013\nTên thiết bị: Ram DDR2 Kingston\nNgày thêm: 2017-3-29 13:17:33\nNgười thêm: giangdt'),
	('giangdt', 'RAM014', '2017-03-29 13:18:15', 'Thêm mới thiết bị\n Mã thiết bị: RAM014\nTên thiết bị: Ram DDR2 Kingston\nNgày thêm: 2017-3-29 13:18:15\nNgười thêm: giangdt'),
	('giangdt', 'RAM015', '2017-03-29 13:18:52', 'Thêm mới thiết bị\n Mã thiết bị: RAM015\nTên thiết bị: Ram DDR3 Kingston\nNgày thêm: 2017-3-29 13:18:52\nNgười thêm: giangdt'),
	('giangdt', 'RAM016', '2017-03-29 13:19:32', 'Thêm mới thiết bị\n Mã thiết bị: RAM016\nTên thiết bị: Ram DDR3 Samsung\nNgày thêm: 2017-3-29 13:19:32\nNgười thêm: giangdt'),
	('giangdt', 'RAM017', '2017-03-29 13:20:14', 'Thêm mới thiết bị\n Mã thiết bị: RAM017\nTên thiết bị: Ram DDR2 Samsung\nNgày thêm: 2017-3-29 13:20:14\nNgười thêm: giangdt'),
	('giangdt', 'BLV001', '2017-03-29 13:21:03', 'Thêm mới thiết bị\n Mã thiết bị: BLV001\nTên thiết bị: Ram DDR2 Kingston\nNgày thêm: 2017-3-29 13:21:3\nNgười thêm: giangdt'),
	('giangdt', 'RAM018', '2017-03-29 13:21:54', 'Thêm mới thiết bị\n Mã thiết bị: RAM018\nTên thiết bị: Ram DDR2 Kingston\nNgày thêm: 2017-3-29 13:21:54\nNgười thêm: giangdt'),
	('giangdt', 'BLV002', '2017-03-29 13:22:39', 'Thêm mới thiết bị\n Mã thiết bị: BLV002\nTên thiết bị: Ram DDR2 Kingston\nNgày thêm: 2017-3-29 13:22:39\nNgười thêm: giangdt'),
	('giangdt', 'RAM019', '2017-03-29 13:24:02', 'Thêm mới thiết bị\n Mã thiết bị: RAM019\nTên thiết bị: Ram DDR3 GSKill\nNgày thêm: 2017-3-29 13:24:2\nNgười thêm: giangdt'),
	('giangdt', 'RAM020', '2017-03-29 13:24:39', 'Thêm mới thiết bị\n Mã thiết bị: RAM020\nTên thiết bị: Ram DDR3 HYNIX\nNgày thêm: 2017-3-29 13:24:39\nNgười thêm: giangdt'),
	('giangdt', 'RAM021', '2017-03-29 13:25:28', 'Thêm mới thiết bị\n Mã thiết bị: RAM021\nTên thiết bị: Ram DDR2 Kingston\nNgày thêm: 2017-3-29 13:25:28\nNgười thêm: giangdt'),
	('giangdt', 'CHA001', '2017-03-29 13:26:33', 'Thêm mới thiết bị\n Mã thiết bị: CHA001\nTên thiết bị: Sạc laptop SAMSUNG\nNgày thêm: 2017-3-29 13:26:33\nNgười thêm: giangdt'),
	('giangdt', 'SWT001', '2017-03-29 13:34:35', 'Thêm mới thiết bị\n Mã thiết bị: SWT001\nTên thiết bị: INFOSMART\nNgày thêm: 2017-3-29 13:34:35\nNgười thêm: giangdt'),
	('giangdt', 'SSWT002', '2017-03-29 13:35:46', 'Thêm mới thiết bị\n Mã thiết bị: SSWT002\nTên thiết bị: Modem\nNgày thêm: 2017-3-29 13:35:46\nNgười thêm: giangdt'),
	('giangdt', 'SSWT003', '2017-03-29 13:36:21', 'Thêm mới thiết bị\n Mã thiết bị: SSWT003\nTên thiết bị: TPLink 52 cổng\nNgày thêm: 2017-3-29 13:36:21\nNgười thêm: giangdt'),
	('giangdt', 'SSWT004', '2017-03-29 13:37:21', 'Thêm mới thiết bị\n Mã thiết bị: SSWT004\nTên thiết bị: Thiết bị chia nhánh màn hình\nNgày thêm: 2017-3-29 13:37:21\nNgười thêm: giangdt'),
	('giangdt', 'SSWT005', '2017-03-29 13:38:05', 'Thêm mới thiết bị\n Mã thiết bị: SSWT005\nTên thiết bị: Switch chia mạng\nNgày thêm: 2017-3-29 13:38:5\nNgười thêm: giangdt'),
	('giangdt', 'SWT001', '2017-03-29 13:38:21', 'Sửa thiết bị\n Mã thiết bị: SWT001\nTên thiết bị: INFOSMART\nNgày sửa: 2017-3-29 13:38:21\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'SWT001', '2017-03-29 13:38:36', 'Sửa thiết bị\n Mã thiết bị: SWT001\nTên thiết bị: INFOSMART\nNgày sửa: 2017-3-29 13:38:36\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'SSWT002', '2017-03-29 13:38:54', 'Sửa thiết bị\n Mã thiết bị: SSWT002\nTên thiết bị: Modem\nNgày sửa: 2017-3-29 13:38:54\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'SSWT003', '2017-03-29 13:39:02', 'Sửa thiết bị\n Mã thiết bị: SSWT003\nTên thiết bị: TPLink 52 cổng\nNgày sửa: 2017-3-29 13:39:2\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'SSWT004', '2017-03-29 13:39:14', 'Sửa thiết bị\n Mã thiết bị: SSWT004\nTên thiết bị: Thiết bị chia nhánh màn hình\nNgày sửa: 2017-3-29 13:39:14\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'SSWT006', '2017-03-29 13:39:54', 'Thêm mới thiết bị\n Mã thiết bị: SSWT006\nTên thiết bị: Switch chia mạng\nNgày thêm: 2017-3-29 13:39:54\nNgười thêm: giangdt'),
	('giangdt', 'SSWT007', '2017-03-29 13:40:31', 'Thêm mới thiết bị\n Mã thiết bị: SSWT007\nTên thiết bị: Switch chia mạng DLink\nNgày thêm: 2017-3-29 13:40:31\nNgười thêm: giangdt'),
	('giangdt', 'SSWT008', '2017-03-29 13:41:19', 'Thêm mới thiết bị\n Mã thiết bị: SSWT008\nTên thiết bị: Switch chia mạng\nNgày thêm: 2017-3-29 13:41:19\nNgười thêm: giangdt'),
	('giangdt', 'SSWT007', '2017-03-29 13:41:32', 'Sửa thiết bị\n Mã thiết bị: SSWT007\nTên thiết bị: Switch chia mạng DLink\nNgày sửa: 2017-3-29 13:41:32\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'SSWT009', '2017-03-29 13:42:14', 'Thêm mới thiết bị\n Mã thiết bị: SSWT009\nTên thiết bị: Switch chia mạng 5 cổng\nNgày thêm: 2017-3-29 13:42:14\nNgười thêm: giangdt'),
	('giangdt', 'SSWT010', '2017-03-29 13:42:52', 'Thêm mới thiết bị\n Mã thiết bị: SSWT010\nTên thiết bị: Adapter Cisco\nNgày thêm: 2017-3-29 13:42:52\nNgười thêm: giangdt'),
	('giangdt', 'SSWT011', '2017-03-29 13:43:45', 'Thêm mới thiết bị\n Mã thiết bị: SSWT011\nTên thiết bị: Switch chia mạng Dlink\nNgày thêm: 2017-3-29 13:43:45\nNgười thêm: giangdt'),
	('giangdt', 'SSWT012', '2017-03-29 13:44:44', 'Thêm mới thiết bị\n Mã thiết bị: SSWT012\nTên thiết bị: Switch chia mạng DLink\nNgày thêm: 2017-3-29 13:44:44\nNgười thêm: giangdt'),
	('giangdt', 'SSWT013', '2017-03-29 13:45:40', 'Thêm mới thiết bị\n Mã thiết bị: SSWT013\nTên thiết bị: Switch\nNgày thêm: 2017-3-29 13:45:40\nNgười thêm: giangdt'),
	('giangdt', 'SSWT014', '2017-03-29 13:46:14', 'Thêm mới thiết bị\n Mã thiết bị: SSWT014\nTên thiết bị: TPLink 4 cổng\nNgày thêm: 2017-3-29 13:46:14\nNgười thêm: giangdt'),
	('giangdt', 'SWT014', '2017-03-29 13:48:02', 'Thêm mới thiết bị\n Mã thiết bị: SWT014\nTên thiết bị: TPLink 4 cổng\nNgày thêm: 2017-3-29 13:48:2\nNgười thêm: giangdt'),
	('giangdt', 'SWT014', '2017-03-29 13:48:19', 'Sửa thiết bị\n Mã thiết bị: SWT014\nTên thiết bị: TPLink 4 cổng\nNgày sửa: 2017-3-29 13:48:19\nNgười sửa: giangdtNội dung sửa: '),
	('giangdt', 'ORR001', '2017-03-29 13:49:27', 'Thêm mới thiết bị\n Mã thiết bị: ORR001\nTên thiết bị: Divoom\nNgày thêm: 2017-3-29 13:49:27\nNgười thêm: giangdt'),
	('giangdt', 'WBC001', '2017-03-29 13:50:23', 'Thêm mới thiết bị\n Mã thiết bị: WBC001\nTên thiết bị: Webcam\nNgày thêm: 2017-3-29 13:50:23\nNgười thêm: giangdt'),
	('giangdt', 'SPK001', '2017-03-29 13:51:05', 'Thêm mới thiết bị\n Mã thiết bị: SPK001\nTên thiết bị: Loa VOIP CONFERENCE STATION\nNgày thêm: 2017-3-29 13:51:5\nNgười thêm: giangdt'),
	('giangdt', 'SSRM001', '2017-03-29 13:52:56', 'Thêm mới thiết bị\n Mã thiết bị: SSRM001\nTên thiết bị: Điều khiển điều hòa Daikin\nNgày thêm: 2017-3-29 13:52:56\nNgười thêm: giangdt'),
	('giangdt', 'SMIC001', '2017-03-29 13:53:35', 'Thêm mới thiết bị\n Mã thiết bị: SMIC001\nTên thiết bị: Micro Phone\nNgày thêm: 2017-3-29 13:53:35\nNgười thêm: giangdt'),
	('giangdt', 'SWBC002', '2017-03-29 13:54:58', 'Thêm mới thiết bị\n Mã thiết bị: SWBC002\nTên thiết bị: Thiết bị thu hình Sanwa\nNgày thêm: 2017-3-29 13:54:58\nNgười thêm: giangdt'),
	('thangnb', 'MSC001', '2017-03-29 14:08:49', 'Thêm mới thiết bị\n Mã thiết bị: MSC001\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:8:49\nNgười thêm: thangnb'),
	('thangnb', 'MSC002', '2017-03-29 14:11:31', 'Thêm mới thiết bị\n Mã thiết bị: MSC002\nTên thiết bị: Chuột Microsoft trắng\nNgày thêm: 2017-3-29 14:11:31\nNgười thêm: thangnb'),
	('thangnb', 'MSC003', '2017-03-29 14:16:48', 'Thêm mới thiết bị\n Mã thiết bị: MSC003\nTên thiết bị: Chuột Logitech\nNgày thêm: 2017-3-29 14:16:48\nNgười thêm: thangnb'),
	('thangnb', 'MSC004', '2017-03-29 14:17:53', 'Thêm mới thiết bị\n Mã thiết bị: MSC004\nTên thiết bị: Chuột Logitech\nNgày thêm: 2017-3-29 14:17:53\nNgười thêm: thangnb'),
	('thangnb', 'MSC003', '2017-03-29 14:18:09', 'Sửa thiết bị\n Mã thiết bị: MSC003\nTên thiết bị: Chuột Logitech\nNgày sửa: 2017-3-29 14:18:9\nNgười sửa: thangnbNội dung sửa: '),
	('thangnb', 'MSC005', '2017-03-29 14:19:11', 'Thêm mới thiết bị\n Mã thiết bị: MSC005\nTên thiết bị: Chuột Microsoft\nNgày thêm: 2017-3-29 14:19:11\nNgười thêm: thangnb'),
	('thangnb', 'MSC006', '2017-03-29 14:20:00', 'Thêm mới thiết bị\n Mã thiết bị: MSC006\nTên thiết bị: Chuột Microsoft\nNgày thêm: 2017-3-29 14:20:0\nNgười thêm: thangnb'),
	('thangnb', 'MSC007', '2017-03-29 14:21:00', 'Thêm mới thiết bị\n Mã thiết bị: MSC007\nTên thiết bị: Chuột Microsoft\nNgày thêm: 2017-3-29 14:21:0\nNgười thêm: thangnb'),
	('thangnb', 'MSC008', '2017-03-29 14:22:01', 'Thêm mới thiết bị\n Mã thiết bị: MSC008\nTên thiết bị: Chuột Logitech\nNgày thêm: 2017-3-29 14:22:1\nNgười thêm: thangnb'),
	('thangnb', 'MSC009', '2017-03-29 14:23:05', 'Thêm mới thiết bị\n Mã thiết bị: MSC009\nTên thiết bị: Chuột Microsoft\nNgày thêm: 2017-3-29 14:23:5\nNgười thêm: thangnb'),
	('thangnb', 'MSC010', '2017-03-29 14:24:09', 'Thêm mới thiết bị\n Mã thiết bị: MSC010\nTên thiết bị: Chuột Logitect\nNgày thêm: 2017-3-29 14:24:9\nNgười thêm: thangnb'),
	('thangnb', 'MSC011', '2017-03-29 14:25:11', 'Thêm mới thiết bị\n Mã thiết bị: MSC011\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:25:11\nNgười thêm: thangnb'),
	('thangnb', 'MSC012', '2017-03-29 14:25:55', 'Thêm mới thiết bị\n Mã thiết bị: MSC012\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:25:55\nNgười thêm: thangnb'),
	('thangnb', 'MSC013', '2017-03-29 14:26:46', 'Thêm mới thiết bị\n Mã thiết bị: MSC013\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:26:46\nNgười thêm: thangnb'),
	('thangnb', 'MSC014', '2017-03-29 14:27:36', 'Thêm mới thiết bị\n Mã thiết bị: MSC014\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:27:36\nNgười thêm: thangnb'),
	('thangnb', 'MSC015', '2017-03-29 14:28:30', 'Thêm mới thiết bị\n Mã thiết bị: MSC015\nTên thiết bị: Chuột Logitech\nNgày thêm: 2017-3-29 14:28:30\nNgười thêm: thangnb'),
	('thangnb', 'MSC016', '2017-03-29 14:29:19', 'Thêm mới thiết bị\n Mã thiết bị: MSC016\nTên thiết bị: Chuột Microsoft\nNgày thêm: 2017-3-29 14:29:19\nNgười thêm: thangnb'),
	('thangnb', 'MSC017', '2017-03-29 14:29:59', 'Thêm mới thiết bị\n Mã thiết bị: MSC017\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:29:59\nNgười thêm: thangnb'),
	('thangnb', 'MSC018', '2017-03-29 14:30:38', 'Thêm mới thiết bị\n Mã thiết bị: MSC018\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:30:38\nNgười thêm: thangnb'),
	('thangnb', 'MSC019', '2017-03-29 14:31:19', 'Thêm mới thiết bị\n Mã thiết bị: MSC019\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:31:19\nNgười thêm: thangnb'),
	('thangnb', 'MSC020', '2017-03-29 14:32:31', 'Thêm mới thiết bị\n Mã thiết bị: MSC020\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:32:31\nNgười thêm: thangnb'),
	('thangnb', 'MSC021', '2017-03-29 14:33:16', 'Thêm mới thiết bị\n Mã thiết bị: MSC021\nTên thiết bị: Chuột Logitect\nNgày thêm: 2017-3-29 14:33:16\nNgười thêm: thangnb'),
	('thangnb', 'MSC022', '2017-03-29 14:33:55', 'Thêm mới thiết bị\n Mã thiết bị: MSC022\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:33:55\nNgười thêm: thangnb'),
	('thangnb', 'MSC023', '2017-03-29 14:34:36', 'Thêm mới thiết bị\n Mã thiết bị: MSC023\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:34:36\nNgười thêm: thangnb'),
	('thangnb', 'MSC024', '2017-03-29 14:35:23', 'Thêm mới thiết bị\n Mã thiết bị: MSC024\nTên thiết bị: CHuột DELL\nNgày thêm: 2017-3-29 14:35:23\nNgười thêm: thangnb'),
	('thangnb', 'MSC025', '2017-03-29 14:36:04', 'Thêm mới thiết bị\n Mã thiết bị: MSC025\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:36:4\nNgười thêm: thangnb'),
	('thangnb', 'MSC026', '2017-03-29 14:36:46', 'Thêm mới thiết bị\n Mã thiết bị: MSC026\nTên thiết bị: Chuột Logitect\nNgày thêm: 2017-3-29 14:36:46\nNgười thêm: thangnb'),
	('thangnb', 'MSC027', '2017-03-29 14:37:26', 'Thêm mới thiết bị\n Mã thiết bị: MSC027\nTên thiết bị: Chuột Logitect\nNgày thêm: 2017-3-29 14:37:26\nNgười thêm: thangnb'),
	('thangnb', 'MSC028', '2017-03-29 14:38:23', 'Thêm mới thiết bị\n Mã thiết bị: MSC028\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:38:23\nNgười thêm: thangnb'),
	('thangnb', 'MSC029', '2017-03-29 14:38:58', 'Thêm mới thiết bị\n Mã thiết bị: MSC029\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:38:58\nNgười thêm: thangnb'),
	('thangnb', 'MSC030', '2017-03-29 14:39:37', 'Thêm mới thiết bị\n Mã thiết bị: MSC030\nTên thiết bị: Chuột IBM\nNgày thêm: 2017-3-29 14:39:37\nNgười thêm: thangnb'),
	('thangnb', 'MSC031', '2017-03-29 14:40:18', 'Thêm mới thiết bị\n Mã thiết bị: MSC031\nTên thiết bị: Chuột Microsoft\nNgày thêm: 2017-3-29 14:40:18\nNgười thêm: thangnb'),
	('thangnb', 'MSC032', '2017-03-29 14:40:56', 'Thêm mới thiết bị\n Mã thiết bị: MSC032\nTên thiết bị: Chuột Microsoft\nNgày thêm: 2017-3-29 14:40:56\nNgười thêm: thangnb'),
	('thangnb', 'MSC033', '2017-03-29 14:41:29', 'Thêm mới thiết bị\n Mã thiết bị: MSC033\nTên thiết bị: Chuột DELL\nNgày thêm: 2017-3-29 14:41:29\nNgười thêm: thangnb'),
	('thangnb', 'AFU001', '2017-03-29 14:44:40', 'Thêm mới thiết bị\n Mã thiết bị: AFU001\nTên thiết bị: Máy lọc không khí Sharp FU-A80\nNgày thêm: 2017-3-29 14:44:40\nNgười thêm: thangnb'),
	('thangnb', 'PRJ001', '2017-03-29 14:45:26', 'Thêm mới thiết bị\n Mã thiết bị: PRJ001\nTên thiết bị: Máy chiếu Panasonic\nNgày thêm: 2017-3-29 14:45:26\nNgười thêm: thangnb'),
	('thangnb', 'AFU002', '2017-03-29 14:46:07', 'Thêm mới thiết bị\n Mã thiết bị: AFU002\nTên thiết bị: Máy lọc không khí Sharp\nNgày thêm: 2017-3-29 14:46:7\nNgười thêm: thangnb'),
	('thangnb', 'PRT001', '2017-03-29 14:46:59', 'Thêm mới thiết bị\n Mã thiết bị: PRT001\nTên thiết bị: Máy in HP laser Jet 1320n\nNgày thêm: 2017-3-29 14:46:59\nNgười thêm: thangnb'),
	('thangnb', 'SHR001', '2017-03-29 14:47:42', 'Thêm mới thiết bị\n Mã thiết bị: SHR001\nTên thiết bị: Máy hủy tài liệu Primo\nNgày thêm: 2017-3-29 14:47:42\nNgười thêm: thangnb'),
	('thangnb', 'HEA001', '2017-03-29 14:48:27', 'Thêm mới thiết bị\n Mã thiết bị: HEA001\nTên thiết bị: Máy sưởi Halogen Heater\nNgày thêm: 2017-3-29 14:48:27\nNgười thêm: thangnb'),
	('thangnb', 'PRT002', '2017-03-29 14:49:14', 'Thêm mới thiết bị\n Mã thiết bị: PRT002\nTên thiết bị: Máy in HP-laser Jet M1319f MFP\nNgày thêm: 2017-3-29 14:49:14\nNgười thêm: thangnb'),
	('thangnb', 'MCW001', '2017-03-29 14:49:49', 'Thêm mới thiết bị\n Mã thiết bị: MCW001\nTên thiết bị: Lò vi sóng Sharp\nNgày thêm: 2017-3-29 14:49:49\nNgười thêm: thangnb'),
	('thangnb', 'FRD001', '2017-03-29 14:50:23', 'Thêm mới thiết bị\n Mã thiết bị: FRD001\nTên thiết bị: Tủ lạnh Sharp\nNgày thêm: 2017-3-29 14:50:23\nNgười thêm: thangnb'),
	('thangnb', 'MCC001', '2017-03-29 14:51:30', 'Thêm mới thiết bị\n Mã thiết bị: MCC001\nTên thiết bị: Máy chấm công vân tay\nNgày thêm: 2017-3-29 14:51:30\nNgười thêm: thangnb'),
	('thangnb', 'SPRJ002', '2017-03-29 14:52:26', 'Thêm mới thiết bị\n Mã thiết bị: SPRJ002\nTên thiết bị: Máy chiếu\nNgày thêm: 2017-3-29 14:52:26\nNgười thêm: thangnb'),
	('thangnb', 'HEA002', '2017-03-29 14:53:29', 'Thêm mới thiết bị\n Mã thiết bị: HEA002\nTên thiết bị: Máy sưởi dầu NONAN\nNgày thêm: 2017-3-29 14:53:29\nNgười thêm: thangnb'),
	('thangnb', 'FAN001', '2017-03-29 14:54:12', 'Thêm mới thiết bị\n Mã thiết bị: FAN001\nTên thiết bị: Quạt điện cơ 91\nNgày thêm: 2017-3-29 14:54:12\nNgười thêm: thangnb'),
	('thangnb', 'AFU003', '2017-03-29 14:54:53', 'Thêm mới thiết bị\n Mã thiết bị: AFU003\nTên thiết bị: Máy lọc không khí Sharp\nNgày thêm: 2017-3-29 14:54:53\nNgười thêm: thangnb'),
	('thangnb', 'DIS001', '2017-03-29 14:55:55', 'Thêm mới thiết bị\n Mã thiết bị: DIS001\nTên thiết bị: Cây nước nóng lạnh\nNgày thêm: 2017-3-29 14:55:55\nNgười thêm: thangnb'),
	('thangnb', 'FAN002', '2017-03-29 14:56:30', 'Thêm mới thiết bị\n Mã thiết bị: FAN002\nTên thiết bị: Quạt Seiko\nNgày thêm: 2017-3-29 14:56:30\nNgười thêm: thangnb'),
	('thangnb', 'TIV001', '2017-03-29 14:59:01', 'Thêm mới thiết bị\n Mã thiết bị: TIV001\nTên thiết bị: Tivi Sony 43"\nNgày thêm: 2017-3-29 14:59:1\nNgười thêm: thangnb'),
	('thangnb', 'TIV002', '2017-03-29 14:59:40', 'Thêm mới thiết bị\n Mã thiết bị: TIV002\nTên thiết bị: Tivi Sony 40"\nNgày thêm: 2017-3-29 14:59:40\nNgười thêm: thangnb'),
	('thangnb', 'SRM002', '2017-03-29 15:00:17', 'Thêm mới thiết bị\n Mã thiết bị: SRM002\nTên thiết bị: Điều khiển điều hòa\nNgày thêm: 2017-3-29 15:0:17\nNgười thêm: thangnb'),
	('thangnb', 'UPS001', '2017-03-29 15:01:21', 'Thêm mới thiết bị\n Mã thiết bị: UPS001\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:1:21\nNgười thêm: thangnb'),
	('thangnb', 'UPS002', '2017-03-29 15:02:07', 'Thêm mới thiết bị\n Mã thiết bị: UPS002\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:2:7\nNgười thêm: thangnb'),
	('thangnb', 'UPS003', '2017-03-29 15:03:00', 'Thêm mới thiết bị\n Mã thiết bị: UPS003\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:3:0\nNgười thêm: thangnb'),
	('thangnb', 'UPS004', '2017-03-29 15:03:46', 'Thêm mới thiết bị\n Mã thiết bị: UPS004\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:3:46\nNgười thêm: thangnb'),
	('thangnb', 'UPS003', '2017-03-29 15:03:56', 'Sửa thiết bị\n Mã thiết bị: UPS003\nTên thiết bị: Bộ lưu điện Santak\nNgày sửa: 2017-3-29 15:3:56\nNgười sửa: thangnbNội dung sửa: '),
	('thangnb', 'UPS005', '2017-03-29 15:04:31', 'Thêm mới thiết bị\n Mã thiết bị: UPS005\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:4:31\nNgười thêm: thangnb'),
	('thangnb', 'UPS006', '2017-03-29 15:05:25', 'Thêm mới thiết bị\n Mã thiết bị: UPS006\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:5:25\nNgười thêm: thangnb'),
	('thangnb', 'UPS007', '2017-03-29 15:06:24', 'Thêm mới thiết bị\n Mã thiết bị: UPS007\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:6:24\nNgười thêm: thangnb'),
	('thangnb', 'UPS008', '2017-03-29 15:07:34', 'Thêm mới thiết bị\n Mã thiết bị: UPS008\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:7:34\nNgười thêm: thangnb'),
	('thangnb', 'UPS009', '2017-03-29 15:08:11', 'Thêm mới thiết bị\n Mã thiết bị: UPS009\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:8:11\nNgười thêm: thangnb'),
	('thangnb', 'UPS010', '2017-03-29 15:09:01', 'Thêm mới thiết bị\n Mã thiết bị: UPS010\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:9:1\nNgười thêm: thangnb'),
	('thangnb', 'UPS011', '2017-03-29 15:09:42', 'Thêm mới thiết bị\n Mã thiết bị: UPS011\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:9:42\nNgười thêm: thangnb'),
	('thangnb', 'UPS012', '2017-03-29 15:10:25', 'Thêm mới thiết bị\n Mã thiết bị: UPS012\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:10:25\nNgười thêm: thangnb'),
	('thangnb', 'UPS013', '2017-03-29 15:11:12', 'Thêm mới thiết bị\n Mã thiết bị: UPS013\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:11:12\nNgười thêm: thangnb'),
	('thangnb', 'UPS014', '2017-03-29 15:11:39', 'Thêm mới thiết bị\n Mã thiết bị: UPS014\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:11:39\nNgười thêm: thangnb'),
	('thangnb', 'UPS015', '2017-03-29 15:12:47', 'Thêm mới thiết bị\n Mã thiết bị: UPS015\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:12:47\nNgười thêm: thangnb'),
	('thangnb', 'UPS016', '2017-03-29 15:13:29', 'Thêm mới thiết bị\n Mã thiết bị: UPS016\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:13:29\nNgười thêm: thangnb'),
	('thangnb', 'UPS017', '2017-03-29 15:14:02', 'Thêm mới thiết bị\n Mã thiết bị: UPS017\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:14:2\nNgười thêm: thangnb'),
	('thangnb', 'UPS018', '2017-03-29 15:14:43', 'Thêm mới thiết bị\n Mã thiết bị: UPS018\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:14:43\nNgười thêm: thangnb'),
	('thangnb', 'UPS019', '2017-03-29 15:15:19', 'Thêm mới thiết bị\n Mã thiết bị: UPS019\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:15:19\nNgười thêm: thangnb'),
	('thangnb', 'UPS020', '2017-03-29 15:15:52', 'Thêm mới thiết bị\n Mã thiết bị: UPS020\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:15:52\nNgười thêm: thangnb'),
	('thangnb', 'UPS021', '2017-03-29 15:16:22', 'Thêm mới thiết bị\n Mã thiết bị: UPS021\nTên thiết bị: Bộ lưu điện Santak\nNgày thêm: 2017-3-29 15:16:22\nNgười thêm: thangnb'),
	('thangnb', 'UPS022', '2017-03-29 15:17:22', 'Thêm mới thiết bị\n Mã thiết bị: UPS022\nTên thiết bị: Bộ lưu điện Santak Online 2KVA\nNgày thêm: 2017-3-29 15:17:22\nNgười thêm: thangnb'),
	('thangnb', 'SSWT014', '2017-03-29 15:19:28', 'Xóa tài sản có mã SSWT014. Duyệt bởi thangnb vào lúc 2017-3-29 15:19:28'),
	('thangnb', 'BLV002', '2017-03-29 15:19:28', 'Xóa tài sản có mã BLV002. Duyệt bởi thangnb vào lúc 2017-3-29 15:19:28'),
	('thangnb', 'BLV001', '2017-03-29 15:19:28', 'Xóa tài sản có mã BLV001. Duyệt bởi thangnb vào lúc 2017-3-29 15:19:28');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping structure for table asset.productions
CREATE TABLE IF NOT EXISTS `productions` (
  `production_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `production_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`production_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.productions: ~0 rows (approximately)
/*!40000 ALTER TABLE `productions` DISABLE KEYS */;
/*!40000 ALTER TABLE `productions` ENABLE KEYS */;

-- Dumping structure for procedure asset.removeAllRoleByGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `removeAllRoleByGroup`(group_id INT(4))
BEGIN
	DELETE FROM groups_roles WHERE groups_roles.group_id = group_id;
END//
DELIMITER ;

-- Dumping structure for procedure asset.removeUserByGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `removeUserByGroup`(group_id INT(4))
BEGIN
	DELETE FROM groups_users
    WHERE groups_users.group_id = group_id;
END//
DELIMITER ;

-- Dumping structure for procedure asset.removeUserById
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `removeUserById`(
	IN `group_id` TINYINT(4),
	IN `arr_id` VARCHAR(200)
)
BEGIN
	DELETE FROM groups_users
	WHERE groups_users.group_id = group_id AND FIND_IN_SET(groups_users.user_id, arr_id);
END//
DELIMITER ;

-- Dumping structure for table asset.requests
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
  `buy_date` datetime NOT NULL,
  `waranty_date` datetime NOT NULL,
  `price` int(11) NOT NULL,
  `production_id` tinyint(4) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
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
  `requested_by` int(11) NOT NULL,
  `ref02` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref03` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref04` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ref05` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.requests: ~0 rows (approximately)
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
REPLACE INTO `requests` (`request_id`, `hardware_id`, `hardware_id_lu`, `barcode`, `serial`, `hardware_name`, `os`, `supplier`, `category_id`, `buy_date`, `waranty_date`, `price`, `production_id`, `description`, `status`, `user_id`, `depreciated_months`, `expired_date`, `allocated_retrieved_at`, `hw_note`, `request_note`, `hw_created_at`, `hw_updated_at`, `hw_deleted_at`, `hw_deleted_flag`, `requested_by`, `ref02`, `ref03`, `ref04`, `ref05`, `request_status`, `created_at`) VALUES
	(1, 'MOR001', '', '', '', 'Màn hình DELL 21 inch', '', 'Unknow', 'MOR', '2013-01-14 00:00:00', '2013-01-14 00:00:00', 0, NULL, 'Chi tiết: MN58\nMã TSCĐ: MVT58', 5, NULL, 0, '2013-01-31 00:00:00', '0000-00-00 00:00:00', '', '', '2017-03-29 09:14:50', NULL, NULL, 0, 7, NULL, NULL, NULL, NULL, 1, '2017-03-29 09:19:57'),
	(2, 'MOR002', '', '', '', 'Màn hình SAMSUNG 17 inch', '', 'Unknow', 'MOR', '2008-02-12 00:00:00', '2008-02-12 00:00:00', 0, NULL, 'Chi tiết: MN29; Mã TSCĐ: MVT29', 5, NULL, 0, '2008-02-29 00:00:00', '0000-00-00 00:00:00', '', '', '2017-03-29 09:19:28', NULL, NULL, 0, 7, NULL, NULL, NULL, NULL, 1, '2017-03-29 09:20:02'),
	(3, 'SMOR044', '', '', '', 'Màn hình DELL 21 inch', '', 'Unknow', 'MOR', '2013-01-14 00:00:00', '2013-01-14 00:00:00', 0, NULL, 'Chi tiết: MN58;\nMã TSCĐ: MVT58', 5, NULL, 0, '2013-01-31 00:00:00', '0000-00-00 00:00:00', '', '', '2017-03-29 09:20:57', NULL, NULL, 0, 7, NULL, NULL, NULL, NULL, 1, '2017-03-29 09:23:43'),
	(4, 'SMOR002', '', '', '', 'Màn hình SAMSUNG 17 inch', '', 'Unknow', 'MOR', '2008-02-12 00:00:00', '2008-02-12 00:00:00', 0, NULL, 'Chi tiết: MN29;\nMã TSCĐ: MVT29', 5, NULL, 0, '2008-02-29 00:00:00', '0000-00-00 00:00:00', '', '', '2017-03-29 09:22:17', NULL, NULL, 0, 7, NULL, NULL, NULL, NULL, 1, '2017-03-29 09:23:47'),
	(5, 'SMOR001', '', '', '', 'Màn hình Samsung 17 inch', '', 'Unknow', 'MOR', '2011-11-15 00:00:00', '2011-11-15 00:00:00', 0, NULL, 'Chi tiết: MN41;\nMã TSCĐ: MVT41', 5, NULL, 0, '2011-11-30 00:00:00', '0000-00-00 00:00:00', '', '', '2017-03-29 09:23:07', NULL, NULL, 0, 7, NULL, NULL, NULL, NULL, 1, '2017-03-29 09:23:50'),
	(6, 'BLV001', '', 'KT0004V12I08', '', 'Ram DDR2 Kingston', '', 'Unknow', 'BLV', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 5, NULL, 0, '2011-01-31 00:00:00', '0000-00-00 00:00:00', '', '', '2017-03-29 13:21:03', NULL, NULL, 0, 7, NULL, NULL, NULL, NULL, 1, '2017-03-29 13:21:58'),
	(7, 'BLV002', '', 'KT0004V12I08', '', 'Ram DDR2 Kingston', '', 'Unknow', 'BLV', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Loại RAM: DDR2\nDung lượng: 2GB', 5, NULL, 0, '2011-01-31 00:00:00', '0000-00-00 00:00:00', '', '', '2017-03-29 13:22:39', NULL, NULL, 0, 7, NULL, NULL, NULL, NULL, 1, '2017-03-29 13:25:36'),
	(8, 'SSWT014', '', '', '11176423843', 'TPLink 4 cổng', '', 'Unknow', 'SWT', '2011-01-01 00:00:00', '2011-01-01 00:00:00', 0, NULL, 'Model: TL-SF1005D', 5, NULL, 0, '2011-01-31 00:00:00', '0000-00-00 00:00:00', 'Màu trắng', '', '2017-03-29 13:46:14', NULL, NULL, 0, 7, NULL, NULL, NULL, NULL, 1, '2017-03-29 13:46:49');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;

-- Dumping structure for procedure asset.restoreDeletedGroup
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `restoreDeletedGroup`(group_name VARCHAR(255))
BEGIN
	UPDATE groups SET groups.deleted_flag = 0
	WHERE groups.group_name = group_name;
END//
DELIMITER ;

-- Dumping structure for procedure asset.retrieveHardware
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `retrieveHardware`(
					   hardwareId VARCHAR(10), 
					   retrievedDate DATETIME, 
					   retrievedReason TEXT, 
					   updatedAt DATETIME
				   )
BEGIN
	UPDATE hardware_management 
	SET retrieved_date = retrievedDate, note = CONCAT(note, '\n', retrievedReason), updated_at = updatedAt
	WHERE hardware_id = hardwareId;
END//
DELIMITER ;

-- Dumping structure for procedure asset.reUpdateCategory
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `reUpdateCategory`(categoryId VARCHAR(10), categoryName VARCHAR(255) CHARACTER SET utf8, updatedAt DATETIME)
BEGIN  
	UPDATE categories
    SET category_name = categoryName, updated_at = updatedAt, deleted_flag = 0
	WHERE category_id = categoryId;
END//
DELIMITER ;

-- Dumping structure for table asset.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `link` varchar(255) CHARACTER SET latin1 NOT NULL,
  `method` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.roles: ~5 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id`, `role_name`, `description`, `link`, `method`, `created_at`, `updated_at`, `deleted_at`, `deleted_flag`) VALUES
	(1, 'Thêm thiết bị', 'Thêm mới thiết bị', '/hardwares/add-new-hardware', 'GET,POST', NULL, NULL, NULL, 0),
	(2, 'Sửa thiết bị', 'Sửa thông tin thiết bị', '/hardwares/edit', 'GET,POST', NULL, NULL, NULL, 0),
	(3, 'Xóa thiết bị', 'Xóa thiết bị', '/hardwares/delete', 'POST', NULL, NULL, NULL, 0),
	(4, 'Duyệt thiết bị', 'Duyệt thiết bị', '/hardwares/pending', '', NULL, NULL, NULL, 0),
	(7, 'Phân quyền', 'Phân quyền nhóm người dùng', '/permission', 'GET,POST', NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for procedure asset.setApprovedRequest
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `setApprovedRequest`(hardwareId VARCHAR(10))
BEGIN 
	UPDATE requests
	SET request_status = 1
	WHERE hardware_id = hardwareId
    AND request_status = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.setRejectedRequest
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `setRejectedRequest`(hardwareId VARCHAR(10))
BEGIN 
	UPDATE requests
	SET request_status = 2
    WHERE hardware_id = hardwareId
    AND request_status = 0;
END//
DELIMITER ;

-- Dumping structure for procedure asset.updateHardwareStatus
DELIMITER //
CREATE DEFINER=`assetadmin`@`%` PROCEDURE `updateHardwareStatus`(
					   hardwareId VARCHAR(10), 
					   hwStatus TINYINT, 
					   updatedAt DATETIME
				   )
BEGIN
	UPDATE hardwares 
	SET status = hwStatus, updated_at = updatedAt
	WHERE hardware_id = hardwareId;
END//
DELIMITER ;

-- Dumping structure for table asset.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- Dumping data for table asset.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `user_id`, `full_name`, `username`, `password`, `department`, `email`, `phone`, `skype`, `created_at`, `updated_at`, `deleted_at`, `deleted_flag`) VALUES
	(1, 'superadmin', 'superadmin', 'superadmin', '32250170a0dca92d53ec9624f336ca24', 'admin', 'superadmin@ruby.com', '123123', '123', NULL, NULL, NULL, 0),
	(2, '', 'Nguyễn Bảo Thắng', 'thangnb', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'nguyenbaothang@luvina.jp', '', '', '2017-03-28 13:42:53', '2017-03-28 13:42:53', NULL, 1),
	(3, '', 'Nguyễn Bảo Thắng', 'thangnb', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'nguyenbaothang@luvina.jp', '', '', '2017-03-28 13:48:12', '2017-03-28 13:51:24', NULL, 0),
	(4, 'nghiadt', 'nghiadt', 'nghiadt', 'd41d8cd98f00b204e9800998ecf8427e', 'developers', 'nghiadt@gmail.com', '016674647072', '', '2017-03-28 13:58:21', '2017-03-29 08:27:49', NULL, 0),
	(5, NULL, 'sonnv', 'sonnv', 'd41d8cd98f00b204e9800998ecf8427e', 'developers', 'ngoson11.33@gmail.com', '', '', '2017-03-29 08:21:24', '2017-03-29 08:24:38', NULL, 0),
	(6, NULL, 'vuongnm', 'vuongnm', 'd41d8cd98f00b204e9800998ecf8427e', 'developers', 'vuongnguyenhsgs@gmail.com', '', '', '2017-03-29 08:25:55', '2017-03-29 08:27:22', NULL, 0),
	(7, NULL, 'giangdt', 'giangdt', 'febc4bab4a6273239df4c4c529e09e34', 'admin', 'dangthigiang@luvina.jp', '', '', '2017-03-29 08:27:06', '2017-03-29 08:27:06', NULL, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

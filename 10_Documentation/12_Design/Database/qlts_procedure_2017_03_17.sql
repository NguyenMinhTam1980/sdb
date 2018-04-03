/* ************************************** */
/* ---------- Tạo các thủ tục ----------- */
/* ************************************** */

DELIMITER //

-- -------------------------------------- --
-- ---- Thao tác với bảng categories ---- --
-- -------------------------------------- --

/* Xóa thủ tục getAllCategories */
DROP PROCEDURE IF EXISTS `getAllCategories`; //

/* 
 * Lấy ra tất cả các loại tài sản chưa bị xóa (để hiển thị trong combobox Loại tài sản)
 * NghiaDT
*/
CREATE  PROCEDURE `getAllCategories`()
BEGIN 
	SELECT category_id, category_name	
    FROM categories
    WHERE deleted_flag = 0
    ORDER BY updated_at DESC;
END //

/* Xóa thủ tục getListCategories */
DROP PROCEDURE IF EXISTS `getListCategories` //

/* 
 * Lấy ra danh sách loại tài sản theo điều kiện và có phân trang
 * Truyền vào cateLimit: số bản ghi/trang
 * Truyền vào cateOffset: bản ghi bắt đầu của danh sách
 * NghiaDT
 */
CREATE  PROCEDURE `getListCategories`(cateLimit INT(10), cateOffset INT(10))
BEGIN 
	SELECT category_id, category_name
    FROM categories
    WHERE deleted_flag = 0
    ORDER BY updated_at DESC
    LIMIT cateLimit
    OFFSET cateOffset;
END //

/* Xóa thủ tục addNewCategory */
DROP PROCEDURE IF EXISTS `addNewCategory` //

/*
 * Thêm một loại tài sản
 * Truyền vào categoryId: mã loại tài sản
 * Truyền vào categoryName: tên loại tài sản (kiểu utf8)
 * Truyền vào createdAt: thời gian thêm loại tài sản
 * Truyền vào updatedAt: ngày giờ cập nhật thông tin loại tài sản
 * NghiaDT
 */
CREATE  PROCEDURE `addNewCategory`(
				       categoryId VARCHAR(10), 
					   categoryName VARCHAR(255) CHARSET UTF8, 
					   createdAt DATETIME,  
					   updatedAt DATETIME  
				   )
BEGIN
	INSERT INTO categories(category_id, category_name, created_at, updated_at)
    VALUES(categoryId, categoryName, createdAt, updatedAt);
END //

/* Xóa thủ tục editCategory */
DROP PROCEDURE IF EXISTS `editCategory` //

/*
 * Sửa thông tin một loại tài sản
 * Truyền vào categoryId: mã loại tài sản
              categoryName: tên loại tài sản (kiểu utf8)
              updatedAt: ngày cập nhật loại tài sản
 * Trả về TRUE - cập nhật thành công
 * Trả về FALSE - cập nhật không thành công
 * NghiaDT
 */
CREATE  PROCEDURE `editCategory`(
				       categoryId VARCHAR(10),
					   categoryName VARCHAR(255) CHARSET UTF8, 
					   updatedAt DATETIME  
				   )
BEGIN
	UPDATE categories
    SET category_name = categoryName, updated_at = updatedAt
    WHERE category_id = categoryId;
END //

/* Xóa thủ tục getCategoryById */
DROP PROCEDURE IF EXISTS `getCategoryById` //

/*
 * Lấy ra một loại tài sản theo id
 * Truyền vào categoryId mã loại tài sản
 * Trả về danh sách loại tài sản có category_id bằng giá trị truyền vào
 * VuongNM
 */
CREATE  PROCEDURE `getCategoryById`(
					   categoryId VARCHAR(10)
				   )
BEGIN
	SELECT categories.category_id, categories.category_name
	FROM categories
	WHERE categories.category_id = categoryId
    AND categories.deleted_flag = 0;
END//

/* Xóa thủ tục deleteCategory */
DROP PROCEDURE IF EXISTS `deleteCategory` //
/*
 * Xóa một loại tài sản
 * Truyền vào deletedAt: ngày xóa loại tài sản
 * Truyền vào categoryId: mã loại tài sản
 * Trả về TRUE: xóa thành công loại tài sản
          FALSE: không xóa được loại tài sản
 * NghiaDT
 */
CREATE  PROCEDURE `deleteCategory`(deletedAt DATETIME, categoryId VARCHAR(10))
BEGIN    
    UPDATE categories
    SET deleted_flag = 1, deleted_at = deletedAt
    WHERE category_id = categoryId
    AND deleted_flag = 0;     
END//

/* Xóa thủ tục isCategoryExisted */
DROP PROCEDURE IF EXISTS isCategoryExisted //

/*
 * Kiểm tra xem loại tài sản đã được xóa hay chưa
 * Truyền vào categoryId VARCHAR(10) - mã loại tài sản
 * Trả về deleted_flag của mã tài sản truyền vào
 * NghiaDT
 */
CREATE PROCEDURE `isCategoryExisted`(categoryId VARCHAR(10))
BEGIN
	SELECT deleted_flag as flag FROM categories 
	WHERE categories.category_id = categoryId;
END //

/* Xóa thủ tục reUpdateCategory */
DROP PROCEDURE IF EXISTS `reUpdateCategory` //

/* 
 * Cập nhật lại thông tin loại thiết bị khi thêm mới một loại thiết bị đã bị xóa
 * Truyền vào thông tin của loại thiết bị: mã loại, tên loại, ngày cập nhật thông tin
 * Trả về TRUE nếu cập nhật thành công, FALSE nếu không thành công
 * NghiaDT 
 */
CREATE  PROCEDURE `reUpdateCategory`(categoryId VARCHAR(10), categoryName VARCHAR(255) CHARACTER SET utf8, updatedAt DATETIME)
BEGIN  
	UPDATE categories
    SET category_name = categoryName, updated_at = updatedAt, deleted_flag = 0
	WHERE category_id = categoryId;
END//

/* Xóa thủ tục getTotalCategories */
DROP PROCEDURE IF EXISTS `getTotalCategories` //

/* Lấy ra tổng số loại thiết bị chưa bị xóa (để phân trang ở màn hình danh sách loại tài sản)
 * Trả về tổng số loại thiết bị chưa xóa
 * NghiaDT
 */
CREATE  PROCEDURE `getTotalCategories`()
BEGIN 
	SELECT COUNT(category_id) as total
    FROM categories
	WHERE deleted_flag = 0;
END//


-- -------------------------------------- --
-- ----Thao tác với bảng productions ---- --

/* Xóa thủ tục addNewProduction */
DROP PROCEDURE IF EXISTS `addNewProduction` //

/* 
 * Thêm một hãng sản xuất
 * Truyền vào productionName: tên của hãng cần thêm (kiểu utf8)
 *            created_time: ngày giờ thêm 
 * Trả về TRUE nếu thêm hãng thành công, FALSE nếu thêm không thành công
 * VuongNM
 */
CREATE  PROCEDURE `addNewProduction`(productionName  VARCHAR(255) CHARACTER SET utf8, created_time DATETIME)
BEGIN
	INSERT INTO productions(production_name, created_at) VALUES (productionName, created_time);
END//

/* Xóa thủ tục getProductionByName */
DROP PROCEDURE IF EXISTS `getProductionByName` //

/* 
 * Lấy ra thông tin hãng sản xuất
 * Truyền vào productionName: tên của hãng sản xuất
 * Trả về danh sách hãng có tên truyền vào
 * VuongNM
 */
CREATE  PROCEDURE `getProductionByName`(productionName VARCHAR(255))
BEGIN
	SELECT production_id, production_name FROM productions
	WHERE production_name = productionName AND deleted_flag = '0';
END//


-- ------------------------------------- --
-- ---- Thao tác với bảng hardwares ---- --

/* Xóa thủ tục restoreHardware*/
DROP PROCEDURE IF EXISTS restoreHardware //

/*
 * Phục hồi tài sản đã bị xóa
 * Truyền vào hardwareId: mã tài sản
			  statusAfter: trạng thái sau khi phục hồi
			  currentTime: thời gian thực hiện
 * Trả về true nếu phục hồi thành công, false nếu phục hồi thất bại
 */
 CREATE PROCEDURE restoreHardware(hardwareId VARCHAR(10), statusAfter TINYINT(1), currentTime DATETIME) 
 BEGIN 
	UPDATE hardwares
    SET status = statusAfter, deleted_flag = 0, updated_at = currentTime
    WHERE hardware_id = hardwareId;
 END //
 
/* Xóa thủ tục getHardwareIdByCategoryId */
DROP PROCEDURE IF EXISTS getHardwareIdByCategoryId //

/*
 * Tìm mã tài sản thuộc loại tài sản cho trước
 * Truyền vào categoryId INT(11) - Mã loại tài sản
 * Trả về danh sách mã tài sản có category_id là mã loại truyền vào 
 * NghiaDT
 */
CREATE PROCEDURE getHardwareIdByCategoryId(categoryId VARCHAR(10))
BEGIN
	SELECT hardware_id
	FROM hardwares hw
	WHERE hw.deleted_flag = 0
	AND hw.category_id = categoryId;
END; //

/* Xóa thủ tục deleteHardware */
DROP PROCEDURE IF EXISTS `deleteHardware` //

/*
 * Xóa một thiết bị có mã tương ứng
 * Truyền vào mã thiết bị và giờ xóa thiết bị
 * Trả về TRUE nếu xóa thành công, FALSE nếu xóa không thành công
 * NghiaDT
 */
CREATE  PROCEDURE `deleteHardware`(hardwareId VARCHAR(10), deletedAt DATETIME)
BEGIN
	UPDATE hardwares
	SET status = 6, deleted_flag = 1, deleted_at = deletedAt
	WHERE hardware_id = hardwareId;
END//

/* Xóa thủ tục getAllHardwareStatus */
DROP PROCEDURE IF EXISTS `getAllHardwareStatus` //

/*
 * Lấy ra danh sách trạng thái thiết bị (đổ vào combobox)
 * Trả vè danh sách trạng thái thiết bị
 * NghiaDT
 */
CREATE  PROCEDURE `getAllHardwareStatus`()
BEGIN
	SELECT hw.status
    FROM hardwares hw
    GROUP BY hw.status;
END//

/* Xóa thủ tục getHardwareByHardwareId */
DROP PROCEDURE IF EXISTS `getHardwareByHardwareId` //

/*
 * Lấy thông tin của thiết bị (để đưa vào bảng requests)
 * Truyền vào hardwareId: mã của thiết bị
 * Trả về danh sách thiết bị có mã truyền vào
 * NghiaDT
 */
CREATE  PROCEDURE `getHardwareByHardwareId`(hardwareId VARCHAR(10))
BEGIN 
SELECT 	hardware_id, hardware_id_lu, barcode, serial, hardware_name, 
		os, supplier, category_id, buy_date, waranty_date, price, production_id, description, 
		status, depreciated_months, expired_date, note, 
		created_at, updated_at, deleted_at, deleted_flag
FROM hardwares
WHERE hardware_id = hardwareId;
END//

/* Xóa thủ tục getHardwareDetailById */
DROP PROCEDURE IF EXISTS `getHardwareDetailById` //

/*
 * Lấy ra thông tin chi tiết của thiết bị (để hiển thị lên popup)
 * Truyền vào hardwareId - mã thiết bị
 * Trả về thông tin chi tiết của thiết bị có mã truyền vào
 * NghiaDT
 */
CREATE  PROCEDURE `getHardwareDetailById`(hardwareId VARCHAR(10))
BEGIN
	SELECT  hw.hardware_id, hw.category_id, hw.hardware_id_lu, hw.barcode, hw.hardware_name, cate.category_name, hw.os, hw. supplier, 
    DATE_FORMAT(hw.buy_date, '%d/%m/%Y') AS buy_date, DATE_FORMAT(hw.waranty_date,'%d/%m/%Y') AS waranty_date, hw.serial,
    hw.price, pr.production_id, pr.production_name, hw.description, hwm.user_id, hwm.username, hwm.full_name, rq.user_id AS rq_user_id, 
    rq.username AS rq_username, rq.full_name AS rq_full_name, hw.depreciated_months, DATE_FORMAT(hwm.allocated_date, '%d/%m/%Y') AS allocated_date,
    DATE_FORMAT(hw.expired_date, '%d/%m/%Y') AS expired_date, DATE_FORMAT((rq.allocated_retrieved_at), '%d/%m/%Y') AS allocated_retrieved_at, 
    hw.note, hw.status as statusBefore , rq.request_note, rq.status as statusAfter, hwm.allo_user_id
    FROM hardwares hw 
		INNER JOIN categories cate ON hw.category_id = cate.category_id
        LEFT JOIN productions pr ON hw.production_id = pr.production_id
		LEFT JOIN (SELECT hm.hardware_id, MAX(hm.allocated_date) AS allocated_date, MAX(hm.created_at) AS created_at, 
						  MAX(hm.retrieved_date) AS retrieved_date, user.full_name, user.id AS user_id, user.department, user.username, hm.allo_user_id as allo_user_id
					FROM hardware_management hm INNER JOIN users user ON hm.user_id = user.id
					WHERE hm.allocated_date IS NOT NULL
					AND hm.retrieved_date IS NULL
					GROUP BY hm.hardware_id) hwm 
			ON hw.hardware_id = hwm.hardware_id
		LEFT JOIN (SELECT r.hardware_id, r.user_id, u.full_name, u.username, r.allocated_retrieved_at, r.status, r.request_note, r.allo_user_id
				   FROM requests r LEFT JOIN users u 
                   ON r.user_id = u.id
                   WHERE r.request_status = 0
                   AND r.hardware_id = hardwareId) rq
			ON hw.hardware_id = rq.hardware_id                    
    WHERE hw.hardware_id = hardwareId;
END//

/* Xóa thủ tục getSearchedHardwares */
DROP PROCEDURE IF EXISTS `getSearchedHardwares` //
/*
 * Lấy ra danh sách thiết bị theo điều kiện tìm kiếm
 * Truyền vào các điều kiện tìm kiếm:
      categoryId VARCHAR(10) - mã loại thiết bị 
	  hardwareId VARCHAR(10) - mã thiết bị
	  hardwareName VARCHAR(255) - tên thiết bị
	  hwSerial VARCHAR(50) - số seri của thiết bị
	  hardwareStatus TINYINT - trạng thái của thiết bị
	  department VARCHAR(50) - phòng ban
	  userId INT(11) - mã người dùng
	  fromDate DATETIME - thời điểm cấp phát
	  toDate DATETIME - thời điểm cấp phát
	  rqLimit int(2) - số bản ghi được lấy ra
	  rqOffset int(2) - địa chỉ bản ghi bắt đầu được lấy
 * Trả về danh sách thiết bị tìm được
 * NghiaDT
 */
CREATE  PROCEDURE `getSearchedHardwares`(
					   categoryId VARCHAR(10), 
					   hardwareId VARCHAR(10),
					   luvinaId VARCHAR(10),					   
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

IF categoryId = '' THEN SET categoryId = NULL;
END IF;

IF hardwareStatus = '' THEN SET hardwareStatus = NULL;
END IF;

IF userId = '' THEN SET userId = NULL;
END IF;

IF department = '' THEN SET department = NULL;
END IF;

SET hardwareId = CONCAT('%', hardwareId, '%');
SET hardwareName = CONCAT('%', hardwareName, '%');
SET hwSerial = CONCAT('%', hwSerial, '%');


-- Nếu là màn hình tìm kiếm thì có phân trang
IF (rqLimit > 0) THEN 
	SELECT hw.hardware_id, hw.hardware_name, DATE_FORMAT(hwm.allocated_date,'%d/%m/%Y') AS allocated_date, hwm.full_name, hwm.user_id, cate.category_name, 
		   hw.status, pr.production_name, hw.supplier, hw.price, DATE_FORMAT(hw.waranty_date,'%d/%m/%Y') AS waranty_date, DATE_FORMAT(hw.expired_date,'%d/%m/%Y') AS expired_date, hwm.department, 
		   hw.os, hw.serial, hw.note, hw.description, rq.request_id, hwm.allo_user_id, hw.barcode, hw.hardware_id_lu, DATE_FORMAT(hw.buy_date,'%d/%m/%Y') AS buy_date, hw.depreciated_months
	FROM hardwares hw 
		INNER JOIN categories cate
		ON hw.category_id = cate.category_id
		LEFT JOIN productions pr ON pr.production_id = hw.production_id
		LEFT JOIN (SELECT hm.hardware_id, MAX(hm.allocated_date) AS allocated_date, MAX(hm.created_at) AS created_at, 
						  MAX(hm.retrieved_date) AS retrieved_date, user.full_name, user.id AS user_id, user.department, hm.allo_user_id
					FROM hardware_management hm INNER JOIN users user ON hm.user_id = user.id 
					WHERE hm.allocated_date IS NOT NULL
					AND hm.retrieved_date IS NULL
					GROUP BY hm.hardware_id) hwm ON hw.hardware_id = hwm.hardware_id
		LEFT JOIN (SELECT request_id, hardware_id 
				   FROM requests 
                   WHERE request_status = 0) as rq
		ON hw.hardware_id = rq.hardware_id
	WHERE (hw.category_id = categoryId OR ISNULL(categoryId))
	AND hw.hardware_id LIKE hardwareId
	AND IF (luvinaId = '', 1, hw.hardware_id_lu LIKE CONCAT('%', luvinaId, '%'))
	AND hw.hardware_name LIKE hardwareName
	AND hw.serial LIKE hwSerial
	AND (hwm.department = department OR ISNULL(department))
	AND (hw.status = hardwareStatus OR ISNULL(hardwareStatus))
	AND (hwm.user_id = userId OR ISNULL(userId))
	AND (hwm.allocated_date >= STR_TO_DATE(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
	AND (hwm.allocated_date <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate))
    ORDER BY hw.updated_at DESC
	LIMIT rqLimit OFFSET rqOffset; 
	
-- Nếu là export thì lấy ra tất cả các bản ghi
ELSE  
	set @row_num = 0;
	SELECT @row_num:= @row_num + 1, cate.category_name, hw.hardware_id, hw.hardware_id_lu, hw.barcode, hw.hardware_name, hw.status as Trạng_thái, 
    hw.price, pr.production_name, DATE_FORMAT(hw.buy_date,'%m/%d/%Y') AS buy_date,  hw.supplier,
	DATE_FORMAT(hw.waranty_date,'%m/%d/%Y') AS waranty_date, DATE_FORMAT(hw.expired_date,'%m/%d/%Y') AS expired_date, hwm.full_name, hwm.department, 
	DATE_FORMAT(hwm.allocated_date,'%m/%d/%Y') AS allocated_date,  hw.description, hw.serial, hw.os,  hw.note
       
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
WHERE (hw.category_id = categoryId OR ISNULL(categoryId))
AND hw.hardware_id LIKE hardwareId
AND IF (luvinaId = '', 1, hw.hardware_id_lu LIKE CONCAT('%', luvinaId, '%'))
AND hw.hardware_name LIKE hardwareName
AND hw.serial LIKE hwSerial
AND (hwm.department = department OR ISNULL(department))
AND (hw.status = hardwareStatus OR ISNULL(hardwareStatus))
AND (hwm.user_id = userId OR ISNULL(userId))
AND (hwm.allocated_date >= STR_TO_DATE(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
AND (hwm.allocated_date <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate));
    
    END IF;
END//

/* Xóa thủ tục getSearchedHardwareToAllocate */
DROP PROCEDURE IF EXISTS `getSearchedHardwareToAllocate` //

/*
 * Lấy ra danh sách thiết bị có thể cấp phát (hiển thị ở màn hình cấp phát-thu hồi tài sản
 * Truyền vào:
			 requestedType TINYINT - loại yêu cầu: cấp phát hoặc thu hồi
			 categoryId VARCHAR(10) - mã loại tài sản 
			 hardwareId VARCHAR(10) - mã thiết bị
			 hardwareName VARCHAR(255) - tên thiết bị
			 hardwareStatus TINYINT - trạng thái thiết bị
			 userId INT(11) - mã người dùng
			 fromDate DATETIME - ngày cấp phát
			 toDate DATETIME - ngày cấp phát
			 rqLimit int(2) - số bản ghi/trang
			 rqOffset int(2) - chỉ số bản ghi bắt đầu lấy
 * Trả về danh sách thiết bị tìm được
 * NghiaDT
 */
CREATE  PROCEDURE `getSearchedHardwareToAllocate`(
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

/* Xóa thủ tục getStatisticalCategories */
DROP PROCEDURE IF EXISTS `getStatisticalCategories` //

/*
 * Lấy ra các dữ liệu thống kê
 * Truyền vào các biến:
	categoriesId VARCHAR(10) - mã loại tài sản 
	warrantyStatus VARCHAR(10) - trạng thái bảo hành
	fromDate DATETIME - ngày bắt đầu thống kê
	toDate DATETIME - ngày kết thúc thống kê
 * Trả về danh sách dữ liệu thống kê
 */
CREATE  PROCEDURE `getStatisticalCategories`(
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
        SUM(CASE WHEN hw.statusBefore IN (1, 3, 4) THEN 1 ELSE 0 END) AS emptyNum,
        SUM(CASE WHEN (hw.statusBefore != 5 AND hw.statusAfter = 5) THEN 1 ELSE 0 END) AS deletedPending,
        COUNT(hw.hardware_id) AS total
FROM categories cate
LEFT JOIN (SELECT h.hardware_id, h.category_id, h.created_at, h.status as statusBefore, r.status as statusAfter, h.waranty_date, h.buy_date
			FROM hardwares h LEFT JOIN (SELECT hardware_id, status, MAX(created_at) 
										FROM requests 
                                        WHERE request_status = 0
                                        GROUP BY hardware_id) r
			ON h.hardware_id = r.hardware_id
			WHERE h.deleted_flag = 0
			AND IF (warrantyStatus = 'under', STR_TO_DATE(h.waranty_date, '%Y-%m-%d') >= STR_TO_DATE(NOW(), '%Y-%m-%d'), 
					IF (warrantyStatus = 'expired', STR_TO_DATE(h.waranty_date, '%Y-%m-%d') < STR_TO_DATE(NOW(), '%Y-%m-%d'), ISNULL(warrantyStatus)))
			AND (STR_TO_DATE(h.buy_date, '%Y-%m-%d') >= STR_TO_DATE(fromDate, '%Y-%m-%d') OR ISNULL(fromDate))
			AND (STR_TO_DATE(h.buy_date, '%Y-%m-%d') <= STR_TO_DATE(toDate, '%Y-%m-%d') OR ISNULL(toDate))) hw
ON cate.category_id = hw.category_id
WHERE cate.deleted_flag = 0
AND (FIND_IN_SET(cate.category_id, categoriesId) OR ISNULL(categoriesId))
GROUP BY cate.category_id
ORDER BY cate.category_name;
END//

/* Xóa thủ tục getTotalSearchedHardwares*/
DROP PROCEDURE IF EXISTS `getTotalSearchedHardwares` //

/*
 * Lấy ra tổng số thiết bị theo điều kiện tìm kiếm (để phân trang trong màn hình tìm kiếm)
 * Truyền vào các điều kiện tìm kiếm:
      categoryId VARCHAR(10) - mã loại thiết bị 
	  hardwareId VARCHAR(10) - mã thiết bị
	  hardwareName VARCHAR(255) - tên thiết bị
	  hwSerial VARCHAR(50) - số seri của thiết bị
	  hardwareStatus TINYINT - trạng thái của thiết bị
	  department VARCHAR(50) - phòng ban
	  userId INT(11) - mã người dùng
	  fromDate DATETIME - thời điểm cấp phát
	  toDate DATETIME - thời điểm cấp phát
	  rqLimit int(2) - số bản ghi được lấy ra
	  rqOffset int(2) - địa chỉ bản ghi bắt đầu được lấy
 * Trả về tổng số thiết bị tìm được theo điều kiện tìm kiếm
 * NghiaDT
 */
CREATE PROCEDURE `getTotalSearchedHardwares`(
					   categoryId VARCHAR(10), 
					   hardwareId VARCHAR(10),
					   luvinaId VARCHAR(10),
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
	WHERE (hw.category_id = categoryId OR ISNULL(categoryId))
	AND hw.hardware_id LIKE hardwareId
	AND IF (luvinaId = '', 1, hw.hardware_id_lu LIKE CONCAT('%', luvinaId, '%'))
	AND hw.hardware_name LIKE hardwareName
	AND hw.serial LIKE hwSerial
	AND (hwm.department = department OR ISNULL(department))
	AND (hw.status = hardwareStatus OR ISNULL(hardwareStatus))
	AND (hwm.user_id = userId OR ISNULL(userId))
	AND (hwm.allocated_date >= STR_TO_DATE(fromDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(fromDate))
	AND (hwm.allocated_date <= STR_TO_DATE(toDate, '%Y-%m-%d %H:%i:%s') OR ISNULL(toDate));
END//

/* Xóa thủ tục getTotalSearchedHardwaresToAllocate*/
DROP PROCEDURE IF EXISTS `getTotalSearchedHardwaresToAllocate` //
/*
 * Lấy ra tổng số thiết bị có thể cấp phát/thu hồi (để phân trang ở màn hình cấp phát - thu hồi tài sản
 * Truyền vào:
			 requestedType TINYINT - loại yêu cầu: cấp phát hoặc thu hồi
			 categoryId VARCHAR(10) - mã loại tài sản 
			 hardwareId VARCHAR(10) - mã thiết bị
			 hardwareName VARCHAR(255) - tên thiết bị
			 hardwareStatus TINYINT - trạng thái thiết bị
			 userId INT(11) - mã người dùng
			 fromDate DATETIME - ngày cấp phát
			 toDate DATETIME - ngày cấp phát
			 rqLimit int(2) - số bản ghi/trang
			 rqOffset int(2) - chỉ số bản ghi bắt đầu lấy\
 * Trả về tổng số thiết bị tìm được
 * NghiaDT
 */
CREATE  PROCEDURE `getTotalSearchedHardwaresToAllocate`(requestedType TINYINT, categoryId VARCHAR(10), hardwareId VARCHAR(10), hardwareName VARCHAR(255), 
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

/* Xóa thủ tục getTotalStatisticalHardwares*/
DROP PROCEDURE IF EXISTS `getTotalStatisticalHardwares` //-- Lấy ra tổng số thiết bị được thống kê

/*
 * Lấy ra tổng số thiết bị được thống kê
 * Truyền vào các biến:
	categoriesId VARCHAR(10) - mã loại tài sản 
	warrantyStatus VARCHAR(10) - trạng thái bảo hành
	fromDate DATETIME - ngày bắt đầu thống kê
	toDate DATETIME - ngày kết thúc thống kê
 * Trả về tổng số thiết bị được thống kê
 * NghiaDT
 */
CREATE  PROCEDURE `getTotalStatisticalHardwares`(categoriesId TEXT, warrantyStatus VARCHAR(10), fromDate DATETIME, toDate DATETIME)
BEGIN

IF categoriesId = '' THEN SET categoriesId = NULL;
END IF;
                 
IF warrantyStatus = 'all' THEN SET warrantyStatus = NULL;
END IF;

SELECT COUNT(hw.hardware_id) AS total
FROM (SELECT h.hardware_id, h.category_id, h.created_at, h.status as statusBefore, r.status as statusAfter, h.waranty_date, h.buy_date
			FROM hardwares h LEFT JOIN (SELECT hardware_id, status, MAX(created_at) FROM requests GROUP BY hardware_id) r
			ON h.hardware_id = r.hardware_id
      WHERE h.deleted_flag = 0) hw
LEFT JOIN categories cate
ON cate.category_id = hw.category_id
WHERE cate.deleted_flag = 0
AND (FIND_IN_SET(cate.category_id, categoriesId) OR ISNULL(categoriesId))
AND IF (warrantyStatus = 'under', STR_TO_DATE(hw.waranty_date, '%Y-%m-%d') >= STR_TO_DATE(NOW(), '%Y-%m-%d'), 
		IF (warrantyStatus = 'expired', STR_TO_DATE(hw.waranty_date, '%Y-%m-%d') <= STR_TO_DATE(NOW(), '%Y-%m-%d'), ISNULL(warrantyStatus)))
AND (STR_TO_DATE(hw.buy_date, '%Y-%m-%d') >= STR_TO_DATE(fromDate, '%Y-%m-%d') OR ISNULL(fromDate))
AND (STR_TO_DATE(hw.buy_date, '%Y-%m-%d') <= STR_TO_DATE(toDate, '%Y-%m-%d') OR ISNULL(toDate));
END//

/* Xóa thủ tục updateHardwareStatus */
DROP PROCEDURE IF EXISTS `updateHardwareStatus` //
/*
 * Thay đổi trạng thái loại thiết bị
 * Truyền vào các biến:
	hardwareId VARCHAR(10) - mã tài sản
	hwStatus TINYINT - trạng thái thiết bị
    updatedAt DATETIME - thời điểm cập nhật thiết bị
 * Trả về TRUE nếu cập nhật thành công, FALSE nếu không thành công
 * NghiaDT
 */
CREATE  PROCEDURE `updateHardwareStatus`(
					   hardwareId VARCHAR(10), 
					   hwStatus TINYINT, 
					   updatedAt DATETIME
				   )
BEGIN
	UPDATE hardwares 
	SET status = hwStatus, updated_at = updatedAt, deleted_flag = 0
	WHERE hardware_id = hardwareId;
END//


-- ------------------------------------- --
-- Thao tác với bảng hardware_management --

/* Xóa thủ tục allocateHardware */
DROP PROCEDURE IF EXISTS `allocateHardware` //
/*
 * Cấp phát thiết bị/thêm bản ghi mới
 * Truyền vào các thông tin để thêm vào bảng hardware_management:
	   hardwareId VARCHAR(10), 
	   userId INT(11), 
	   allocatedDate DATETIME, 
	   allocatedReason TEXT, 
	   createdAt DATETIME, 
	   updatedAt DATETIME
 * Trả về TRUE nếu insert thành công, FALSE nếu không thành công
 * NghiaDT
 */
CREATE  PROCEDURE `allocateHardware`(
					   allocatedBy INT(11),
					   hardwareId VARCHAR(10), 
					   userId INT(11), 
					   allocatedDate DATETIME, 
					   allocatedReason TEXT, 
					   createdAt DATETIME, 
					   updatedAt DATETIME
				   )
BEGIN
	-- cấp phát tài sản
    INSERT INTO hardware_management (hardware_id, user_id, allocated_date, note, created_at, updated_at, allo_user_id)
    VALUES (hardwareId, userId, allocatedDate, allocatedReason, createdAt, updatedAt, allocatedBy);
END//

/* Xóa thủ tục retrieveHardware */
DROP PROCEDURE IF EXISTS `retrieveHardware` //
/*
 * Thu hồi thiết bị/ sửa thông tin bản ghi
 * Truyền vào các thông tin để cập nhật bảng hardware_management:
	   hardwareId VARCHAR(10), 
	   retrievedDate DATETIME, 
	   retrievedReason TEXT, 
	   updatedAt DATETIME
 * Trả về TRUE nếu cập nhật thành công, FALSE nếu cập nhật không thành công
 * NghiaDT
 */
CREATE  PROCEDURE `retrieveHardware`(
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

/* Xóa thủ tục getHistoryAlocation */
DROP PROCEDURE IF EXISTS `getHistoryAlocation` //

/*
 * Lấy ra lịch sử cấp phát, thu hồi thiết bị (xem lịch sử trong màn hình tìm kiếm)
 * Truyền vào hardwareId VARCHAR(10): mã thiết bị
 * Trả về lịch sử cấp phát, thu hồi của thiết bị có mã truyền vào
 * NghiaDT
 */
CREATE  PROCEDURE `getHistoryAlocation`(hardwareId VARCHAR(10))
BEGIN 
SELECT DISTINCT hm.hardware_id, hw.hardware_name, hm.user_id, user.full_name, 
	   DATE_FORMAT(hm.allocated_date, '%d/%m/%Y') AS allocated_date, DATE_FORMAT(hm.retrieved_date, '%d/%m/%Y') AS retrieved_date
FROM hardware_management hm
	LEFT JOIN hardwares hw ON hw.hardware_id = hm.hardware_id
    LEFT JOIN users user ON hm.user_id = user.id
WHERE hm.hardware_id = hardwareId
AND hm.deleted_flag = 0;
END//

/* Xóa thủ tục getMaxRetrievedDate */
DROP PROCEDURE IF EXISTS `getMaxRetrievedDate` //

/*
 * Lấy ra ngày thu hồi gần nhất (để validate ngày cấp phát với tài sản đã qua sử dụng)
 * Truyền vào hardwareIdArr VARCHAR(255): chuỗi danh sách mã tài sản
 * Trả về ngày thu hồi gần nhất
 * NghiaDT
 */
CREATE  PROCEDURE `getMaxRetrievedDate`(hardwareIdArr VARCHAR(255))
BEGIN
	SELECT hardware_id, DATE_FORMAT(MAX(retrieved_date), '%d/%m/%Y') AS max_retrieved_date
	FROM hardware_management
	WHERE FIND_IN_SET(hardware_id , hardwareIdArr)
	GROUP BY hardware_id;
END//


-- ------------------------------------- --
-- ---- Thao tác với bảng requests ----- --

/* xóa thủ tục getRequestedHardwares */
DROP PROCEDURE IF EXISTS `getRequestedHardwares` //

/*
 * Lấy ra danh sách đang chờ duyệt (để hiển thị ra màn hình chờ duyệt)
 * Truyền vào các thông tin để tìm kiếm
	   requestedStatus int(1) - Trạng thái yêu cầu: cấp phát/thu hồi/xóa tài sản
	   userId INT(11) - Mã người dùng 
	   rqLimit int(2) - số bản ghi/trang
	   rqOffset int(2) - chỉ số bản ghi bắt đầu được lấy
 * Trả về danh sách đang chờ duyệt theo điều kiện tìm kiếm
 * NghiaDT
 */
CREATE  PROCEDURE `getRequestedHardwares`(requestedStatus INT(1), userId INT(11), rqLimit INT(4), rqOffset INT(2))

BEGIN
	IF requestedStatus = '' THEN SET requestedStatus = null;
	END IF; 
	-- lấy ra danh sách request 
	SELECT rq.hardware_id, rq.hardware_name, hw.status as statusBefore, rq.status as statusAfter,
		   u.username, rq.request_status, u.full_name, rq.allo_user_id
	FROM requests rq  
		 LEFT JOIN hardwares hw ON hw.hardware_id = rq.hardware_id
		 LEFT JOIN users u ON rq.user_id = u.id  
    WHERE rq.request_status = 0
	AND (rq.status = requestedStatus OR ISNULL(requestedStatus))
    AND (rq.requested_by = userId OR ISNULL(userId))
    ORDER BY rq.created_at DESC
    LIMIT rqLimit OFFSET rqOffset;
END//

/* Xóa thủ tục insertToRequest */
DROP PROCEDURE IF EXISTS `insertToRequest` //

/*
 * Thêm một yêu cầu (insert) vào bảng requests
 * Truyền vào thông tin các trường trong bảng
 * Trả về TRUE nếu insert thành công, FALSE nếu insert không thành công
 * NghiaDT
 */
CREATE  PROCEDURE `insertToRequest`(IN `hardwareId` VARCHAR(10),
	IN `hardwareIdLu` VARCHAR(10),
	IN `hwBarcode` VARCHAR(50),
	IN `hwSerial` VARCHAR(50),
	IN `hardware_name` VARCHAR(255) CHARSET UTF8,
	IN `hwOs` VARCHAR(50),
	IN `hwSupplier` VARCHAR(255) CHARSET UTF8,
	IN `categoryId` VARCHAR(10),
	IN `buyDate` DATETIME,
	IN `warantyDate` DATETIME,
	IN `hwPrice` INT(11),
	IN `productionId` TINYINT(4),
	IN `hwDescription` TEXT CHARSET UTF8,
	IN `rqStatus` TINYINT,
	IN `userId` INT(11),
	IN `depreciatedMonths` TINYINT(4),
	IN `expiredDate` DATETIME,
	IN `requestedBy` INT(11),
	IN `alreAt` DATETIME,
	IN `hwNote` TEXT CHARSET UTF8,
	IN `rqNote` TEXT CHARSET UTF8,
	IN `hwCreatedAt` DATETIME,
	IN `hwUpdatedAt` DATETIME,
	IN `hwDeletedAt` DATETIME,
	IN `hwDeletedFlag` TINYINT,
	IN `createdAt` DATETIME,
	IN `allo_user_id` INT)
BEGIN 
INSERT INTO requests(hardware_id, hardware_id_lu, barcode, serial, hardware_name, 
			os, supplier, category_id, buy_date, waranty_date, price, production_id, description, 
			status, user_id, depreciated_months, expired_date, allocated_retrieved_at, hw_note,
            request_note, hw_created_at, hw_updated_at, hw_deleted_at, hw_deleted_flag, requested_by, created_at, allo_user_id)
VALUES (hardwareId, hardwareIdLu, hwBarcode, hwSerial, hardware_name, 
		hwOs, hwSupplier, categoryId, buyDate, warantyDate, hwPrice, productionId, hwDescription,
        rqStatus, userId, depreciatedMonths, expiredDate, alreAt, hwNote, rqNote, hwCreatedAt,
        hwUpdatedAt, hwDeletedAt, hwDeletedFlag, requestedBy, createdAt, allo_user_id);
END//

/* Xóa thủ tục isPendingHardware */
DROP PROCEDURE IF EXISTS `isPendingHardware` //

/*
 * Kiểm tra thiết bị có phải đang chờ duyệt
 * Truyền vào hw_id VARCHAR(10) mã thiết bị
 * Trả về 1 nếu tài sản đang chờ duyệt, 0 nếu không có trong danh sách
 * VươngNM
 */
CREATE  PROCEDURE `isPendingHardware`(hw_id VARCHAR(10))
BEGIN
	SELECT COUNT(requests.request_id) as num FROM requests
	WHERE requests.hardware_id = hw_id AND requests.request_status = '0';
END//

/* Xóa thủ tục setApprovedRequest */
DROP PROCEDURE IF EXISTS `setApprovedRequest` //

/*
 * Chuyển trạng thái yêu cầu là duyệt
 * Truyền vào hardwareId VARCHAR(10): mã thiết bị
 * Trả về TRUE nếu cập nhật thành công, FALSE nếu cập nhật thất bại
 * NghiaDT
 */
CREATE  PROCEDURE `setApprovedRequest`(hardwareId VARCHAR(10))
BEGIN 
	UPDATE requests
	SET request_status = 1
	WHERE hardware_id = hardwareId
    AND request_status = 0;
END//

/* Xóa thủ tục setRejectedRequest */
DROP PROCEDURE IF EXISTS `setRejectedRequest` //

/* 
 * Chuyển trạng thái yêu cầu là bỏ qua
 * Truyền vào hardwareId VARCHAR(10): mã thiết bị
 * Trả về TRUE nếu cập nhật thành công, FALSE nếu cập nhật thất bại
 * NghiaDT
 */
CREATE  PROCEDURE `setRejectedRequest`(hardwareId VARCHAR(10))
BEGIN 
	UPDATE requests
	SET request_status = 2
    WHERE hardware_id = hardwareId
    AND request_status = 0;
END//

/* Xóa thủ tục deleteExpiredRequest */
DROP PROCEDURE IF EXISTS `deleteExpiredRequest` //

/* 
 * tự động bỏ qua các yêu cầu đã hết hạn
 * Truyền vào createdDate DATETIME: nếu thời gian sớm hơn sẽ bị bỏ qua
 * Trả về TRUE nếu cập nhật thành công, FALSE nếu cập nhật thất bại
 * NghiaDT
 */
CREATE  PROCEDURE `deleteExpiredRequest`(createdDate DATETIME)
BEGIN
	UPDATE requests SET request_status = 2 WHERE created_at < str_to_date(createdDate, '%Y-%m-%d %H:%i:%s') AND request_status = 0;
END//

/* Xóa thủ tục getTotalRequestedHardwares */
DROP PROCEDURE IF EXISTS `getTotalRequestedHardwares` //

/* 
 * Lấy ra tổng số các yêu cầu đang chờ duyệt
 * Truyền vào requestedStatus int(1): trạng thái yêu cầu: cấp phát/thu hồi/ xóa
			  userId INT(11): người tạo yêu cầu
 * Trả về tổng số các yêu cầu đang chờ duyệt
 * NghiaDT
 */
CREATE  PROCEDURE `getTotalRequestedHardwares`(requestedStatus int(1), userId INT(11))

BEGIN
	IF requestedStatus = '' THEN SET requestedStatus = null;
	END IF; 
	SELECT COUNT(rq.request_id) AS total
    FROM requests rq
    WHERE rq.request_status = 0
	AND (rq.status = requestedStatus OR ISNULL(requestedStatus))
    AND (rq.requested_by = userId OR ISNULL(userId));
END//


-- ------------------------------------- --
-- ------ Thao tác với bảng users ------ --

/* Xóa thủ tục getAllDepartments */
DROP PROCEDURE IF EXISTS `getAllDepartments` //

/* 
 * Lấy ra danh sách phòng ban
 * Trả về danh sách phòng ban
 * NghiaDT
 */
CREATE  PROCEDURE `getAllDepartments`()
BEGIN  
	SELECT DISTINCT department
    FROM users 
    WHERE deleted_flag = 0;
END//

/* Xóa thủ tục getAllUsers */
DROP PROCEDURE IF EXISTS `getAllUsers` //

/* 
 * Lấy ra danh sách user
 * Trả về danh sách user
 * NghiaDT
 */
CREATE  PROCEDURE `getAllUsers`()
BEGIN
	SELECT id, user_id, full_name, username
    FROM users 
    WHERE deleted_flag = 0;
END//

/* Xóa thủ tục getUserPermision */
DROP PROCEDURE IF EXISTS `getUserPermision` //

/* 
 * Lấy ra danh sách quyền của user
 * Truyền vào userId TINYINT(2): mã của user
 * Trả về danh sách quyền của user
 * NghiaDT
 */
CREATE  PROCEDURE `getUserPermision`(userId TINYINT(2))
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

/* Xóa thủ tục getSearchedUsers */
DROP PROCEDURE IF EXISTS getSearchedUsers //

/* 
 * Lấy ra danh sách user theo điều kiện tìm kiếm
 * Truyền vào các điều kiện tìm kiếm:
    fullName VARCHAR(255) - tên đầy đủ của người dùng
    groupId INT(4) - mã nhóm
    department VARCHAR(50) - phòng ban của user
 * NghiaDT
 */
CREATE PROCEDURE `getSearchedUsers`(
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

	SELECT user.id, user.full_name, user.department, gr_u.group_name
	FROM users user 
	LEFT JOIN (SELECT gu.user_id, g.group_name, g.group_id
				FROM groups_users gu LEFT JOIN groups g
				ON g.group_id = gu.group_id
				WHERE g.deleted_flag = 0) gr_u
				
	ON user.id = gr_u.user_id
	WHERE user.deleted_flag = 0
    AND (gr_u.group_id <> currentGroup OR ISNULL(gr_u.group_id))
	AND (user.full_name LIKE fullName OR ISNULL(fullName))
	AND (gr_u.group_id = groupId OR ISNULL(groupId))
	AND (user.department = department OR ISNULL(department));
END; //


DROP PROCEDURE IF EXISTS getUsernameById //
/*
 * Lấy ra username của người dùng có id truyền vào
 * Truyền vào id của user
 * Trả về username của người dùng có id truyền vào
 * VuongNM
 */
CREATE PROCEDURE `getUsernameById`(userId INT(11))
BEGIN
	SELECT username
    FROM users
    WHERE id = userId AND deleted_flag = 0;
END //


DROP PROCEDURE IF EXISTS getUserByUsernamePassword //
/*
 * Lấy ra user theo username và password
 * Truyền vào username và password của user
 * Trả về thông tin user có username và password tương ứng
 * NghiaDT
 */
CREATE PROCEDURE `getUserByUsernamePassword`(username VARCHAR(255), pass VARCHAR(255))
BEGIN
	SELECT users.id, users.username, users.full_name
	FROM users
	WHERE users.deleted_flag = 0
	AND users.username = username
	AND users.password = md5(pass);
END //

-- -------------------------------------- --
-- ------ Thao tác với bảng groups ------ --

/* Xóa thủ tục restoreDeletedGroup*/
DROP PROCEDURE IF EXISTS restoreDeletedGroup //

/*
 * Khôi phục lại nhóm đã xóa
 * Truyền vào group_name VARCHAR(255) tên nhóm
 * Trả về TRUE nếu khôi phục thành công, FALSE nếu khôi phục không thành công
 * VuongNM
 */
CREATE PROCEDURE `restoreDeletedGroup`(group_name VARCHAR(255))
BEGIN
	UPDATE groups SET groups.deleted_flag = 0
	WHERE groups.group_name = group_name;
END //

/* Xóa thủ tục getAllGroup */
DROP PROCEDURE IF EXISTS `getAllGroup` //

/* 
 * Lấy ra danh sách nhóm người dùng
 * Trả về danh sách nhóm người dùng
 * NghiaDT
 */
CREATE  PROCEDURE `getAllGroup`()
BEGIN
	SELECT groups.group_id, groups.group_name FROM groups
	WHERE groups.deleted_flag = 0;
END//

/* Xóa thủ tục addNewGroup */
DROP PROCEDURE IF EXISTS `addNewGroup` //

/*
 * Thêm một nhóm người dùng
 * Truyền vào các thông tin bảng groups
     name VARCHAR(255): tên group
	 currentTime DATETIME: thời điểm thêm group
 * Trả về TRUE nếu thêm thành công, FALSE nếu thêm không thành công
 * NghiaDT
 */
CREATE  PROCEDURE `addNewGroup`(
	IN `name` VARCHAR(255) CHARACTER SET utf8,
	IN `currentTime` DATETIME
)
BEGIN
	INSERT INTO groups(groups.group_name, groups.created_at)
	VALUES (name, currentTime);
END//

/* Xóa thủ tục getGroupByName */
DROP PROCEDURE IF EXISTS `getGroupByName` //

/*
 * Lấy ra thông tin nhóm người dùng theo tên nhóm
 * Truyền vào name VARCHAR(255) tên của group
 * Trả về thông tin group theo tên nhóm truyền vào
 * NghiaDT
 */
CREATE  PROCEDURE `getGroupByName`(
	IN `name` VARCHAR(255)
)
BEGIN
	SELECT groups.group_id, groups.group_name FROM groups
	WHERE groups.group_name = name AND groups.deleted_flag = 0;
END//

DROP PROCEDURE IF EXISTS `removeGroupRole` //

/*
 *Xóa quyền của nhóm người dùng
 * vuongNM
 */
CREATE  PROCEDURE `removeGroupRole`(`group_id` INT(4), `role_id` INT(4))
BEGIN
	DELETE FROM groups_roles WHERE groups_roles.group_id = group_id AND groups_roles.role_id = role_id;
END//

/* Xóa thủ tục getSearchedGroups */
DROP PROCEDURE IF EXISTS getSearchedGroups //

/* 
 * Lấy ra danh sách nhóm và các quyền của nhóm
 * Truyền vào groupName VARCHAR(255) - tên của nhóm để tìm kiếm gần đúng
 * NghiaDT
 */
CREATE PROCEDURE `getSearchedGroups`(
	IN `groupName` VARCHAR(255)
)
BEGIN
	SET groupName = CONCAT('%', groupName, '%');
    SELECT g.group_id, g.group_name
	FROM groups g
	WHERE g.deleted_flag = 0
	AND g.group_name LIKE groupName;
	
END; //

/* Xóa thủ tục removeUserById*/
DROP PROCEDURE IF EXISTS removeUserById //

/*
 * Xóa người dùng khỏi nhóm
 * Truyền vào 
     group_id TINYINT(4): mã nhóm
	 arr_id VARCHAR(200): mảng mã người dùng
 * Trả về TRUE nếu xóa thành công, FALSE nếu xóa không thành công
 * VuongNM
 */
CREATE PROCEDURE `removeUserById`(
	IN `group_id` TINYINT(4),
	IN `arr_id` VARCHAR(200)
)
BEGIN
	DELETE FROM groups_users
	WHERE groups_users.group_id = group_id AND FIND_IN_SET(groups_users.user_id, arr_id);
END //

/* Xóa thủ tục removeUserByGroup*/
DROP PROCEDURE IF EXISTS removeUserByGroup //

/*
 * Xóa người dùng khỏi bảng người dùng trong nhóm
 * Truyền vào group_id INT(4) mã nhóm
 * Trả về TRUE nếu xóa thành công, FALSE nếu xóa không thành công
 * VuongNM
 */
CREATE PROCEDURE `removeUserByGroup`(group_id INT(4))
BEGIN
	DELETE FROM groups_users
    WHERE groups_users.group_id = group_id;
END //

/* Xóa thủ tục hasGroupRole */
DROP PROCEDURE IF EXISTS hasGroupRole //

/*
 * Lấy ra quyền của nhóm
 * Truyền vào group_id mã nhóm; role_id mã quyền
 * Trả về các mã quyền của nhóm tương ứng
 * VuongNM
 */
CREATE PROCEDURE `hasGroupRole`(group_id INT(4), role_id INT(4))
BEGIN
	SELECT groups_roles.id FROM groups_roles
	WHERE groups_roles.group_id = group_id AND groups_roles.role_id = role_id;
END //

/* Xóa thủ tục getTotalGroup */
DROP PROCEDURE IF EXISTS getTotalGroup //
/*
 * Lấy ra tổng số nhóm theo tên nhóm
 * Truyền vào groupName VARCHAR(255) tên nhóm
 * Trả về tổng số các nhóm có tên tương ứng
 * VuongNM
 */
CREATE PROCEDURE `getTotalGroup`(groupName VARCHAR(255))
BEGIN
	SET groupName = CONCAT('%', groupName, '%');
    SELECT COUNT(g.group_id) AS group_count
	FROM groups g
	WHERE g.deleted_flag = 0
	AND g.group_name LIKE groupName;
END //
-- ------------------------------------- --
-- ------ Thao tác với bảng roles ------ --

/* Xóa thủ tục getAllRole */
DROP PROCEDURE IF EXISTS `getAllRole` //

/*
 * Lấy ra danh sách quyền thực hiện với hệ thống
 * Trả về danh sách quyền thao tác với hệ thống
 * NghiaDT
 */
CREATE  PROCEDURE `getAllRole`()
BEGIN
	SELECT roles.id, roles.role_name, roles.link, roles.method FROM roles
	WHERE roles.deleted_flag = 0;
END//
/* Xóa thủ tục removeAllRoleByGroup*/
DROP PROCEDURE IF EXISTS removeAllRoleByGroup //

/*
 * Xóa các quyền của nhóm
 * Truyền vào group_id INT(4) mã nhóm
 * Trả về TRUE nếu xóa thành công, FALSE nếu xóa không thành công
 * VuongNM
 */
CREATE PROCEDURE `removeAllRoleByGroup`(group_id INT(4))
BEGIN
	DELETE FROM groups_roles WHERE groups_roles.group_id = group_id;
END //

-- ------------------------------------ --
-- -- Thao tác với bảng groups_roles -- --

/* Xóa thủ tục getAllRoleByGroup */
DROP PROCEDURE IF EXISTS `getAllRoleByGroup` //

/*
 * Lấy ra danh sách quyền theo nhóm
 * Trả vè danh sách quyền theo nhóm người dùng
 * NghiaDT
 */
CREATE  PROCEDURE `getAllRoleByGroup`()
BEGIN
	SELECT groups.group_id, groups.group_name, groups_roles.role_id
	FROM groups LEFT JOIN groups_roles
	ON groups.group_id = groups_roles.group_id;
END//


-- ------------------------------------ --
-- ------ Thao tác với bảng logs ------ --

/* Xóa thủ tục addNewLog */
DROP PROCEDURE IF EXISTS `addNewLog` //

/* Thêm một log
 * Truyền vào thông tin các trường để thêm vào log
	username VARCHAR(255): username thực hiện thao tác
 	hardwareId VARCHAR(10): mã tài sản được tác động
	createdAt DATETIME: thời điểm tạo log
	logContent TEXT CHARSET UTF8: Nội dung log
 * NghiaDT
 */
CREATE  PROCEDURE `addNewLog`(username VARCHAR(255), hardwareId VARCHAR(10), createdAt DATETIME, logContent TEXT CHARSET UTF8)
BEGIN
	INSERT INTO logs(username, hardware_id, log_time, content)
    VALUES (username, hardwareId, createdAt, logContent);
END//


/* Xóa thủ tục `getTotalSearchedLog` */
DROP PROCEDURE IF EXISTS `getTotalSearchedLog` //

/*
 * Lấy ra tổng số lần thao tác với thiết bị
 * Truyền vào các điều kiện tìm kiếm
      categoryId VARCHAR(10): mã loại thiết bị
      startDate DATETIME: ngày thực hiện sau startDate
      endDate DATETIME: ngày thực hiện trước endDate
 * NghiaDT
 */
CREATE PROCEDURE getTotalSearchedLog(categoryId VARCHAR(10), startDate DATETIME, endDate DATETIME)
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
END //

/* */
DROP PROCEDURE IF EXISTS `getSearchLog` //


/* 
 * Tìm kiếm lịch sử sử dụng tài sản
 * Truyền vào các điều kiện tìm kiếm
	categoryId VARCHAR(10) mã loại tài sản
	startDate DATETIME ngày thực hiện cập nhật
	endDate DATETIME ngày thực hiện cập nhật
	limitRecord TINYINT(4) số bản ghi/trang
	offsetRecord TINYINT(4) chỉ số bản ghi bắt đầu được lấy
 * Trả về danh sách lịch sử sử dụng tìm được
 * NghiaDT
 */
CREATE PROCEDURE `getSearchLog`(categoryId VARCHAR(10),  startDate DATETIME, endDate DATETIME, limitRecord TINYINT(4), offsetRecord TINYINT(4))
BEGIN
	IF categoryId = '' THEN SET categoryId = null;
	END IF;
	SELECT  `logs`.hardware_id, `logs`.username, DATE_FORMAT(`logs`.log_time, '%d/%m/%Y') AS log_time, `logs`.content
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
END //

/* Xóa thủ tục getTotalExpiredRequest */
DROP PROCEDURE IF EXISTS getTotalExpiredRequest //

/*
 * Lấy ra tổng số yêu cầu đến hạn
 * Truyền vào 
	userId INT(11) mã người dùng
	createdDate DATETIME ngày tạo yêu cầu
 * Trả về tổng số yêu cầu đã đến hạn
 * NghiaDT
 */
CREATE PROCEDURE `getTotalExpiredRequest`(userId INT(11), createdDate DATETIME)
BEGIN 
	SELECT COUNT(request_id) AS total 
	FROM requests
	WHERE request_status = 0
	AND (requested_by = userId OR ISNULL(userId))
    AND (DATE_FORMAT(created_at, '%Y-%m-%d') = STR_TO_DATE(createdDate, '%Y-%m-%d'));
END //

/* Xóa thủ tục getSearchedUsers */
DROP PROCEDURE IF EXISTS getSearchedUsers //

/*
 * Tìm kiếm người dùng
 * Truyền vào các điều kiện tìm kiếm
	`fullName` VARCHAR(255) tên đầy đủ của người dùng
	`groupId` INT(4) mã nhóm người dùng
	`department` VARCHAR(50) phòng ban
	`currentGroup` INT(4) nhóm hiện tại cần được thêm user
 * Trả về danh sách user tìm được
 * VuongNM
 */
CREATE PROCEDURE `getSearchedUsers`(
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
END //

/* Xóa thủ tục getRoleFromPath */
DROP PROCEDURE IF EXISTS getRoleFromPath //

/*
 * Lấy ra quyền thực hiện từ link
 * Truyền vào path VARCHAR(255) link trên thanh địa chỉ
 * Trả về danh sách quyền thực hiện
 * VuongNm
 */
CREATE PROCEDURE `getRoleFromPath`(path VARCHAR(255))
BEGIN
	SELECT roles.id, roles.method FROM roles
	WHERE roles.link = path;
END //

/* Xóa thủ tục getDeletedGroupByName */
DROP PROCEDURE IF EXISTS getDeletedGroupByName //

/*
 * Lấy ra những nhóm đã xóa theo tên nhóm
 * Truyền vào `group_name` VARCHAR(255) tên nhóm
 * Trả về danh sách mã nhóm
 * VuongNM
 */
CREATE PROCEDURE `getDeletedGroupByName`(
	IN `group_name` VARCHAR(255)

)
BEGIN
	SELECT groups.group_id FROM groups
	WHERE groups.group_name = group_name AND groups.deleted_flag = 1;
END //

/* Xóa thủ tục getAllUserByGroup */
DROP PROCEDURE IF EXISTS getAllUserByGroup //

/*
 * Lấy ra danh sách user theo nhóm
 * Truyền vào mã nhóm người dung
 * Trả về danh sách user trong nhóm có mã tương ứng
 * VuongNm
 */
CREATE PROCEDURE `getAllUserByGroup`(
	IN `id` INT(4)

)
BEGIN
	SELECT users.id, users.full_name, users.department 
	FROM groups_users 
    LEFT JOIN users 
    ON groups_users.user_id = users.id
	WHERE groups_users.group_id = id
    AND users.deleted_flag = 0;
END //

/* Xóa thủ tục getAllGroupByUser */
DROP PROCEDURE IF EXISTS getAllGroupByUser //

/*
 * Lấy ra danh sách nhóm theo user
 * Truyền vào user_id INT(11) mã người dùng
 * Trả về danh sách mã nhóm có user đã chon
 * VuongNM
 */
CREATE PROCEDURE `getAllGroupByUser`(user_id INT(11))
BEGIN
	SELECT groups_users.group_id
	FROM groups_users WHERE groups_users.user_id = user_id;
END //

/* Xóa thủ tục deleteGroup */
DROP PROCEDURE IF EXISTS deleteGroup //

/* 
 * Xóa nhóm theo mã nhóm 
 * Truyền vào id INT(4): mã nhóm
 * Trả về true nếu cập nhật thành công, false nếu cập nhật không thành công
 * VuongNM
 */
CREATE PROCEDURE `deleteGroup`(id INT(4))
BEGIN
	UPDATE groups SET groups.deleted_flag = 1
	WHERE groups.group_id = id;
END //

/* Xóa thủ tục addUserToGroup */
DROP PROCEDURE IF EXISTS addUserToGroup //

/*
 * Thêm user vào nhóm
 * Truyền vào 
	group_id INT(4) - mã nhóm
	user_id INT(11) - mã người dùng
 * Trả về true nếu thêm thành công, false nếu thêm không thành công
 * VuongNM
 */
CREATE PROCEDURE `addUserToGroup`(group_id TINYINT(4), user_id INT(11))
BEGIN
	INSERT INTO groups_users(groups_users.group_id, groups_users.user_id)
	VALUES (group_id, user_id);	
END //

/* Xóa thủ tục addGroupRole */
DROP PROCEDURE IF EXISTS addGroupRole //

/*
 * Thêm quyền cho nhóm
 * Truyền vào 
	group_id INT(4) mã nhóm
	role_id INT(4) mã quyền
 * Trả về true nếu thêm thành công, false nếu thêm không thành công
 * vuongNM
 */
CREATE PROCEDURE `addGroupRole`(group_id INT(4), role_id INT(4))
BEGIN
	INSERT INTO groups_roles(groups_roles.group_id, groups_roles.role_id)
	VALUES (group_id, role_id);
END //

/* xóa thủ tục getListUsers */
DROP PROCEDURE IF EXISTS getListUsers //

/*
 * Lấy ra danh sách người dùng có phân trang
 * Truyền vào các điều kiện tìm kiếm
	fullName VARCHAR(255) CHARACTER SET utf8: tên đầy đủ của người dùng
    department VARCHAR(50): phòng ban của người dùng
    limitRecord INT(5): số bản ghi/trang
    offsetRecord INT(5): bản ghi bắt đầu lấy
 * Trả về tổng số user tìm được
 * NghiaDT
 */
CREATE PROCEDURE getListUsers(fullName VARCHAR(255) CHARACTER SET utf8, department VARCHAR(50), limitRecord INT(5), offsetRecord INT(5)) 
BEGIN

	SET fullName = CONCAT('%', fullName, '%');
    
    IF department = '' THEN SET department = NULL;
    END IF;

	SELECT user.id, user.user_id, user.username, user.full_name, user.department, user.email, user.skype, user.phone,
		   user.gender, user.position, user.identification_no, user.birthday
    FROM users user
    WHERE user.deleted_flag = 0
    AND user.full_name LIKE fullName COLLATE utf8_unicode_ci
    AND (user.department = department OR ISNULL(department))
    ORDER BY user.updated_at DESC
    LIMIT limitRecord OFFSET offsetRecord;
END //

/* Xóa thủ tục getTotalUsers */
DROP PROCEDURE IF EXISTS getTotalUsers //

/*
 * Lấy ra tổng số user tìm được
 * Truyền vào các điều kiện tìm kiếm
	fullName VARCHAR(255) CHARACTER SET utf8: tên đầy đủ của người dùng
    department VARCHAR(50): phòng ban của người dùng
 * Trả về tổng số user tìm được
 * NghiaDT
 */
CREATE PROCEDURE getTotalUsers(fullName VARCHAR(255) CHARACTER SET utf8, department VARCHAR(50))
BEGIN  
	SET fullName = CONCAT('%', fullName, '%');
    
    IF department = '' THEN SET department = NULL;
    END IF;
    
	SELECT COUNT(user.username) as total
    FROM users user
    WHERE user.deleted_flag = 0
    AND user.full_name LIKE fullName COLLATE utf8_unicode_ci
    AND (user.department = department OR ISNULL(department));
END //

/* Xóa thủ tục addNewUser */
DROP PROCEDURE IF EXISTS addNewUser //

/*
 * Thêm mới một user
 * Truyền vào thông tin người dùng:
	userId VARCHAR(10): mã người dùng
    fullName VARCHAR(255) CHARACTER SET utf8: tên đầy đủ của người dùng
    username VARCHAR(255): tên đăng nhập của người dùng
    pass VARCHAR(255): mật khẩu của người dùng
    gender TINYINT: giới tính của người dùng (0 - nam, 1 - nữ)
    identificationNo VARCHAR(15): số chứng minh thư của người dùng
    birthday DATETIME: ngày sinh của người dùng
	department VARCHAR(50): phòng ban của người dùng
    position VARCHAR(255): chức vụ của người dùng
    email VARCHAR(255): email của người dùng
    phone VARCHAR(15): số điện thoại của người dùng
    skype VARCHAR(50): skype của người dùng
    currentTime DATETIME: giờ cập nhật
 * Trả về true nếu thêm thành công, false nếu thêm không thành công
 * Nghiadt
 */
CREATE PROCEDURE addNewUser(
				fullName VARCHAR(255) CHARACTER SET utf8, 
                username VARCHAR(255), 
                pass VARCHAR(255), 
                gender TINYINT,
                identificationNo VARCHAR(15),
                birthday DATETIME,
                department VARCHAR(50) CHARACTER SET utf8, 
                position VARCHAR(255) CHARACTER SET utf8,
                email VARCHAR(255), 
                phone VARCHAR(15), 
                skype VARCHAR(50), 
                currentTime DATETIME
                )
BEGIN
	INSERT INTO users(full_name, username, password, gender, identification_no, birthday , department, position, email, phone, skype, created_at, updated_at)
			  VALUES (fullName, username, md5(pass), gender, identificationNo, str_to_date(birthday, '%Y-%m-%d %H:%i:%s')  , 
						department, position, email, phone, skype, str_to_date(currentTime, '%Y-%m-%d %H:%i:%s'),
						str_to_date(currentTime, '%Y-%m-%d %H:%i:%s'));
END //

/* Xóa thủ tục isExistedUsername */
DROP PROCEDURE IF EXISTS getExistedUsername //

CREATE PROCEDURE getExistedUsername(username VARCHAR(255))
BEGIN 
	SELECT username 
	FROM users user
	WHERE user.deleted_flag = 0
	AND user.username = username;
END //

/* Xóa thủ tục deleteUser */
DROP PROCEDURE IF EXISTS deleteUser //

/*
 * Xóa thông tin người dùng
 * Truyền vào strUsername VARCHAR(255) tên đăng nhập của người dùng
 * Trả về true nếu xóa thành công, false nếu xóa không thành công
 */
CREATE PROCEDURE deleteUser(strUsername VARCHAR(255)) 
BEGIN 
	UPDATE users
    SET users.deleted_flag = 1
    WHERE users.username = strUsername;
END; //

/* Xóa thủ tục editUser */
DROP PROCEDURE IF EXISTS editUser; //

/*
 * Thay đổi thông tin của người dùng
 * Truyền vào thông tin người dùng:
	userId VARCHAR(10): mã người dùng
    fullName VARCHAR(255) CHARACTER SET utf8: tên đầy đủ của người dùng
    strUsername VARCHAR(255): tên đăng nhập của người dùng
    pass VARCHAR(255): mật khẩu của người dùng
	strDepartment VARCHAR(50): phòng ban của người dùng
    strEmail VARCHAR(255): email của người dùng
    strPhone VARCHAR(15): số điện thoại của người dùng
    strSkype VARCHAR(50): skype của người dùng
    currentTime DATETIME: giờ cập nhật
 * Trả về true nếu cập nhật thành công, false nếu cập nhật không thành công
 * Nghiadt
 */
CREATE PROCEDURE editUser(fullName VARCHAR(255) CHARACTER SET utf8, strUsername VARCHAR(255), pass VARCHAR(255),
inputGender TINYINT, identNo VARCHAR(15), dateBirthday DATETIME, strPosition VARCHAR(255) CHARACTER SET utf8,
strDepartment VARCHAR(50) CHARACTER SET utf8, strEmail VARCHAR(255), strPhone VARCHAR(15), strSkype VARCHAR(50), currentTime DATETIME)
BEGIN

	IF pass = '' THEN SET pass = null;
    END IF;

	UPDATE users
    SET full_name = fullName COLLATE utf8_unicode_ci, 
    password = CASE WHEN pass IS NOT NULL THEN md5(pass) ELSE password END,
    gender = inputGender, identification_no = identNo, birthday = str_to_date(dateBirthday, '%Y-%m-%d %H:%i:%s'), position = strPosition,
    department = strDepartment, email = strEmail, phone = strPhone, skype = strSkype, updated_at = currentTime
    WHERE deleted_flag = 0
    AND username = strUsername;
END; //

/* Xóa thủ tục getAllHardwares */
DROP PROCEDURE IF EXISTS getAllHardwares //

/*
 * Lấy ra tất cả tài sản, có sắp xếp và phân trang
 * Truyền vào categoryId VARCHAR(10): mã loại tài sản
			  rqLimit INT(4): số bản ghi/trang
              rqOffset INT(4): bản ghi bắt đầu lấy
 * Trả về danh sách tài sản
 * NghiaDT
 */
CREATE PROCEDURE getAllHardwares(categoryId VARCHAR(10), rqLimit INT(4), rqOffset INT(4)) 
BEGIN 
	SELECT h.hardware_id, cate.category_name, h.hardware_name, h.price, DATE_FORMAT(h.expired_date, '%d/%m/%Y') AS expired_date, h.description, h.status, h.note, r.request_id
	FROM hardwares h 
    LEFT JOIN (SELECT request_id, hardware_id, MAX(created_at)
			   FROM requests 
               WHERE request_status = 0
               GROUP BY hardware_id) r
	ON h.hardware_id = r.hardware_id
	INNER JOIN categories cate
	ON cate.category_id = h.category_id
	WHERE cate.deleted_flag = 0
	AND h.deleted_flag = 0
    ORDER BY cate.category_id LIKE CONCAT('%',categoryId,'%') DESC, h.updated_at DESC
    LIMIT rqLimit OFFSET rqOffset;
END //

/* Xóa thủ tục getTotalHardwares */
DROP PROCEDURE IF EXISTS getTotalHardwares //

/*
 * Lấy ra tổng số tài sản chưa bị xóa
 * Trả về tổng số tài sản chưa bị xóa
 * NghiaDT
 */
 CREATE PROCEDURE getTotalHardwares()
 BEGIN
	SELECT COUNT(hardware_id) as total
    FROM hardwares 
    WHERE deleted_flag = 0;
 END; //
 
 /* Xóa thủ tục getAllProduction */
 DROP PROCEDURE IF EXISTS getAllProduction //
 
 /*
  * Lấy ra danh sách hãng sản xuất
  * Trả về danh sách hãng sản xuất
  * NghiaDT
  */
  CREATE PROCEDURE getAllProduction() 
  BEGIN
	SELECT production_id, production_name
    FROM productions
    WHERE deleted_flag = 0;
  END; //
  
 /* Xóa thủ tục getUser */
 DROP PROCEDURE IF EXISTS getUser //
 
 /*
  * Lấy ra user theo id của user
  * Truyền vào user_id id của user
  * Trả về danh sách user thỏa mãn điều kiện
  */
 CREATE PROCEDURE getUser(user_id int(11))
 BEGIN
 SELECT id, user_id, full_name, username, gender, 
	identification_no, birthday, department, position,
	email, phone, skype, avatar
	FROM users
	WHERE id = user_id;
 END; //
 
 /* Xóa thủ tục getAllHardwareIds */
 DROP PROCEDURE IF EXISTS getAllHardwareIds //
 
 /*
  * Lấy ra danh sách các mã, mã luvina, barcode, serial của tài sản
  * Trả về danh sách các mã, mã luvina, barcode, serial của tài sản
  * NghiaDT
  */
CREATE PROCEDURE getAllHardwareIds()
BEGIN      
	SELECT hardware_id, hardware_id_lu, barcode, serial
    FROM hardwares; 
END; //

/* Xóa thủ tục changeAvatar */
DROP PROCEDURE IF EXISTS changeAvatar //

/*
 * Thay đổi link chứa ảnh đại diện của user
 * Truyền vào id của user và link ảnh đại diện mới
 */
 CREATE PROCEDURE changeAvatar(userId INT(11), link VARCHAR(255) CHARACTER SET utf8)
 BEGIN
	UPDATE users
    SET avatar = link
    WHERE deleted_flag = 0
    AND id = userId;
 END; //
 
 /* Xóa thủ tục */
 DROP PROCEDURE IF EXISTS addImportHardware //
 
 /*
  * Thủ tục thêm thiết bị vào bảng hardwares
  * Truyền vào các thông tin của bảng hardwares
  * Trả về true nếu thêm thành công, false nếu thêm không thành công
  */
CREATE PROCEDURE `addImportHardware`(hardware_id VARCHAR(10), hardware_category VARCHAR(10), hardware_id_lu VARCHAR(10), barcode VARCHAR(50), hardware_name VARCHAR(255) CHARACTER SET utf8,
										status tinyint(1), price INT(11) , production TINYINT(4), buy_date DATETIME, suplier varchar(50) CHARACTER SET utf8, waranty_date DATETIME, expired_date DATETIME,
                                        description VARCHAR(255) CHARACTER SET utf8, serial VARCHAR(50), os VARCHAR(50), note TEXT CHARACTER SET utf8, created_at DATETIME, depreciated_months INT(4))
BEGIN
    
	INSERT INTO hardwares(hardware_id, hardware_id_lu, barcode, serial, hardware_name, os, supplier, category_id, buy_date, waranty_date,
						price, production_id, description, status, depreciated_months, expired_date, note, created_at, updated_at)
    VALUES(hardware_id, hardware_id_lu, barcode, serial, hardware_name, os, suplier, hardware_category, STR_TO_DATE(buy_date, '%Y-%m-%d %H:%i:%s'), 
                        STR_TO_DATE(waranty_date, '%Y-%m-%d %H:%i:%s'), price, production, description, status, depreciated_months, STR_TO_DATE(expired_date, '%Y-%m-%d %H:%i:%s'),
                        note, STR_TO_DATE(created_at, '%Y-%m-%d %H:%i:%s'), STR_TO_DATE(created_at, '%Y-%m-%d %H:%i:%s'));
END //

/* Xóa thủ tục updateHW */
DROP PROCEDURE IF EXISTS updateHW //

/*
 * Cập nhật người cấp phát cho các tài sản đã được cấp trước đó
 * Truyền vào mã người cấp phát, ngày cấp phát và mã tài sản
 * Trả về true nếu cập nhật thành công, false nếu cập nhật không thành công
 * SonNV
 */
CREATE PROCEDURE `updateHW`(allo_user_id INT(11), allo_date DATETIME, hardware_id VARCHAR(10))
BEGIN
	UPDATE hardware_management SET hardware_management.allo_user_id = allo_user_id, hardware_management.allocated_date = allo_date
	WHERE hardware_management.hardware_id = hardware_id AND hardware_management.retrieved_date IS NULL;
END //

/* Xóa thủ tục getHardwareIsUsedByUserId*/
DROP PROCEDURE IF EXISTS getHardwareIsUsedByUserId //

/*
 *
 *
 *
 */
CREATE PROCEDURE getHardwareIsUsedByUserId(userId INT(11)) 
BEGIN
	SELECT hm.hardware_id
    FROM hardware_management hm
    WHERE hm.user_id = userId
    AND ISNULL(hm.retrieved_date);
END; //


DELIMITER ;

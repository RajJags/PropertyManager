CREATE DATABASE  IF NOT EXISTS `project2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project2`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: project2
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'project2'
--

--
-- Dumping routines for database 'project2'
--
/*!50003 DROP PROCEDURE IF EXISTS `CreateLease` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateLease`(
IN lease_id_as_param INT,
IN property_id_as_param INT,
IN tenant_id_as_param INT,
IN owner_id_as_param INT,
IN start_date_as_param DATE,
IN end_date_as_param DATE, 
IN rent_amount_as_param INT,
IN deposit_amount_as_param INT, 
IN agency_commision_as_param INT, 
IN yearly_hike_as_param INT)
BEGIN
	INSERT INTO lease_agreement
    VALUES (lease_id_as_param, property_id_as_param, tenant_id_as_param, owner_id_as_param, start_date_as_param, end_date_as_param, 
			rent_amount_as_param, deposit_amount_as_param, agency_commision_as_param, yearly_hike_as_param);

UPDATE properties
SET is_available = 0
WHERE properties.properties_id = property_id_as_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewUser`(
    IN p_aadhar_id VARCHAR(20),
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_name VARCHAR(50),
    IN p_gender VARCHAR(10),
    IN p_dob DATE,
    IN p_address VARCHAR(100),
    IN p_user_type VARCHAR(10),
    IN p_annual_income INT,
    IN p_permission_id INT,
    IN phone_numbers VARCHAR(100)
)
BEGIN
    DECLARE v_user_id INT;
    
    -- insert user into users table
    INSERT INTO users(aadhar_id, username, password, email, name, gender, dob, address)
    VALUES(p_aadhar_id, p_username, p_password, p_email, p_name, p_gender, p_dob, p_address);
    
    -- get the new user_id
    SET v_user_id = LAST_INSERT_ID();
    
    -- insert additional data based on user type
    IF p_user_type = 'tenant' THEN
        INSERT INTO tenants(tenant_id, annual_income)
        VALUES(v_user_id, p_annual_income);
    ELSEIF p_user_type = 'owner' THEN
        INSERT INTO owner(owner_id, permission_id)
        VALUES(v_user_id, p_permission_id);
    ELSEIF p_user_type = 'manager' THEN
        INSERT INTO manager(manager_id, permission_id)
        VALUES(v_user_id, p_permission_id);
    END IF;
    
    -- Insert the phone numbers for the user into the phone table
	IF phone_numbers IS NOT NULL THEN
		INSERT INTO phone (user_id, phone_no)
		SELECT v_user_id, phone_number
		FROM JSON_TABLE(phone_numbers, '$[*]' COLUMNS (phone_number VARCHAR(50) PATH '$')) AS phone_numbers;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPropertyRecords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPropertyRecords`(
	IN owner_id_param INT
    )
BEGIN
	SELECT *
    FROM properties
    WHERE owner_id = owner_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRentHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRentHistory`(
	IN property_id_as_param INT
    )
BEGIN
	SELECT * 
    FROM lease_agreement
    WHERE property_id = property_id_as_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTenantDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTenantDetails`(
IN property_id_param INT
)
BEGIN
	SELECT u.user_id, aadhar_id, u.username, u.password, u.name, u.email, u.gender, u.dob, u.address, t.annual_income
	FROM users u
	JOIN tenants t ON u.user_id = t.tenant_id
	JOIN lease_agreement l ON t.tenant_id = l.tenant_id
	WHERE l.property_id = property_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertPropertyRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPropertyRecord`(
    IN property_id INT,
    IN owner_id INT,
    IN is_available TINYINT,
    IN property_type VARCHAR(10),
    IN address VARCHAR(115),
    IN square_footage INT,
    IN rental_price INT,
    IN yearly_hike INT,
    IN num_floors INT,
    IN year_of_construction YEAR,
    IN details VARCHAR(225),
    IN city VARCHAR(45),
    IN num_bedroom INT,
    IN num_bathroom INT,
    IN pets_allowed TINYINT,
    IN num_office INT,
    IN num_parking INT
)
BEGIN
    -- Insert into properties table
    INSERT INTO properties (properties_id, owner_id, is_available, property_type, address, square_footage, rental_price, yearly_hike, num_floors, year_of_construction, details, city)
    VALUES (property_id, owner_id, is_available, property_type, address, square_footage, rental_price, yearly_hike, num_floors, year_of_construction, details, city);

    -- Check the property type and insert into the respective table
    IF property_type = 'res' THEN
        INSERT INTO residential (property_id, num_bedroom, num_bathroom, pets_allowed)
        VALUES (property_id, num_bedroom, num_bathroom , pets_allowed);
    ELSEIF property_type = 'com' THEN
        INSERT INTO commercial (property_id, num_office, num_parking)
        VALUES (property_id, num_office, num_parking);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid property type';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_property` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_property`(
    IN property_id INT,
    IN owner_id INT,
    IN is_available TINYINT,
    IN property_type VARCHAR(10),
    IN address VARCHAR(115),
    IN square_footage INT,
    IN rental_price INT,
    IN yearly_hike INT,
    IN num_floors INT,
    IN year_of_construction YEAR,
    IN details VARCHAR(225),
    IN city VARCHAR(45),
    IN num_bedroom INT,
    IN num_bathroom INT,
    IN pets_allowed TINYINT,
    IN num_office INT,
    IN num_parking INT
)
BEGIN
    -- Insert into properties table
    INSERT INTO properties (properties_id, owner_id, is_available, property_type, address, square_footage, rental_price, yearly_hike, num_floors, year_of_construction, details, city)
    VALUES (property_id, owner_id, is_available, property_type, address, square_footage, rental_price, yearly_hike, num_floors, year_of_construction, details, city);

    -- Check the property type and insert into the respective table
    IF property_type = 'res' THEN
        INSERT INTO residential (property_id, num_bedroom, num_bathroom, pets_allowed)
        VALUES (property_id, num_bedroom, num_bathroom , pets_allowed);
    ELSEIF property_type = 'com' THEN
        INSERT INTO commercial (property_id, num_office, num_parking)
        VALUES (property_id, num_office, num_parking);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid property type';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchProperyForRent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchProperyForRent`(
	IN city_as_param VARCHAR(45)
    )
BEGIN
	SELECT * 
    FROM properties
    WHERE is_available = 1 AND city = city_as_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_properties_is_available` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_properties_is_available`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pid INT;
    DECLARE cur CURSOR FOR SELECT property_id FROM lease_agreement WHERE end_date < NOW();
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO pid;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE properties SET is_available = 1 WHERE properties_id = pid;
    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-02  6:28:25

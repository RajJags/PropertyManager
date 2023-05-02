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
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `properties_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `is_available` tinyint NOT NULL,
  `property_type` varchar(10) NOT NULL,
  `address` varchar(115) NOT NULL,
  `square_footage` int NOT NULL,
  `rental_price` int NOT NULL,
  `yearly_hike` int NOT NULL,
  `num_floors` int NOT NULL,
  `year_of_construction` year NOT NULL,
  `details` varchar(225) DEFAULT NULL,
  `lease_id` int DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`properties_id`),
  UNIQUE KEY `properties_id_UNIQUE` (`properties_id`),
  UNIQUE KEY `address_UNIQUE` (`address`),
  KEY `lease__idx` (`lease_id`),
  CONSTRAINT `lease_` FOREIGN KEY (`lease_id`) REFERENCES `lease_agreement` (`lease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,3,1,'res','avd',3000,25000,2,1,2010,NULL,NULL,'Mumbai'),(2,5,1,'com','ada',10000,500000,3,2,2015,NULL,2,'Cape Town'),(3,7,1,'com','xxdc',15000,600000,1,3,2016,NULL,1,'Sydney'),(4,8,0,'res','fvs',2000,35000,5,1,2020,NULL,4,'Paris'),(5,9,0,'com','gbd',17200,900000,1,4,2022,NULL,3,'New York'),(6,7,1,'res','bfd',5000,50000,2,2,2011,NULL,NULL,'Delhi'),(10,1,1,'res','123 Main St',2000,1500,1,2,2020,'Spacious living room, updated kitchen',NULL,'Lucknow'),(11,3,1,'res','anciadbiuabiu',2500,35000,2,2,2022,'hello friends!!',NULL,'Pune'),(12,7,1,'com','anaffjnaefbiu',5000,65000,2,2,2021,NULL,NULL,'Lucknow'),(13,9,1,'res','residence',300,20000,2,1,2017,'1bhk',NULL,'Mumbai');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-02  6:28:25

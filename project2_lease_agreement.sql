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
-- Table structure for table `lease_agreement`
--

DROP TABLE IF EXISTS `lease_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lease_agreement` (
  `lease_id` int NOT NULL,
  `property_id` int NOT NULL,
  `tenant_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `rent_amount` int NOT NULL,
  `deposit_amount` int NOT NULL,
  `agency_commision` int NOT NULL,
  `yearly_hike` int NOT NULL,
  PRIMARY KEY (`lease_id`),
  UNIQUE KEY `lease_id_UNIQUE` (`lease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease_agreement`
--

LOCK TABLES `lease_agreement` WRITE;
/*!40000 ALTER TABLE `lease_agreement` DISABLE KEYS */;
INSERT INTO `lease_agreement` VALUES (1,3,4,7,'2021-02-01','2022-02-01',7200000,5000000,500000,1),(2,2,10,5,'2021-01-01','2024-07-01',6000000,4500000,450000,3),(3,5,11,6,'2023-01-01','2025-01-01',9000000,6000000,600000,2),(4,4,11,8,'2023-01-01','2025-01-01',35000,20000,1000,1),(5,2,6,5,'2016-01-01','2017-01-01',6000000,4500000,400000,3),(10,12,9,7,'2021-01-01','2023-05-01',65000,50000,2000,2);
/*!40000 ALTER TABLE `lease_agreement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 22:40:52

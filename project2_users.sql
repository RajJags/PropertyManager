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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `aadhar_id` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` datetime NOT NULL,
  `address` varchar(115) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `aadhar_id_UNIQUE` (`aadhar_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'xxxxxxxxx','shikhar_s','abc','shikhar.sachan16@gmail.com','Shikhar Sachan','M','2001-09-01 00:00:00','xyz'),(2,'yyyyyyyyy','shashwat_t','abc','shashwat@gmail.com','Shashwat Tripathi','M','2002-04-02 00:00:00','abc'),(3,'zzzzzzzzzz','raj_j','jnjn','raj@yahoo.com','Raj Jagtap','M','2001-05-03 00:00:00','efg'),(4,'eeeeeeeee','anna','nsns','anna@gmail.com','Anna','F','1995-01-01 00:00:00','tgy'),(5,'tttttttttttt','edwin_a','ghdg','edaldrin@icloud.com','Edwin Aldrin','M','1965-01-01 00:00:00','qwr'),(6,'uuuuuuuuu','dolores_r','knhhk','dolores@gmail.com','Dolores O\'Riordan','F','1971-09-06 00:00:00','dvs'),(7,'rrrrrrrrrrr','nick_m','nnnnn','nick.m@gmail.com','Nick Mason','M','1975-01-01 00:00:00','acfd'),(8,'ffffffffffff','roger_w','aaaaaa','roger@gmail.com','Roger Waters','M','1980-01-01 00:00:00','afhd'),(9,'ddddddddd','david_g','ddddd','david.g@yahoo.com','David Gilmour','M','1979-01-01 00:00:00','sdvs'),(10,'afffffffffff','roger_wr','rfrrvs','richard.w@gmail.com','Richard Wright','M','1965-01-01 00:00:00','dvsvv'),(11,'jaaaaaaaa','syd_b','wvfrv','syd.b@gmail.com','Syd Barrett','M','1987-01-01 00:00:00','vdvsrv'),(12,'1234567890','johndoe','password','johndoe@example.com','John Doe','M','1990-01-01 00:00:00','123 Main St, Anytown USA'),(13,'jahbfbibi','shreyaan','shskankjv','shreyaan@gmail.com','shreyaan','M','2002-01-01 00:00:00','cjcbaihb chidbci'),(20,'hdhbsfsvi','rahul','govil','esafcfiibb@gmail.com','rahul','F','2002-01-01 00:00:00','kjncdiusbiuc'),(21,'alallas','a.ananya','ghane','ananya@gmail.com','ananya','F','2002-06-01 00:00:00','kdcsiuc'),(22,'1238039','Rajesh','password','raju10@gmail.com','Rajendra','M','2002-01-01 00:00:00','address'),(23,'abkabjk','shreya','ajkbak','shre@gmail.com','shreya','F','2002-01-01 00:00:00','bakkj');
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

-- Dump completed on 2023-05-01 22:40:51

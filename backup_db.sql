-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: wallet
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `b_id` int NOT NULL AUTO_INCREMENT,
  `BankName` varchar(50) DEFAULT NULL,
  `c_id` int DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `banks_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `currency` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'Mono',1),(2,'MTB',3),(3,'Pumb',2);
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `CurrencyName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'GBP'),(2,'EUR'),(3,'USD');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `PayDate` datetime NOT NULL,
  `b_id` int NOT NULL,
  `PaySum` decimal(8,2) DEFAULT NULL,
  `r_id` int NOT NULL,
  `sh_id` int NOT NULL,
  `pt_id` int DEFAULT NULL,
  `CreateDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`p_id`),
  KEY `payments_ibfk_3_idx` (`r_id`),
  KEY `sh_id` (`sh_id`),
  KEY `b_id` (`b_id`),
  KEY `pt_id` (`pt_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `reasons` (`r_id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`sh_id`) REFERENCES `subcategory` (`sh_id`),
  CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`b_id`) REFERENCES `banks` (`b_id`),
  CONSTRAINT `payments_ibfk_4` FOREIGN KEY (`pt_id`) REFERENCES `paytypes` (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'2023-10-01 00:00:00',1,70.39,10,20,1,'2024-01-12 22:59:14'),(2,'2023-10-01 00:00:00',2,737.72,10,20,1,'2024-01-12 22:59:14'),(3,'2023-10-01 00:00:00',3,34.83,10,20,1,'2024-01-12 22:59:14'),(4,'2023-10-02 00:00:00',2,-6.39,8,16,2,'2024-01-12 22:59:14'),(5,'2023-10-02 00:00:00',2,0.06,10,19,1,'2024-01-12 22:59:14'),(6,'2023-10-07 00:00:00',1,-20.97,1,2,2,'2024-01-12 22:59:14'),(7,'2023-10-10 00:00:00',1,-35.61,1,1,2,'2024-01-12 22:59:14'),(8,'2023-10-11 00:00:00',1,43.10,10,20,1,'2024-01-12 22:59:14'),(9,'2023-10-12 00:00:00',1,-32.31,1,1,2,'2024-01-12 22:59:14'),(10,'2023-10-12 00:00:00',1,184.37,10,20,1,'2024-01-12 22:59:14'),(11,'2023-10-13 00:00:00',3,45.12,10,20,1,'2024-01-12 22:59:14'),(12,'2023-10-14 00:00:00',1,-10.30,1,2,2,'2024-01-12 22:59:14'),(13,'2023-10-14 00:00:00',1,-5.40,10,21,2,'2024-01-12 22:59:14'),(14,'2023-10-15 00:00:00',1,-6.10,5,10,2,'2024-01-12 22:59:14'),(15,'2023-10-15 00:00:00',1,-6.10,5,9,2,'2024-01-12 22:59:14'),(16,'2023-10-16 00:00:00',1,-32.12,1,1,2,'2024-01-12 22:59:14'),(17,'2023-10-16 00:00:00',1,-5.40,8,16,2,'2024-01-12 22:59:14'),(18,'2023-10-19 00:00:00',1,180.50,10,20,1,'2024-01-12 22:59:14'),(19,'2023-10-20 00:00:00',3,-22.87,4,7,2,'2024-01-12 22:59:14'),(20,'2023-10-21 00:00:00',2,-7.60,8,15,2,'2024-01-12 22:59:14'),(21,'2023-10-22 00:00:00',2,0.08,10,19,1,'2024-01-12 22:59:14'),(22,'2023-10-24 00:00:00',1,-21.81,1,3,2,'2024-01-12 22:59:14'),(23,'2023-10-24 00:00:00',2,-2.50,8,15,2,'2024-01-12 22:59:14'),(24,'2023-10-25 00:00:00',1,-45.24,1,1,2,'2024-01-12 22:59:14'),(25,'2023-10-26 00:00:00',1,14.37,10,20,1,'2024-01-12 22:59:14'),(26,'2023-10-27 00:00:00',3,21.00,10,20,1,'2024-01-12 22:59:14'),(27,'2023-10-30 00:00:00',1,25.00,7,12,2,'2024-01-12 22:59:14'),(28,'2023-10-30 00:00:00',1,41.00,7,13,2,'2024-01-12 22:59:14'),(29,'2023-10-30 00:00:00',2,200.00,10,20,1,'2024-01-12 22:59:14'),(30,'2023-10-31 00:00:00',1,-33.14,1,1,2,'2024-01-12 22:59:14'),(31,'2023-10-31 00:00:00',1,300.00,10,20,1,'2024-01-12 22:59:14'),(32,'2023-11-01 00:00:00',2,-80.93,8,15,2,'2024-01-12 22:59:14'),(33,'2023-11-01 00:00:00',2,91.37,10,20,1,'2024-01-12 22:59:14'),(34,'2023-11-01 00:00:00',3,34.96,10,20,1,'2024-01-12 22:59:14'),(35,'2023-11-01 00:00:00',1,412.00,10,20,1,'2024-01-12 22:59:14'),(36,'2023-11-02 00:00:00',1,-7.98,1,3,2,'2024-01-12 22:59:14'),(37,'2023-11-02 00:00:00',1,-10.34,1,4,2,'2024-01-12 22:59:14'),(38,'2023-11-03 00:00:00',1,-50.00,3,6,2,'2024-01-12 22:59:14'),(39,'2023-11-03 00:00:00',1,-5.40,5,10,2,'2024-01-12 22:59:14'),(40,'2023-11-07 00:00:00',1,-32.81,1,1,2,'2024-01-12 22:59:14'),(41,'2023-11-07 00:00:00',1,-51.00,7,13,2,'2024-01-12 22:59:14'),(42,'2023-11-07 00:00:00',1,-41.00,7,14,1,'2024-01-12 22:59:14'),(43,'2023-11-08 00:00:00',1,-28.88,1,3,2,'2024-01-12 22:59:14'),(44,'2023-11-09 00:00:00',1,-39.99,8,15,2,'2024-01-12 22:59:14'),(45,'2023-11-10 00:00:00',3,146.00,10,19,1,'2024-01-12 22:59:14'),(46,'2023-11-10 00:00:00',1,18.37,10,20,1,'2024-01-12 22:59:14'),(47,'2023-11-11 00:00:00',1,-10.20,1,4,2,'2024-01-12 22:59:14'),(48,'2023-11-11 00:00:00',1,-34.98,8,15,2,'2024-01-12 22:59:14'),(49,'2023-11-11 00:00:00',1,-5.40,10,21,2,'2024-01-12 22:59:14'),(50,'2023-11-12 00:00:00',1,-28.33,1,1,2,'2024-01-12 22:59:14'),(51,'2023-11-14 00:00:00',1,-13.91,1,1,2,'2024-01-12 22:59:14'),(52,'2023-11-17 00:00:00',1,-25.00,3,6,2,'2024-01-12 22:59:14'),(53,'2023-11-18 00:00:00',1,-15.36,9,18,2,'2024-01-12 22:59:14'),(54,'2023-11-19 00:00:00',1,-35.11,9,18,2,'2024-01-12 22:59:14'),(55,'2023-11-20 00:00:00',3,-22.87,3,5,2,'2024-01-12 22:59:14'),(56,'2023-11-24 00:00:00',3,107.94,10,19,1,'2024-01-12 22:59:14'),(57,'2023-11-24 00:00:00',1,114.37,10,20,1,'2024-01-12 22:59:14'),(58,'2023-12-01 00:00:00',1,-3.48,6,11,2,'2024-01-12 22:59:14'),(59,'2023-12-01 00:00:00',1,-4.87,6,11,2,'2024-01-12 22:59:14'),(60,'2023-12-01 00:00:00',1,23.28,10,20,1,'2024-01-12 22:59:14'),(61,'2023-12-01 00:00:00',3,51.09,10,20,1,'2024-01-12 22:59:14'),(62,'2023-12-01 00:00:00',2,100.44,10,20,1,'2024-01-12 22:59:14'),(63,'2023-12-03 00:00:00',1,-11.00,1,2,2,'2024-01-12 22:59:14'),(64,'2023-12-07 00:00:00',1,-8.54,1,2,2,'2024-01-12 22:59:14'),(65,'2023-12-08 00:00:00',3,58.95,10,19,1,'2024-01-12 22:59:14'),(66,'2023-12-09 00:00:00',1,-33.44,7,12,2,'2024-01-12 22:59:14'),(67,'2023-12-09 00:00:00',1,-35.00,2,22,2,'2024-01-12 22:59:15'),(68,'2023-12-10 00:00:00',1,-25.02,1,1,2,'2024-01-12 22:59:15'),(69,'2023-12-12 00:00:00',1,76.38,10,19,1,'2024-01-12 22:59:15'),(70,'2023-12-14 00:00:00',1,-31.57,1,1,2,'2024-01-12 22:59:15'),(71,'2023-12-16 00:00:00',1,-10.80,2,22,2,'2024-01-12 22:59:15'),(72,'2023-12-19 00:00:00',1,-13.47,1,2,2,'2024-01-12 22:59:15'),(73,'2023-12-20 00:00:00',3,-22.87,3,5,2,'2024-01-12 22:59:15'),(74,'2023-12-20 00:00:00',1,-5.40,10,21,2,'2024-01-12 22:59:15'),(75,'2023-12-22 00:00:00',1,184.37,10,20,1,'2024-01-12 22:59:15'),(76,'2023-12-22 00:00:00',3,42.00,10,20,1,'2024-01-12 22:59:15'),(77,'2023-12-26 00:00:00',2,-36.99,3,5,2,'2024-01-12 22:59:15'),(78,'2023-12-27 00:00:00',1,-17.45,7,13,2,'2024-01-12 22:59:15'),(79,'2023-12-27 00:00:00',1,-26.00,7,14,2,'2024-01-12 22:59:15'),(80,'2023-12-28 00:00:00',2,-34.84,1,2,2,'2024-01-12 22:59:15'),(81,'2023-12-28 00:00:00',1,-350.00,7,12,2,'2024-01-12 22:59:15'),(82,'2023-12-31 00:00:00',1,-10.00,9,17,2,'2024-01-12 22:59:15'),(83,'2024-01-01 00:00:00',2,112.61,10,20,1,'2024-01-12 22:59:15'),(84,'2024-01-01 00:00:00',1,22.98,10,20,1,'2024-01-12 22:59:15'),(85,'2024-01-01 00:00:00',3,57.22,10,20,1,'2024-01-12 22:59:15'),(86,'2024-01-03 00:00:00',2,-34.94,7,14,2,'2024-01-12 22:59:15'),(87,'2024-01-03 00:00:00',1,-12.00,9,17,2,'2024-01-12 22:59:15'),(88,'2024-01-05 00:00:00',2,-27.17,1,2,2,'2024-01-12 22:59:15'),(89,'2024-01-05 00:00:00',3,69.43,10,19,1,'2024-01-12 22:59:15'),(90,'2024-01-09 00:00:00',2,-19.35,1,2,2,'2024-01-12 22:59:15'),(91,'2024-01-09 00:00:00',2,-5.35,1,3,2,'2024-01-12 22:59:15'),(92,'2024-01-09 00:00:00',3,-5.40,9,17,2,'2024-01-12 22:59:15'),(93,'2024-01-10 00:00:00',3,-5.40,2,22,2,'2024-01-12 22:59:15'),(94,'2024-01-11 00:00:00',2,-15.20,1,3,2,'2024-01-12 22:59:15'),(95,'2024-01-12 00:00:00',1,-190.00,7,12,2,'2024-01-12 22:59:15'),(96,'2024-01-12 00:00:00',1,84.37,10,20,1,'2024-01-12 22:59:15');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paytypes`
--

DROP TABLE IF EXISTS `paytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paytypes` (
  `pt_id` int NOT NULL AUTO_INCREMENT,
  `PayName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paytypes`
--

LOCK TABLES `paytypes` WRITE;
/*!40000 ALTER TABLE `paytypes` DISABLE KEYS */;
INSERT INTO `paytypes` VALUES (1,'Income'),(2,'Outcome');
/*!40000 ALTER TABLE `paytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reasons`
--

DROP TABLE IF EXISTS `reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reasons` (
  `r_id` int NOT NULL AUTO_INCREMENT,
  `ReasonName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reasons`
--

LOCK TABLES `reasons` WRITE;
/*!40000 ALTER TABLE `reasons` DISABLE KEYS */;
INSERT INTO `reasons` VALUES (1,'Groceries'),(2,'Transportation'),(3,'Housing'),(4,'Entertainment'),(5,'Education'),(6,'Health'),(7,'Utilities'),(8,'Shopping'),(9,'Travel'),(10,'Other');
/*!40000 ALTER TABLE `reasons` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ReasonName_bi` BEFORE INSERT ON `reasons` FOR EACH ROW BEGIN
	SET NEW.ReasonName = CONCAT(UPPER(SUBSTRING(NEW.ReasonName,1,1)),
						LOWER(SUBSTRING(NEW.ReasonName FROM 2)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `saldo`
--

DROP TABLE IF EXISTS `saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saldo` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `b_id` int DEFAULT NULL,
  `Period` varchar(10) DEFAULT NULL,
  `SaldoBegin` decimal(8,2) DEFAULT NULL,
  `Debet` decimal(8,2) DEFAULT NULL,
  `Kredit` decimal(8,2) DEFAULT NULL,
  `SaldoEnd` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `b_id` (`b_id`),
  CONSTRAINT `saldo_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `banks` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saldo`
--

LOCK TABLES `saldo` WRITE;
/*!40000 ALTER TABLE `saldo` DISABLE KEYS */;
INSERT INTO `saldo` VALUES (1,1,'2023-10-01',0.00,792.73,-188.50,604.23),(2,2,'2023-10-01',0.00,937.86,-16.49,921.37),(3,3,'2023-10-01',0.00,100.95,-22.87,78.08),(4,1,'2023-11-01',604.23,503.74,-394.69,713.28),(5,2,'2023-11-01',921.37,91.37,-80.93,931.81),(6,3,'2023-11-01',78.08,288.90,-22.87,344.11),(7,1,'2023-12-01',713.28,284.03,-586.04,411.27),(8,2,'2023-12-01',931.81,100.44,-71.83,960.42),(9,3,'2023-12-01',344.11,152.04,-22.87,473.28),(10,1,'2024-01-01',411.27,107.35,-202.00,316.62),(11,2,'2024-01-01',960.42,112.61,-102.01,971.02),(12,3,'2024-01-01',473.28,126.65,-10.80,589.13),(13,1,'2024-02-01',316.62,0.00,0.00,0.00),(14,2,'2024-02-01',971.02,0.00,0.00,0.00),(15,3,'2024-02-01',589.13,0.00,0.00,0.00);
/*!40000 ALTER TABLE `saldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `sh_id` int NOT NULL AUTO_INCREMENT,
  `subcategory` varchar(30) DEFAULT NULL,
  `r_id` int DEFAULT NULL,
  PRIMARY KEY (`sh_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `reasons` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Lidl',1),(2,'Morrison',1),(3,'Iceland',1),(4,'Other',1),(5,'Rent/mortgage',3),(6,'Home maintenance',3),(7,'Movies',4),(8,'Concerts',4),(9,'Tuition fees',5),(10,'Books',5),(11,'Doctor visits',6),(12,'Gas',7),(13,'Electricity',7),(14,'Water',7),(15,'Clothing',8),(16,'Electronics',8),(17,'Vacation',9),(18,'Business travel',9),(19,'Other cashback',10),(20,'Other income',10),(21,'Other outcome',10),(22,'Bus',2);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `subcategory_bi` BEFORE INSERT ON `subcategory` FOR EACH ROW BEGIN
	SET NEW.subcategory = CONCAT(UPPER(SUBSTRING(NEW.subcategory,1,1)),
						LOWER(SUBSTRING(NEW.subcategory FROM 2)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_payments`
--

DROP TABLE IF EXISTS `vw_payments`;
/*!50001 DROP VIEW IF EXISTS `vw_payments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_payments` AS SELECT 
 1 AS `PayDate`,
 1 AS `b_id`,
 1 AS `PaySum`,
 1 AS `r_id`,
 1 AS `sh_id`,
 1 AS `pt_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_transactions`
--

DROP TABLE IF EXISTS `vw_transactions`;
/*!50001 DROP VIEW IF EXISTS `vw_transactions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_transactions` AS SELECT 
 1 AS `BankName`,
 1 AS `PayDate`,
 1 AS `PaySum`,
 1 AS `ReasonName`,
 1 AS `subcategory`,
 1 AS `CurrencyName`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'wallet'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `saldo_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `saldo_event` ON SCHEDULE EVERY 1 DAY STARTS '2024-01-17 01:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
		DECLARE nowmonth VARCHAR(10);
        DECLARE countBanks tinyint;
        DECLARE counter tinyint default 1;
        SELECT MAX(b_id) INTO countBanks FROM Banks;
		SET nowmonth=DATE_FORMAT(NOW() ,'%Y-%m-01');
        WHILE countBanks>=counter DO
			CALL calcSaldo(nowmonth,counter);        
			SET counter =counter + 1;
		END WHILE;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'wallet'
--
/*!50003 DROP PROCEDURE IF EXISTS `calcSaldo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calcSaldo`(IN lastMonth datetime, bank_id tinyint )
BEGIN 
	DECLARE vDebet DECIMAL(8,2);
    DECLARE vKredit DECIMAL(8,2);
    DECLARE vSaldoEnd DECIMAL(8,2);
    DECLARE vSaldoBegin DECIMAL(8,2);
	SELECT sum(case when pt_id=1 then PaySum else 0 end), sum(case when pt_id=2 then PaySum else 0 end), sum(PaySum) INTO vDebet, vKredit,  vSaldoEnd
	FROM Payments  
	WHERE PayDate between lastMonth and LAST_DAY(lastMonth)  AND b_id=bank_id
    GROUP BY b_id, lastMonth;
    UPDATE Saldo SET Debet=vDebet, Kredit=vKredit, SaldoEnd=SaldoBegin+vSaldoEnd
    where b_id= bank_id AND Period = lastMonth;
	SELECT SaldoEnd INTO vSaldoBegin FROM Saldo where b_id= bank_id AND Period = lastMonth;
	UPDATE Saldo SET SaldoBegin=vSaldoBegin
    where b_id= bank_id AND Period = DATE_ADD(LAST_DAY(lastMonth), INTERVAL 1 DAY);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_payments`
--

/*!50001 DROP VIEW IF EXISTS `vw_payments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_payments` AS select `payments`.`PayDate` AS `PayDate`,`payments`.`b_id` AS `b_id`,`payments`.`PaySum` AS `PaySum`,`payments`.`r_id` AS `r_id`,`payments`.`sh_id` AS `sh_id`,`payments`.`pt_id` AS `pt_id` from `payments` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_transactions`
--

/*!50001 DROP VIEW IF EXISTS `vw_transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_transactions` AS select `b`.`BankName` AS `BankName`,`p`.`PayDate` AS `PayDate`,`p`.`PaySum` AS `PaySum`,`r`.`ReasonName` AS `ReasonName`,`s`.`subcategory` AS `subcategory`,`c`.`CurrencyName` AS `CurrencyName` from ((((`payments` `p` join `subcategory` `s` on((`p`.`sh_id` = `s`.`sh_id`))) join `banks` `b` on((`p`.`b_id` = `b`.`b_id`))) join `currency` `c` on((`b`.`c_id` = `c`.`c_id`))) join `reasons` `r` on((`p`.`r_id` = `r`.`r_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-16 14:10:58

-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: telco
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `churn`
--
#creating the churn table 
DROP TABLE IF EXISTS `churn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `churn` (
  `churnid` int NOT NULL,
  `customerID` varchar(50) NOT NULL,
  `churn_label` varchar(45) NOT NULL,
  `churn_value` int NOT NULL,
  `churn_score` int NOT NULL,
  `churn_reason` varchar(50) NOT NULL,
  PRIMARY KEY (`churnid`),
  KEY `customerID_idx` (`customerID`),
  CONSTRAINT `customerID` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `churn`
--

LOCK TABLES `churn` WRITE;
/*!40000 ALTER TABLE `churn` DISABLE KEYS */;
INSERT INTO `churn` VALUES (101,'3668-QPYBK','yes',1,86,'competitor made better offer'),(102,'9237-HQITU','yes',1,67,'moved'),(103,'9305-CDSKC','yes',1,86,'moved'),(104,'7892-POOKP','yes',1,84,'moved'),(105,'0280-XJGEX','yes',1,89,'competitor had better devices'),(106,'4190-MFLUW','yes',1,78,'competitor offered higher download speeds'),(107,'8779-QRDMV','yes',1,100,'competitor offered more data'),(108,'1066-JKSGK','yes',1,92,'competitor made better offer'),(109,'6467-CHFZW','yes',1,77,'competitor had better devices'),(110,'8665-UTDHZ','yes',1,97,'competitor had better devices');
/*!40000 ALTER TABLE `churn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--
#creating the customer table
DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `partner` varchar(50) NOT NULL,
  `senior_citizen` varchar(50) NOT NULL,
  `dependents` varchar(50) NOT NULL,
  `CLTV` int NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('0280-XJGEX','male','no','no','yes',5340),('1066-JKSGK','male','no','no','no',4832),('3668-QPYBK','male','no','no','no',3239),('4190-MFLUW','female','yes','no','no',5925),('6467-CHFZW','male','yes','no','yes',5789),('7892-POOKP','female','yes','no','yes',5003),('8665-UTDHZ','male','yes','no','no',2915),('8779-QRDMV','male','no','yes','no',5433),('9237-HQITU','female','no','no','yes',2701),('9305-CDSKC','female','no','no','yes',5372);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--
#creating the location table
DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `locID` int NOT NULL,
  `customerID` varchar(50) NOT NULL,
  `country` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zip_code` int NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  PRIMARY KEY (`locID`),
  KEY `custID3_idx` (`customerID`),
  CONSTRAINT `custID3` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (401,'3668-QPYBK','United States','California','Los Angeles',90003,33.9641,-118.273),(402,'9237-HQITU','United States','California','Los Angeles',90005,34.0593,-118.307),(403,'9305-CDSKC','United States','California','Los Angeles',90006,34.048,-118.294),(404,'7892-POOKP','United States','California','Los Angeles',90010,34.0621,-118.316),(405,'0280-XJGEX','United States','California','Los Angeles',90015,34.0392,-118.266),(406,'4190-MFLUW','United States','California','Los Angeles',90020,34.0664,-118.31),(407,'8779-QRDMV','United States','California','Los AngelesLos Angeles',90022,34.0238,-118.157),(408,'1066-JKSGK','United States','California','Los Angeles',90024,34.0663,-118.435),(409,'6467-CHFZW','United States','California','Los Angeles',90028,34.0999,-118.327),(410,'8665-UTDHZ','United States','California','Los Angeles',90029,34.09,-118.295);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--
#creating the Payments table
DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payID` int NOT NULL,
  `customerID` varchar(50) NOT NULL,
  `paperless_billing` varchar(45) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `monthly_charges` float NOT NULL,
  `total_charges` float NOT NULL,
  `Tenure_months` int NOT NULL,
  PRIMARY KEY (`payID`),
  KEY `customerID_idx` (`customerID`),
  KEY `payID` (`payID`,`customerID`),
  CONSTRAINT `custofID` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--
LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (201,'3668-QPYBK','yes','mailed check',53.85,108.15,2),(202,'9237-HQITU','yes','electronic check',70.7,151.65,2),(203,'9305-CDSKC','yes','electronic check',99.65,820.5,8),(204,'7892-POOKP','yes','electronic check',104.8,3046.05,28),(205,'0280-XJGEX','yes','bank transfer(automatic)',103.7,5036.3,49),(206,'4190-MFLUW','no','credit card(automatic)',55.2,528.35,10),(207,'8779-QRDMV','yes','electronic check',39.65,39.65,1),(208,'1066-JKSGK','no','mailed check',2015,20.15,1),(209,'6467-CHFZW','yes','electronic check',99.35,4749.15,47),(210,'8665-UTDHZ','no','electronic check',30.2,30.2,1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--
#creating the services table
DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `serviceid` int NOT NULL,
  `customerID` varchar(50) NOT NULL,
  `phone_service` varchar(45) NOT NULL,
  `multiple_lines` varchar(45) NOT NULL,
  `internet_service` varchar(45) NOT NULL,
  `online_security` varchar(45) NOT NULL,
  `online_backup` varchar(45) NOT NULL,
  `device_backup` varchar(45) NOT NULL,
  `tech_support` varchar(45) NOT NULL,
  `streaming_tv` varchar(45) NOT NULL,
  `streaming_movies` varchar(45) NOT NULL,
  `contract` varchar(45) NOT NULL,
  PRIMARY KEY (`serviceid`),
  KEY `customerID_idx` (`customerID`),
  CONSTRAINT `customerid2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'3668-QPYBK','yes','no','DSL','yes','yes','no','no','no','no','Month-to-month'),(2,'9237-HQITU','yes','no','fiber optic','no','no','no','no','no','no','Month-to-month'),(3,'9305-CDSKC','yes','yes','fiber optic','no','no','yes','no','yes','yes','Month-to-month'),(4,'7892-POOKP','yes','yes','fiber optic','no','no','yes','yes','yes','yes','Month-to-month'),(5,'0280-XJGEX','yes','yes','fiber optic','no','yes','yes','no','yes','yes','Month-to-month'),(6,'4190-MFLUW','yes','no','DSL','no','no','yes','yes','no','no','Month-to-month'),(7,'8779-QRDMV','no','no phone service','DSL','no','no','yes','no','no','yes','Month-to-month'),(8,'1066-JKSGK','yes','no','no','no internet service','no internet service','no internet service','no internet service','no internet service','no internet service','Month-to-month'),(9,'6467-CHFZW','yes','yes','fiber optic','no','yes','no','no','yes','yes','Month-to-month'),(10,'8665-UTDHZ','no','no phone service','DSL','no','yes','no','no','no','no','Month-to-month');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-25  4:21:09

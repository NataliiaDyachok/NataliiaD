-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: work13
-- ------------------------------------------------------
-- Server version	5.7.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe` (
  `employe_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'employee_ID',
  `first_name` varchar(127) NOT NULL COMMENT 'first name',
  `last_name` varchar(127) NOT NULL COMMENT 'last name',
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`employe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='employee';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,'Elvin','Thomas','1993-10-23'),(2,'Kent','Peacock','1999-05-12'),(3,'Anna','Ross','1985-12-31'),(4,'Augusta','Walter','1983-05-23'),(5,'Audrey','Smith','1991-10-11'),(6,'Allan','Butler','2000-04-23'),(7,'Carla','Williams','1988-08-21'),(8,'Claudia','Sinclair','1975-03-24'),(9,'Deborah','Waite','1981-06-11'),(10,'Andrew','Grant','1968-01-13');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income` (
  `income_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'income item id',
  `income_date` date NOT NULL COMMENT 'income date',
  `employe_id` int(10) unsigned NOT NULL COMMENT 'employee id',
  `transport_id` int(10) unsigned NOT NULL COMMENT 'transport id',
  `income_sum` decimal(20,6) NOT NULL COMMENT 'income sum',
  PRIMARY KEY (`income_item_id`),
  KEY `income_employe_id_employe_employe_id` (`employe_id`),
  KEY `income_transport_id_transport_transport_id` (`transport_id`),
  CONSTRAINT `income_employe_id_employe_employe_id` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`) ON UPDATE CASCADE,
  CONSTRAINT `income_transport_id_transport_transport_id` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='income';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,'2019-10-23',4,6,60000.000000),(2,'2019-09-23',5,7,35000.000000),(3,'2019-10-23',6,8,87000.000000),(4,'2019-09-23',7,9,84000.000000),(5,'2019-08-23',8,10,79000.000000),(6,'2019-08-23',9,1,42000.000000),(7,'2019-08-23',10,2,38000.000000),(8,'2019-10-24',4,6,55000.000000),(9,'2019-09-24',5,7,37000.000000),(10,'2019-10-24',6,8,85000.000000),(11,'2019-09-24',7,9,82400.000000),(12,'2019-08-24',8,10,92000.000000),(13,'2019-08-24',9,1,39000.000000),(14,'2019-08-24',10,2,35000.000000),(15,'2019-10-25',4,6,63000.000000),(16,'2019-09-25',5,7,39000.000000),(17,'2019-10-25',6,8,87000.000000),(18,'2019-09-25',7,9,85000.000000),(19,'2019-08-25',8,10,91000.000000),(20,'2019-08-25',9,1,40000.000000),(21,'2019-08-25',10,2,38000.000000),(22,'2019-10-26',4,6,70000.000000),(23,'2019-09-26',5,7,41000.000000),(24,'2019-10-26',6,8,89000.000000),(25,'2019-09-26',7,9,82000.000000),(26,'2019-08-26',8,10,93500.000000),(27,'2019-08-26',9,1,44000.000000),(28,'2019-08-26',10,2,37500.000000);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'job item id',
  `job_bdate` date NOT NULL COMMENT 'job bdate',
  `job_edate` date NOT NULL COMMENT 'job edate',
  `employe_id` int(10) unsigned NOT NULL COMMENT 'employee id',
  `position_id` int(10) unsigned NOT NULL COMMENT 'position id',
  PRIMARY KEY (`job_item_id`),
  KEY `job_employe_id_employe_employe_id` (`employe_id`),
  KEY `job_position_id_position_position_id` (`position_id`),
  CONSTRAINT `job_employe_id_employe_employe_id` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`) ON UPDATE CASCADE,
  CONSTRAINT `job_position_id_position_position_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='job';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'2019-10-01','2020-10-01',1,1),(2,'2019-10-01','2020-10-01',2,5),(3,'2019-10-01','2020-10-01',3,2),(4,'2019-10-01','2020-10-01',4,3),(5,'2019-10-01','2020-10-01',5,3),(6,'2019-10-01','2020-10-01',6,3),(7,'2019-10-01','2020-10-01',7,3),(8,'2019-10-01','2020-10-01',8,3),(9,'2019-10-01','2020-10-01',9,3),(10,'2019-10-01','2020-10-01',10,3);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'position id',
  `position_name` varchar(127) NOT NULL COMMENT 'position name',
  `is_drive` bit(1) NOT NULL COMMENT 'is_drive',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='position';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Car mechanic',_binary '\0'),(2,'Manager',_binary '\0'),(3,'driver',_binary ''),(4,'conductor',_binary '\0'),(5,'accountant',_binary '\0'),(6,'Car mechanic',_binary '\0'),(7,'Manager',_binary '\0'),(8,'driver',_binary ''),(9,'conductor',_binary '\0'),(10,'accountant',_binary '\0');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'salary item id',
  `salary_date` date NOT NULL COMMENT 'salary date',
  `employe_id` int(10) unsigned NOT NULL COMMENT 'employee id',
  `salary_sum` decimal(20,6) NOT NULL COMMENT 'salary sum',
  PRIMARY KEY (`item_id`),
  KEY `salary_employe_id_employe_employe_id` (`employe_id`),
  CONSTRAINT `salary_employe_id_employe_employe_id` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`employe_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='salary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'2019-10-22',1,6000.000000),(2,'2019-09-22',1,3500.000000),(3,'2019-08-22',1,4000.000000),(4,'2019-10-22',2,10000.000000),(5,'2019-09-22',2,9000.000000),(6,'2019-08-22',2,8700.000000),(7,'2019-10-22',3,6000.000000),(8,'2019-09-22',3,6000.000000),(9,'2019-08-22',3,6000.000000),(10,'2019-10-22',4,5000.000000),(11,'2019-09-22',4,4800.000000),(12,'2019-08-22',4,4600.000000),(13,'2019-10-22',5,7500.000000),(14,'2019-09-22',5,7400.000000),(15,'2019-08-22',5,7100.000000),(16,'2019-10-22',6,5150.000000),(17,'2019-09-22',6,5050.000000),(18,'2019-08-22',6,4800.000000),(19,'2019-10-22',7,12000.000000),(20,'2019-09-22',7,11800.000000),(21,'2019-08-22',7,10000.000000),(22,'2019-10-22',8,5800.000000),(23,'2019-09-22',8,5400.000000),(24,'2019-08-22',8,4800.000000),(25,'2019-10-22',9,6000.000000),(26,'2019-09-22',9,4600.000000),(27,'2019-08-22',9,4200.000000),(28,'2019-10-22',10,8700.000000),(29,'2019-09-22',10,8400.000000),(30,'2019-08-22',10,7900.000000);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `transport_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'transport',
  `transport_type_id` int(10) unsigned NOT NULL COMMENT 'transport_type id',
  `transport_number` varchar(127) NOT NULL COMMENT 'transport_number',
  PRIMARY KEY (`transport_id`),
  KEY `transport_transport_type_id_transport_type_transport_type_id` (`transport_type_id`),
  CONSTRAINT `transport_transport_type_id_transport_type_transport_type_id` FOREIGN KEY (`transport_type_id`) REFERENCES `transport_type` (`transport_type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,1,'tb 1'),(2,1,'tb 2'),(3,1,'tb 3'),(4,1,'tb 4'),(5,1,'tb 5'),(6,2,'b 1'),(7,2,'b 2'),(8,2,'b 3'),(9,2,'b 4'),(10,2,'b 5'),(11,3,'c 1'),(12,3,'c 2'),(13,3,'c 3'),(14,3,'c 4'),(15,3,'c 5');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_type`
--

DROP TABLE IF EXISTS `transport_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_type` (
  `transport_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'transport_type',
  `transport_type_name` varchar(127) NOT NULL COMMENT 'transport_type name',
  PRIMARY KEY (`transport_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='employe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_type`
--

LOCK TABLES `transport_type` WRITE;
/*!40000 ALTER TABLE `transport_type` DISABLE KEYS */;
INSERT INTO `transport_type` VALUES (1,'trolley bus'),(2,'bus'),(3,'car');
/*!40000 ALTER TABLE `transport_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-06  0:25:01

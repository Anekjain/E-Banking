-- MySQL dump 10.13  Distrib 5.5.54, for Win64 (AMD64)
--
-- Host: localhost    Database: ebank
-- ------------------------------------------------------
-- Server version	5.5.54

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
-- Table structure for table `accountinfo`
--

DROP TABLE IF EXISTS `accountinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountinfo` (
  `AcNo` int(11) NOT NULL,
  `AcName` varchar(45) NOT NULL,
  `DoB` date NOT NULL,
  `Address` varchar(60) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `ContactNo` varchar(10) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `PANno` varchar(20) NOT NULL,
  `Balance` double NOT NULL,
  `Ac_Type` varchar(10) NOT NULL,
  PRIMARY KEY (`AcNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountinfo`
--

LOCK TABLES `accountinfo` WRITE;
/*!40000 ALTER TABLE `accountinfo` DISABLE KEYS */;
INSERT INTO `accountinfo` VALUES (12345,'Anek Jain','1996-05-25','1-8-30/5/H','Secunderabad','Telangana','India','9032110421','jainanek@gmail.com','ANEK1996',436292,'Saving'),(22565,'Vivek Vasudev','1995-07-24','plot No 201 Sainikpuri','Secunderabad','Telangana','India','8121781637','vivekvasudev@gmail.com','VIVE1995',62199,'Saving'),(45211,'Kishore Jain','1969-03-06','1-8-30/5/H','Secunderabad','Telangana','India','8522962069','kishoreporwal69@gmail.com','KISH1969',266200,'Saving'),(54321,'Khitesh Jain','2000-02-04','1-8-30/5/H','Secunderabad','Telangana','India','9640187188','khiteshjain09@gmail.com','KHIT2000',81385,'Saving'),(54963,'Sangam Jain','1974-01-01','1-8-30/5/H','Secunderabad','Telangana','India','9396462576','sangamporwal@gmail.com','SANG1974',603660,'Saving');
/*!40000 ALTER TABLE `accountinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eaccounts`
--

DROP TABLE IF EXISTS `eaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eaccounts` (
  `Acno` int(11) NOT NULL,
  `Uid` varchar(45) NOT NULL,
  `Password` varchar(300) NOT NULL,
  `TPassword` int(4) NOT NULL,
  `IP` varchar(15) NOT NULL,
  PRIMARY KEY (`Acno`),
  CONSTRAINT `key3` FOREIGN KEY (`Acno`) REFERENCES `accountinfo` (`AcNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eaccounts`
--

LOCK TABLES `eaccounts` WRITE;
/*!40000 ALTER TABLE `eaccounts` DISABLE KEYS */;
INSERT INTO `eaccounts` VALUES (12345,'jainanek','7826b958b79c70626801b880405eb5111557dadceb2fee2b1ed69a18eed0c6dc',4101,'0:0:0:0:0:0:0:1'),(22565,'Vivek','a3da73976501812cd7b821a20bfb09af0a6a891e419cdfb761fb19a92c914242',1234,'0:0:0:0:0:0:0:1'),(45211,'kishore','0a962987762ad6560cbfd522ccfc316a4346187b9fe7eba20c202964f388fe09',1234,'0:0:0:0:0:0:0:1'),(54321,'khitesh','13b00f0ab233c94d9ee9f94b521f2247a511640cf89f3844a1f59a5dad1214c7',1234,'0:0:0:0:0:0:0:1'),(54963,'sangam','f1fe52fbb5e42798713c27a07db227cf4ef397cf1ac79ee016e4d030aa9ee4a7',1234,'0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `eaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `Rid` int(11) NOT NULL AUTO_INCREMENT,
  `Rtype` varchar(1) NOT NULL,
  `Rdate` date NOT NULL,
  `Rtime` time NOT NULL,
  `Rstatus` varchar(1) NOT NULL,
  `Rby` int(11) NOT NULL,
  PRIMARY KEY (`Rid`),
  KEY `key2_idx` (`Rby`),
  CONSTRAINT `key2` FOREIGN KEY (`Rby`) REFERENCES `accountinfo` (`AcNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'C','2016-12-30','23:37:11','P',12345),(2,'L','2016-12-30','23:37:18','P',12345),(3,'C','2016-12-30','23:40:07','P',12345),(4,'L','2016-12-30','23:41:49','P',12345);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `Tid` int(11) NOT NULL AUTO_INCREMENT,
  `Tby` int(11) NOT NULL,
  `Tto` int(11) NOT NULL,
  `Amount` double NOT NULL,
  `ToBal` double NOT NULL,
  `ByBal` double NOT NULL,
  `Tdate` date DEFAULT NULL,
  `ttime` time DEFAULT NULL,
  PRIMARY KEY (`Tid`),
  KEY `key1_idx` (`Tby`),
  CONSTRAINT `key1` FOREIGN KEY (`Tby`) REFERENCES `accountinfo` (`AcNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (7,12345,54321,5500,81385,530052,'2016-12-30','23:39:34'),(8,12345,45211,3000,260940,527052,'2016-12-30','23:40:39'),(9,12345,54963,49000,603660,478052,'2016-12-30','23:41:00'),(10,12345,22565,36500,62199,441552,'2016-12-30','23:41:25'),(11,12345,45211,5260,266200,436292,'2016-12-30','23:41:42');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-07 20:30:58

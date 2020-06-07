-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: HostelMS
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `Notifications`
--

DROP TABLE IF EXISTS `Notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notifications` (
  `nid` int(5) NOT NULL AUTO_INCREMENT,
  `nDetails` varchar(1000) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `linkPath` varchar(1000) DEFAULT NULL,
  `linkStatus` varchar(5) DEFAULT 'N',
  `deleteStatus` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
INSERT INTO `Notifications` VALUES (22,'Submit ur fee reciepts,Urgently.','2020-03-20','2020-04-20','OR.pdf','','Y'),(23,'1111111111111111111111111111','2020-02-20','2020-03-30','OR.pdf','Y','Y'),(24,'nothing to worry abt corona','2020-03-21','2020-04-21','','N','Y'),(40,'Submit Your Hostel Fees','2020-03-23','2020-04-23','','','Y'),(41,'Submit Ur Hostel Fees','2020-03-23','2020-04-23','','N','Y'),(42,'is done','2020-03-23','2020-04-23','','N','Y'),(43,'done Done Done !!!!!!!1 ','2020-03-23','2020-04-23','','N','Y'),(44,'you \r\nhave \r\nto \r\nsubmit','2020-03-23','2020-04-23','','N','Y'),(45,'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff\r\nfffffffffffffffffffffffffffffffffffffffffffff\r\nf\r\nfffffffffffffffffffffffffffffffffffffffffffffffffff\r\nfffffffffffffffffffffffffffffffffff','2020-03-23','2020-04-23','','N','Y'),(46,'asdfghjk','2020-03-23','2020-04-23','','N','Y'),(47,' asdfgh','2020-03-23','2020-04-23','','N','Y'),(48,'my DOB\r\n','1996-02-21','2020-04-25','','N','Y');
/*!40000 ALTER TABLE `Notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `studId` int(5) NOT NULL AUTO_INCREMENT,
  `appliedDate` date DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `uid` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `parentContact` varchar(20) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `currentAddress` varchar(1000) DEFAULT NULL,
  `permanentAddress` varchar(1000) DEFAULT NULL,
  `guardianName` varchar(300) DEFAULT NULL,
  `guardianOccupation` varchar(50) DEFAULT NULL,
  `guardianAddress` varchar(1000) DEFAULT NULL,
  `guardianEmail` varchar(100) DEFAULT NULL,
  `guardianContact` varchar(20) DEFAULT NULL,
  `deptName` varchar(50) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `courseName` varchar(100) DEFAULT NULL,
  `courseDuration` varchar(5) DEFAULT NULL,
  `courseYear` varchar(5) DEFAULT NULL,
  `eligibilityNo` varchar(20) DEFAULT NULL,
  `admissionDate` date DEFAULT NULL,
  `admissionYear` varchar(5) DEFAULT NULL,
  `isRoomAllotted` varchar(5) DEFAULT NULL,
  `hostelNo` varchar(5) DEFAULT NULL,
  `roomNo` varchar(5) DEFAULT NULL,
  `approvalStatus` varchar(5) DEFAULT 'W',
  `deleteStatus` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`studId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,'2020-04-17','manoj','sadashiv','popalghat','1996-02-21','Male','939134884184','emailVar','7798642202','1234567890','emailVar:Screenshot from 2020-04-11 14-12-07.png','emailVar:Screenshot from 2020-04-11 14-12-07.png','washim','washim','Sadashiv Popalghat','Farmer','washim','popalghatsadashiv@gmail.com','9552968237','Maths','PG','M Sc IMCA','3','2','22018000494','2018-07-01','','Y','G7','12','W','N'),(2,'2020-04-17','manoj','sadashiv','popalghat','1996-02-21','Male','939134884184','emailVar','9988774455','','emailVar:Screenshot from 2020-04-14 23-15-13.png','emailVar:Screenshot from 2020-04-14 23-15-13.png','x\r\ny\r\nz','a\r\nb\r\nc','Sadashiv Popalghat','Farmer','a\r\nb\r\nc','','7744112255','Maths','Post Graduate','M Sc IMCA','4','2','22018000494','2019-05-18','2019','Y','G1','6','W','N'),(3,'2020-04-18','manoj','sadashiv','popalghat','1999-02-01','Male','098745612300','emailVar','1234567890','','emailVar:Screenshot from 2020-04-11 14-12-07.png','emailVar:Screenshot from 2020-04-11 14-12-07.png',' ',' ','Sadashiv Popalghat','Farmer',' ','','8855220022',' ','Post Graduate','M Sc IMCA','2','1','22018000494','2018-12-12','2018','N','','','W','N');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `uid` int(5) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) DEFAULT NULL,
  `userId` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `deleteStatus` varchar(5) DEFAULT 'W',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userId` (`userId`,`deleteStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Admin','admin@sppu.ac.in','admin@sppu','N');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-18  0:25:27

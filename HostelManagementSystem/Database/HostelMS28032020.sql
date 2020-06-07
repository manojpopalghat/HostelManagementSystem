-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: HostelMS
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
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
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (22,'Submit ur fee reciepts,Urgently.','2020-03-20','2020-04-20','OR.pdf','','Y'),(23,'1111111111111111111111111111','2020-02-20','2020-03-30','OR.pdf','Y','Y'),(24,'nothing to worry abt corona','2020-03-21','2020-04-21','','N','Y'),(40,'Submit Your Hostel Fees','2020-03-23','2020-04-23','','','Y'),(41,'Submit Ur Hostel Fees','2020-03-23','2020-04-23','','N','Y'),(42,'is done','2020-03-23','2020-04-23','','N','Y'),(43,'done Done Done !!!!!!!1 ','2020-03-23','2020-04-23','','N','Y'),(44,'you \r\nhave \r\nto \r\nsubmit','2020-03-23','2020-04-23','','N','Y'),(45,'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff\r\nfffffffffffffffffffffffffffffffffffffffffffff\r\nf\r\nfffffffffffffffffffffffffffffffffffffffffffffffffff\r\nfffffffffffffffffffffffffffffffffff','2020-03-23','2020-04-23','','N','Y'),(46,'asdfghjk','2020-03-23','2020-04-23','','N','Y'),(47,' asdfgh','2020-03-23','2020-04-23','','N','Y'),(48,'my DOB\r\n','1996-02-21','2020-04-25','','N','Y');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `studId` int(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `uidNo` varchar(20) DEFAULT NULL,
  `emailId` varchar(50) DEFAULT NULL,
  `mobNo` varchar(20) DEFAULT NULL,
  `currentAddress` varchar(100) DEFAULT NULL,
  `permanantAddress` varchar(100) DEFAULT NULL,
  `casteCategory` varchar(20) DEFAULT NULL,
  `deleteStatus` varchar(5) DEFAULT 'W',
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`studId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(5) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) DEFAULT NULL,
  `userId` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `deleteStatus` varchar(5) DEFAULT 'W',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userId` (`userId`,`deleteStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2020-03-28 19:16:48

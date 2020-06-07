-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: HostelMS
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `Hostels`
--

DROP TABLE IF EXISTS `Hostels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hostels` (
  `hId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `rooms` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `allotedRooms` int(11) DEFAULT NULL,
  `unallotedRooms` int(11) DEFAULT NULL,
  `filledStudents` int(11) DEFAULT NULL,
  `remainingSpace` int(11) DEFAULT NULL,
  `rector` varchar(100) DEFAULT NULL,
  `deleteStatus` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`hId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hostels`
--

LOCK TABLES `Hostels` WRITE;
/*!40000 ALTER TABLE `Hostels` DISABLE KEYS */;
INSERT INTO `Hostels` VALUES (1,'G1','Gents',30,150,NULL,NULL,NULL,NULL,'Prof Nitin Patil','Y'),(2,'G2','Gents',40,160,NULL,NULL,NULL,NULL,'Prof S A Kandekar','Y'),(3,'G1','Gents',20,100,10,10,60,40,'prof Nitin Patil','N'),(4,'G2','Gents',30,120,10,20,70,50,'Prof S A Kandekar','N'),(5,'G3','Gents',40,150,NULL,NULL,NULL,NULL,'Prof Ballal','N'),(6,'L1','Ladies',30,100,NULL,NULL,NULL,NULL,'Prof K K Sharma','N'),(7,'L2','Ladies',35,120,NULL,NULL,NULL,NULL,'Prof V Joshi','N'),(8,'L3','Ladies',40,160,NULL,NULL,NULL,NULL,'Prof R R Kendre','Y'),(9,'L3','Ladies',50,250,NULL,NULL,NULL,NULL,'Dr. K K Khanna','Y'),(10,'L3','Ladies',50,250,0,50,0,250,'Dr. K K Khanna','N');
/*!40000 ALTER TABLE `Hostels` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notifications`
--

LOCK TABLES `Notifications` WRITE;
/*!40000 ALTER TABLE `Notifications` DISABLE KEYS */;
INSERT INTO `Notifications` VALUES (22,'Submit ur fee reciepts,Urgently.','2020-03-20','2020-04-20','OR.pdf','','Y'),(23,'1111111111111111111111111111','2020-02-20','2020-03-30','OR.pdf','Y','Y'),(24,'nothing to worry abt corona','2020-03-21','2020-04-21','','N','Y'),(40,'Submit Your Hostel Fees','2020-03-23','2020-04-23','','','Y'),(41,'Submit Ur Hostel Fees','2020-03-23','2020-04-23','','N','Y'),(42,'is done','2020-03-23','2020-04-23','','N','Y'),(43,'done Done Done !!!!!!!1 ','2020-03-23','2020-04-23','','N','Y'),(44,'you \r\nhave \r\nto \r\nsubmit','2020-03-23','2020-04-23','','N','Y'),(45,'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff\r\nfffffffffffffffffffffffffffffffffffffffffffff\r\nf\r\nfffffffffffffffffffffffffffffffffffffffffffffffffff\r\nfffffffffffffffffffffffffffffffffff','2020-03-23','2020-04-23','','N','Y'),(46,'asdfghjk','2020-03-23','2020-04-23','','N','Y'),(47,' asdfgh','2020-03-23','2020-04-23','','N','Y'),(48,'my DOB\r\n','1996-02-21','2020-04-25','','N','Y'),(49,'77777777777777777777','2020-05-26','2020-06-26','','N','Y'),(50,'999999999999999999','2020-05-28','2020-06-26','SE_Maths_ Assignment.pdf','Y','Y'),(51,'Hey just Download kkkkkkk','2020-05-28','2020-06-30','SE_Maths_ Assignment.pdf','Y','Y'),(52,'Due to Water Recession in pune , Muncipality Stops Water Supply.Save Water !   ','2020-06-05','2020-07-05','','N','N'),(53,'Click here for Students list, Who not Pay Hostel Fees ','2020-06-05','2020-07-05','S4)Exam_Fees.PDF','Y','N');
/*!40000 ALTER TABLE `Notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rooms` (
  `rId` int(11) NOT NULL AUTO_INCREMENT,
  `roomNo` int(11) DEFAULT '0',
  `allotedFor` varchar(30) DEFAULT NULL,
  `capacity` int(11) DEFAULT '0',
  `filledStudents` int(11) DEFAULT '0',
  `remainingSpace` int(11) DEFAULT '0',
  `isRoomFulled` varchar(5) DEFAULT NULL,
  `hId` int(11) DEFAULT NULL,
  `deleteStatus` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`rId`),
  KEY `hId` (`hId`),
  CONSTRAINT `Rooms_ibfk_1` FOREIGN KEY (`hId`) REFERENCES `Hostels` (`hId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES (1,1,'Students',2,0,2,'No',3,'Y'),(2,2,'Mathematics',4,4,0,'Yes',3,'Y'),(3,2,'Mathematics',4,4,0,NULL,3,'Y'),(4,3,'Students',3,2,1,'No',3,'Y'),(5,3,'Students',5,1,4,'No',3,'Y'),(6,3,'Students',3,3,0,'Yes',3,'Y'),(7,3,'Students',3,3,0,'Yes',3,'Y'),(8,4,'Students',4,3,1,'No',3,'Y'),(9,4,'Mathematics',5,5,0,'Yes',3,'Y'),(10,10,'Students',5,3,2,'Yes',3,'Y'),(11,10,'Mathematics',4,3,1,'No',3,'Y'),(12,2,'Students',7,6,1,'No',3,'Y'),(13,1,'Mathematics',2,2,0,'Yes',3,'Y'),(14,1,'Mathematics',2,-1,3,'No',3,'Y'),(15,1,'Mathematics',3,-1,4,'No',3,'Y'),(16,1,'Mathematics',3,0,3,'No',3,'N');
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
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
  `rId` int(11) DEFAULT NULL,
  PRIMARY KEY (`studId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (11,'2020-06-04','Manoj','Sadashiv','Popalghat','1996-02-21','Male','123456789012','manojpopalghat@gmail.com','7798642202','','manojpopalghat@gmail.com:photo.jpg','manojpopalghat@gmail.com:sign.jpg',' ',' ','   ','  ','   ','','1234567890','Mathematics','Post Graduate','M.Sc. IMCA II','3','2','22018000494','2018-07-01','2018','Y','G1','1','W','N',NULL),(12,'2020-06-05','Suraj','Kailas','Kale','1997-01-01','Male','123456789012','manojspopalghat@gmail.com','1234567890','','manojspopalghat@gmail.com:photo.jpg','manojspopalghat@gmail.com:sign.jpg','SPPU,PUNE,411007','Junnar,Pune','Kailas Kale','Farmer','Junnar,Pune','','9874563210','Statistics','Post Graduate','M.Sc. Statistics','2','2','22018000494','2018-07-01','2018','Y','G1','1','W','N',NULL);
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleEntry`
--

DROP TABLE IF EXISTS `VehicleEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VehicleEntry` (
  `vehicleType` varchar(15) DEFAULT NULL,
  `vehicleNumber` varchar(15) DEFAULT NULL,
  `driverName` varchar(35) DEFAULT NULL,
  `driverMobileNumber` varchar(12) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `inTime` varchar(15) DEFAULT NULL,
  `outTime` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleEntry`
--

LOCK TABLES `VehicleEntry` WRITE;
/*!40000 ALTER TABLE `VehicleEntry` DISABLE KEYS */;
INSERT INTO `VehicleEntry` VALUES ('ambulence','MH12MP1234','Manoj P','12345','2020-05-11','08:06:00 PM','05:17:38 PM'),('tractor','MH12AW1997','Ankita W','67890','2019-04-01','02:36:40 AM','01:00:12 PM'),('truck','MH14SK0606','Suraj K','111213','2020-02-23','09:16:01 AM','10:06:00 PM'),('tanker','MH12MP1990','SE Project','878889','2018-05-30','11:06:00 PM','12:06:00 PM'),('truck','MH12MP1234','Manoj P','1234567890','2020-06-05','05:11:54 PM','05:17:38 PM'),('Bike','MH12A1234','Manoj','1234567890','2020-06-05','05:25:04 PM','05:27:34 PM'),('Car','MH12C1234','Prof Ballal','1234567890','2020-06-05','05:25:50 PM','05:28:30 PM'),('Ambulence','MH12AM1234','Arun Jadhav','7744112233','2020-06-05','05:26:43 PM','05:27:47 PM');
/*!40000 ALTER TABLE `VehicleEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `adminId` int(5) NOT NULL AUTO_INCREMENT,
  `appliedDate` date DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `uid` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `alternateContact` varchar(20) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `currentAddress` varchar(1000) DEFAULT NULL,
  `permanentAddress` varchar(1000) DEFAULT NULL,
  `employeeId` varchar(20) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `experience` varchar(10) DEFAULT NULL,
  `approvalStatus` varchar(5) DEFAULT 'W',
  `deleteStatus` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'2020-04-24','Ankita','Uttam','Waghmode','1997-07-16','Female','123456789012','ankita@gmail.com','7028854402','1234567890','ankita@gmail.com:107205483 (1).png','ankita@gmail.com:my signature.jpg','pune','raigad','E123456','graduation','admin','2.5','W','N'),(2,'2020-05-02','ankita``','uttam','Waghmode','2020-05-01','Female','123456789120','ankita@gmail.com','7720893444','1234567890','ankita@gmail.com:my photo 2_1.jpg','ankita@gmail.com:my signature_1.jpg','pune','pune','E123456','graduation','admin','2.5','W','N'),(3,'2020-06-05','Vikas','Shivaji','Vaenekar','1996-01-01','Male','741258963032','vikasv@gmail.com','9988774411','','vikasv@gmail.com:photo.jpg','vikasv@gmail.com:sign.jpg','dfgh','fghj','123','PhD','Prof','5','W','N'),(4,'2020-06-05','Vikas','Shivaji','Varnekar','1996-01-01','Male','123456789012','vikas@gmail.com','1234567890','','vikas@gmail.com:photo.jpg','vikas@gmail.com:sign.jpg','dfgh','ghjk','100','PhD','Professor','10','W','N'),(5,'2020-06-05','Vikas','Shivaji','Varnekar','1996-01-01','Male','123456789012','vikas@gmail.com','1234567890','','vikas@gmail.com:photo.jpg','vikas@gmail.com:sign.jpg','dfgh','ghjk','100','PhD','Professor','10','W','N');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administration`
--

DROP TABLE IF EXISTS `administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administration` (
  `adminId` int(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `uidNo` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `otherContact` varchar(20) DEFAULT NULL,
  `currentAddress` varchar(100) DEFAULT NULL,
  `permanantAddress` varchar(100) DEFAULT NULL,
  `eId` varchar(20) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `experience` varchar(50) DEFAULT NULL,
  `deleteStatus` varchar(5) DEFAULT 'W',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administration`
--

LOCK TABLES `administration` WRITE;
/*!40000 ALTER TABLE `administration` DISABLE KEYS */;
/*!40000 ALTER TABLE `administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latepass`
--

DROP TABLE IF EXISTS `latepass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latepass` (
  `lateId` int(5) NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) DEFAULT NULL,
  `appliedDate` date DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `rollNo` varchar(10) DEFAULT NULL,
  `roomNo` varchar(10) DEFAULT NULL,
  `hostelNo` varchar(10) DEFAULT NULL,
  `leaveTime` time DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `guardianContact` varchar(20) DEFAULT NULL,
  `approvalStatus` varchar(5) DEFAULT 'W',
  `deleteStatus` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`lateId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latepass`
--

LOCK TABLES `latepass` WRITE;
/*!40000 ALTER TABLE `latepass` DISABLE KEYS */;
INSERT INTO `latepass` VALUES (1,'manojpopalghat@gmail.com','2020-06-04','Manoj Sadashiv Popalghat',NULL,'Mathematics','1','1','G1','07:29:00',NULL,'djhvshsvd','7798642202','1234567890','W','N');
/*!40000 ALTER TABLE `latepass` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (22,'Submit ur fee reciepts,Urgently.','2020-03-20','2020-04-20','OR.pdf','','Y'),(23,'1111111111111111111111111111','2020-02-20','2020-03-30','OR.pdf','Y','Y'),(24,'nothing to worry abt corona','2020-03-21','2020-04-21','','N','Y'),(40,'Submit Your Hostel Fees','2020-03-23','2020-04-23','','','Y'),(41,'Submit Ur Hostel Fees','2020-03-23','2020-04-23','','N','Y'),(42,'is done','2020-03-23','2020-04-23','','N','Y'),(43,'done Done Done !!!!!!!1 ','2020-03-23','2020-04-23','','N','Y'),(44,'you \r\nhave \r\nto \r\nsubmit','2020-03-23','2020-04-23','','N','Y'),(45,'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff\r\nfffffffffffffffffffffffffffffffffffffffffffff\r\nf\r\nfffffffffffffffffffffffffffffffffffffffffffffffffff\r\nfffffffffffffffffffffffffffffffffff','2020-03-23','2020-04-23','','N','Y'),(46,'asdfghjk','2020-03-23','2020-04-23','','N','Y'),(47,' asdfgh','2020-03-23','2020-04-23','','N','Y'),(48,'my DOB\r\n','1996-02-21','2020-04-25','','N','Y'),(49,'try','2020-04-01','2020-03-01','Ls1_NetworkLayer.pdf','Y','N'),(50,'try2','2020-04-02','2020-05-02','Hostel_Font_image.docx.jpg.docx','Y','N'),(51,'try11','2020-04-12','2020-04-11','d189c1b6566f0f0be33580f2f591ab71.jpg','Y','N');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outpass`
--

DROP TABLE IF EXISTS `outpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outpass` (
  `outId` int(5) NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) DEFAULT NULL,
  `appliedDate` date DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `rollNo` varchar(10) DEFAULT NULL,
  `roomNo` varchar(10) DEFAULT NULL,
  `hostelNo` varchar(10) DEFAULT NULL,
  `leaveDate` date DEFAULT NULL,
  `reportDate` date DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `guardianContact` varchar(20) DEFAULT NULL,
  `approvalStaus` varchar(5) DEFAULT NULL,
  `deleteStatus` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`outId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outpass`
--

LOCK TABLES `outpass` WRITE;
/*!40000 ALTER TABLE `outpass` DISABLE KEYS */;
INSERT INTO `outpass` VALUES (1,'manojpopalghat@gmail.com','2020-06-04',NULL,'Manoj Sadashiv Popalghat','null','1','1','G1','2020-06-04','2020-06-04','abc','7798642202','1234567890',NULL,NULL);
/*!40000 ALTER TABLE `outpass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rector`
--

DROP TABLE IF EXISTS `rector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rector` (
  `rectorId` int(5) NOT NULL AUTO_INCREMENT,
  `appliedDate` date DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `uid` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `alternateContact` varchar(20) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `currentAddress` varchar(1000) DEFAULT NULL,
  `permanentAddress` varchar(1000) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `employeeId` varchar(20) DEFAULT NULL,
  `hostelAllocated` varchar(20) DEFAULT NULL,
  `hostelNo` varchar(20) DEFAULT NULL,
  `approvalStatus` varchar(5) DEFAULT 'W',
  `deleteStatus` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`rectorId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rector`
--

LOCK TABLES `rector` WRITE;
/*!40000 ALTER TABLE `rector` DISABLE KEYS */;
INSERT INTO `rector` VALUES (1,'2020-04-24','Ankita','Uttam','Wghmode','1997-07-16','Female','123456789012','ankita@gmail.com','7028854402','1547895586','ankita@gmail.com:my photo 2_1.jpg','ankita@gmail.com:my signature.jpg','pune','raigad','mathematics','','E123456','Ladies','L8','W','N'),(2,'2020-04-24','Ankita','Uttam','Wghmode','1997-07-16','Female','123456789012','ankita@gmail.com','7028854402','1547895586','ankita@gmail.com:my photo 2_1.jpg','ankita@gmail.com:my signature.jpg','pune','raigad','mathematics','','E123456','Ladies','L8','W','N'),(3,'2020-04-24','Sanket','SURESH','THORAT','1999-02-21','Male','123456789120','ankita@gmail.com','7720893444','1234567890','ankita@gmail.com:107205483 (1).png','ankita@gmail.com:Untitled.png','solapur','mumbai','mech','','E123456','Gents','G2','W','N'),(4,'2020-06-05','sumit','Sandipan','Pawar','1997-01-01','Male','741236589120','sumit@gmail.com','7798642202','','sumit@gmail.com:photo.jpg','sumit@gmail.com:sign.jpg','dfghjk','fghjk','maths','','123','Gents','G1','W','N'),(5,'2020-06-05','sumit','Sandipan','Pawar','1997-01-01','Male','741236589120','sumit@gmail.com','7798642202','','sumit@gmail.com:photo.jpg','sumit@gmail.com:sign.jpg','dfghjk','fghjk','maths','','123','Gents','G1','W','N');
/*!40000 ALTER TABLE `rector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rectors`
--

DROP TABLE IF EXISTS `rectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rectors` (
  `rectId` int(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `uidNo` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `otherContact` varchar(20) DEFAULT NULL,
  `currentAddress` varchar(100) DEFAULT NULL,
  `permanantAddress` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `eId` varchar(20) DEFAULT NULL,
  `hostelAllocate` varchar(20) DEFAULT NULL,
  `hostelNo` varchar(20) DEFAULT NULL,
  `deleteStatus` varchar(5) DEFAULT 'W',
  PRIMARY KEY (`rectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rectors`
--

LOCK TABLES `rectors` WRITE;
/*!40000 ALTER TABLE `rectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `rectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security`
--

DROP TABLE IF EXISTS `security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security` (
  `securId` int(5) NOT NULL AUTO_INCREMENT,
  `appliedDate` date DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `uid` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `alternateContact` varchar(20) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `currentAddress` varchar(1000) DEFAULT NULL,
  `permanentAddress` varchar(1000) DEFAULT NULL,
  `employeeId` varchar(20) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `experience` varchar(10) DEFAULT NULL,
  `approvalStatus` varchar(5) DEFAULT 'W',
  `deleteStatus` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`securId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security`
--

LOCK TABLES `security` WRITE;
/*!40000 ALTER TABLE `security` DISABLE KEYS */;
INSERT INTO `security` VALUES (1,'2020-04-24','Ankita','Uttam','Waghmode','1997-07-16','Female','123456789012','ankita@gmail.com','7028854402','1122334455','ankita@gmail.com:my photo 2_1.jpg','ankita@gmail.com:my signature.jpg','pune','Raigad','E123456','graduation','gate Security','2.5','W','N'),(2,'2020-05-02','Ankita','Uttam','Waghmode','2020-05-01','Female','123456789012','ankita@gmail.com','7720893444','1234567890','ankita@gmail.com:my photo 2_1.jpg','ankita@gmail.com:my signature_1.jpg','pune','pune','E123456','graduation','gate Security','2.5','W','N'),(3,'2020-06-05','Om','xyz ','abc','2001-01-01','Male','741852963012','om@gmail.com','1234567890','','om@gmail.com:photo.jpg','om@gmail.com:sign.jpg','abc ','abc','111','BSc','Warden','10','W','N'),(4,'2020-06-05','Om','xyz ','abc','2001-01-01','Male','741852963012','om@gmail.com','1234567890','','om@gmail.com:photo.jpg','om@gmail.com:sign.jpg','abc ','abc','111','BSc','Warden','10','W','N');
/*!40000 ALTER TABLE `security` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'2020-04-30','ankita','Uttam','Waghmode','2020-04-01','Female','123456789123','ankita@gmail.com','7720893444','9226380426','ankita@gmail.com:my photo 2_1.jpg','ankita@gmail.com:my signature_1.jpg','pune','pune','Uttam Waghmode','Teacher','pune','s201603116@gmail.com','1224899554','Mathematics','Post Graduate','Industrial Mathematics with Computer Applications','3','2','1234567890','2020-04-09','2020','N','','','W','N'),(2,'2020-05-06','ankita','uttam','waghmode','1997-07-16','Female','123456789012','ankita@gmail.com','7028854402','9226380426','ankita@gmail.com:my photo 2_1.jpg','ankita@gmail.com:my signature_1.jpg','pune','nandgaon','Uttam Waghmode','Teacher','nandgaon','uttamwaghmode@gmail.com','1224899554','Mathematics','Post Graduate','Industrial Mathematics with Computer Applications','3','2','1234567890','2018-07-04','2018','Y','L8','223','W','N'),(3,'2020-05-06','sourabh','SURESH','THORAT','1996-04-09','Male','123456789012','ankita@gmail.com','7720893444','9226380426','ankita@gmail.com:107205483.png','ankita@gmail.com:my signature.jpg','pune','mumbai','suresh thorat','Teacher','solapur','s@gmail.com','1224899554','mechanical','Under Graduate','mech ','4','4','1234567890','2017-08-01','2017','Y','G8','200','W','N'),(4,'2020-05-06','sourabh','SURESH','THORAT','1996-04-09','Male','123456789012','sourabh@gmail.com','7720893444','9226380426','sourabh@gmail.com:107205483.png','sourabh@gmail.com:my signature.jpg','pune','mumbai','suresh thorat','Teacher','solapur','s@gmail.com','1224899554','mechanical','Under Graduate','mech ','4','4','1234567890','2017-08-01','','Y','G8','200','W','N');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uId` int(5) NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `approvalStatus` varchar(5) DEFAULT 'W',
  `deleteStatus` varchar(5) DEFAULT 'N',
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (32,'manojpopalghat@gmail.com','pass123','Student','W','N'),(33,'sumit@gmail.com','pass123','Rector','W','N'),(34,'sumit@gmail.com','pass123','Rector','W','N'),(35,'om@gmail.com','pass123','Security','W','N'),(36,'om@gmail.com','pass123','Security','W','N'),(37,'vikas@gmail.com','pass123','Admin','W','N'),(38,'vikas@gmail.com','pass123','Admin','W','N'),(39,'manojspopalghat@gmail.com','pass123','Student','W','N');
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

-- Dump completed on 2020-06-06  0:07:12

-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: lfhsystem
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(12) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `avator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (4,'17626521182','123456','public/admin/admin.png');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `doctorId` int DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `doctorId` (`doctorId`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (18,19,4,'1628438400000',4);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_item`
--

DROP TABLE IF EXISTS `chat_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` varchar(20) DEFAULT NULL,
  `targetId` varchar(20) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `extend1` varchar(100) DEFAULT NULL,
  `alreadyRead` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_item`
--

LOCK TABLES `chat_item` WRITE;
/*!40000 ALTER TABLE `chat_item` DISABLE KEYS */;
INSERT INTO `chat_item` VALUES (2,'d4','user19','asdf','2012-04-09 00:00:00',NULL,0),(3,'d4','u19','asdf','2012-04-09 00:00:00',NULL,1),(4,'d4','u19','asdfs','2019-08-09 00:00:00',NULL,1),(5,'d4','u19','4353424','2019-08-09 00:00:00',NULL,1),(6,'d4','u19','0dsfgjldgfd','2019-08-09 00:00:00',NULL,1),(7,'d4','u19','0dsfg15owefjw9p8u3','2019-08-09 00:00:00',NULL,1),(8,'uundefined','dundefined',NULL,NULL,NULL,0),(9,'uundefined','dundefined',NULL,NULL,NULL,0),(10,'u-1','d4','123123','2021-08-03 15:30:39',NULL,1),(11,'u19','d4','哈哈哈哈哈哈哈','2021-08-03 15:31:15',NULL,1),(12,'u19','d4','123123','2021-08-03 15:32:45',NULL,1),(13,'u19','d4','342342','2021-08-03 15:33:01',NULL,1),(14,'u19','d4','234324324','2021-08-03 15:36:10',NULL,1),(15,'u19','d4','哈哈哈哈','2021-08-03 15:39:11',NULL,1),(16,'u-1','d4','元','2021-08-03 15:40:59',NULL,1),(17,'u-1','d4','哈哈哈','2021-08-03 15:41:36',NULL,1),(18,'u-1','d4','hahahah','2021-08-03 15:41:58',NULL,1),(19,'u-1','d4','lasjdflksj','2021-08-03 15:42:49',NULL,1),(20,'u19','d4','hahahah','2021-08-03 15:54:03',NULL,1),(21,'u19','d4','hahahahah','2021-08-03 15:57:18',NULL,1),(22,'u19','d4','hahahah','2021-08-03 18:05:53',NULL,1),(23,'u-1','d4','yuyu','2021-08-03 18:42:42',NULL,1),(24,'u19','d4','hahahah','2021-08-03 20:16:23',NULL,1),(25,'u19','d4','嘿嘿嘿','2021-08-03 20:16:31',NULL,1),(26,'d5','u19','我是doctorB','2021-08-03 22:28:36',NULL,1),(27,'d5','u19','你好呀','2021-08-03 22:38:57',NULL,1),(28,'u19','d5','你好','2021-08-03 22:39:35',NULL,0),(29,'u19','d4','哈哈哈哈哈哈','2021-08-12 01:09:32',NULL,1),(30,'u19','d4','哈哈哈哈哈哈','2021-08-12 01:10:14',NULL,1),(31,'u19','d4','hahahahah','2021-08-12 01:11:05',NULL,1),(32,'u19','d4','第一条','2021-08-12 01:11:58',NULL,1),(33,'u19','d4','第二条','2021-08-12 01:13:07',NULL,1),(34,'u19','d4','第二条','2021-08-12 01:13:50',NULL,1),(35,'u19','d4','第二条','2021-08-12 01:14:09',NULL,1),(36,'u19','d4','嘻嘻嘻','2021-08-12 01:14:29',NULL,1),(37,'u19','d4','嘻嘻嘻搜索','2021-08-12 01:15:05',NULL,1),(38,'u19','d4','嘻嘻嘻搜索','2021-08-12 01:15:06',NULL,1),(39,'u19','d4','wo','2021-08-12 01:15:47',NULL,1),(40,'u19','d4','aaaa','2021-08-12 01:24:43',NULL,1),(41,'u19','d4','sdfsdf','2021-08-12 01:25:14',NULL,1),(42,'u19','d4','asdfsdf','2021-08-12 01:42:55',NULL,1),(43,'u4','d19','您好','2021-08-12 01:43:39',NULL,0),(44,'u19','d4','woooo','2021-08-12 01:46:13',NULL,1),(45,'u19','d4','哈哈哈','2021-08-12 01:47:29',NULL,1),(46,'d4','u19','n你好','2021-08-12 01:47:49',NULL,1),(47,'u19','d4','哈哈哈哈','2021-08-12 01:48:26',NULL,1),(48,'u19','d4','医生好','2021-08-13 01:21:18',NULL,1),(49,'u19','d4','hahahah','2021-08-13 01:22:27',NULL,1),(50,'u19','d4','hahahah','2021-08-13 01:23:31',NULL,1),(51,'u19','d4','我是谁','2021-08-13 01:23:49',NULL,1),(52,'u19','d4','我是谁','2021-08-13 01:24:01',NULL,1),(53,'d4','u19','我怎么知道你是谁','2021-08-13 01:24:17',NULL,1),(54,'u19','d4','你好','2021-08-13 01:26:11',NULL,1),(55,'d4','u19','您好','2021-08-13 01:26:23',NULL,1),(56,'u19','d4','你好','2021-08-13 01:26:32',NULL,1),(57,'d4','u19','您好','2021-08-13 01:33:33',NULL,1),(58,'d4','u19','您好','2021-08-13 01:41:56',NULL,1),(59,'d4','u19','您好','2021-08-13 01:43:10',NULL,1),(60,'u19','d4','hahah','2021-08-13 01:45:45',NULL,1),(61,'u19','d4','hahah','2021-08-13 01:46:22',NULL,1),(62,'u19','d4','hahah','2021-08-13 01:46:45',NULL,1),(63,'u19','d4','hahah','2021-08-13 01:49:17',NULL,1),(64,'u19','d4','医生您好','2021-08-13 01:52:09',NULL,1),(65,'u19','d4','医生您好','2021-08-13 02:01:43',NULL,1),(66,'u19','d4','您好','2021-08-13 02:03:02',NULL,1),(67,'u19','d4','您好','2021-08-13 02:05:25',NULL,1),(68,'d4','u19','您好呀','2021-08-13 02:05:45',NULL,1),(69,'u19','d4','哈哈哈哈','2021-08-13 02:05:53',NULL,1),(70,'d4','u19','您好呀','2021-08-13 02:07:07',NULL,1),(71,'d4','u19','您好呀','2021-08-13 02:07:16',NULL,1),(72,'u19','d4','哈哈哈哈','2021-08-13 02:07:24',NULL,1),(73,'u19','d4','哈哈哈哈','2021-08-13 02:07:31',NULL,1),(74,'d4','u19','您好呀','2021-08-13 02:07:44',NULL,1),(75,'u19','d4','哈哈哈哈','2021-08-13 02:07:49',NULL,1),(76,'u19','d4','您好','2021-08-13 02:09:25',NULL,1),(77,'d4','u19','伺机待发洛杉矶的法律','2021-08-13 02:09:48',NULL,1),(78,'u19','d4','q3请324','2021-08-13 02:09:58',NULL,1),(79,'d4','u19','23523423432','2021-08-13 02:13:44',NULL,1),(80,'d4','u19','234324','2021-08-13 02:13:49',NULL,1),(81,'d4','u19','234234','2021-08-13 02:13:52',NULL,1),(82,'d4','u19','23423432','2021-08-13 02:13:56',NULL,1),(83,'d4','u19','2342343','2021-08-13 02:13:58',NULL,1),(84,'d4','u19','234234234','2021-08-13 02:14:00',NULL,1),(85,'d4','u19','2342342','2021-08-13 02:14:02',NULL,1),(86,'d4','u19','234234234','2021-08-13 02:14:05',NULL,1),(87,'d4','u19','234234234','2021-08-13 02:14:17',NULL,1),(88,'d4','u19','234234324','2021-08-13 02:14:20',NULL,1),(89,'d4','u19','234324','2021-08-13 02:14:23',NULL,1),(90,'u19','d4','height','2021-08-13 02:14:28',NULL,1),(91,'u19','d4','12321','2021-08-13 02:14:38',NULL,1),(92,'u19','d4','234234','2021-08-13 02:15:18',NULL,1),(93,'u19','d4','124123','2021-08-13 02:15:31',NULL,1),(94,'u19','d4','123213','2021-08-13 02:15:37',NULL,1),(95,'u19','d4','234324','2021-08-13 02:15:55',NULL,1),(96,'u19','d4','234324','2021-08-13 02:15:58',NULL,1),(97,'u19','d4','234234','2021-08-13 02:16:01',NULL,1),(98,'u19','d4','234234','2021-08-13 02:16:03',NULL,1),(99,'d4','u19','1','2021-08-13 02:16:18',NULL,1),(100,'d4','u19','1','2021-08-13 02:16:23',NULL,1),(101,'d4','u19','1','2021-08-13 02:16:25',NULL,1),(102,'d4','u19','1','2021-08-13 02:16:29',NULL,1),(103,'d4','u19','2','2021-08-13 02:16:31',NULL,1),(104,'d4','u19','2','2021-08-13 02:16:33',NULL,1),(105,'d4','u19','2','2021-08-13 02:16:36',NULL,1),(106,'d4','u19','2','2021-08-13 02:16:38',NULL,1),(107,'d4','u19','2','2021-08-13 02:16:41',NULL,1),(108,'d4','u19','2','2021-08-13 02:16:44',NULL,1),(109,'d4','u19','2','2021-08-13 02:16:46',NULL,1),(110,'u19','d4','123','2021-08-13 02:16:53',NULL,1),(111,'u19','d4','123213','2021-08-13 02:17:50',NULL,1),(112,'u19','d4','123123','2021-08-13 02:17:53',NULL,1),(113,'u19','d4','123213','2021-08-13 02:17:56',NULL,1),(114,'u19','d4','213123','2021-08-13 02:18:27',NULL,1),(115,'u19','d4','sdfsdfs','2021-08-13 02:19:41',NULL,1),(116,'d4','u19','3234234','2021-08-13 02:19:59',NULL,1),(117,'d4','u19','234324','2021-08-13 02:27:14',NULL,1),(118,'u19','d4','sdfsdkf','2021-08-13 02:28:09',NULL,1),(119,'u19','d4','986798798','2021-08-13 02:28:54',NULL,1),(120,'u19','d4','你好呀医生','2021-08-13 02:31:49',NULL,1),(121,'d4','u19','士大夫但是','2021-08-13 02:32:04',NULL,1),(122,'d4','u19','123123','2021-08-13 02:32:11',NULL,1),(123,'u19','d4','sdfsd','2021-08-13 02:33:42',NULL,1),(124,'u19','d4','213123','2021-08-13 02:34:51',NULL,1),(125,'u19','d4','122','2021-08-13 02:35:16',NULL,1),(126,'u19','d4','1232','2021-08-13 02:35:32',NULL,1),(127,'u19','d4','12312','2021-08-13 02:39:06',NULL,1),(128,'u19','d4','12312','2021-08-13 02:39:47',NULL,1),(129,'u19','d4','123123','2021-08-13 02:40:28',NULL,1),(130,'u19','d4','123213','2021-08-13 02:42:38',NULL,1),(131,'u19','d4','123123','2021-08-13 02:42:51',NULL,1),(132,'u19','d4','12312','2021-08-13 02:43:20',NULL,1),(133,'d4','u19','12312','2021-08-13 02:43:45',NULL,1),(134,'u19','d4','123123','2021-08-13 02:44:23',NULL,1),(135,'u19','d4','123213','2021-08-13 02:44:41',NULL,1),(136,'u19','d4','123213','2021-08-13 02:44:47',NULL,1),(137,'u19','d4','123213','2021-08-13 02:45:46',NULL,1),(138,'u19','d4','12321','2021-08-13 02:46:52',NULL,1),(139,'d4','u19','123123','2021-08-13 02:47:19',NULL,1),(140,'u19','d4','121231','2021-08-13 02:48:54',NULL,1),(141,'u19','d4','12321','2021-08-13 02:50:49',NULL,1),(142,'d4','u19','12321','2021-08-13 02:51:12',NULL,1),(143,'u19','d4','123123','2021-08-13 02:51:19',NULL,1);
/*!40000 ALTER TABLE `chat_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `doctorId` int DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `rate` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `doctorId` (`doctorId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `scene` varchar(200) DEFAULT NULL,
  `extend` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `avator` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `hospitalId` int DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospitalId` (`hospitalId`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (4,'doctorA','public/12cb29f4c21a53f594c42f61c0180bea','null',10,'17626521182','e07fbe873934539b9809d146be03c909');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (2,'复旦大学附属儿童医院'),(3,'上海市第十人民医院'),(4,'上海市第九人民医院'),(5,'上海场镇医院'),(6,'上海交通大学附属仁济医院'),(7,'上海交通大学附属瑞吉医院'),(8,'上海曙光医院'),(9,'复旦大学附属华山医院'),(10,'复旦大学附属中山医院'),(11,'上海市儿童医院'),(12,'上海东方肝胆医院');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_message`
--

DROP TABLE IF EXISTS `leave_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `hospitalId` int DEFAULT NULL,
  `doctorId` int DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `doctorId` (`doctorId`),
  KEY `hospitalId` (`hospitalId`),
  CONSTRAINT `leave_message_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `leave_message_ibfk_2` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`id`),
  CONSTRAINT `leave_message_ibfk_3` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_message`
--

LOCK TABLES `leave_message` WRITE;
/*!40000 ALTER TABLE `leave_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `petName` varchar(30) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `petType` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (1,19,'2021-08-07','小兔子','今天有了自己的小家',0),(2,19,'2021-08-07','小鸡','小鸡被吃掉了',0);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `extend1` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `avator` varchar(100) DEFAULT NULL,
  `extend1` varchar(30) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (19,'xixixixixhahaha','public/0712f1b352ac53fc498a8982d0227a47','null','17626521182','e07fbe873934539b9809d146be03c909');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-14 17:18:38

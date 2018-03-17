-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: network_infomation
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `tb_comment`
--

DROP TABLE IF EXISTS `tb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_comment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  `DATETIME` datetime DEFAULT NULL,
  `BLOG_ID` varchar(45) DEFAULT NULL,
  `PARENT_COMMENT_ID` varchar(45) DEFAULT NULL,
  `USER_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comment`
--

LOCK TABLES `tb_comment` WRITE;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
INSERT INTO `tb_comment` VALUES (5,1,'..sajhshah','2018-03-08 10:35:11','1','7','Hello'),(6,1,'我觉得这个妹子没什么问题 上次我去相亲后来觉得不合适 原因是我平时早上刷牙的时候都是左边刷10下右边刷10下\r\n但是那天左边我只刷了9下','2018-03-08 10:35:29','1',NULL,'Hello'),(7,1,'我觉得这个妹子没什么问题 上次我去相亲后来觉得不合适 原因是我平时早上刷牙的时候都是左边刷10下右边刷10下\r\n但是那天左边我只刷了9下','2018-03-08 10:36:11','1',NULL,'Hello'),(9,1,'TESTTESTTEST','2018-03-08 10:43:45','1',NULL,'Hello'),(10,1,'陈独秀同志请你坐下.','2018-03-08 13:52:18','1',NULL,'Hello'),(11,1,'不错','2018-03-11 12:10:27','6',NULL,'Hello'),(12,1,'Hello World','2018-03-12 10:11:55','2',NULL,'Hello'),(13,1,'hello world','2018-03-12 10:54:10','3',NULL,'Hello'),(14,1,'不错，支持一下','2018-03-12 14:23:47','18',NULL,'Hello'),(15,1,'yo yo yo,check it out','2018-03-12 14:35:40','19',NULL,'Hello'),(16,2,'comment test','2018-03-15 01:15:53','22',NULL,'World'),(17,1,'hello world','2018-03-15 10:18:54','19',NULL,'Hello'),(18,1,'good work, keep ahead','2018-03-15 10:20:31','22',NULL,'Hello'),(19,2,'勤奋朴素，自强不息','2018-03-15 10:31:05','18',NULL,'World');
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-17 15:48:14

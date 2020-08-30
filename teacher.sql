-- MySQL dump 10.13  Distrib 5.5.61, for Win64 (AMD64)
--
-- Host: localhost    Database: teacher
-- ------------------------------------------------------
-- Server version	5.5.61

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `act_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sponsor` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_organizer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign_up_start_date` datetime DEFAULT NULL,
  `sign_up_end_date` datetime DEFAULT NULL,
  `act_start_date` datetime DEFAULT NULL,
  `act_end_date` datetime DEFAULT NULL,
  `act_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (2,'DDDD','/upload/pic02.jpg','LLLL','新增加','2016-01-08 00:00:00','2017-01-08 00:00:00','2018-01-08 00:00:00','2019-01-08 00:00:00','新增加啊啊啊。'),(3,'二二','/upload/pic01.jpg','呃呃','强强','2020-01-01 00:00:00','2020-01-02 00:00:00','2020-01-03 00:00:00','2020-01-04 00:00:00','打算打算'),(4,'凄凄切切','/upload/pic01.jpg','纯纯粹粹','强强强强','2020-01-01 00:00:00','2020-01-02 00:00:00','2020-01-03 00:00:00','2020-01-04 00:00:00','啊啊啊从'),(5,'新增','/upload/pic02.jpg','新增','新增','2020-01-01 00:00:00','2020-01-02 00:00:00','2020-01-03 00:00:00','2020-01-04 00:00:00','新增'),(6,'U盘鉴赏大赛','/upload/pic03.png','银士顿','铜士顿','2020-01-01 00:00:00','2020-01-02 00:00:00','2020-01-03 00:00:00','2020-01-04 00:00:00','  名副其实的U盘鉴赏大赛。看看哪个U盘最好看。'),(7,'新夜活動','/upload/pic01.jpg','新夜活動','新夜活動','2020-01-01 00:00:00','2020-01-02 00:00:00','2020-01-03 00:00:00','2020-01-04 00:00:00','这题好难。'),(8,'佛科院校庆','/upload/pic04.jpg','佛科院','学生会','2020-01-01 00:00:00','2020-01-02 00:00:00','2020-01-03 00:00:00','2020-01-04 00:00:00','  佛科院的30周年校庆。');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_sign_up`
--

DROP TABLE IF EXISTS `activity_sign_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_sign_up` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `sign_up_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`activity_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `activity_sign_up_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `activity_sign_up_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_sign_up`
--

LOCK TABLES `activity_sign_up` WRITE;
/*!40000 ALTER TABLE `activity_sign_up` DISABLE KEYS */;
INSERT INTO `activity_sign_up` VALUES (1,6,'2020-01-10 08:28:59'),(1,8,'2020-01-14 10:42:33'),(2,2,'2020-01-09 08:38:38'),(2,5,'2020-01-10 00:26:48'),(4,5,'2020-01-09 09:11:24'),(7,6,'2020-01-14 11:14:02');
/*!40000 ALTER TABLE `activity_sign_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Rin','林零零','123','2020-01-08 08:48:59','1','2020-01-08','13247671284'),(2,'admin','林枣糕','123','2020-01-08 09:00:59','1','2019-01-08','18367273812'),(3,'Zao','林零伊','123','2020-01-08 09:51:39','1','2020-01-08','26798356745'),(4,'Gao','林零贰','123','2020-01-08 09:52:21','2','2020-01-08','19754681245'),(5,'test','林改贰','123','2020-01-08 09:52:52','1','2017-01-11','13246761254'),(6,'New','林新','123','2020-01-09 09:20:45','1','2020-01-01','13245432543'),(7,'017','林泽浩','123','2020-01-14 11:13:50','1','2020-01-01','13246761263');
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

-- Dump completed on 2020-01-14 22:05:07

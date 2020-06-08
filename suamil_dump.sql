-- MariaDB dump 10.17  Distrib 10.5.3-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: suamil_db
-- ------------------------------------------------------
-- Server version	10.5.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership` (
  `name` varchar(30) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `user_pw` varchar(30) NOT NULL,
  `user_pw2` varchar(30) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `grade` varchar(20) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` VALUES ('안녕','asdf@@1','a1!!a1!!','a1!!a1!!','010-0-13','13-1318-313','1sdf@hanmail.net','06267서울 강남구 강남대로 238ㄴㅇㄹㄴㄹㅇ (도곡동)','1'),('김희철','heechar3934!','dongju1425@','dongju1425@','031-207-3930','010-9018-3934','qaz3ws@naver.com','16325경기 수원시 장안구 정자로42번길 52736동 1603호 (천천동, 비단마을 베스트타운)','10'),('홍길동','rlagmlcjf123@','rlagmlcjf123@','rlagmlcjf123@','010-9013-5131','351-131-3131','khc90183934@gmail.com','08505서울 금천구 가산디지털2로 1234층 kosmo (가산동)','1');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multi_board`
--

DROP TABLE IF EXISTS `multi_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multi_board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `user_id` varchar(30) NOT NULL,
  `postdate` datetime DEFAULT current_timestamp(),
  `visitcount` mediumint(9) NOT NULL DEFAULT 0,
  `bname` varchar(30) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `fk_board_member` (`user_id`),
  CONSTRAINT `fk_board_member` FOREIGN KEY (`user_id`) REFERENCES `membership` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multi_board`
--

LOCK TABLES `multi_board` WRITE;
/*!40000 ALTER TABLE `multi_board` DISABLE KEYS */;
INSERT INTO `multi_board` VALUES (2,'test','test5','heechar3934!','2020-06-05 10:12:13',2,'freeboard'),(3,'test2','test2','heechar3934!','2020-06-05 10:14:21',11,'freeboard'),(5,'공지사항입니다.','공지내용입니다.','heechar3934!','2020-06-05 14:42:59',6,'notice'),(6,'안녕','안녕','rlagmlcjf123@','2020-06-05 14:44:07',2,'freeboard'),(7,'제목입니다','내용입니다','rlagmlcjf123@','2020-06-05 14:50:02',0,'freeboard'),(8,'제목입니다','내용입니다','heechar3934!','2020-06-05 14:52:27',0,'freeboard'),(9,'여긴 공지사항','내용있음','heechar3934!','2020-06-05 14:54:02',4,'freeboard'),(11,'안녕','안녕','heechar3934!','2020-06-05 15:56:56',2,'information'),(12,'안녕','ㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹ','heechar3934!','2020-06-05 16:35:24',2,'freeboard'),(13,'sdaf','asdf','heechar3934!','2020-06-05 17:03:58',0,'information');
/*!40000 ALTER TABLE `multi_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myfile`
--

DROP TABLE IF EXISTS `myfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myfile` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `sfile` varchar(100) NOT NULL,
  `ofile` varchar(100) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myfile`
--

LOCK TABLES `myfile` WRITE;
/*!40000 ALTER TABLE `myfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `myfile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-08  9:49:33

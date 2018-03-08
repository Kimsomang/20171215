-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: qudcjf125.cafe24.com    Database: qudcjf125
-- ------------------------------------------------------
-- Server version	5.5.17-log

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
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `board_id` char(1) NOT NULL,
  `board_num` int(11) NOT NULL,
  `reply_num` int(11) NOT NULL AUTO_INCREMENT,
  `reply_date` varchar(30) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `user_nickname` varchar(16) NOT NULL,
  `reply_contents` varchar(300) NOT NULL,
  `report_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`board_num`,`reply_num`),
  KEY `fk_board_to_reply` (`board_id`,`board_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES

('T',1,1,'2017-12-11 09:29:24','qudcjf1234@naver.com','qudcjf1234','우물밖개구리~~~~',0),
('F',2,1,'2017-12-11 09:32:11','qudcjf1234@naver.com','qudcjf1234','일찍좀다니자',0),
('N',11,1,'2017-12-14 10:52:10','mang@naver.com','소망','따듯한 물 많이 드세요~',0),
('F',8,1,'2017-12-14 10:52:34','mang@naver.com','소망','힘내요ㅜㅜ 화이팅!!',0),
('F',10,1,'2017-12-14 10:53:22','mang@naver.com','소망','망함',0);


/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 11:21:40

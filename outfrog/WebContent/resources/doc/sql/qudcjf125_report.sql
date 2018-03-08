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
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `report_type` varchar(10) NOT NULL,
  `type_num` int(11) NOT NULL,
  `reply_num` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `writer` varchar(30) NOT NULL,
  `report_reason` varchar(50) NOT NULL,
  `reporter` varchar(30) NOT NULL,
  `process` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES

('게시글',15,0,'[가격포기-25만원] 다이어트 한방에 해결!','cksal1156@naver.com','부적절한 게시물','somangk@naver.com',' '),
('게시글',12,0,'게시판을 내가 점령해버리게따~~~','mang@naver.com','부적절한 게시물','somangk@naver.com',' '),
('게시글',3,0,'게시파아나나나나ㅏ','qudcjf1234@naver.com','음란성 또는 청소년에게 부적합한 내용','admin',' '),
('작품',43,0,'fdsafdsafdsafds','dlalswjd@naver.com','음란성 또는 청소년에게 부적합한 내용','dlalswjd@naver.com',' '),
('작품',3,0,'얍얍','mang@naver.com','명예훼손/사생활 침해 및 저작권침해 등','qudcjf1234@naver.com',' '),
('게시글',3,0,'게시파아나나나나ㅏ','qudcjf1234@naver.com','부적절한 게시물','mang@naver.com',' '),
('게시글',15,0,'[가격포기-25만원] 다이어트 한방에 해결!','cksal1156@naver.com','부적절한 게시물','mang@naver.com',' ');


/*!40000 ALTER TABLE `report` ENABLE KEYS */;
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

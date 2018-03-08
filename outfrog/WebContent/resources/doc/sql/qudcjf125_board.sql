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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE board (
  `board_id` char(1) NOT NULL,
  `board_num` int(5) NOT NULL AUTO_INCREMENT,
  `board_title` varchar(50) NOT NULL,
  `post_date` varchar(30) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `user_nickname` varchar(16) NOT NULL,
  `board_contents` varchar(1000) NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `report_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`board_num`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES 
('F',6,'[자유]한울오빠가 또 자고 있다..','2017-12-14 10:50:06','somangk@naver.com','소망','언제까지 자는거지',0,NULL),
('N',3,'게시파아나나나나ㅏ','2017-12-11 09:32:54','qudcjf1234@naver.com','qudcjf1234','나나나나나나',0,NULL),
('K',5,'공지입니다.','2017-12-11 10:10:18','admin','관리자',' 개굴개굴 삼창 ~!',5,NULL),
('N',7,'지환오빠 왜 안오지','2017-12-14 10:50:21','somangk@naver.com','소망','왜 안오지',0,NULL),
('F',8,'[자유]병철오빠...','2017-12-14 10:50:36','somangk@naver.com','소망','뎨동...\r\n\r\n앞으로 잘할게여\r\n',1,NULL),
('N',9,'재혁오빠는 지금 뭐하고 있는걸까','2017-12-14 10:50:55','somangk@naver.com','소망','\r\n항상 뭔가 열심히 하고계신당..',0,NULL),
('F',10,'[자유]사진 어떡하지....','2017-12-14 10:51:11','somangk@naver.com','소망','\r\n하나 찍을까..',1,NULL),
('N',11,'날씨 너무 추워','2017-12-14 10:51:47','somangk@naver.com','소망','\r\n\r\n감기걸릴듯\r\n\r\n목이 부었당...',1,NULL),
('N',12,'게시판을 내가 점령해버리게따~~~','2017-12-14 10:54:33','mang@naver.com','소망','야호~~~',0,NULL),
('N',13,'헐...어떡하지','2017-12-14 10:58:23','mang@naver.com','소망','신고당해땅...\r\n꺄아아ㅏㅏ...ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ\r\n\r\nㅎㄱㅎ그흑',0,NULL),
('F',14,'[자유]이제 내일이면...','2017-12-14 10:59:13','mang@naver.com','소망','수업도 마지막이다..ㅠㅠㅠ\r\n아쉬워...',0,NULL),
('N',15,'[가격포기-25만원] 다이어트 한방에 해결!','2017-12-14 11:02:48','cksal1156@naver.com','cksal1156','\r\n\r\n여러분 다들 다이어트하기 힘드셨죠~?\r\n\r\n퍽퍽한 닭가슴살에 맛없는 샐러드만 먹느라 그동안 힘드셨던거 제가 싹~ 해결해드리겠습니다.\r\n지금 소개드릴 [하루 한알 다이어트]는 단돈 25만원에 맛있는 다이어트!!\r\n\r\n가능하게 해드립니다~\r\n\r\n연락주세요.\r\n\r\nTel : 010-XXXX-XXXX\r\n',0,NULL);

/*!40000 ALTER TABLE `board` ENABLE KEYS */;

UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 11:21:38

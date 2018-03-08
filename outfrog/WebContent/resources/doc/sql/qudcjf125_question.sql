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
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_nickname` varchar(16) NOT NULL,
  `question_title` varchar(50) NOT NULL,
  `question_content` varchar(1000) NOT NULL,
  `write_date` varchar(30) NOT NULL,
  `question_comment` varchar(500) DEFAULT NULL,
  `comment_state` varchar(20) NOT NULL,
  PRIMARY KEY (`question_num`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES

(1,'monerado','개구리 뒷다리','맛있나요???','2017-12-11 01:42:39','맛없네요ghj','답변완료'),
(2,'cksal1156','수상혜택을 변경하고싶어요','채택 전에 변경 가능할까요?\r\n빠른 답변 부탁드립니다.','2017-12-11 01:59:38','네 가능합니다.','답변완료'),
(3,'소망','신고당했을 때는 어떻게 하나요?ㅜㅜ','저는 이제 어떻게 되는 거죠..?ㅜㅜ','2017-12-11 02:02:43','잘가','답변완료'),
(4,'소망','신고 처리는 보통 얼마나 걸리나요?','방금 신고했는데 처리하는데까지 얼마나 걸리나요?\r\n신속한 처리 부탁드립니다.','2017-12-14 10:56:42','','답변대기'),
(5,'소망','의뢰할 때 필요한 정보에는 무엇이 있나요?','사업자 등록번호가 꼭 필요한가요?','2017-12-14 11:05:35','','답변대기'),
(6,'소망이','회원신고가 가능한가요?','게시글/댓글에만 신고가 가능한거같은데\r\n회원도 신고가 가능할까요?','2017-12-14 11:06:21','','답변대기'),
(7,'소망이','공모 수상자는 어떻게 알 수 있나요?','채택 시 연락이 오는건가요?\r\n직접 확인해야 하는건가요?','2017-12-14 11:07:00','','답변대기'),
(8,'qhqo','공모 수상자와는 어떻게 컨택할 수 있나요?','공모 채택 후 수상자와 컨택할 수 있는 방법이 있나요?\r\n블라인드 테스트라 정보를 알 수 있는지 궁금하네요.','2017-12-14 11:08:15','','답변대기');


/*!40000 ALTER TABLE `question` ENABLE KEYS */;
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

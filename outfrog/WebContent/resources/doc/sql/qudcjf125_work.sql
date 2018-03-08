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
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work` (
  `contest_num` int(11) NOT NULL,
  `work_num` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `user_nickname` varchar(16) NOT NULL,
  `work_title` varchar(100) NOT NULL,
  `work_content` varchar(1000) DEFAULT NULL,
  `work_picture` varchar(100) NOT NULL,
  `work_file` varchar(100) NOT NULL,
  `vote_count` int(11) NOT NULL,
  `report_count` int(11) NOT NULL,
  `sub_date` varchar(30) DEFAULT NULL,
  `prize` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`work_num`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES

(3,3,'mang@naver.com','소망','얍얍','대상','우물밖개구리1.png','우물밖개구리2.png',-1,3,'YYYY-MM-DD',''),
(3,11,'monerado@naver.com','monerado','한글','한글','평창-올림픽-31.jpg','평창-올림픽-32.jpg',0,0,'YYYY-MM-DD',' '),
(2,8,'kimbill@hanmail.net','kimbill','피자는 ','맛있엉','%B9%FA%C1%FD2.jpg','학습구분변경승인신청서.hwp',1,0,'YYYY-MM-DD','대상'),
(17,39,'somangk@naver.com','소망','체육시설 안전 도시재생 포스터','체육시설 안전 도시재생 포스터 작품 출품합니다.\r\n많이 투표해주세요~','jamsil.png','jamsil1.png',0,0,'2017-12-11',' '),
(17,38,'kjh30503@naver.com','kjh30503','체육시설안전','체육시설안전 주의합시다.','maxresdefault1.jpg','maxresdefault2.jpg',0,0,'2017-12-11','대상'),
(1,43,'dlalswjd@naver.com','dlalswjd','fdsafdsafdsafds','fdsafdsafd','Chrysanthemum1.jpg','Chrysanthemum2.jpg',0,1,'2017-12-11',' '),
(4,14,'monerado@naver.com','monerado','캐릭터 응모','캐릭터 응모','images (1).jpg','images (1)1.jpg',0,0,'2017-12-09','대상'),
(4,15,'monerado@naver.com','monerado','캐릭터 응모','캐릭터 응모','images.jpg','images1.jpg',0,0,'2017-12-09','우수상'),
(4,16,'monerado@naver.com','monerado','캐릭터 응모','캐릭터 응모','다운로드 (1).png','다운로드 (1)1.png',0,0,'2017-12-09','우수상'),
(4,17,'monerado@naver.com','monerado','캐릭터 응모','캐릭터 응모','다운로드 (2).png','다운로드 (2)1.png',0,0,'2017-12-09','입상'),
(4,18,'monerado@naver.com','monerado','캐릭터 응모','캐릭터 응모','다운로드.jpg','다운로드1.jpg',0,0,'2017-12-09','입상'),
(4,19,'monerado@naver.com','monerado','캐릭터 응모','캐릭터 응모','다운로드.png','다운로드1.png',0,0,'2017-12-09','입상'),
(1,44,'leedhun9393@naver.com','leedhun9393','ㅋㄹㅇ','ㅋㅇㄹ','Tulips8.jpg','Tulips9.jpg',0,0,'2017-12-11',' '),
(13,21,'somangk@naver.com','소망','괜찮아 잘하고 있어','잘했고, 잘하고 있고 잘할거야\r\n\r\n공모 참여합니다.','캘리.png','캘리1.png',0,0,'2017-12-10',' '),
(13,22,'somangk@naver.com','소망','꿈에 눈이 멀어라','꿈에 눈이 멀어라\r\n시시한 현실따위 보이지 않게','캘리2.png','캘리21.png',0,0,'2017-12-10',' '),
(5,23,'somangk@naver.com','소망','유니크샵 소개합니다~','폐공장을 유니크한 샵으로!','유니크샵.png','유니크샵1.png',0,0,'2017-12-10',' '),
(12,24,'somangk@naver.com','소망','뉴트리라이트 건강 수명up','82 = 82\r\n뉴트리라이트 건강수명 up!','뉴트리.png','뉴트리1.png',0,0,'2017-12-10',' '),
(9,25,'somangk@naver.com','소망','흡연에티켓','흡연 에티켓 광고 공모 참여~','흡연에티켓.png','흡연에티켓1.png',0,0,'2017-12-10',' '),
(17,41,'somangk@naver.com','소망','안전 스포츠','스포츠 및 체육시설안전 공모전 참여합니다.\r\n많은 투표 바랍니다.','sports.png','sports1.png',0,0,'2017-12-11','우수상'),
(10,27,'qhqo@naver.com','qhqo','스킨큐어 네이밍 공모','동백씨앗 고보습 오일!','스킨큐어 네이밍.png','스킨큐어 네이밍1.png',1,0,'2017-12-10',' '),
(6,28,'qhqo@naver.com','qhqo','롯데 기획 아이디어','롯데X롯데 콜라보레이션!!','제2롯데월드.png','제2롯데월드1.png',0,0,'2017-12-10',' '),
(17,29,'monerado@naver.com','monerado','스포츠 및 체육시설안전 홍보','스포츠 및 체육시설안전 홍보 포스터','maxresdefault.jpg','maxresdefault - 복사본.jpg',2,0,'2017-12-10',' '),
(16,30,'monerado@naver.com','monerado','스포츠강좌이용권','스포츠강좌이용권 광고','Fnp3-9641205903703.jpg','체험수기.hwp',1,0,'2017-12-10',' '),
(14,31,'monerado@naver.com','monerado','평창 홍보','평창 홍보 인쇄광고','20170217050258_1_726230.jpg','20170217050258_1_726230 - 복사본.jpg',2,0,'2017-12-10',' '),
(15,32,'monerado@naver.com','monerado','우리옷 디자인','우리옷 디자인','200905151502576315.jpg','200905151502576315 - 복사본.jpg',2,0,'2017-12-10',' '),
(17,42,'qudcjf125@naver.com','qudcjf125','체육시설 안전 홍보','안전에는 역시 실내 및 근처 내 금연 입니다.\r\n그러므로 이런 작품을 선택했습니다!','chaeyouk.jpg','silnaegeumyoun.jpg',1,0,'2017-12-11','우수상'),
(3,34,'mang@naver.com','소망','건전재정 가디언즈 5기','청정대리인팀 공모 참여합니다.\r\n\r\n국가재정에 관심가지겠다는 약속나무입니다.','청정대리인.png','청정대리인1.png',0,0,'2017-12-10',' '),
(18,35,'mang@naver.com','소망','건전한 재정 지킴이','건전재정 지킴이!\r\n국가 재정에 관심을 가지자','건전재정가디언즈모집.png','건전재정가디언즈모집1.png',0,0,'2017-12-10',' '),
(17,40,'qudcjf1234@naver.com','qudcjf1234','안전하게 운동하기','안전하게 운동합시다.','10252_23556_5022.jpg','10252_23556_50221.jpg',1,0,'2017-12-11','최우수상');


/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 11:21:37

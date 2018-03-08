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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(30) NOT NULL,
  `user_pw` varchar(20) NOT NULL,
  `user_nickname` varchar(16) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_phone1` varchar(11) NOT NULL,
  `user_phone2` varchar(15) DEFAULT NULL,
  `user_field` varchar(20) DEFAULT NULL,
  `user_grade` varchar(1) NOT NULL,
  `user_email` varchar(40) DEFAULT NULL,
  `user_getmail` varchar(1) NOT NULL,
  `user_getsms` varchar(1) NOT NULL,
  `contest_sponsor` varchar(50) DEFAULT NULL,
  `group_num` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES

('qudcjf125@naver.com','ekrkwu57!','qudcjf125','강병철','01099774965','0432957557','동영상광고,지면광고','S','qudcjf125@naver.com','N','N','코스모스타(기업)',1245655432),
('somangk@naver.com','thakddl23@','소망','김소망','01033303084','0438531156','동영상광고,지면광고','S','somangk@naver.com','Y','N','NSI 국가경영전략연구원(공공기관)',1995012323),
('doraemon@naver.com','doraemon1!','doraemon','도라에몽','01022225555','01044445555','동영상광고','S','doraemon@naver.com','Y','N','도라에몽컴퍼니(기업)',1080214587),
('xmflrtm2@naver.com','as!@1234','xmflrtm2','박한울','01071084259','x','팝업광고,지면광고','S','xmflrtm2@naver.com','Y','N','한민규.co(기업)',3302330543),
('kimbill6759@naver.com','rlawlghks1!','kimbill6759','김지환','01026526759','02-796-6759','배너광고,팝업광고','S','kimbill6759@naver.com','Y','N','(주)키움증권(기업)',2421915582),
('admin','admin','관리자','관리자','01097749653','0432957557',NULL,'A','qudcjf1234@naver.com','Y','N','서울시청(공공기관)',1234512512),
('mang@naver.com','thakddl23@','소망이','김소망','01033303084','','지면광고,브랜드명','G','mang@naver.com','N','Y',NULL,0),
('qudcjf1234@naver.com','ekrkwu57!','qudcjf1234','강병철','01097749653','0432957557','동영상광고,지면광고','S','qudcjf1234@naver.com','Y','N','서울시청(공공기관)',1234512512),
('monerado@naver.com','monerado1@','monerado','몽에라도','01011112222','01033334444','배너광고,팝업광고','G','monerado@naver.com','Y','Y',NULL,0),
('ing4965@naver.com','ekrkwu57!','ing4965','강병철','01078784545','0432799977','팝업광고,동영상광고','S','ing4965@naver.com','N','N','FiveFingers(기업)',5135579555),
('kimbill@hanmail.net','rlawlghks1!','kimbill','지환김','01011223344','02-6759-7492','동영상광고,제품명','S','kimbill@hanmail.net','Y','N','경상남도청(공공기관)',1113924423),
('terrorist@naver.com','terrorist1!','terrorist','테러범','01044444444','',NULL,'X','terrorist@naver.com','N','N',NULL,0),
('fatric@fatric.co.kr','fatric@12','fatric','페트릭','24900541968','','제품명,기타광고','G','fatric@fatric.co.kr','Y','Y',NULL,0),
('somang_k@naver.com','thakddl23@','somang_k','김소망','01033303084','0232135000',NULL,'S','somang_k@naver.com','Y','N','이투에스티(기업)',2198114922),
('cksal1156@naver.com','cksal1156@','cksal1156','김찬미','01062043084','0438531156','동영상광고,지면광고','S','cksal1156@naver.com','Y','N','한국사학진흥재단(공공기관)',2130808832),
('qhqo@naver.com','qhqoqhqo14@','qhqo','김보배','01041941156','07043555474',NULL,'S','qhqo@naver.com','Y','N','뉴트리라이트(기업)',3155028837),
('kimbill6759@gmail.com','rlawlghks1!','kimbill6759','김지환','01026526759','02-6759-7492','배너광고,팝업광고','S','kimbill6759@gmail.com','Y','N','KORAIL(기업)',1219394402),
('culturesport@naver.com','culturesport1!','culturesport','홍길동','01087486126','01087486127',NULL,'S','culturesport@naver.com','Y','N','문화체육관광부(공공기관)',0),
('kjh30503@naver.com','kjh30503*','kjh30503','금메달','01012251412','',NULL,'G','kjh30503@naver.com','N','N',NULL,0),
('leedhun9393@naver.com','ehdgns93@','leedhun9393','이동훈','01089067520','01089067520',NULL,'S','leedhun9393@naver.com','N','N','코스타일처리(기업)',4123212),
('dlalswjd@naver.com','dlalswjd24!','dlalswjd','이민정','01074218900','',NULL,'G','dlalswjd@naver.com','N','N',NULL,0),
('kz1993@naver.com','kz1993kz!','kz1993','이름','01063418208','',NULL,'G','kz1993@naver.com','N','N',NULL,0),
('mmmmmmm@naver.com','mmmmmmmm1!','mmmmmmm','비밀','01012341234','',NULL,'G','mmmmmmm@naver.com','N','N',NULL,0),
('aaaaaaaaaaa@aaa.com','bluesky98$$','aaaaaaaaaaa','요청한형식','01012341234','',NULL,'G','aaaaaaaaaaa@aaa.com','N','N',NULL,0),
('01011112222@hanmail.net','rlawofla1!','01011112222','김재림','01011112222','010-123123123','배너광고,기타광고','G','01011112222@hanmail.net','Y','Y',NULL,0),
('test@test.co.kr','xptmxm1!','test','왕길동','01012345678','',NULL,'G','test@test.co.kr','N','N',NULL,0),
('qudcjf12345@naver.com','ekrkwu57!','qudcjf12345','강병철','01099774965','01012345678','팝업광고,기타광고','G','qudcjf12345@naver.com','N','N',NULL,0);


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

-- Dump completed on 2017-12-14 11:21:35

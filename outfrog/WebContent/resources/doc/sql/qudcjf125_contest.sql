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
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest` (
  `contest_num` int(11) NOT NULL AUTO_INCREMENT,
  `contest_title` varchar(100) NOT NULL,
  `contest_contents` varchar(1000) NOT NULL,
  `contest_sponsor` varchar(50) NOT NULL,
  `contest_field` varchar(100) NOT NULL,
  `contest_benefit` varchar(300) NOT NULL,
  `due_date` varchar(30) NOT NULL,
  `contest_file` varchar(100) DEFAULT NULL,
  `user_id` varchar(30) NOT NULL,
  `group_num` varchar(12) NOT NULL,
  `bookmark_count` int(11) NOT NULL,
  PRIMARY KEY (`contest_num`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
INSERT INTO `contest` VALUES 

(1,'파일파일','되라되라','코스모스타(기업)','팝업광고','대상/5명/500만원','2017년12월21일','k_dokdo.jpg','qudcjf125@naver.com','1245655432',4),
(2,'한민큐','it\'s real','한민규.co(기업)','브랜드명','대상/kimbill@hanmail.net /500만원/','2017년12월09일','캡처.JPG','xmflrtm2@naver.com','3302330543',1),
(3,'건전재정 가디언즈 5기 모집 포스터 공고','건전재정 가디언즈 5기 모집 전 광고 포스터 공모합니다.\r\n많이 참여해주세요.','NSI 국가경영전략연구원(기업)','지면광고','대상/1명/2000만원/최우수상/4명/500만원','2017년12월26일','건전재정가디언즈.png','somangk@naver.com','1995012323',3),
(4,'대한민국 캐릭터 공모','대한민국 캐릭터 공모입니다.','도라에몽컴퍼니(기업)','기타광고','대상/monerado@naver.com /500만원/우수상/monerado@naver.com monerado@naver.com /200만원/입상/monerado@naver.com monerado@naver.com monerado@naver.com /50만원/','2017년12월08일','포스터_2017대한민국캐릭터공모대전1.jpg','doraemon@naver.com','1080214587',0),
(5,'2018 서울 샵디자인테크 전시회 유니크샵 영상 공모전','숨어있는 #유니크샵을 찾아라!\r\n응모자격 : 애정하는 샵을 갖고 있는 누구나\r\n특전 : 전시기회(1월 25일~27일)','에이스비즈컴즈(기업)','동영상광고','대상/1명/20만원/최우수상/3명/10만원/우수상/5명/5만원','2018년01월05일','가게를담다.png','cksal1156@naver.com','2130808832',1),
(6,'제 7회 롯데 아이디어 공모전','롯데와 롯데의 콜라보레이션\r\nSynergy Your Idea\r\n계열사와 계열사간 결합으로 새로운 시너지를 낼 수 있는 아이디어 공모합니다.','Lotte(기업)','기타광고','대상/1명/500만원/최우수상/22명/300만원/우수상/23명/200만원/장려상/23명/100만원','2018년01월09일','롯데아이디어공모전.png','somang_k@naver.com','2198114922',1),
(7,'지금은 코스모스타','나중에도 코스모스타','코스모스타(기업)','동영상광고','대상/4명/3만원','2017년12월23일','kosmosta.jpg','qudcjf125@naver.com','1245655432',1),
(8,'우물  밖 개구리 광고 모집','우물 밖 개구리 광고 공모합니다.\r\n다양한 광고를 올려주세요~~~','NSI 국가경영전략연구원(공공기관)','기타광고','대상/5명/1000만원','2017년12월15일','우물밖개구리1.png','somangk@naver.com','1995012323',1),
(23,'2017 서울시 앱 공모전','자유공모 : 서울시와 관련된 공익성을 담은 작품\r\n지정공모 : 서울시 공공 앱 주요기능 API를 활용한 작품\r\n참가자격 : 지역/학력 제한없음\r\n특별혜택 : 각 수상마다 상장 부여','서울시청(공공기관)','동영상광고()','대상/1명/500만원/최우수상/3명/300만원/우수상/7명/200만원/장려상/16명/50만원','2017년12월22일','2017_seoul.png','qudcjf1234@naver.com','1234512512',0),
(10,'스킨큐어 뷰티 광고 공모전','스킨큐어 뷰티 새 제품 제품명 공모합니다.\r\n신박한 이름 많이 지어주세요~~','스킨큐어(기업)','제품명','대상/1명/300만원/최우수상/1명/100만원/우수상/3명/30만원/장려상/5명/10만원','2018년01월09일','스킨큐어.png','somangk@naver.com','1995012323',0),
(11,'2018년 고등교육 재정정보 통합공시시스템 이름 공모','2018년 오픈 예정 고등교육 재정정보 통합공시시스템의 새 이름 공모\r\n대상: 관심 있는 분 누구나\r\n공모내용: 통합공시시스템의 새이름과 새이름을 대표하는 홈페이지 주소','한국사학진흥재단(공공기관)','브랜드명','최우수상/1명/50만원/우수상/2명/30만원/입상/6명/10만원','2017년12월15일','한국사학진흥재단.png','cksal1156@naver.com','2130808832',0),
(12,'제 11회 뉴트리라이트 대학생 광고 공모전','제 11회 뉴트리라이트 대학생 광고 공모전\r\n뉴트리라이트의 건강 수명 캠페인을 2030에게 효과적으로 알리기 위한 팝업광고 제작\r\n-건강수명 표현시 \'제품섭취를 통한 건강수명 증가\' 등 제품과 효과를 연결시키는 표현 금지','뉴트리라이트(기업)','팝업광고','대상/1명/300만원/최우수상/2명/100만원/우수상/3명/50만원/장려상/5명/20만원/입상/50명/10만원','2017년12월13일','뉴트리라이트.png','qhqo@naver.com','3155028837',0),
(13,'제 4회 수상한 공모전(캘리그라피)','성취, 목표\r\n올초 야심차게 다짐했던 일들.. 어떤가요?\r\n올해의 마지막이 얼마 남지 않았어요~\r\n주제에 부합한 내용의 글을 캘리그라피로 나만의 감성을 담아 자유롭게 표현해주세요.','이투에스티(기업)','배너광고','우수상/2명/100만원/장려상/1명/50만원','2017년12월31일','캘리그라피.png','somang_k@naver.com','2198114922',0),
(14,'평창 홍보 인쇄광고','평창 홍보 인쇄광고입니다.\r\n작품 규격 : A2 사이즈. 해상도 300dpi이상, 10MB 이내 jpg파일\r\n수상 발표 : 1월 초 예정\r\n문의 사항 : 문화체육관광부 평창 광고 운영사무국(02-6496-2141)','문화체육관광부(공공기관)','지면광고','대상/1명/500만원/최우수상/1명/300만원/우수상/2명/100만원/장려상/4명/50만원','2017년12월31일','평창 광고.jpg','culturesport@naver.com','0',2),
(15,'우리옷 디자인','한(韓)디자인 입고 싶은 우리옷 공모\r\n\r\n공모 주제 : 한복, 일상을 만나다. 상황A - 자유 창작물 상황B - 유니폼 창작물\r\n문의처 : - 담당자 : 02-399-8978 ','문화체육관광부(공공기관)','기타광고','대상/1명/500만원/최우수상/1명/200만원','2017년12월22일','우리옷 디자인.jpg','culturesport@naver.com','0',1),
(16,'스포츠강좌이용권  광고','스포츠강좌이용권  홍보 광고\r\n\r\n공모 주제 : KSPO 스포츠강좌이용권과 함께하는 희망찬 스포츠 복지사회\r\n심사기준 : 주제성(30) 작품성(35) 독창성(15) 대중성(20)\r\n작품규격 : A4 2매 내외, 바탕체, 12포인트(줄간격 기본). 파일형식 : hwp, doc, docx\r\n문의처 : 사무국 02)6394-2154','문화체육관광부(공공기관)','지면광고','대상/1명/100만원/최우수상/1명/50만원/우수상/2명/20만원/장려상/3명/10만원','2017년12월15일','스포츠강좌이용권 체험수기.jpg','culturesport@naver.com','0',1),
(17,'스포츠 및 체육시설안전 홍보 포스터','스포츠 및 체육시설안전 홍보 포스터\r\n\r\n주제 : 스포츠(체육시설포함) 안전문화 확산\r\n작품규격 : 대표자명_작품명 A2 사이즈. 해상도 300dpi이상, 10MB 이내 jpg파일\r\n문의사항 : 운영사무국 02-333-7000','문화체육관광부(공공기관)','지면광고','대상/kjh30503@naver.com /200만원/최우수상/qudcjf1234@naver.com /100만원/우수상/somangk@naver.com qudcjf125@naver.com /40만원/','2017년12월10일','스포츠 및 체육시설안전 공모.jpg','culturesport@naver.com','0',1),
(18,'건전재정 가디언즈 6기 모집 배너 광고','건전재정 가디언즈 6기 모집을 위한 배너 광고 공모합니다.','NSI 국가경영전략연구원(공공기관)','배너광고','대상/1명/2000만원/우수상/3명/1000만원','2018년02월07일','건전재정가디언즈6기.png','somangk@naver.com','1995012323',1),
(19,'인터넷 중독 포스터 광고','인터넷 중독에 대한 심각성을 청소년 / 청년들이 인지할 수 있도록 포스터 제작을 요청합니다!','경상남도청(공공기관)','지면광고','대상/1명/100만원/최우수상/1명/50만원/우수상/2명/30만원','2017년12월31일','도정뉴스20151106인터넷중독예방포스터공모당선작_시간가는줄모르는우리아이.jpg','kimbill@hanmail.net','1113924423',0),
(20,'철도를 소재로 참신한 영상을 만들어보자','철도르 소재로 한 짧은 영상을 만들어보세요\r\n팀 / 개인 상관없이 모두 등록이 가능합니다~','KORAIL(기업)','동영상광고','대상/1명/500만원/최우수상/1명/300만원/우수상/3명/100만원/장려상/10명/10만원/입상/30명/1만원','2018년01월30일','초단편영화제공모포스터(연장).jpg','kimbill6759@gmail.com','1219394402',0),(21,'이제 너도나도 개미가 되어보자~!? 개미???','키움 만의 개미가 아닌 주식 투자자들의 별칭을 지어주세요~','(주)키움증권(기업)','기타광고','대상/1명/10만원/최우수상/2명/5만원','2017년12월21일','0708-꿈틀꿈틀-공지포스터.png','kimbill6759@naver.com','2421915582',0),
(22,'다섯손가락 로고','저희 기업 이름이 다섯손가락인데 다섯손가락에 맞는 로고를 제작 해주세요!','FiveFingers(기업)','지면광고()','대상/1명/1000만원/최우수상/4명/300만원/우수상/5명/100만원','2017년12월22일','fivefingers_on.jpg','ing4965@naver.com','5135579555',0),(24,'등대그려주세요','등대를 그려주세요 ㅋ','코스타일처리(기업)','팝업광고()','대상/1명/500만원','2017년12월28일','Lighthouse.jpg','leedhun9393@naver.com','4123212',0);

/*!40000 ALTER TABLE `contest` ENABLE KEYS */;
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

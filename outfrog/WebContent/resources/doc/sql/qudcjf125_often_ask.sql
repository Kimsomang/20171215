﻿-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
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
-- Table structure for table `often_ask`
--

DROP TABLE IF EXISTS `often_ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `often_ask` (
  `ask_num` int(11) NOT NULL AUTO_INCREMENT,
  `ask_category` varchar(20) NOT NULL,
  `ask_title` varchar(50) NOT NULL,
  `ask_comment` varchar(500) NOT NULL,
  PRIMARY KEY (`ask_num`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='자주 묻는 질문';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `often_ask`
--

LOCK TABLES `often_ask` WRITE;
/*!40000 ALTER TABLE `often_ask` DISABLE KEYS */;
INSERT INTO `often_ask` VALUES 

(1,'로그인 관련','로그인이 안됩니다.','로그인이 안되는 이유는 존재하지 않는 아이디 이거나, 비밀번호가 틀렸을 경우에 로그인이 되지 않습니다.\r\n혹은 그 전에 이용하다 불가피하게 이용 정지 계정일 경우 같은 아이디로 재가입은 불가능 합니다.'),
(2,'로그인 관련','네이버 로그인 기능이 잘 안되요.','네 이 부분은 아직 개발 단계에 있으며 추후 공지를 통해 여러분에게 다가설 것을 약속 드립니다.\r\n잠시만 기다려 주시면 간편 로그인 기능을 추가하도록 하겠습니다.'),
(3,'내 정보 관련','제 정보는 유출되지 않는거죠?','저희는 여러분의 개인 정보를 개인정보보호법에 따라 보관할 의무를 갖으며 타인에게 노출되지 않는 한 외부 유출을 금하고 있습니다.'),
(4,'로그인 관련','testq','testx'),
(5,'내 정보 관련','aaa','aaa'),
(6,'로그인 관련','아이디/비밀번호가 자동으로 입력되는 경우 해결 방법','아이디/비밀번호가 자동으로 입력되어 있다면,\r\n사용 중인 익스플로러에서 자동 저장 기능이 설정되어 있는 것은 아닌지 확인해 주셔야 합니다.\r\n\r\n자동 저장 기능은 익스플로러에서 제공하는 기능이므로,\r\n아래의 방법으로 설정을 변경하신 후 이용해 주시길 바랍니다.\r\n\r\n1. 인터넷 익스플로러 창 상단의 메뉴에서 도구 > 인터넷 옵션 클릭\r\n2. 일반 탭에서 검색 기록의 삭제 클릭 > 암호 체크 후 삭제\r\n3. 내용 탭에서 자동 완성의 설정 클릭 > 양식과 양식에 사용할 사용자 이름과 암호 체크 해제\r\n4. 설정 완료 후 인터넷 옵션 화면 하단의 적용 클릭'),
(7,'내 정보 관련','실명 정보(이름, 생년월일 등) 수정 방법','개명, 주민등록번호 발급/수정 등의 이유로 실명 정보가 변경된 경우,\r\n정보 변경 이후 발급된 아이핀 또는 본인 명의 휴대폰으로 인증하여 직접 수정하실 수 있습니다.\r\n\r\n단, 이름/생년월일/개인고유식별정보(암호화된 동일인식별정보) 중 일치하는 정보가 있어야 수정이 가능합니다.'),
(8,'내 정보 관련','별명 수정 방법','내 정보 보기 > 수정하기 버튼을 누르신 후 변경이 가능합니다.\r\n별명은 한글 8글자 이내이며, 중복된 닉네임은 사용하실 수 없습니다.'),
(9,'게시판 관련','삭제된 게시글을 복구하고 싶어요.','삭제된 게시글은 데이터가 서버에서도 영구 삭제되어 복구가 불가능합니다.\r\n마찬가지로 게시글에 달려있던 댓글도 해당됩니다.\r\n\r\n우물 밖 개구리는 이용자의 소중한 개인정보보호를 위해 삭제된 데이터는 지체없이 서버에서 파기하고 있습니다.\r\n\r\n따라서, 삭제된 포스트에 대해서는 복구가 되지 않으니 신중히 삭제해 주실 것을 부탁드리며, 이는 개인정보를 보호하기 위한 정책인 점 너그러운 양해를 부탁드립니다.'),
(10,'작품 관련','작품 등록 오류 해결 방법','작품 작성이나 등록에 오류가 있어 불편함이 있다면 아래의 내용을 확인해주세요.\r\n\r\n1. 포스트 내용 내 다른 페이지에서 \"복사/붙여넣기\" 한 영역이 있을 경우\r\n-예를 들어 다른 페이지의 내용을 복사하여 등록할 경우 그 내용만 복사되는 것이 아니라 눈에는 보이지 않는 html 소스가 함께 복사되고 충돌을 일으켜 오류가 발생됩니다.\r\n\r\n2. 네트워크 환경이 불안정할 경우\r\n-네트워크 환경이 불안정할 경우 데이터의 전송이 원활하지 않습니다.\r\n-네트워크 환경이 불안정하면 일부 게시물의 내용이 보이지 않거나 등록이 되지 않을 수 있습니다.'),
(11,'의뢰 관련','의뢰 등록 오류 해결 방법','의뢰 작성이나 등록에 오류가 있어 불편함이 있다면 아래의 내용을 확인해주세요.\r\n\r\n1. 포스트 내용 내 다른 페이지에서 \"복사/붙여넣기\" 한 영역이 있을 경우\r\n-예를 들어 다른 페이지의 내용을 복사하여 등록할 경우 그 내용만 복사되는 것이 아니라 눈에는 보이지 않는 html 소스가 함께 복사되고 충돌을 일으켜 오류가 발생됩니다.\r\n\r\n2. 네트워크 환경이 불안정할 경우\r\n-네트워크 환경이 불안정할 경우 데이터의 전송이 원활하지 않습니다.\r\n-네트워크 환경이 불안정하면 일부 게시물의 내용이 보이지 않거나 등록이 되지 않을 수 있습니다.\r\n\r\n3. 브라우저의 알 수 없는 오류\r\n-브라우저 내 잘못된 캐시값이나 데이터값 등이 적용되어 있을 경우 오류가 발생될 수 있습니다.\r\n-브라우저 내 툴바나 추가 기능 등의 간섭으로 일부 기능이 정상적으로 작동하지 않을 수 있습니다.'),
(12,'작품 관련','삭제된 작품을 복구하고 싶어요.','삭제된 작품은 데이터가 서버에서도 영구 삭제되어 복구가 불가능합니다.\r\n\r\n우물 밖 개구리는 이용자의 소중한 개인정보보호를 위해 삭제된 데이터는 지체없이 서버에서 파기하고 있습니다.\r\n\r\n따라서, 삭제된 작품에 대해서는 복구가 되지 않으니 신중히 삭제해 주실 것을 부탁드리며, 이는 개인정보를 보호하기 위한 정책인 점 너그러운 양해를 부탁드립니다.'),
(13,'공모 관련','공모 등록한 글을 수정하고 싶어요','공모는 의뢰를 통해 등록되므로, 글 수정을 위해서는 관리자 권한이 필요합니다.\r\n수정을 원하실 경우 관리자에게 문의하시기 바랍니다.\r\n\r\n이메일 : outfrog@naver.com\r\n연락처 : 02-3780-2114'),
(14,'작품 관련','사진/동영상 대표 사진 설정 방법','작품 등록시 업로드 파일과 대표사진으로 설정할 썸네일 파일을 따로 설정할 수 있어\r\n하단의 대표사진 [첨부파일]에 썸네일로 등록될 사진을 설정하신 후\r\n공모 분야에 부합하는 파일을 업로드 하시기 바랍니다.'),
(15,'의뢰 관련','의뢰한 공모글이 올라오지 않아요','의뢰 요청 후 공모글이 바로 등록되지 않습니다.\r\n관리자의 검토 후 공모글이 등록되기 때문에 글이 바로 등록되기 원하신다면 관리자에게 문의하여 주시기 바랍니다.\r\n\r\n이메일 : outfrog@naver.com\r\n연락처 : 02-3780-2114'),
(16,'의뢰 관련','의뢰 시 필요한 정보에는 무엇이 있나요?','의뢰 시 필요한 정보에는 기본적인 기업명과 사업자등록번호, 연락처, 이메일 등 기업정보와 공모에 대한 설명, 썸네일로 등록될 첨부파일 등을 필수정보로 수집하고 있습니다.'),
(17,'게시판 관련','게시판 카테고리에 대해 설명해주세요.','게시판에는 크게 두가지 분류로 나눌 수 있습니다.\r\n관리자만이 작성가능한 공지게시판과 회원여러분들이 자유롭게 글을 작성해주실 수 있는 자유게시판이 있습니다. 자유게시판에는 [Tip] 카테고리와 [자유] 카테고리가 있는데, [Tip]은 공모나 작품 관련 팁을 줄 수 있는 정보 게시글을 적을 때 사용하는 카테고리이며 [자유]는 주제없이 자유롭게 게시글을 작성할 때 사용할 수 있습니다. '),
(18,'공모 관련','채택하기 기능은 무엇인가요?','채택하기 기능은 의뢰자에게만 주어지는 특별 권한으로써, 등록한 공모의 수상자를 채택할 수 있는 기능입니다. 처음 의뢰글을 작성하실때 수집된 수상혜택에 따라 수상자를 채택할 수 있습니다.'),
(19,'공모 관련','채택하기 기능은 무엇인가요?','채택하기 기능은 의뢰자에게만 주어지는 특별 권한으로써, 등록한 공모의 수상자를 채택할 수 있는 기능입니다. 처음 의뢰글을 작성하실때 수집된 수상혜택에 따라 수상자를 채택할 수 있습니다.'),(20,'신고 관련','회원 신고도 가능한가요?','아쉽게도 회원에 대한 신고 기능은 지원하지 않고 있습니다.\r\n오직 회원이 작성한 작품/게시글/댓글에 대해서만 신고가 가능합니다.\r\n\r\n신고 시 신고받은 회원은 활동에 제한이 생길 수 있으므로, 신중히 고민한 후 결정하시기 바랍니다.\r\n허위 신고 시 신고자가 불이익을 받을 수 있습니다.');

/*!40000 ALTER TABLE `often_ask` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 11:21:39

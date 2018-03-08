/* 게시판테이블 */
CREATE TABLE BOARD (
   BOARD_ID CHAR(1) NOT NULL, /* 게시판아이디 */
   BOARD_NUM NUMBER(5) NOT NULL, /* 게시글번호 */
   BOARD_TITLE VARCHAR2(50) NOT NULL, /* 게시글제목 */
   POST_DATE VARCHAR2(30) NOT NULL, /* 작성날짜 */
   USER_ID VARCHAR2(60) NOT NULL, /* 작성자 */
   USER_NICKNAME VARCHAR2(16) NOT NULL, /* 닉네임 */
   BOARD_CONTENTS VARCHAR2(1000) NOT NULL,  /* 게시글 내용 */
   HITS NUMBER DEFAULT '0' NOT NULL, /* 조회수 */
   REPORT_COUNT NUMBER /* 신고수 */
);


/* 제약 */
ALTER TABLE BOARD ADD CONSTRAINT PK_BOARD PRIMARY KEY (BOARD_ID, BOARD_NUM);

create sequence seq_notice_board_num
start with 1
increment by 1
maxvalue 99999
cycle;

create sequence seq_free_board_num
start with 1
increment by 1
maxvalue 99999
cycle;

/* 주석 */
COMMENT ON TABLE BOARD IS '게시판
-공지와 자유게시판의 구분자는 게시판아이디로 나뉘고
-게시글마다의 구분은 게시글 번호로 구분한다.';

COMMENT ON COLUMN BOARD.BOARD_ID IS '게시판아이디';

COMMENT ON COLUMN BOARD.BOARD_NUM IS '게시글번호';

COMMENT ON COLUMN BOARD.BOARD_TITLE IS '게시글제목';

COMMENT ON COLUMN BOARD.POST_DATE IS '작성날짜';

COMMENT ON COLUMN BOARD.USER_ID IS '작성자';

COMMENT ON COLUMN BOARD.USER_NICKNAME IS '닉네임';

COMMENT ON COLUMN BOARD.HITS IS '조회수';

COMMENT ON COLUMN BOARD.REPORT_COUNT IS '신고수';

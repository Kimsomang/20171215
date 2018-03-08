DROP TABLE QUESTION PURGE;

/* 1:1문의 */
CREATE TABLE QUESTION (
	QUESTION_NUM NUMBER NOT NULL, /* 문의 번호 */
	USER_NICKNAME VARCHAR2(16) NOT NULL, /* 닉네임 */
	QUESTION_TITLE VARCHAR2(50) NOT NULL, /* 문의 제목 */
	QUESTION_CONTENT VARCHAR2(1000) NOT NULL, /* 문의 내용 */
	WRITE_DATE VARCHAR2(30) NOT NULL, /* 작성 날짜 */
	QUESTION_COMMENT VARCHAR2(500), /* 답변 내용 */
	COMMENT_STATE VARCHAR2(20) NOT NULL /* 답변 상태 */
);

/* 문의 번호 시퀀스 */
create sequence seq_question_num
start with 1
increment by 1
nocycle;

/* 제약 */
ALTER TABLE QUESTION ADD CONSTRAINT PK_QUESTION PRIMARY KEY (QUESTION_NUM);


/* 주석 */
COMMENT ON TABLE QUESTION IS '고객센터의 1:1문의 게시판에 대한 테이블';

COMMENT ON COLUMN QUESTION.QUESTION_NUM IS '1:1 문의글을 식별할 수 있는 기본키';

COMMENT ON COLUMN QUESTION.USER_NICKNAME IS '1:1 문의 글을 작성한 회원의 닉네임(작성자)';

COMMENT ON COLUMN QUESTION.QUESTION_TITLE IS '1:1 문의 글 제목';

COMMENT ON COLUMN QUESTION.QUESTION_CONTENT IS '문의하고 싶은 구체적 내용';

COMMENT ON COLUMN QUESTION.WRITE_DATE IS '문의 글을 작성한 날짜';

COMMENT ON COLUMN QUESTION.QUESTION_COMMENT IS '문의에 대한 관리자의 댓글형태의 답변';

COMMENT ON COLUMN QUESTION.COMMENT_STATE IS '문의글에 대한 관리자의 답변상태(답변대기/답변완료)';

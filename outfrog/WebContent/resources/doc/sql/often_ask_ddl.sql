/* 자주 묻는 질문 */
CREATE TABLE OFTEN_ASK (
	ASK_NUM NUMBER NOT NULL, /* 질문글 번호 */
	ASK_CATEGORY VARCHAR2(20) NOT NULL, /* 질문 분류 */
	ASK_TITLE VARCHAR2(50) NOT NULL, /* 질문 제목 */
	ASK_COMMENT VARCHAR2(500) NOT NULL /* 질문 답변 */
);

/* 자주 묻는 질문 시퀀스 */
create sequence seq_ask_num
start with 1
increment by 1
nocycle;

/* 제약 */
ALTER TABLE OFTEN_ASK ADD CONSTRAINT PK_OFTEN_ASK PRIMARY KEY (ASK_NUM);


/* 주석 */
COMMENT ON TABLE OFTEN_ASK IS '회원들이 자주 묻는 질문들에 대한 테이블
고객센터의 자주 묻는 질문(관리자만 작성가능)';

COMMENT ON COLUMN OFTEN_ASK.ASK_NUM IS '자주 묻는 질문글들을 식별할 수 있는 기본키';

COMMENT ON COLUMN OFTEN_ASK.ASK_CATEGORY IS '자주 묻는 질문들의 대한 유형 분류';

COMMENT ON COLUMN OFTEN_ASK.ASK_TITLE IS '자주 묻는 질문들';

COMMENT ON COLUMN OFTEN_ASK.ASK_COMMENT IS '자주 묻는 질문들에 해당하는 답변들';

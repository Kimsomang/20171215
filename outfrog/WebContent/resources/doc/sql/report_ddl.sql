/* 신고 */
CREATE TABLE REPORT (
	REPORT_TYPE VARCHAR2(10) NOT NULL, /* 글 종류 */
	TYPE_NUM NUMBER NOT NULL, /* 식별 번호 */
	REPLY_NUM NUMBER, /* 댓글 식별번호 */
	CATEGORY VARCHAR2(10) NOT NULL, /* 카테고리 */
	TITLE VARCHAR2(50) NOT NULL, /* 글 제목 */
	WRITER VARCHAR2(16) NOT NULL, /* 작성자 */
	REPORT_REASON VARCHAR2(100) NOT NULL, /* 신고사유 */
	REPORTER VARCHAR2(16) NOT NULL /* 신고자 */
);


/* 주석 */
COMMENT ON TABLE REPORT IS '게시판, 작품, 댓글의 신고 관련 테이블';

COMMENT ON COLUMN REPORT.REPORT_TYPE IS '글의 종류를 분류하는 컬럼(게시글, 작품, 댓글)';

COMMENT ON COLUMN REPORT.TYPE_NUM IS '글종류 분류에 따른 각 게시판/작품의 고유식별키';

COMMENT ON COLUMN REPORT.REPLY_NUM IS '댓글 신고시 댓글 식별번호,
타입식별번호에는 댓글이 달린 게시글의 고유키값이 들어가고 댓글 식별번호에는 해당 댓글 식별키값이 들어감';

COMMENT ON COLUMN REPORT.CATEGORY IS '각 글들의 종류에 따른 분류(게시글-Tip,자유/작품-디자인,비디오,배너 등)
댓글의 경우 해당 댓글이 달린 게시글의 분류';

COMMENT ON COLUMN REPORT.TITLE IS '신고를 받은 해당 글의 제목
댓글의 경우 댓글이 달린 해당 게시글의 제목';

COMMENT ON COLUMN REPORT.WRITER IS '신고받은 글 및 댓글을 작성한 회원의 닉네임(신고받은자)';

COMMENT ON COLUMN REPORT.REPORT_REASON IS '신고를 한 이유(신고사유)';

COMMENT ON COLUMN REPORT.REPORTER IS '신고를 한 회원의 닉네임';

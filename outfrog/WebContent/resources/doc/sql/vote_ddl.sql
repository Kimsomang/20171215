/* ��ǥ */
CREATE TABLE VOTE (
	CONTEST_NUM NUMBER NOT NULL, /* ������ ��ȣ */
	WORK_NUM NUMBER NOT NULL, /* �����ڷ� ��ȣ */
	USER_ID VARCHAR2(30) NOT NULL /* ���̵� */
);


/* �ּ� */
COMMENT ON TABLE VOTE IS '���ƿ� ���̺�';

COMMENT ON COLUMN VOTE.CONTEST_NUM IS '������ ��ȣ';

COMMENT ON COLUMN VOTE.WORK_NUM IS '�����ڷ� ��ȣ';

COMMENT ON COLUMN VOTE.USER_ID IS '���̵�';
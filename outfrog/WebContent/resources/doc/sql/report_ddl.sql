/* �Ű� */
CREATE TABLE REPORT (
	REPORT_TYPE VARCHAR2(10) NOT NULL, /* �� ���� */
	TYPE_NUM NUMBER NOT NULL, /* �ĺ� ��ȣ */
	REPLY_NUM NUMBER, /* ��� �ĺ���ȣ */
	CATEGORY VARCHAR2(10) NOT NULL, /* ī�װ� */
	TITLE VARCHAR2(50) NOT NULL, /* �� ���� */
	WRITER VARCHAR2(16) NOT NULL, /* �ۼ��� */
	REPORT_REASON VARCHAR2(100) NOT NULL, /* �Ű���� */
	REPORTER VARCHAR2(16) NOT NULL /* �Ű��� */
);


/* �ּ� */
COMMENT ON TABLE REPORT IS '�Խ���, ��ǰ, ����� �Ű� ���� ���̺�';

COMMENT ON COLUMN REPORT.REPORT_TYPE IS '���� ������ �з��ϴ� �÷�(�Խñ�, ��ǰ, ���)';

COMMENT ON COLUMN REPORT.TYPE_NUM IS '������ �з��� ���� �� �Խ���/��ǰ�� �����ĺ�Ű';

COMMENT ON COLUMN REPORT.REPLY_NUM IS '��� �Ű�� ��� �ĺ���ȣ,
Ÿ�Խĺ���ȣ���� ����� �޸� �Խñ��� ����Ű���� ���� ��� �ĺ���ȣ���� �ش� ��� �ĺ�Ű���� ��';

COMMENT ON COLUMN REPORT.CATEGORY IS '�� �۵��� ������ ���� �з�(�Խñ�-Tip,����/��ǰ-������,����,��� ��)
����� ��� �ش� ����� �޸� �Խñ��� �з�';

COMMENT ON COLUMN REPORT.TITLE IS '�Ű� ���� �ش� ���� ����
����� ��� ����� �޸� �ش� �Խñ��� ����';

COMMENT ON COLUMN REPORT.WRITER IS '�Ű���� �� �� ����� �ۼ��� ȸ���� �г���(�Ű������)';

COMMENT ON COLUMN REPORT.REPORT_REASON IS '�Ű� �� ����(�Ű����)';

COMMENT ON COLUMN REPORT.REPORTER IS '�Ű� �� ȸ���� �г���';

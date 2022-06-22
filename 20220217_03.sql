select user
from dual;
--==>>LYJ

--�� ���̺� ����(TBL_ORAUSERTEST)
create table TBL_ORAUSERTEST
(no number(10)
, name VARCHAR(30)
);
--==>> �����߻�
-- (ORA-01031: insufficient privileges)
--> ���� ������ �̸� ������ create session ���Ѹ� ���� ������
-- ���̺� ���� ������ ���� ���� ���� �����̴�.
-- �׷��Ƿ� �����ڷκ��� ���̺��� ������ �� �ִ� ������ �ο��޾ƾ� �Ѵ�.


--�� SYS �� ���� ���̺� ��������(CREATE_TABLE)�� �ο����� �� 
-- �ٽ� ���̺� ����(TBL_ORAUSERTEST)
create table TBL_ORAUSERTEST
(no number(10)
, name VARCHAR(30)
);
--==>> ���� �߻�
-- (ORA-01950: no privileges on tablespace 'TBS_EDUA')
--> ���̺� ���� ���ѱ��� �ο����� ��Ȳ������
-- ������ �̸� ������ �⺻ ���̺� �����̽�(DEFAULT TABLESPACE)��
-- TBS_EDUA �̸�, �� ������ ���� �Ҵ緮�� �ο����� ���� �����̴�.
-- �׷��Ƿ� �� ���̺����̽��� ����� ������ ���ٴ� �����޼����� 
-- ����Ŭ�� ������ְ� �ִ� ��Ȳ

-- �� SYS�� ���� ���̺� �����̽�(TBS_EDUA)�� ���� �Ҵ緮�� �ο����� ��
-- �ٽ� ���̺� ����
create table TBL_ORAUSERTEST
(no number(10)
, name VARCHAR(30)
);
--==>> Table TBL_ORAUSERTEST��(��) �����Ǿ����ϴ�.


--�� ������ ���̺� ��ȸ
select *
from TBL_ORAUSERTEST;
--> ���̺��� ������ Ȯ���� �� �ִ� ����
-- ��, ��ȸ ����� ����

--�� �ڽſ��� �ο��� �Ҵ緮 ��ȸ
select *
from user_ts_quotas;
--==>> TBS_EDUA	65536	-1	8	-1	NO
-- �� ��-1���� �������� �ǹ�

--�� ������ ���̺�(TBL_ORAUSERTEST)dl
-- � ���̺����̽��� ����Ǿ� �ִ��� ��ȸ
select table_name, tablespace_name
from user_tables;
--==>> TBL_ORAUSERTEST	TBS_EDUA




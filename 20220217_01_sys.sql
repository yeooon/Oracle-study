select user
from dual;
--==>> SYS

select '���ڿ�'
from dual;
--==>> ���ڿ�

select 550+23
from dual;

select '������'+'ȫ����'
from dual;
--==>> �����߻�
--(ORA-01722: invalid number)

--�� ���� ����Ŭ ������ �����ϴ� ����� ���� ���� ��ȸ
select username, account_status
from dba_users;
--==>>
/*
SYS	OPEN
SYSTEM	                OPEN
ANONYMOUS	            OPEN
HR	                    OPEN
APEX_PUBLIC_USER	    LOCKED
FLOWS_FILES	            LOCKED
APEX_040000	            LOCKED
OUTLN	                EXPIRED & LOCKED
DIP	                    EXPIRED & LOCKED
ORACLE_OCM	            EXPIRED & LOCKED
XS$NULL	                EXPIRED & LOCKED
MDSYS	                EXPIRED & LOCKED
CTXSYS	                EXPIRED & LOCKED
DBSNMP	                EXPIRED & LOCKED
XDB	                    EXPIRED & LOCKED
APPQOSSYS	            EXPIRED & LOCKED
*/

select *
from dba_users;

/*
SYS	0		OPEN		2022-08-14	SYSTEM
SYSTEM	5		OPEN		2022-08-14	SYSTEM
ANONYMOUS	35		OPEN		2014-11-25	SYSAUX
HR	43		OPEN		2022-08-15	USERS
APEX_PUBLIC_USER	45		LOCKED	2014-05-29	2014-11-25	SYSTEM
FLOWS_FILES	44		LOCKED	2014-05-29	2014-11-25	SYSAUX
APEX_040000	47		LOCKED	2014-05-29	2014-11-25	SYSAUX
OUTLN	9		EXPIRED & LOCKED	2022-02-15	2022-02-15	SYSTEM
DIP	14		EXPIRED & LOCKED	2014-05-29	2014-05-29	SYSTEM
ORACLE_OCM	21		EXPIRED & LOCKED	2014-05-29	2014-05-29	SYSTEM
XS$NULL	2147483638		EXPIRED & LOCKED	2014-05-29	2014-05-29	SYSTEM
MDSYS	42		EXPIRED & LOCKED	2014-05-29	2022-02-15	SYSAUX
CTXSYS	32		EXPIRED & LOCKED	2022-02-15	2022-02-15	SYSAUX
DBSNMP	29		EXPIRED & LOCKED	2014-05-29	2014-05-29	SYSAUX
XDB	34		EXPIRED & LOCKED	2014-05-29	2014-05-29	SYSAUX
APPQOSSYS	30		EXPIRED & LOCKED	2014-05-29	2014-05-29	SYSAUX
*/

select username, created
from DBA_users;
/*
SYS	2014-05-29
SYSTEM	2014-05-29
ANONYMOUS	2014-05-29
HR	2014-05-29
APEX_PUBLIC_USER	2014-05-29
FLOWS_FILES	2014-05-29
APEX_040000	2014-05-29
OUTLN	2014-05-29
DIP	2014-05-29
ORACLE_OCM	2014-05-29
XS$NULL	2014-05-29
MDSYS	2014-05-29
CTXSYS	2014-05-29
DBSNMP	2014-05-29
XDB	2014-05-29
APPQOSSYS	2014-05-29
*/

--> ��DBA_�� �� �����ϴ� Oracle Data Dictionary View ��
-- ������ ������ �������� �������� ��쿡�� ��ȸ�� �����ϴ�.
-- ���� ������ ��ųʸ� ������ ���� ���ص� �������.

--�� ��HR ������� ������ ��� ���·� ����
alter user HR account lock;
--==>>User HR��(��) ����Ǿ����ϴ�.

--�� ����� ���� ���� ��ȸ
select username, account_status
from DBA_USERS;
--==>>
/*
    :
HR	LOCKED
    :
*/

--�� ��HR�� ����� ������ ��� ���� ����
alter user HR account unlock;
--==>>User HR��(��) ����Ǿ����ϴ�.

--�� �ٽ� ����� ���� ���� ��ȸ
select username, account_status
from DBA_USERS;
/*
    :
HR	OPEN    
    :
*/

------------------------------------------------------------------

--�� TABLESPACE ����
--�� TABLESPACE ��?
--> ���׸�Ʈ(���̺�, �ε���,...)�� ��Ƶδ�(�����صδ�)
-- ����Ŭ�� ������ ���屸���� �ǹ��Ѵ�.

create TABLESPACE TBS_EDUA              -- �����ϰڴ�. ���̺����̽��� TBS_EDUA ��� �̸�����
datafile 'C:\TESTDATA\TBS_EDUA01.DBF'   -- ������ ������ ���� ��� �� �̸�
SIZE 4M                                 -- ������(�뷮)
extent management local                 -- ����Ŭ ������ ���׸�Ʈ�� �˾Ƽ� ����
segment space management auto;          -- ���׸�Ʈ ���� ������ ����Ŭ ������ �ڵ����� ����
--==>> TABLESPACE TBS_EDUA��(��) �����Ǿ����ϴ�.

--�� ���̺����̽� ���� ������ �����ϱ� ����
-- �ش� ����� �������� ���͸� ������ �ʿ��ϴ�.
-- (C:\TESTDATA)

-- �� ������ ���̺����̽� ��ȸ
SELECT *
from DBA_TABLESPACES;
/*
SYSTEM	8192	65536		1	2147483645	2147483645		65536
SYSAUX	8192	65536		1	2147483645	2147483645		65536
UNDOTBS1	8192	65536		1	2147483645	2147483645		65536
TEMP	8192	1048576	1048576	1		2147483645	0	1048576
USERS	8192	65536		1	2147483645	2147483645		65536
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536
*/

--�� ���� �뷮 ���� ��ȸ (�������� ���� �̸� ��ȸ)
SELECT *
FROM DBA_DATA_FILES;

--�� ����Ŭ ����� ���� ����
CREATE USER lyj IDENTIFIED by java006$
default tablespace TBS_EDUA;
--==>> User LYJ��(��) �����Ǿ����ϴ�.
--> lyj ��� ����� ������ �����ϰڴ�. (����ڴ�.)
-- �� ����� ������ �н������ java006$ �� �ϰڴ�.
-- �� ������ ���� �����ϴ� ����Ŭ ���׸�Ʈ��
-- �⺻������ TBS_EDUA ��� ���̺����̽��� ������ �� �ֵ��� �����ϰڴ�.

-- �� ������ ����Ŭ ����� ����(���� ���� �̸� �̴ϼ� ����)�� ���� ���� �õ�
-- �� ���� �Ұ�(����)
-- ��create session�� ������ ���� ������ ���� �Ұ�.

-- �� ������ ����Ŭ ����� ����(���� ���� �̸� �̴ϼ� ����)��
-- ����Ŭ ���� ������ �����ϵ��� create session ���� �ο�
grant create session to lyj;
--==>> Grant��(��) �����߽��ϴ�.

--�� ���� ������ ����Ŭ ����� ������ �ý��� ���� ���� ��ȸ
select *
FROM DBA_SYS_PRIVS;
--==>>
/*
    :
LYJ	CREATE SESSION	NO    
    :
*/

-- �� ���� ������ ����Ŭ ����� ������
-- ���̺� ������ �����ϵ��� create table ���� �ο�
grant create table to lyj;
--==>> Grant��(��) �����߽��ϴ�.

-- �� ���� ������ ����Ŭ ����� ������
-- ���̺� �����̽�(TBS_EDUA���� ����� �� �ִ� ����(�Ҵ緮) ����.
alter user lyj
quota unlimited on TBS_EDUA;
--==>> User LYJ��(��) ����Ǿ����ϴ�.

-----------------------------------------------------------

CREATE USER scott
IDENTIFIED BY tiger;
--==>> User SCOTT��(��) �����Ǿ����ϴ�.

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT;
--==>> Grant��(��) �����߽��ϴ�.

ALTER USER SCOTT DEFAULT TABLESPACE USERS;
--==>> User SCOTT��(��) ����Ǿ����ϴ�.

ALTER USER SCOTT TEMPORARY TABLESPACE TEMP; 
--==> User SCOTT��(��) ����Ǿ����ϴ�.

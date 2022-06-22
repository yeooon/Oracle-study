SELECT USER
FROM DUAL;
--==>> SCOTT

--�� 20220310_01_scott(plsql).sql ���Ͽ���
-- FN_PAY() �Լ� ���� �� �׽�Ʈ
SELECT NUM, NAME, BASICPAY, SUDANG, FN_PAY(BASICPAY, SUDANG)"�޿�"
FROM TBL_INSA;
/*
1001	ȫ�浿	2610000	200000	31520000
1002	�̼���	1320000	200000	16040000
1003	�̼���	2550000	160000	30760000
1004	������	1954200	170000	23620400
1005	�Ѽ���	1420000	160000	17200000
                    :
                    :                    
*/

--�� 20220310_01_scott(plsql).sql ���Ͽ���
-- FN_WORKYEAR() �Լ� ���� �� �׽�Ʈ
SELECT NAME, IBSADATE, FN_WORKYEAR(IBSADATE)"�ٹ��Ⱓ"
FROM TBL_INSA;
/*
ȫ�浿	1998-10-11	23.4
�̼���	2000-11-29	21.2
�̼���	1999-02-25	23
������	2000-10-01	21.4
�Ѽ���	2004-08-13	17.5
*/

--------------------------------------------------------------------------------

--�� ���ν��� ���� �ǽ��� ���� �غ�

-- �ǽ� ���̺� ����
CREATE TABLE TBL_STUDENTS
(ID VARCHAR2(10)
,NAME VARCHAR2(40)
,TEL VARCHAR2(30)
,ADDR VARCHAR2(100)
,CONSTRAINT STUDENTS_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_STUDENTS��(��) �����Ǿ����ϴ�.

-- �ǽ� ���̺� ����
CREATE TABLE TBL_IDPW
(ID VARCHAR2(10)
,PW VARCHAR2(20)
,CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)
);
--==>>Table TBL_IDPW��(��) �����Ǿ����ϴ�.


-- �� ���̺� ������ �Է�
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('happy','�̽ÿ�','010-1111-1111','���ֵ� ��������');
INSERT INTO TBL_IDPW(ID, PW)
VALUES('happy','java006$');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2

-- Ȯ��
SELECT *
FROM TBL_STUDENTS;
--==>> happy	�̽ÿ�	010-1111-1111	���ֵ� ��������

SELECT *
FROM TBL_IDPW;
--==>> happy	java006$

--Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


-- ���� ������ �����ϴ� ���ν���(INSERT ���ν���, �Է� ���ν���)�� �����ϰ� �Ǹ�
-- EXEC PRC_STUDENT_INSERT('happy','java006$','�̽ÿ�','010-1111-1111','���ֵ� ��������');
-- �̿� ���� ���� �� �ٷ� ���� ���̺� ��� ����� �����͸� �Է��� �� �ִ�.

--�� ���ν����� �����ϴ� ������
-- ��20220310_01_scott(plsql).sql�� ���� ����~!!!


--�� ���ν��� ���� �� ����
EXEC PRC_STUDENT_INSERT('rainbow','java006$','������','010-2222-2222','���� ������');
--==>>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
SELECT *
FROM TBL_IDPW;
--==>>
/*
happy	java006$
rainbow	java006$
*/
SELECT *
FROM TBL_STUDENTS;
--==>>
/*
happy	�̽ÿ�	010-1111-1111	���ֵ� ��������
rainbow	������	010-2222-2222	���� ������
*/

--�� �ǽ� ���̺� ����(TBL_SUNGJUK)
CREATE TABLE TBL_SUNGJUK
(HAKBUN     NUMBER
,NAME       VARCHAR2(40)
,KOR        NUMBER(3)
,ENG        NUMBER(3)
,MAT        NUMBER(3)
,CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>> Table TBL_SUNGJUK��(��) �����Ǿ����ϴ�.

DROP TABLE TBL_SUNGJUK;

--�� ������ ���̺� ���� ���� �� �÷� �߰�
-- (���� �� TOT, ��� �� AVG, ��� �� GRADE)
ALTER TABLE TBL_SUNGJUK
ADD (TOT NUMBER(3), AVG NUMBER(4,1), GRADE CHAR);
--==>>Table TBL_SUNGJUK��(��) ����Ǿ����ϴ�.


--�� ����� ���̺� ���� Ȯ��
DESC TBL_SUNGJUK;
--==>> 
/*
�̸�     ��?       ����           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)   
*/


--�� ���⼭ �߰��� �÷��� ���� �׸���
-- ���ν��� �ǽ��� ���� �߰��׸��� ��
-- ���� ���̺� ������ ����������, �ٶ��������� ���� �����̴�~!!! CHECK~!!!

--==>> ���� ���̺��� �����͸� Ȱ���Ͽ� ���� �� �ִ� �����ʹ�
-- ��, �������� ���� �� �� �ִ� �����ʹ�
-- ���� ���̺� �߰��� ����(���̺� ���� �÷�ȭ)���� �ʴ´�.

--�� ���ν��� ���� �� ����
EXEC PRC_SUNGJUK_INSERT(1, '�ּ���', 90, 80, 70);
--==>>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

--�� ���ν��� ���� �� ����
EXEC PRC_SUNGJUK_INSERT(2, '������', 87, 97, 67);
--==>>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

--�� ���ν��� ȣ�� ���� ���̺� ��ȸ
SELECT *
FROM TBL_SUNGJUK;
/*
1	�ּ���	90	80	70	240	80	B
2	������	50	50	50	150	50	F
*/

--�� ���ν��� ���� �� ����
EXEC PRC_SUNGJUK_UPDATE(2, 50, 50, 50);
--==>> PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

--�� ���ν��� ȣ��(����) ���� ���̺� ��ȸ
SELECT *
FROM TBL_SUNGJUK;


--�� ���ν��� ���� �� ����(�߸��� �н�����)
EXEC PRC_STUDENTS_UPDATE('happy','java006','010-9999-9999','������ Ⱦ��');
--==>>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.

--�� ���ν��� ȣ�� �� ���̺� ��ȸ
SELECT *
FROM TBL_STUDENTS;
/*
happy	�̽ÿ�	010-1111-1111	���ֵ� ��������
rainbow	������	010-2222-2222	���� ������
*/

--�� ���ν��� ���� �� ����(�ùٸ� �н�����)
EXEC PRC_STUDENTS_UPDATE('happy','java006$','010-9999-9999','������ Ⱦ��');
--==>>PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
--�� ���ν��� ȣ�� �� ���̺� ��ȸ
SELECT *
FROM TBL_STUDENTS;
/*
happy	�̽ÿ�	010-9999-9999	������ Ⱦ��
rainbow	������	010-2222-2222	���� ������
*/
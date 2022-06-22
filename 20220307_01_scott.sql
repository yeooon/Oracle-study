SELECT USER
FROM DUAL;
--==>>SCOTT

--���� UPDATE ����--

--1. ���̺��� ���� �����͸� ����(����)�ϴ� ����

--2. ���� �� ����
-- UPDATE ���̺��
-- SET �÷��� = ������ ��[, �÷��� = �����Ұ�, ...]
--[WHERE ������]

SELECT *
FROM TBL_SAWON;

--�� TBL_SAWON ���̺��� �����ȣ 1004�� �����
-- �ֹι�ȣ�� ��9609172234567���� �����Ѵ�

UPDATE TBL_SAWON
SET JUBUN = '9609172234567'
WHERE SANO = 1004;

SELECT *
FROM TBL_SAWON;
--==>> 1004	�̿���	9609172234567	2007-10-10	4000

-- ���� �� COMMIT �Ǵ� ROLLBACK�� �ݵ�� ���������� ����
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�μ�Ʈ ����Ʈ ������Ʈ ���� �����ϰ� �ݵ�� Ŀ��.

--�� TBL_SAWON ���̺��� 1005�� ����� �Ի��ϰ� �޿���
-- ���� 2020-04-01, 1200 ���� �����Ѵ�.

UPDATE TBL_SAWON
SET HIREDATE = TO_DATE('2020-04-01'), SAL = 1200 
WHERE SANO = 1005;
--==>>1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

DESC TBL_SAWON;

COMMIT;


--��TBL_INSA ���̺� ����(�����͸�...)
CREATE TABLE TBL_INSABACKUP
AS
SELECT *
FROM TBL_INSA;
--==>> Table TBL_INSABACKUP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_INSABACKUP
ORDER BY 4;
/*
���� ����...
*/

--�� TBL_INSABACKUP ���̺���
-- ������ ����� ���常 ���� 10% �λ���Ѷ�

UPDATE TBL_INSABACKUP
SET SUDANG = (SUDANG + (SUDANG*0.1))
WHERE JIKWI IN ('����','����');
--==>>15�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

COMMIT;
--==>>Ŀ�� �Ϸ�.

--�� TBL_INSABACKUP ���̺���
-- ��ȭ��ȣ�� 016,017,018,019�� ���۵Ǵ� ��ȭ��ȣ�� ���
-- �̸� ��� 010���� �����ϴ� �������� �����Ѵ�.
UPDATE TBL_INSABACKUP
SET TEL = '010' || SUBSTR(TEL,4)
WHERE SUBSTR(TEL,1,3) IN ('016','017','018','019');
--==>>24�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT TEL, '010'||SUBSTR(TEL,4)
FROM TBL_INSABACKUP
WHERE SUBSTR(TEL,1,3) IN ('016','017','018','019');

DESC TBL_INSABACKUP;

COMMIT;
--==>>Ŀ�� �Ϸ�.

SELECT *
FROM VIEW_SAWON;
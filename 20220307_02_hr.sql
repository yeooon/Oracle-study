SELECT USER
FROM DUAL;


--�� EMPLOYEES ���̺��� ������ SALARY�� 10% �λ��Ѵ�.
-- ��, �μ����� 'IT'�� �����鸸 �����Ѵ�.
-- ����, ���濡 ���� ��� Ȯ�� �� ROLLBACK �����Ѵ�.

SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';

SELECT SALARY, (SALARY*1.1)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');

UPDATE EMPLOYEES
SET SALARY = SALARY*1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');

ROLLBACK;

DESC EMPLOYEES;

--�� EMPLOYEES ���̺��� JOB_TITLE�� SALE MANAGER �� ������� 
-- SALARY�� �ش� ����(����)�� �ְ�޿�(MAX_SALARY)�� �����Ѵ�.
-- ��, �Ի����� 2006�� ����(�ش� �⵵ ����)�Ի��ڿ� ���� ������ �� �ֵ��� �Ѵ�.
-- ����, ���濡 ���� ��� Ȯ�� �� ROLLBACK �����Ѵ�.

SELECT *
FROM EMPLOYEES;

-- 1��°
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';

SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';

UPDATE EMPLOYEES
SET SALARY = ('Sales Manager'�� MAX_SALARY)
WHERE JOB_TITLE = 'Sales Manager'
  AND 2006�� ����

UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
              FROM JOBS
              WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager') AND EXTRACT(YEAR FROM HIRE_DATE)<2006;
                
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager') AND EXTRACT(YEAR FROM HIRE_DATE)<2006;
                
                SELECT *
                FROM EMPLOYEES;
                
                ROLLBACK;
                
--�� EMPLOYEES ���̺��� SALARY��
-- �� �μ��� �̸����� �ٸ� �λ���� �����Ͽ� ������ �� �ֵ��� �Ѵ�.
-- Finance 10%�λ�
-- executive 15%�λ�
-- accounting 20% �λ�
-- ����, ���濡 ���� ��� Ȯ�� �� ROLLBACK �����Ѵ�.
DESC EMPLOYEES;

SELECT SALARY * 1.1"Finance"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Finance');

SELECT SALARY * 1.5"Executive"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Executive');                  

SELECT SALARY * 1.5"Accounting"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'Accounting');  
                        

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID
             WHEN (SELECT DEPARTMENT_ID
                   FROM DEPARTMENTS
                   WHERE DEPARTMENT_NAME = 'Finance')
             THEN SALARY * 1.1
             WHEN (SELECT DEPARTMENT_ID
                   FROM DEPARTMENTS
                   WHERE DEPARTMENT_NAME = 'Executive')
             THEN SALARY * 1.15
             WHEN (SELECT DEPARTMENT_ID
                   FROM DEPARTMENTS
                   WHERE DEPARTMENT_NAME = 'Accounting')
             THEN SALARY * 1.2
             ELSE SALARY
             END;
             
     
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Finance')
                                THEN SALARY * 1.1
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Executive')
                                THEN SALARY * 1.15
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Accounting')
                                THEN SALARY * 1.2
                                ELSE SALARY
                                END      
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID             
                       FROM DEPARTMENTS             
                       WHERE DEPARTMENT_NAME IN ('Finance','Executive','Accounting'));

-- �����Ͱ� �� ���϶��� =, �Ѱ��� �ƴ� ���� IN                       

ROLLBACK;
     
SELECT *
FROM EMPLOYEES;

--------------------------------------------------------------------------------

--���� DELETE ����--

--1. ���̺��� ������ ��(���ڵ�)�� �����ϴµ� ����ϴ� ����

--2. ���� �� ����
-- DELETE [FROM] ���̺��
-- [WHERE ������];

-- ���̺� ����(������ ����)
CREATE TABLE TBL_EMPLOYEES
AS
SELECT *
FROM EMPLOYEES;
--==>>Table TBL_EMPLOYEES��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMPLOYEES
WHERE EMPLOYEE_ID = 198;

-- ��

DELETE
FROM TBL_EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

ROLLBACK;
--==>>�ѹ� �Ϸ�.

--�� EMPLOYEES ���̺��� �������� �����͸� �����Ѵ�.
-- ��, �μ����� 'IT'�� ���� �����Ѵ�.

-- �� �����δ� EMPLOYEES ���̺��� �����Ͱ�(�����ϰ��� �ϴ� ��� ������)
-- �ٸ� ���ڵ忡 ���� �������ϰ� �ִ� ���
-- �������� ���� �� �ִٴ� ����� �����ؾ� �ϸ�...
-- �׿� ���� ������ �˾ƾ� �Ѵ�.

DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');
--==>> (ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found)


--------------------------------------------------------------------------------


--���� ��(VIEW) ����--

--1. ��(VIEW)�� �̹� Ư���� �����ͺ��̽� ���� �����ϴ�
-- �ϳ� �̻��� ���̺��� ����ڰ� ��� ���ϴ� �����͵鸸��
-- ��Ȯ�ϰ� ���ϰ� �������� ���Ͽ� ������ ���ϴ� �÷��鸸�� ��Ƽ�
-- �������� ������ ���̺�� ���Ǽ� �� ���ȿ� ������ �ִ�.

-- ������ ���̺��̶�... �䰡 ������ �����ϴ� ���̺�(��ü)�� �ƴ϶�
-- �ϳ� �̻��� ���̺��� �Ļ��� �� �ٸ� ������ �� �� �ִ� ����̸�
-- �� ������ �����س��� SQL �����̶�� �� �� �ִ�.

--2. ���� �� ����
--CREATE [OR REPLACE] VIEW ���̸�
--[(ALIAS[, ALIAS, ...])]
--AS
--��������(SUBQUERY)
--[WITH CHECK OPTION]
--[WITH READ ONLY]

--�� ��(VIEW) ����
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID
AND L.COUNTRY_ID = C.COUNTRY_ID
AND C.REGION_ID = R.REGION_ID;

--�ۺ� ��ȸ
SELECT *
FROM VIEW_EMPLOYEES;

--�ۺ��� ���� ��ȸ
DESC VIEW_EMPLOYEES;
--==>>
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY            NOT NULL VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25)
*/

--�� ��(VIEW) �ҽ� Ȯ��
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE VIEW_NAME = 'VIEW_EMPLOYEES';
--==>>
/*
VIEW_EMPLOYEES	"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
AND D.LOCATION_ID = L.LOCATION_ID
AND L.COUNTRY_ID = C.COUNTRY_ID
AND C.REGION_ID = R.REGION_ID"
*/
SELECT USER
FROM DUAL;
--==>HR


--�� �� �� �̻��� ���̺��� ����(JOIN)
-- ���� 1.(SQL 1992 CODE)
SELECT ���̺��1.�÷���, ���̺��2.�÷���, ���̺��3.�÷���
FROM ���̺��1, ���̺��2, ���̺��3
WHERE ���̺��1.�÷��� = ���̺��2.�÷���1
  AND ���̺��2.�÷���2 = ���̺��3.�÷�2;


-- ���� 2.(SQL 1999 CODE)
SELECT ���̺��1.�÷���, ���̺��2.�÷���, ���̺��3.�÷���
FROM ���̺��1 JOIN ���̺��2
                ON ���̺��1.�÷���1 = ���̺��2.�÷���1
                JOIN ���̺��3
                ON ���̺��2.�÷���2 = ���̺��3.�÷���2;
        
-- �� HR ���� ������ ���̺� �Ǵ� �� ��� ��ȸ
SELECT *
FROM TAB;
--==>>
/*
COUNTRIES	        TABLE	
DEPARTMENTS	        TABLE	
EMPLOYEES	        TABLE	
EMP_DETAILS_VIEW	VIEW	
JOBS	            TABLE	
JOB_HISTORY	        TABLE	
LOCATIONS	        TABLE	
REGIONS	            TABLE	
*/

--�� HR.JOBS, HR.EMPLOYEES, HR.DEPARTMENT ���̺��� ������� �������� �����͸�
-- FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME �׸����� ��ȸ�Ѵ�.

SELECT *
FROM JOBS; -- JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;  --DEPARTMENTS_ID, DEPARTMENTS_NAME, MANAGER_ID, LOCATION_ID

SELECT ���̺��1.�÷���, ���̺��2.�÷���, ���̺��3.�÷���
FROM ���̺��1, ���̺��2, ���̺��3
WHERE ���̺��1.�÷��� = ���̺��2.�÷���1
  AND ���̺��2.�÷���2 = ���̺��3.�÷�2;
  
  -- ������(ex 107)���� ���ΰ�(ex106)�� ������ OUTER JOIN?(������ �����Ͱ� �ִ��� Ȯ���ؾ��Ѵ�)

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM  JOBS J, EMPLOYEES E, DEPARTMENTS D
WHERE J.JOB_ID = E.JOB_ID
  AND E.MANAGER_ID = D.MANAGER_ID; -- �� MANAGER_ID �̰͸� �Ǵ� ����?
  
--�� EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES, REGIONS ���̺��� ������� 
-- �������� �����͸� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
-- FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME

SELECT COUNT(*)
FROM LOCATIONS;

SELECT *
FROM EMPLOYEES; -- 107 �θ� ���̺� 

SELECT *
FROM JOBS; --19 

SELECT *
FROM DEPARTMENTS;  --27

SELECT *
FROM LOCATIONS;  -- 23

SELECT *
FROM COUNTRIES; -- 25

SELECT *
FROM REGIONS; -- 4


-- ���� 2.(SQL 1999 CODE)
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E LEFT JOIN JOBS J
ON E.JOB_ID = J.JOB_ID 
LEFT JOIN DEPARTMENTS D
     ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
LEFT JOIN LOCATIONS L
     ON D.LOCATION_ID = L.LOCATION_ID
LEFT JOIN COUNTRIES C
     ON L.COUNTRY_ID = C.COUNTRY_ID
LEFT JOIN REGIONS R
     ON C.REGION_ID = R.REGION_ID;

-- OUTER JOIN / LEFT JOIN = (+)�� ������ (������ �����ͱ��� ����)
-- INNER JOIN / RIGHT JOIN = (+)�� ���� (�����ո�)

-- ���� 1.(SQL 1992 CODE)
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.JOB_ID = J.JOB_ID(+)
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);

 
        
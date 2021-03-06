SELECT USER
FROM DUAL;
--==>HR


--○ 세 개 이상의 테이블을 조인(JOIN)
-- 형식 1.(SQL 1992 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼2;


-- 형식 2.(SQL 1999 CODE)
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1 JOIN 테이블명2
                ON 테이블명1.컬럼명1 = 테이블명2.컬럼명1
                JOIN 테이블명3
                ON 테이블명2.컬럼명2 = 테이블명3.컬럼명2;
        
-- ○ HR 계정 소유의 테이블 또는 뷰 목록 조회
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

--○ HR.JOBS, HR.EMPLOYEES, HR.DEPARTMENT 테이블을 대상으로 직원들의 데이터를
-- FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME 항목으로 조회한다.

SELECT *
FROM JOBS; -- JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;  --DEPARTMENTS_ID, DEPARTMENTS_NAME, MANAGER_ID, LOCATION_ID

SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명 = 테이블명2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼2;
  
  -- 원본값(ex 107)보다 조인값(ex106)이 작으면 OUTER JOIN?(누락된 데이터가 있는지 확인해야한다)

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM  JOBS J, EMPLOYEES E, DEPARTMENTS D
WHERE J.JOB_ID = E.JOB_ID
  AND E.MANAGER_ID = D.MANAGER_ID; -- 왜 MANAGER_ID 이것만 되는 거지?
  
--○ EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES, REGIONS 테이블을 대상으로 
-- 직원들의 데이터를 다음과 같이 조회할 수 있도록 쿼리문을 구성한다.
-- FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME

SELECT COUNT(*)
FROM LOCATIONS;

SELECT *
FROM EMPLOYEES; -- 107 부모 테이블 

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


-- 형식 2.(SQL 1999 CODE)
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

-- OUTER JOIN / LEFT JOIN = (+)가 오른쪽 (누락된 데이터까지 포함)
-- INNER JOIN / RIGHT JOIN = (+)가 왼쪽 (교집합만)

-- 형식 1.(SQL 1992 CODE)
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.JOB_ID = J.JOB_ID(+)
  AND E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);

 
        
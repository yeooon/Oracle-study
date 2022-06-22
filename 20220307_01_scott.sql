SELECT USER
FROM DUAL;
--==>>SCOTT

--■■■ UPDATE ■■■--

--1. 테이블에서 기존 데이터를 수정(변경)하는 구문

--2. 형식 및 구조
-- UPDATE 테이블명
-- SET 컬럼명 = 변경할 값[, 컬럼명 = 변경할값, ...]
--[WHERE 조건절]

SELECT *
FROM TBL_SAWON;

--○ TBL_SAWON 테이블에서 사원번호 1004번 사원의
-- 주민번호를 『9609172234567』로 수정한다

UPDATE TBL_SAWON
SET JUBUN = '9609172234567'
WHERE SANO = 1004;

SELECT *
FROM TBL_SAWON;
--==>> 1004	이연주	9609172234567	2007-10-10	4000

-- 실행 후 COMMIT 또는 ROLLBACK을 반드시 선택적으로 실행
COMMIT;
--==>> 커밋 완료.

--인서트 딜리트 업데이트 등을 실행하고 반드시 커밋.

--○ TBL_SAWON 테이블에서 1005번 사원의 입사일과 급여를
-- 각각 2020-04-01, 1200 으로 변경한다.

UPDATE TBL_SAWON
SET HIREDATE = TO_DATE('2020-04-01'), SAL = 1200 
WHERE SANO = 1005;
--==>>1 행 이(가) 업데이트되었습니다.

DESC TBL_SAWON;

COMMIT;


--○TBL_INSA 테이블 복사(데이터만...)
CREATE TABLE TBL_INSABACKUP
AS
SELECT *
FROM TBL_INSA;
--==>> Table TBL_INSABACKUP이(가) 생성되었습니다.

SELECT *
FROM TBL_INSABACKUP
ORDER BY 4;
/*
양이 많다...
*/

--○ TBL_INSABACKUP 테이블에서
-- 직위가 과장과 부장만 수당 10% 인상시켜라

UPDATE TBL_INSABACKUP
SET SUDANG = (SUDANG + (SUDANG*0.1))
WHERE JIKWI IN ('과장','부장');
--==>>15개 행 이(가) 업데이트되었습니다.

COMMIT;
--==>>커밋 완료.

--○ TBL_INSABACKUP 테이블에서
-- 전화번호가 016,017,018,019로 시작되는 전화번호인 경우
-- 이를 모두 010으로 변경하는 쿼리문을 구성한다.
UPDATE TBL_INSABACKUP
SET TEL = '010' || SUBSTR(TEL,4)
WHERE SUBSTR(TEL,1,3) IN ('016','017','018','019');
--==>>24개 행 이(가) 업데이트되었습니다.

SELECT TEL, '010'||SUBSTR(TEL,4)
FROM TBL_INSABACKUP
WHERE SUBSTR(TEL,1,3) IN ('016','017','018','019');

DESC TBL_INSABACKUP;

COMMIT;
--==>>커밋 완료.

SELECT *
FROM VIEW_SAWON;
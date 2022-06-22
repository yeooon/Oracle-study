SELECT USER
FROM DUAL;
--==>>SCOTT

--○ EMP 테이블에서 부서번호가 20번과 30번 직원들의 데이터들 중
-- 사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.
-- 단, 별칭(ALIAS)을 사용한다
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO = 20 || DEPTNO = 30;
--    -----------    -----------
--==>> 에러발생
--(ORA-00933: SQL command not properly ended)

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO = 20 or DEPTNO = 30;
--    -----------    -----------
-- WHERE DEPTNO = 20 또는 DEPTNO = 30;

--※ 위의 구문은 IN 연산자를 활용하여
-- 다음과 같이 처리할 수 있으며
-- 위 구문의 처리 결과와 같은 결과를 반환한다.

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO IN(20, 30);
--==>>
/*
7369	SMITH	CLERK	800	20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER	2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	2850	30
7788	SCOTT	ANALYST	3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	1100	20
7900	JAMES	CLERK	950	30
*/

-- ○ EMP 테이블에서 직종이 CLERK 인 사원들의 데이터를 모두 조회한다

SELECT *
FROM EMP
WHERE JOB = "CLERK";
--==>> ORA-00904: "CLERK": invalid identifier

SELECT *
FROM EMP
WHERE JOB = 'CLERK';

SELECT *
FROM EMP
WHERE JOB IN('CLERK');
/*
7369	SMITH	CLERK	7902	1980-12-17	800		20
7876	ADAMS	CLERK	7788	1987-07-13	1100		20
7900	JAMES	CLERK	7698	1981-12-03	950		30
7934	MILLER	CLERK	7782	1982-01-23	1300		10
*/

select *
from emp
where job = 'clerk';
--==>> 조회 값 없음

※ 오라클에서... 입력된 데이터인 값 만큼은...
-- 반.드.시. 대소문자 구분을 한다.

--○ EMP 테이블에서 직종이 CLERK 인 사원들 중
-- 20번 부서에 근무하는 사원들의
-- 사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.

SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
FROM EMP 테이블
WHERE 직종이 CLERK  부서번호 20번;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE JOB IN('CLERK') AND DEPTNO IN(20);

/*
7369	SMITH	CLERK	800	    20
7876	ADAMS	CLERK	1100	20
*/


--○ EMP 테이블의 구조와 데이터를 확인하여
-- 이와 똑같은 데이터가 들어있는 테이블의 구조를 생성한다.

DESCRIBE EMP;
DESC EMP;
--==>>
/*
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
*/

/*
CREATE TABLE TBL_EMP
( EMPNO     NUMBER(4)
, ENAME     VARCHAR2(10)
, JOB       VARCHAR2(9)
, MGR       NUMBER(4)
, HIREDATE  DATE
, SAL       NUMBER(7,2)
, COMM      NUMBER(7,2)
, DEPTNO    NUMBER(2)
);

SELECT *
FROM EMP;

INSERT INTO --- * 14
*/
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>>Table TBL_EMP이(가) 생성되었습니다.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;


--○ 테이블 복사(DEPT → TBL_DEPT)
CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT이(가) 생성되었습니다.


--○ 복사한 테이블 확인
SELECT *
FROM TBL_DEPT;

DESC TBL_DEPT;


--○ 테이블의 커멘트 정보 확인
SELECT *
FROM USER_TAB_COMMENTS;
/*
DEPT	        TABLE	
EMP	            TABLE	
BONUS	        TABLE	
SALGRADE	    TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EMP	        TABLE	
TBL_DEPT	    TABLE	
*/

--○ 테이블 레벨의 커멘트 정보 입력
COMMENT ON TABLE TBL_EMP IS '사원 정보';
--==>>Comment이(가) 생성되었습니다.

--○ 커멘트 정보 입력 후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT	    TABLE	
TBL_EMP	        TABLE	  사원 정보
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	TABLE	
DEPT	        TABLE	
*/

--○ TBL_DEPT 테이블을 대상으로 테이블 레벨의 커멘트 데이터 입력
-- → 부서 정보
COMMENT ON TABLE TBL_DEPT IS '부서정보';
--==>>Comment이(가) 생성되었습니다.

--○ 커멘트 데이터 입력 후 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_DEPT	    TABLE	  부서정보
TBL_EMP	        TABLE	  사원 정보
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	TABLE	
DEPT	        TABLE	
*/

--○ 컬럼 레벨의 커메트 데이터 확인
SELECT *
FROM USER_COL_COMMENTS;
--==>>
/*
TBL_EXAMPLE2	NO	
DEPT	DNAME	
TBL_EMP	HIREDATE	
BONUS	SAL	
BONUS	COMM	
SALGRADE	LOSAL	
TBL_EMP	ENAME	
EMP	EMPNO	
BONUS	ENAME	
TBL_EXAMPLE2	NAME	
EMP	ENAME	
TBL_EMP	COMM	
EMP	SAL	
TBL_EMP	EMPNO	
EMP	DEPTNO	
TBL_EMP	DEPTNO	
TBL_EMP	JOB	
BONUS	JOB	
TBL_DEPT	LOC	
SALGRADE	GRADE	
TBL_EXAMPLE1	ADDR	
TBL_EXAMPLE2	ADDR	
TBL_DEPT	DEPTNO	
DEPT	LOC	
TBL_EMP	MGR	
DEPT	DEPTNO	
EMP	HIREDATE	
TBL_EMP	SAL	
EMP	JOB	
TBL_EXAMPLE1	NAME	
SALGRADE	HISAL	
EMP	COMM	
TBL_DEPT	DNAME	
TBL_EXAMPLE1	NO	
*/

--컬럼 레벨의 커멘트 데이터 확인(TBL_DEPT 테이블 소속의 컬럼들만 확인)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT'; -- 조건 추가
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/

--○ 테이블에 소속된(푸함된) 컬럼에 대한 커멘트 데이터 설정
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '부서 번호';
--==>>Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_DEPT.DNAME IS '부서명';
--==>>Comment이(가) 생성되었습니다.

COMMENT ON COLUMN TBL_DEPT.LOC IS '부서명';
--==>>Comment이(가) 생성되었습니다.

--○ 커멘트 데이터가 입력된 테이블의 컬럼 레벨 커멘트 데이터 확인
-- (TBL_DEPT 테이블 소속의 컬럼들만 조회)
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_DEPT';
/*
TBL_DEPT	DEPTNO	부서 번호
TBL_DEPT	DNAME	부서명
TBL_DEPT	LOC	    부서명
*/

--○ TBL_EMP 테이블을 대상으로
-- 테이블에 소속된(포함된) 컬럼에 대한 커멘트 데이터 설정
DESC TBL_EMP;

COMMENT ON COLUMN TBL_EMP.EMPNO IS '사원 번호';
COMMENT ON COLUMN TBL_EMP.ENAME IS '사원 이름';
COMMENT ON COLUMN TBL_EMP.JOB IS '직업';
COMMENT ON COLUMN TBL_EMP.MGR IS '관리자 사원번호';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '날짜';
COMMENT ON COLUMN TBL_EMP.SAL IS '월급';
COMMENT ON COLUMN TBL_EMP.COMM IS '코멘트';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '부서 번호';

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME='TBL_EMP';
/*
TBL_EMP	EMPNO	    사원 번호
TBL_EMP	ENAME	    사원 이름
TBL_EMP	JOB	        직업
TBL_EMP	MGR	        관리자 사원번호
TBL_EMP	HIREDATE	날짜
TBL_EMP	SAL	        월급
TBL_EMP	COMM	    코멘트
TBL_EMP	DEPTNO	    부서 번호
*/


--■■■ 컬럼 구조의 추가 및 제거 ■■■--

SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	7902	1980-12-17	800		20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	30
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7839	KING	PRESIDENT		1981-11-17	5000		10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30
7876	ADAMS	CLERK	7788	1987-07-13	1100		20
7900	JAMES	CLERK	7698	1981-12-03	950		30
7902	FORD	ANALYST	7566	1981-12-03	3000		20
7934	MILLER	CLERK	7782	1982-01-23	1300		10
*/

--○ TBL_EMP 테이블에 주민등록번호 데이터를 담을 수 있는 컬럼 추가
-- → SSN 문자열 CHAR(13)
ALTER TABLE TBL_EMP     -- 구조적 변경
ADD SSN CHAR(13);
--==>> Table TBL_EMP이(가) 변경되었습니다.

SELECT 01012341234
FROM DUAL;
--==>> 1012341234

SELECT '01012341234'
FROM DUAL;
--==>> 01012341234

--○ 확인
SELECT *
FROM TBL_EMP;

SELECT EMPNO, SSN
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(주민등록번호) 컬럼이 정상적으로 포함(추가)된 사항을 확인
-- ※ 테이블 내에서 컬럼의 순서는 구조적으로 의미 없음.

--○ TBL_EMP 테이블에 추가한 SSN(주민등록번호) 컬럼 구조적으로 제거
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP이(가) 변경되었습니다.

SELECT *
FROM TBL_EMP;

DESC TBL_EMP;

--> SSN(주민등록번호) 컬럼이 정상적으로 삭제되었음을 확인.

DELETE TBL_EMP;
--==>> 14개 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
--> 에러 발생 안함
-- 데이터 없음.
-- 테이블의 구조(뼈대, 틀)는 그대로 남아있는 상태에서
-- 데이터만 모두 소실(삭제)된 상황임을 확인.

DESC TBL_EMP;

DROP TABLE TBL_EMP;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
--==>> 에러 발생
--(ORA-00942: table or view does not exist)

DESC TBL_EMP;
--==>> 에러발생
-- (ORA-04043: TBL_EMP 객체가 존재하지 않습니다.)

--○ 테이블 다시 복사(생성)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.


--○ NULL 의 처리

SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 2	12	8	20	5

SELECT NULL, NULL+2, 10-NULL, NULL*2, 2/NULL
FROM DUAL;
--==>>(NULL) (NULL) (NULL) (NULL) (NULL)

--※ 관찰의 결과
-- NULL 은 상태의 값을 의미하며, 논리적으로는 실제 존재하지 않는 값이기 때문에 
-- 이 NULL 이 연산에 포함될 경우...
-- 그 결과는 무조건 NULL 이다.

-- TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL 인 직원의
-- 사원명, 직종명, 급여, 커미션 항목을 조회한다.

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP;
WHERE 커미션이 NULL;

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM ='NULL';

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IN('NULL');

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM = (null);

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP;
WHERE COMM IS NULL;
-- 이건... 세미콜론이 두 개라... ㅎ

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NULL;
--==>> 
/*
SMITH	CLERK	    800	    NULL
JONES	MANAGER	    2975    NULL	
BLAKE	MANAGER	    2850    NULL	
CLARK	MANAGER	    2450    NULL	
SCOTT	ANALYST	    3000    NULL	
KING	PRESIDENT	5000    NULL	
ADAMS	CLERK	    1100    NULL	
JAMES	CLERK	    950	    NULL
FORD	ANALYST	    3000    NULL	
MILLER	CLERK	    1300    NULL
*/

--※ NULL 은 실제 존재하는 값이 아니기 때문에
-- 일반적인 연산자를 활용하여 비교할 수 없다.
-- NULL 을 대상으로 사용할 수 없는 연산자들...
-- >=, <=, =, >, <, !=, ^=, <>(같지 않다)

--○ TBL_EMP 테이블에서 20번 부서에 근부하지 않는 직원들의 
-- 사원명, 직종명, 부서번호 항목을 조회한다.

SELECT ENAME 사원명, JOB 직업명, DEPTNO 부서번호
FROM TBL_EMP
WHERE DEPTNO ^= 20;
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/

SELECT ENAME 사원명, JOB 직업명, DEPTNO 부서번호
FROM TBL_EMP
WHERE DEPTNO <> 20;
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER	30
CLARK	MANAGER	10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	30
MILLER	CLERK	10
*/

--○TBL_EMP 테이블에서 커미션이 NULL 이 아닌 직원들의
-- 사원명, 직종명, 급여, 커미션 항목을 조회한다.
-- WHERE COMM != NULL;
-- WHERE COMM ^= NULL;
-- WHERE COMM <> NULL;
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NOT NULL;

SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE NOT COMM IS NULL;
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

--○ TBL_EMP 테이블에서 모든 사원들의 
-- 사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
-- 단, 급여(SAL)는 매월 지급한다.
-- 또한, 수당(COMM)은 연 1회 지급하며(매년 지급), 연봉 내역에 포함된다.

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM"커미션"
       , SAL * 12 "연봉" 
FROM TBL_EMP;

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM"커미션"
        , SAL * 12 + NVL(COMM,0) "연봉" 
FROM TBL_EMP;

--○ NVL()
SELECT NULL "COL1", NVL(NULL, 10) "COL2", NVL(5, 10) "COL3"
FROM DUAL;
--==>> (null) 10 5
-- 첫 번째 파라미터 값이 NULL 이면, 두번째 파라미터 값을 반환한다.
-- 첫 번째 파라미터 값이 NULL 이 아니면, 그 값을 그대로 반환한다.

SELECT ENAME "사원명", COMM "수당"
FROM TBL_EMP;

SELECT ENAME "사원명", NVL(COMM, 0) "수당"
FROM TBL_EMP;


--○ NVL2()
--> 첫 번째 파라미터 값이 NULL 이 아닌 경우, 두 번째 파라미터 값을 반환하고
-- 첫 번째 파라미터 값이 NULL 인 경우,  세 번째 파라미터 값을 반환한다.

SELECT ENAME "사원명", NVL2(COMM, '청기올려','백기올려') "수당확인"
FROM TBL_EMP;
/*
SMITH	백기올려
ALLEN	청기올려
WARD	청기올려
JONES	백기올려
MARTIN	청기올려
BLAKE	백기올려
CLARK	백기올려
SCOTT	백기올려
KING	백기올려
TURNER	청기올려
ADAMS	백기올려
JAMES	백기올려
FORD	백기올려
MILLER	백기올려
*/

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
    , SAL * 12 + NVL2(COMM,COMM,0) "연봉" 
FROM TBL_EMP;

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
    , NVL2(COMM,SAL * 12 + COMM,SAL * 12) "연봉" 
FROM TBL_EMP;

--○ COLAESCE()
--> 매개변수 제한이 없는 형태로 인지하고 활용한다.
-- 맨 앞에 있는 매개변수부터 차례로 NULL 인지 아닌지 확인하여
-- NULL 이 아닐 경우 반환하고,
-- NULL 인 경우에는 그 다음 매개변수의 값을 반환한다.
-- NVL() 이나 NVL2() 와 비교하여
-- 모~~~~~~~~~~든 경우의 수를 고려할 수 있다는 특징을 갖는다.

SELECT NULL "COL1"
, COALESCE(NULL,NULL,NULL,30) "COL2"
, COALESCE(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100) "COL3"
, COALESCE(10,NULL,NULL,NULL,NULL,NULL) "COL4"
, COALESCE(NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,100) "COL5"
FROM DUAL;
--==>>(NULL) 30	100	10	50


--○ 실습을 위한 데이터 추가 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '호석이', 'SALESMAN', 7369, SYSDATE, 10);
--==>>1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8001, '문정이', 'SALESMAN', 7369, SYSDATE, 10, 10);
--==>>1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_EMP;

COMMIT;
--==>>커밋 완료.

--○ 데이터가 추가된 현재 상태의 TBL_EMP 테이블에서 모든 사원의
-- 사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
-- 연봉 산출 기준은 위와 같다.
SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션"
        , COALESCE(SAL * 12 + COMM,SAL*12,COMM,0) "연봉" 
FROM TBL_EMP;


--○ 컬럼과 컬럼의 연결(결합)
SELECT 1,2
FROM DUAL;
--==>1	2

SELECT 1+2
FROM DUAL;
--==>>3

SELECT '민지', '정용이'
FROM DUAL;
--==>> 민지	정용이

SELECT '민지'+'정용이'
FROM DUAL;
--==>> 에러 발생
-- (01722. 00000 -  "invalid number")

--『||』
SELECT '민지' || '정용이'
FROM DUAL;
--==>>민지정용이

SELECT ENAME || JOB
FROM TBL_EMP;
/*
SMITHCLERK
ALLENSALESMAN
WARDSALESMAN
JONESMANAGER
MARTINSALESMAN
BLAKEMANAGER
CLARKMANAGER
SCOTTANALYST
KINGPRESIDENT
TURNERSALESMAN
ADAMSCLERK
JAMESCLERK
FORDANALYST
MILLERCLERK
호석이SALESMAN
문정이SALESMAN
*/

SELECT '수정이는', SYSDATE, '에 연봉', 500, '억을 원한다.'
FROM DUAL;
--==>>수정이는	2022-02-18	에 연봉	    500	억을 원한다.
--    --------  ----------  ------      --- ------------
--    문자타입  날짜타입    문자타입    숫자타입 문자타입

SELECT '수정이는'|| SYSDATE || '에 연봉' || 500 || '억을 원한다.'
FROM DUAL;
--==>> 수정이는2022-02-18에 연봉500억을 원한다.

--※ 오라클에서는 문자 타입의 형태로 형 변환하는 별도의 과정 없이
-- || 만 삽입해주면 간단히 컬럼과 컬럼(서로 다른 종류의 데이터)을
-- 결합하는 것이 가능하다.
-- cf) MSSQL 에서는 모든 데이터를 문자열로 CONVERT 해야 한다.

SELECT *
FROM TBL_EMP;

--○ TBL_EMP 테이블의 데이터를 활용하여
-- 다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
-- 『SMITH의 현재 연봉은 9600인데 희망 연봉은 19200이다.
-- ALLEN의 현재 연봉은 19500인데 희망 연봉은 39000이다.
--                      :
-- 문정이의 현재 연봉은 10인데 희망 연봉은 20이다.』
-- 단, 레코드마다 위의 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다.

SELECT ENAME
||'의 현재 연봉은'
||COALESCE((SAL * 12 + COMM),(SAL*12),COMM,0)
||'인데 희망 연봉은'
||COALESCE((SAL * 12 * 2 + COMM),(SAL*12*2),(COMM*2),0)
||'이다'
FROM TBL_EMP;
/*
SMITH의 현재 연봉은9600인데 희망 연봉은19200이다
ALLEN의 현재 연봉은19500인데 희망 연봉은38700이다
WARD의 현재 연봉은15500인데 희망 연봉은30500이다
JONES의 현재 연봉은35700인데 희망 연봉은71400이다
MARTIN의 현재 연봉은16400인데 희망 연봉은31400이다
BLAKE의 현재 연봉은34200인데 희망 연봉은68400이다
CLARK의 현재 연봉은29400인데 희망 연봉은58800이다
SCOTT의 현재 연봉은36000인데 희망 연봉은72000이다
KING의 현재 연봉은60000인데 희망 연봉은120000이다
TURNER의 현재 연봉은18000인데 희망 연봉은36000이다
ADAMS의 현재 연봉은13200인데 희망 연봉은26400이다
JAMES의 현재 연봉은11400인데 희망 연봉은22800이다
FORD의 현재 연봉은36000인데 희망 연봉은72000이다
MILLER의 현재 연봉은15600인데 희망 연봉은31200이다
호석이의 현재 연봉은0인데 희망 연봉은0이다
문정이의 현재 연봉은10인데 희망 연봉은20이다
*/

SELECT *
FROM TBL_EMP;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE
FROM DUAL;
--==>> 2022-02-18 15:36:14

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE
FROM DUAL;
--==>> 2022-02-18

--○ TBL_EMP 테이블의 데이터를 활용하여
-- 다음과 같은 결과를 얻을 수 있도록 쿼리문을 구성한다.
-- 『SMITH's 입사일은 1980-12-17이다. 그리고 급여는 800이다.
-- ALLEN의 입사일은 1981-02-20이다. 그리고 급여는 1600이다.
--                      :
-- 문정's 입사일은 2022-02-18이다. 그리고 급여는 0이다.』
-- 단, 레코드마다 위의 내용이 한 컬럼에 모두 조회될 수 있도록 처리한다.

SELECT ENAME
||'''의 입사일은'
||HIREDATE
||'이다.'
||'그리고 급여는'
||NVL(SAL,0)||'이다.'
FROM TBL_EMP;

--※ 문자열을 나타내는 홑따옴표 사이에서(시작과 끝)
-- 홑따옴표 두 개가 홑따옴표 하나(어퍼스트로피)를 의미한다.
-- 홑따옴표 『'』하나는 문자열의 영역이 시작된다는 것을 나타내고
-- 이 문자열 영역 안에서 홑따옴표 『''』 두개는 어퍼스트로피를 나타내며
-- 다시 등장하는 홑따옴표 『'』하나가 
-- 문자열 영역의 종료를 의미하게 되는 것이다.

SELECT *
FROM TBL_EMP
WHERE JOB = 'SALESMAN';

SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';

--○ UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "COL1"
,UPPER('oRaCLe') "COL2"
,LOWER('oRaCLe') "COL3"
,INITCAP('oRaCLe') "COL4"
FROM DUAL;
--==>>oRaCLe ORACLE	oracle	Oracle
--> UPPER() 는 모두 대문자료 변환
-- LOWER() 는 모두 소문자로 변환
-- INITCAP() 은 첫 글자만 대문자로 하고 나머지는 모두 소문자로 변환하여 반환

--○ TBL_EMP 테이블을 대상으로 검색값이 'sALeSmAN'인 조건으로
-- 해당 직종 사원의 사원번호, 사원명, 직종명을 조회한다.
SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE JOB = UPPER('sALeSmAN'); 
--==>>
/*
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7654	MARTIN	SALESMAN
7844	TURNER	SALESMAN
8000	호석이	SALESMAN
8001	문정이	SALESMAN
*/

--○ 실습을 위한 추가 데이터 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO, COMM)
VALUES(8002, '태형이', 'salesman', 7369, SYSDATE, 20, 100);

SELECT *
FROM TBL_EMP;

COMMIT;
--==>> 커밋완료.

--○ TBL_EMP 테이블에서 직종이 영업사원(세일즈맨)인 사원들의
-- 사원번호, 사원명, 직종명을 조회한다.

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE UPPER(JOB) = UPPER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE LOWER(JOB) = LOWER('sALeSmAN');

SELECT EMPNO, ENAME, JOB
FROM TBL_EMP
WHERE INITCAP(JOB) = INITCAP('sALeSmAN');

--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 입사한 직원의 
-- 사원명, 직종명, 입사일 항목을 조회한다.

SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE = '1981-09-28';
--==>>MARTIN	SALESMAN	1981-09-28

DESC TBL_EMP;
--==>>
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         -- CHECK~!!
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
*/

--○ TO_DATE()
SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28','YYYY-MM-DD');
--==>>MARTIN	SALESMAN	1981-09-28


--○ TBL_EMP 테이블에서 입사일이 1981년 9월 29일 이후(해당일 포함)
-- 입사한 직원들의 사원명, 직종명, 입사일 항목을 조회한다.

SELECT ENAME, JOB, HIREDATE
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-29','YYYY-MM-DD');
--==>>
/*
SCOTT	ANALYST	    1987-07-13
KING	PRESIDENT	1981-11-17
ADAMS	CLERK	    1987-07-13
JAMES	CLERK	    1981-12-03
FORD	ANALYST	    1981-12-03
MILLER	CLERK	    1982-01-23
호석이	SALESMAN	2022-02-18
문정이	SALESMAN	2022-02-18
태형이	salesman	    2022-02-18
*/

--※ 오라클에서는 날짜 데이터에 대한 크기 비교가 가능하다.
-- 오라클에서는 날짜 데이터에 대한 크기 비교 시
-- 과거보다 미래를 더 큰 값으로 간주한다.

--○ TBL_EMP 테이블에서 입사일이 1981년 4월 2일 부터
-- 1981년 9월 28일 사이에 입사한 직원들의 
-- 사원명, 직종명, 입사일 항목을 조회한다.(해당일 포함)

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE 1981-04-02 <= 입사일 <= 1981-09-28;  --(x)

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02','YYYY-MM-DD')        -- 이후(이상) → 해당일 초과 cf)초과
  and HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');       -- 이전(이하) → 해당일 포함 cf)미만

/*
JONES	MANAGER	    1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--○ BETWEEN ⓐ AND ⓑ
SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02','YYYY-MM-DD') 
                   AND TO_DATE('1981-09-28','YYYY-MM-DD');
                   
                   
--○TBL_EMP 테이블에서 급여가 2450 에서 3000 사이의 직원들을 모두 조회한다.
SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2450 AND 3000;
--==>>
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		20
7698	BLAKE	MANAGER	7839	1981-05-01	2850		30
7782	CLARK	MANAGER	7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		20
7902	FORD	ANALYST	7566	1981-12-03	3000		20
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';    --사전식 배열
/*
7566	JONES	MANAGER	7839	1981-04-02	2975		        20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7782	CLARK	MANAGER	7839	1981-06-09	2450		        10
7839	KING	PRESIDENT		1981-11-17	5000		        10
7900	JAMES	CLERK	7698	1981-12-03	950		            30
7902	FORD	ANALYST	7566	1981-12-03	3000		        20
7934	MILLER	CLERK	7782	1982-01-23	1300		        10
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';
/*
JONES	MANAGER	7839	1981-04-02	2975		20
MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
CLARK	MANAGER	7839	1981-06-09	2450		10
SCOTT	ANALYST	7566	1987-07-13	3000		20
KING	PRESIDENT		1981-11-17	5000		10
TURNER	SALESMAN	7698	1981-09-08	1500	0	30
JAMES	CLERK	7698	1981-12-03	950		30
FORD	ANALYST	7566	1981-12-03	3000		20
MILLER	CLERK	7782	1982-01-23	1300		10
*/

-- ※ BETWEEN ⓐ AND ⓑ 는 날짜형, 숫자형, 문자형 데이터 모두에 적용된다.
-- 단, 문자형일 경우 아스키코드 순서를 따르기 때문에 (사전식 배열)
-- 대문자가 앞쪽에 위치하고 소문자가 뒤쪽에 위치한다.
-- 또한, BETWEEN ⓐ AND ⓑ 는 해당 구문이 수행되는 시점에서
-- 오라클 내부적으로는 부등호 연산자의 형태로 바뀌어 연산 처리된다.

SELECT ASCII ('A') "COL1", ASCII ('B') "COL2", ASCII ('a') "COL3", ASCII ('b') "COL4"  
FROM DUAL;
--==>> 65	66	97	98

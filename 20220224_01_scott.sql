SELECT USER
FROM DUAL;
--==>>SCOTT

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY 1;
/*
10	8750
20	10875
30	9400
*/

SELECT *
FROM EMP;

SELECT *
FROM TBL_EMP;

--○ 기존에 복사해둔 TBL_EMP 테이블 제거
DROP TABLE TBL_EMP;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

--○ 다시 EMP 테이블 복사하여 TBL_EMP 테이블 생성
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.

SELECT *
FROM TBL_EMP;

--○ 실습 데이터 추가 입력(TBL_EMP)
INSERT INTO TBL_EMP VALUES
(8001, '홍은혜', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);

INSERT INTO TBL_EMP VALUES
(8002, '김상기', 'CLERK', 7566, SYSDATE, 2000, 10, NULL);

INSERT INTO TBL_EMP VALUES
(8003, '이호석', 'SALESMAN', 7698, SYSDATE, 1700, NULL, NULL);

INSERT INTO TBL_EMP VALUES
(8004, '신시은', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);

INSERT INTO TBL_EMP VALUES
(8005, '김태형', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);

--○ 확인
SELECT *
FROM TBL_EMP;
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
8001	홍은혜	CLERK	7566	2022-02-24	1500	10	
8002	김상기	CLERK	7566	2022-02-24	2000	10	
8003	이호석	SALESMAN	7698	2022-02-24	1700		
8004	신시은	SALESMAN	7698	2022-02-24	2500		
8005	김태형	SALESMAN	7698	2022-02-24	1000		
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

SELECT DEPTNO, SAL, COMM
FROM TBL_EMP
ORDER BY COMM DESC;
/*
20	800	
	1700	
	1000	
10	1300	
20	2975	
30	2850	
10	2450	
20	3000	
10	5000	
	2500	
20	1100	
30	950	
20	3000	
30	1250	1400
30	1250	500
30	1600	300
	1500	10
	2000	10
30	1500	0
*/

--※ 오라클에서는 NULL을 가장 큰 값의 형태로 간주한다.
-- (ORACLE 9I 까지는 NULL 을 가장 작은 값의 형태로 간주했었다.)
-- MSSQL 은 NULL을 가장 작은 값의 형태로 간주한다.

--○ TBL_EMP 테이블을 대상으로 부서별 급여합 조회
-- 부서번호, 급여합 항목 조회

SELECT  DEPTNO"부서번호", SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>
/*
10	8750
20	10875
30	9400
	8700
*/

--○ ROLLUP 사용
SELECT  DEPTNO"부서번호", SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	8750
20	10875
30	9400
	8700    -- 부서번호를 갖지 못한 직원들의 급여합
	37725   -- 모든부서 직원들의 급여합
*/

SELECT  DEPTNO"부서번호", SUM(SAL)"급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	8750
20	10875
30	9400
	29025
*/

/*
--------    ------
부서번호    급여합
--------    ------
10	        8750
20	        10875
30	        9400
모든부서    	29025
*/

SELECT NVL(TO_CHAR(DEPTNO),'모든부서')"부서번호", SUM(SAL)"급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);

SELECT NVL2(DEPTNO,TO_CHAR(DEPTNO),'모든부서')"부서번호", SUM(SAL)"급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
/*
10	        8750
20	        10875
30	        9400
모든부서	    29025
*/

SELECT NVL(TO_CHAR(DEPTNO),'모든부서')"부서번호", SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

SELECT NVL2(DEPTNO,TO_CHAR(DEPTNO),'모든부서')"부서번호", SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	     8750
20	     10875
30	     9400
모든부서	 8700
모든부서	 37725
*/

SELECT GROUPING(DEPTNO) "GROUPING", DEPTNO "부서번호", SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);  -- 그룹핑은 1로 표기된다.
/*
GROUPING 부서번호 급여함
-------- -------- ------
0	        10	    8750
0	        20	    10875
0	        30	    9400
0		            8700    --인턴
1		            37725   --모든부서
*/

SELECT DEPTNO"부서번호", SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

--○ 위에서 조회한 해당 내용을
/*
10	        8750
20	        10875
30	        9400
인턴	    8700
모든부서    	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'인턴')
       ELSE '모든부서'
       END "부서번호"
       ,SUM(SAL)"급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
--==>>
/*
10	    8750
20	    10875
30	    9400
인턴	8700
모든부서	37725
*/

--○ TBL_SAWON 테이블을 대상으로
-- 다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
--------------------
성별 급여합
--------------------
남           XXXXX
여           XXXX
모든사원     XXXXX
*/
SELECT
CASE GROUPING(T.성별) WHEN 0 THEN T.성별
                       ELSE '모든사람'
                       END "성별"
                       ,SUM(T.급여)"급여합"
FROM
(
SELECT CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
            WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
            ELSE '모름'
            END"성별"  
            ,SAL"급여"
FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.성별);
/*
남자	23900
여자	32100
모든사람	56000
*/
SELECT *
FROM VIEW_SAWON;

--○ TBL_SAWON 테이블을 대상으로
-- 다음과 같이 조회될 수 있도록 연령대별 인우너수를 확인할 수 있는 
-- 쿼리문을 구성한다.
/*
---------------------------
연령대     인원수
---------------------------
10          X
20          X
40          X
50          X
전체인원    XX
---------------------------
*/
SELECT 
CASE GROUPING(A.연령대) WHEN 0 THEN TO_CHAR(A.연령대)
                       ELSE '전체인원'
                       END "연령대"
                       ,COUNT(A.연령대)"인원수"
FROM
(
SELECT CASE WHEN T.현재나이 < 20 THEN 10
            WHEN T.현재나이 < 30 THEN 20
            WHEN T.현재나이 < 50 THEN 40            
            WHEN T.현재나이 < 60 THEN 50             
            ELSE 0
            END "연령대"
    FROM
    (
        SELECT
        CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') 
             THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899)
             WHEN SUBSTR(JUBUN,7,1) IN ('3','4') 
             THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
             ELSE -1
             END "현재나이"
        FROM TBL_SAWON
    )T
)A
GROUP BY ROLLUP(A.연령대);
/*
10	        2
20	        12
40	        1
50	        3
전체인원    	18
*/


-- 방법 2. INLINE VIEW 를 한 번만

SELECT TRUNC(27,-1) "RESULT" --10의자리까지 절삭
FROM DUAL;

-- 연령대
SELECT CASE GROUPING(T.연령대) WHEN 0 THEN TO_CHAR(T.연령대)
ELSE '전체'
END "연령대"
, COUNT(*) "인원수"
FROM
(
SELECT TRUNC(CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2') 
     THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1899)
     WHEN SUBSTR(JUBUN,7,1) IN ('3','4') 
     THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2))+1999)
     ELSE -1
     END, -1)"연령대"
FROM TBL_SAWON
)T
GROUP BY ROLLUP(T.연령대);



SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY 1,2;
/*
10	CLERK	1300
10	MANAGER	2450
10	PRESIDENT	5000
20	ANALYST	6000
20	CLERK	1900
20	MANAGER	2975
30	CLERK	950
30	MANAGER	2850
30	SALESMAN	5600
*/

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1,2;
/*
10	CLERK	    1300    -- 10번부서 CLERK 직종의 급여합
10	MANAGER	    2450    -- 10번부서 MANAGER 직종의 급여합
10	PRESIDENT	5000    -- 10번부서 PRESIDENT 직종의 급여합
10		        8750    -- 10번부서 모든 직종의 급여합
20	ANALYST	    6000    -- 20번부서 ANALYST 직종의 급여합
20	CLERK	    1900    -- 20번부서 CLERK 직종의 급여합
20	MANAGER	    2975    -- 20번부서 MANAGER 직종의 급여합
20		        10875   -- 20번부서 모든 직종의 급여합
30	CLERK	    950     -- 30번부서 CLERK 직종의 급여합
30	MANAGER	    2850    -- 30번부서 MANAGER 직종의 급여합
30	SALESMAN	5600    -- 30번부서 SALESMANR 직종의 급여합
30		        9400    -- 30번부서 모든 직종의 급여합
                29025   -- 모든 직종의 급여합
*/

--○ CUBE() → ROLLUP() 보다 더 자세한 결과를 반환받는다.

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1,2;
/*
10	CLERK	    1300
10	MANAGER	    2450
10	PRESIDENT	5000
10		        8750
20	ANALYST	    6000
20	CLERK	    1900
20	MANAGER	    2975
20		        10875
30	CLERK	    950
30	MANAGER	    2850
30	SALESMAN	5600
30		        9400
	ANALYST	    6000    --모든 부서 ANALYST 직종의 급여합
	CLERK	    4150    --모든 부서 CLERK 직종의 급여합
	MANAGER	    8275    --모든 부서 MANAGER 직종의 급여합
	PRESIDENT	5000    --모든 부서 PRESIDENT 직종의 급여합
	SALESMAN	5600    --모든 부서 SALESMAN 직종의 급여합
                29025
*/

-- ※ROLLUP() 과 CUBE() 는
-- 그룹을 묶어주는 방식이 다르다. (차이)

-- ex.
-- ROLLUP(A, B, C)
-- →(A, B, C) /(B, C)/(A)/()

-- CUBE(A, B, C)
-- →(A, B, C) /(A, B)/(A, C)/(B, C)/(A)/(B)/(C)/()

--==>> 위에서 사용한 것(ROLLUP())은 묶음 방식이 다소 모자라고
-- 아래에서 사용한 것(CUBE())은 묶음 방식이 다소 지나치기 때문에
-- 다음과 같은 방식의 쿼리 형태를 더 많이 사용한다.
-- 다음 작성하는 쿼리는 조회하고자 하는 그룹만 『GROUPING SETS』를
-- 이용하여 묶어주는 방식이다.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'인턴')
            ELSE '전체부서'
       END "부서번호"
      ,CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '전체직종'
       END "직종"
      ,SUM(SAL) "급여함"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
--==>> 
/*
10	CLERK	        1300
10	MANAGER	        2450
10	PRESIDENT	    5000
10	전체직종	        8750
20	ANALYST	        6000
20	CLERK	        1900
20	MANAGER	        2975
20	전체직종	        10875
30	CLERK	        950
30	MANAGER	        2850
30	SALESMAN	    5600
30	전체직종	        9400
인턴	CLERK	    3500
인턴	SALESMAN	5200
인턴	전체직종    	8700
전체부서	전체직종	    37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'인턴')
            ELSE '전체부서'
       END "부서번호"
      ,CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '전체직종'
       END "직종"
      ,SUM(SAL) "급여함"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
--==>> 
/*
10	    CLERK	    1300
10	    MANAGER	    2450
10	    PRESIDENT	5000
10	    전체직종	    8750
20	    ANALYST	    6000
20	    CLERK	    1900
20	    MANAGER	    2975
20	    전체직종	    10875
30	    CLERK	    950
30	    MANAGER	    2850
30	    SALESMAN	5600
30	    전체직종	    9400
인턴	CLERK	    3500
인턴	SALESMAN	5200
인턴	전체직종	    8700
전체부서	ANALYST	    6000
전체부서	CLERK	    7650
전체부서	MANAGER	    8275
전체부서	PRESIDENT	5000
전체부서	SALESMAN	10800
전체부서	전체직종    	37725
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO),'인턴')
            ELSE '전체부서'
       END "부서번호"
      ,CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '전체직종'
       END "직종"
      ,SUM(SAL) "급여함"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB),(DEPTNO),())
ORDER BY 1, 2;
--==>> 
/*
10	CLERK	        1300
10	MANAGER	        2450
10	PRESIDENT	    5000
10	전체직종    	    8750
20	ANALYST	        6000
20	CLERK	        1900
20	MANAGER	        2975
20	전체직종	        10875
30	CLERK	        950
30	MANAGER	        2850
30	SALESMAN	    5600
30	전체직종	        9400
인턴	CLERK	    3500
인턴	SALESMAN	5200
인턴	전체직종	    8700
전체부서	전체직종	    37725
*/

SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;

--○ TBL_EMP 테이블을 대상으로 
-- 입사년도별 인원수와 총합을 조회한다.
SELECT CASE GROUPING(T.입사년도) 
       WHEN 0 
       THEN TO_CHAR(T.입사년도) 
       ELSE '총합' 
       END "입사년도"
      ,COUNT(T.입사년도)
FROM
(
        SELECT TO_NUMBER(SUBSTR(HIREDATE,1,4)) "입사년도" -- = TO_CHAR(HIREDATE, 'YYYY') "입사년도"
        FROM TBL_EMP
)T
GROUP BY ROLLUP(T.입사년도);


SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE));


SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY ROLLUP(TO_CHAR(HIREDATE, 'YYYY'));
--==>> 오류 발생
--(ORA-00979: not a GROUP BY expression)


SELECT TO_CHAR(HIREDATE, 'YYYY') "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY ROLLUP(EXTRACT(YEAR FROM HIREDATE));
--==>> 에러 발생
--(ORA-00979: not a GROUP BY expression)
-- GROUP BY와 SELECT 는 같은 형식을 사용해야 한다.

-- 1)
SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY'))
       WHEN 0 
       THEN EXTRACT(YEAR FROM HIREDATE) 
       ELSE '전체'
       END "입사년도"
       , COUNT(*)"인원수" 
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE));
--==>> 에러발생
--(ORA-00932: inconsistent datatypes: expected NUMBER got CHAR)


-- 2) 정상작동(문자타입)
SELECT CASE GROUPING(TO_CHAR(HIREDATE, 'YYYY'))
       WHEN 0 
       THEN TO_CHAR(HIREDATE, 'YYYY')
       ELSE '전체'
       END "입사년도"
       , COUNT(*)"인원수" 
FROM TBL_EMP
GROUP BY CUBE(TO_CHAR(HIREDATE, 'YYYY'))
ORDER BY 1;
/*
1980	1
1981	10
1982	1
1987	2
2022	5
전체	    19
*/


-- 3) 정상작동(숫자타입)
SELECT CASE GROUPING(EXTRACT(YEAR FROM HIREDATE))
       WHEN 0 
       THEN EXTRACT(YEAR FROM HIREDATE)
       ELSE -1
       END "입사년도"
       , COUNT(*)"인원수" 
FROM TBL_EMP
GROUP BY CUBE(EXTRACT(YEAR FROM HIREDATE));

/*
-1      19
1980	1
1981	10
1982	1
1987	2
2022	5
*/

--------------------------------------------------------------------------------

--■■■ HAVING ■■■--
--○ EMP 테이블에서 부서번호가 20, 30 인 부서를 대상으로
-- 부서의 총 급여가 10000 보다 적을 경우만 부서별 총 급여를 조회한다.

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30)
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30) 
      AND SUM(SAL) < 10000
GROUP BY DEPTNO;
--==>> 에러 발생
--(ORA-00934: group function is not allowed here)

SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20,30) 
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
--==>> 30	9400

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000
       AND DEPTNO IN (20,30);
--==>> 30	9400       

--------------------------------------------------------------------------------


--■■■ 중첩 그룹함수/ 분석함수 ■■■--
-- 그룹 함수는 2 LEVEL 까지 중첩해서 사용할 수 있다.
-- MSSQL 은 이마저도 불가능하다.

SELECT SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT MAX(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>10875

SELECT MIN(SUM(SAL))
FROM EMP
GROUP BY DEPTNO;
--==>> 8750

--○ RANK()
-- DENSE_RANK()
--> ORACLE 9I 부터 적용... MSSQL 2005부터 적용...

-- 하위 버전에서는 RANK() 나 DENSE_RANK() 를 사용할 수 없기 때문에
-- 예를 들어... 급여 순위를 구하고자 한다면
-- 해당 사원의 급여보다 더 큰 값이 몇 개인지 확인한 후
-- 확인한 값에 +1을 추가 연산해 주면...
-- 그 값이 곧 해당 사원의 급여 등수가 된다.


--○ SMITH의 급여 등수 확인
SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800; -- SMITH의 급여
--==>>14         -- SMITH의 급여 등수

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 800  -- SMITH의 급여
AND DEPTNO = 20; -- SMITH의 부서
--==>>14         -- SMITH의 급여 등수

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600; -- ALLEN의 급여
--==>>7           -- ALLEN의 급여 등수


--※ 서브 상관 쿼리(상관 서브 쿼리)
-- 메인 쿼리가 있는 테이블의 컬럼이
-- 서브 쿼리의 조건절(WHERE절, HAVING절)에 사용되는 경우
-- 우리는 이 쿼리문을 서브 상관 쿼리(상관 서브 쿼리)라고 부른다.

SELECT ENAME"사원명",SAL"급여", 1"급여등수"
FROM EMP;
--==>>
/*
SMITH	800	    1
ALLEN	1600	1
WARD	1250	1
JONES	2975	1
MARTIN	1250	1
BLAKE	2850	1
CLARK	2450	1
SCOTT	3000	1
KING	5000	1
TURNER	1500	1
ADAMS	1100	1
JAMES	950	    1
FORD	3000	1
MILLER	1300	1
*/

SELECT ENAME"사원명",SAL"급여"
    , (SELECT COUNT(*) + 1
       FROM EMP
       WHERE SAL > E.SAL)"급여등수"
FROM EMP E;
/*
SMITH	800	    14
ALLEN	1600	7
WARD	1250	10
JONES	2975	4
MARTIN	1250	10
BLAKE	2850	5
CLARK	2450	6
SCOTT	3000	2
KING	5000	1
TURNER	1500	8
ADAMS	1100	12
JAMES	950	    13
FORD	3000	2
MILLER	1300	9
*/


--○ EMP 테이블을 대상으로 
-- 사원명, 급여, 부서번호, 부서내 급여등수, 전체 급여등수 항목을 조회한다.
-- 단, RANK() 함수를 사용하지 않고 서브 상관쿼리를 활용할 수 있도록 한다.

SELECT ENAME"사원명", SAL"급여", DEPTNO"부서번호"
    ,(SELECT COUNT(*) + 1
    FROM EMP 
    WHERE SAL > E.SAL AND DEPTNO = E.DEPTNO)"부서내급여등수"
    ,(SELECT COUNT(*) + 1
    FROM EMP 
    WHERE SAL > E.SAL) "전체급여등수"
FROM EMP E
ORDER BY DEPTNO;
/*
CLARK	2450	10	2	6
KING	5000	10	1	1
MILLER	1300	10	3	9
JONES	2975	20	3	4
FORD	3000	20	1	2
ADAMS	1100	20	4	12
SMITH	800	    20	5	14
SCOTT	3000	20	1	2
WARD	1250	30	4	10
TURNER	1500	30	3	8
ALLEN	1600	30	2	7
JAMES	950	    30	6	13
BLAKE	2850	30	1	5
MARTIN	1250	30	4	10
*/

--○EMP 테이블을 대상으로 다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
-------------------------------------------------------------------------
-- 사원명 부서번호     입사일     급여      부서내입사별급여누적
-------------------------------------------------------------------------
--                              :
-- SMITH  20        1980-12-17    800                   800
-- JONES  20        1981-04-02   2975                  3775
-- FORD   20        1981-12-03   3000                  6775
--                              :
-------------------------------------------------------------------------

SELECT E.ENAME"사원명", E.DEPTNO"부서번호", E.HIREDATE"입사일", E.SAL"급여"
,(SELECT SUM(SAL) 
FROM EMP
WHERE HIREDATE <= E.HIREDATE AND DEPTNO = E.DEPTNO) "부서내입사별급여누적"
FROM EMP E
ORDER BY 2,3;

/*
CLARK	10	1981-06-09	2450	2450
KING	10	1981-11-17	5000	7450
MILLER	10	1982-01-23	1300	8750
SMITH	20	1980-12-17	800	    800
JONES	20	1981-04-02	2975	3775
FORD	20	1981-12-03	3000	6775
SCOTT	20	1987-07-13	3000	10875
ADAMS	20	1987-07-13	1100	10875
ALLEN	30	1981-02-20	1600	1600
WARD	30	1981-02-22	1250	2850
BLAKE	30	1981-05-01	2850	5700
TURNER	30	1981-09-08	1500	7200
MARTIN	30	1981-09-28	1250	8450
JAMES	30	1981-12-03	950	    9400
*/

--○ EMP 테이블을 대상으로
-- 입사한 사원의 수가 가장 많았을 때의
-- 입사년월과 인원수를 조회할 수 있도록 쿼리문을 구성한다.

SELECT HIREDATE
FROM EMP;

SELECT TO_CHAR(HIREDATE,'YYYY-MM-DD')"입사년월", COUNT(*)"인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM-DD');
/*
1981-05-01	1
1980-12-17	1
1982-01-23	1
1981-09-08	1
1981-02-20	1
1981-09-28	1
1981-06-09	1
1981-11-17	1
1981-02-22	1
1987-07-13	2
1981-04-02	1
1981-12-03	2
*/
-- 위의 결과를 참고해서 적음
SELECT TO_CHAR(HIREDATE,'YYYY-MM-DD')"입사년월", COUNT(*)"인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM-DD')
HAVING COUNT(*) = 2;

-- 입사한 사원의 수가 가장 많았을 때를 조회
SELECT MAX(COUNT(TO_CHAR(HIREDATE,'YYYY-MM-DD'))) "입사최대인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM-DD');

-- 섞음
SELECT TO_CHAR(HIREDATE,'YYYY-MM-DD')"입사년월", COUNT(*)"인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM-DD')
HAVING COUNT(*) = (SELECT MAX(COUNT(TO_CHAR(HIREDATE,'YYYY-MM-DD'))) "입사최대인원수"
                   FROM EMP
                   GROUP BY TO_CHAR(HIREDATE,'YYYY-MM-DD'));
/*
1987-07-13	2
1981-12-03	2
*/


SELECT TO_CHAR(HIREDATE,'YYYY-MM')"입사년월", COUNT(*)"인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) "입사최대인원수"
                   FROM EMP
                   GROUP BY TO_CHAR(HIREDATE,'YYYY-MM'));
/*
1981-12	2
1981-09	2
1981-02	2
1987-07	2
*/                   


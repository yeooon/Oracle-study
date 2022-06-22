SELECT USER
FROM DUAL;
--==>> SCOTT

--※ 20220310_01_scott(plsql).sql 파일에서
-- FN_PAY() 함수 생성 후 테스트
SELECT NUM, NAME, BASICPAY, SUDANG, FN_PAY(BASICPAY, SUDANG)"급여"
FROM TBL_INSA;
/*
1001	홍길동	2610000	200000	31520000
1002	이순신	1320000	200000	16040000
1003	이순애	2550000	160000	30760000
1004	김정훈	1954200	170000	23620400
1005	한석봉	1420000	160000	17200000
                    :
                    :                    
*/

--※ 20220310_01_scott(plsql).sql 파일에서
-- FN_WORKYEAR() 함수 생성 후 테스트
SELECT NAME, IBSADATE, FN_WORKYEAR(IBSADATE)"근무기간"
FROM TBL_INSA;
/*
홍길동	1998-10-11	23.4
이순신	2000-11-29	21.2
이순애	1999-02-25	23
김정훈	2000-10-01	21.4
한석봉	2004-08-13	17.5
*/

--------------------------------------------------------------------------------

--※ 프로시저 관련 실습을 위한 준비

-- 실습 테이블 생성
CREATE TABLE TBL_STUDENTS
(ID VARCHAR2(10)
,NAME VARCHAR2(40)
,TEL VARCHAR2(30)
,ADDR VARCHAR2(100)
,CONSTRAINT STUDENTS_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_STUDENTS이(가) 생성되었습니다.

-- 실습 테이블 생성
CREATE TABLE TBL_IDPW
(ID VARCHAR2(10)
,PW VARCHAR2(20)
,CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)
);
--==>>Table TBL_IDPW이(가) 생성되었습니다.


-- 두 테이블에 데이터 입력
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('happy','이시우','010-1111-1111','제주도 서귀포시');
INSERT INTO TBL_IDPW(ID, PW)
VALUES('happy','java006$');
--==>> 1 행 이(가) 삽입되었습니다. * 2

-- 확인
SELECT *
FROM TBL_STUDENTS;
--==>> happy	이시우	010-1111-1111	제주도 서귀포시

SELECT *
FROM TBL_IDPW;
--==>> happy	java006$

--커밋
COMMIT;
--==>> 커밋 완료.


-- 위의 업무를 수행하는 프로시저(INSERT 프로시저, 입력 프로시저)를 생성하게 되면
-- EXEC PRC_STUDENT_INSERT('happy','java006$','이시우','010-1111-1111','제주도 서귀포시');
-- 이와 같은 구문 한 줄로 양쪽 테이블 모두 제대로 데이터를 입력할 수 있다.

--※ 프로시저를 생성하는 구문은
-- 『20220310_01_scott(plsql).sql』 파일 참조~!!!


--○ 프로시저 생성 후 실행
EXEC PRC_STUDENT_INSERT('rainbow','java006$','김정용','010-2222-2222','서울 강남구');
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.
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
happy	이시우	010-1111-1111	제주도 서귀포시
rainbow	김정용	010-2222-2222	서울 강남구
*/

--○ 실습 테이블 생성(TBL_SUNGJUK)
CREATE TABLE TBL_SUNGJUK
(HAKBUN     NUMBER
,NAME       VARCHAR2(40)
,KOR        NUMBER(3)
,ENG        NUMBER(3)
,MAT        NUMBER(3)
,CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>> Table TBL_SUNGJUK이(가) 생성되었습니다.

DROP TABLE TBL_SUNGJUK;

--※ 생성된 테이블 구조 변경 → 컬럼 추가
-- (총점 → TOT, 평균 → AVG, 등급 → GRADE)
ALTER TABLE TBL_SUNGJUK
ADD (TOT NUMBER(3), AVG NUMBER(4,1), GRADE CHAR);
--==>>Table TBL_SUNGJUK이(가) 변경되었습니다.


--○ 변경된 테이블 구조 확인
DESC TBL_SUNGJUK;
--==>> 
/*
이름     널?       유형           
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


--※ 여기서 추가한 컬럼에 대한 항목은
-- 프로시저 실습을 위한 추가항목일 뿐
-- 실제 테이블 구조에 적합하지도, 바람직하지도 않은 내용이다~!!! CHECK~!!!

--==>> 기존 테이블의 데이터를 활용하여 얻을 수 있는 데이터는
-- 즉, 쿼리문을 통해 얻어낼 수 있는 데이터는
-- 절대 테이블에 추가로 구성(테이블 내에 컬럼화)하지 않는다.

--○ 프로시저 생성 후 실행
EXEC PRC_SUNGJUK_INSERT(1, '최선하', 90, 80, 70);
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 생성 후 실행
EXEC PRC_SUNGJUK_INSERT(2, '박현수', 87, 97, 67);
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 이후 테이블 조회
SELECT *
FROM TBL_SUNGJUK;
/*
1	최선하	90	80	70	240	80	B
2	박현수	50	50	50	150	50	F
*/

--○ 프로시저 생성 후 실행
EXEC PRC_SUNGJUK_UPDATE(2, 50, 50, 50);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출(실행) 이후 테이블 조회
SELECT *
FROM TBL_SUNGJUK;


--○ 프로시저 생성 후 실행(잘못된 패스워드)
EXEC PRC_STUDENTS_UPDATE('happy','java006','010-9999-9999','강원도 횡성');
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
happy	이시우	010-1111-1111	제주도 서귀포시
rainbow	김정용	010-2222-2222	서울 강남구
*/

--○ 프로시저 생성 후 실행(올바른 패스워드)
EXEC PRC_STUDENTS_UPDATE('happy','java006$','010-9999-9999','강원도 횡성');
--==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.
--○ 프로시저 호출 후 테이블 조회
SELECT *
FROM TBL_STUDENTS;
/*
happy	이시우	010-9999-9999	강원도 횡성
rainbow	김정용	010-2222-2222	서울 강남구
*/
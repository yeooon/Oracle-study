SELECT USER
FROM DUAL;

SELECT *
FROM TBL_INSA;


--※ 20220308_05_scott(plsql).sql 파일에서
-- FN_GENDER() 함수 생성 후 
-- TBL_INSA 테이블을 대상으로 주민번호(SSN)를 가지고 성별 조회

SELECT NAME, SSN, FN_GENDER(SSN) "성별"
FROM TBL_INSA;
--==>>
/*
서엉공
*/

SELECT FN_GENDER('751212-1234567')
FROM TBL_INSA;
--==>> 남자


SELECT FN_POW(10,3)"결과확인"
FROM DUAL;
--==>>1000

SELECT FN_POW(2,5)"결과확인"
FROM DUAL;
--==>>32

SELECT FN_POW(2,8)"결과확인"
FROM DUAL;
--==>>256

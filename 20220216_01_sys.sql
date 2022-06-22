
--1줄 주석문 처리(단일행 주석문 처리)
/*
여러줄
(다중행)
주석문
처리
*/

-- ○ 현재 오라클 서버에 접속한 자신의 계정 조회
show user
--==>>USER이(가) "SYS"입니다.
--> sqlplus 상태일 때 사용하는 명령어

select user
from dual;
--==> SYS

select user
from dual; -- 지금 이건 의미가 없다?
--==> SYS

select 1+2
from dual;
--==> 3

select 1+5
fromdual;
--==>> 에러 발생
-- "FROM keyword not found where expected"

select 쌍용강북교육센터 f강의장
from dual;
--==>> 에러 발생
-- (ORA-00904: "쌍용강북교육센터": invalid identifier)

select "쌍용강북교육센터 f강의장"
from dual;
--==>>에러 발생
--(ORA-00972: identifier is too long)

select '쌍용강북교육센터 f강의장'
from dual;

SELECT '한 발 한 발 힘겨운 오라클 수업'
FROM DUAL;
--==>>한 발 한 발 힘겨운 오라클 수업

select 3.14+3.14
from dual;
--==>>6.28

select 10*5
from dual;
--==>>50

select 10 * 5.0
from dual;
--==>>50

select 4/2
from dual;
--==>>2

select 4.0/2
from dual;
--==>>2

select 4.0/2.0
from dual;
--==>>2

select 5/2
from dual;
--==>>2.5

select 100-23
from dual;
--==>>77

select 10-13
from dual;
--==>>-3


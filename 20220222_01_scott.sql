SELECT USER
FROM DUAL;
--==>> SCOTT

--○ ROUND() 반올림을 처리해주는 함수
SELECT 48.678 "COL1"
    , ROUND(48.678, 2) "COL2"   --48.68
    , ROUND(48.674, 2) "COL3"   --48.67
    , ROUND(48.674, 1) "COL4"   --48.7
    , ROUND(48.674, 0) "COL5"   --49 
    , ROUND(48.674) "COL6"      --49
    , ROUND(48.674, -1) "COL7"  --50
    , ROUND(48.674, -2) "COL8"  --0
    , ROUND(68.674, -2) "COL9"  --100
    , ROUND(48.674, -3) "COL10"  --0  
FROM DUAL;

--○ TRUNC() 절삭을 처리해 주는 함수
SELECT 48.678 "COL1"    --48.678
    , TRUNC(48.678, 2) "COL2"   --48.67 -- 소수점 이하 둘째자리까지 표현 → 두 번째 파라미터
    , TRUNC(48.674, 2) "COL3"   --48.67
    , TRUNC(48.674, 1) "COL4"   --48.6
    , TRUNC(48.674, 0) "COL5"   --48
    , TRUNC(48.674) "COL6"      --48    -- 두 번째 파라미터 값이 0일 경우 생략 가능
    , TRUNC(48.674, -1) "COL7"  --40
    , TRUNC(48.674, -2) "COL8"  --0
    , TRUNC(68.674, -2) "COL9"  --0
    , TRUNC(48.674, -3) "COL10"  --0    
FROM DUAL;


--○ MOD() 나머지를 반환하는 함수
SELECT MOD(5,2) "RESULT"
FROM DUAL;
--==>> 1
--> 5를 2로 나눈 나머지 결과값 반환


--○ POWER() 제곱의 결과를 반환하는 함수
SELECT POWER(5,3) "RESULT"
FROM DUAL;
--==>> 125
--> 5의 3승을 결과값으로 반환


--○ SQRT() 루트 결과값을 반환하는 함수
SELECT SQRT(2) "RESULT"
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> 루트 2에 대한 결과값 반환


--○ LOG() 로그 함수
-- (오라클은 상용로그만 지원하는 반면, MSSQL 은 상용로그, 자연로그 모두 지원한다.)
SELECT LOG(10,100) "COL1"
      ,LOG(10,20) "COL2"
FROM DUAL;
--==>>2	1.30102999566398119521373889472449302677


--○ 삼각함수
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>0.8414709848078965066525023216302989996233
--0.5403023058681397174009366074429766037354
--1.55740772465490223050697480745836017308
--> 각각 싸인, 코싸인, 탄젠트 결과값을 반환한다.


--○ 삼각함수의 역함수(범위 : -1 ~ 1)
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>0.52359877559829887307710723054658381405
--1.04719755119659774615421446109316762805
--0.4636476090008061162142562314612144020295
--> 각각 어싸인, 어코싸인, 어탄젠트 결과값을 반환한다.


--○ SIGN() 서명 부호 특징
--> 연산 결과값이 양수이면 1, 0 이면 0, 음수이면 -1을 반환한다.
SELECT SIGN(5-2) "COL1", SIGN(5-5) "COL2", SIGN(5-8) "COL3"
FROM DUAL;
--==>> 1	0	-1
--> 매출이나 수지와 관련하여 적자 및 흑자의 개념을 나타낼 때 사용된다.


--○ ASCII(), CHR() → 서로 대응(상응)하는 함수
SELECT ASCII('A') "COL1"
     , CHR(65) "COL2"
FROM DUAL;
--==>>65	A
-->『ASCII』 : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다.
-- 『CHR()』 : 매개변수로 넘겨받은 아스키코드 값으로 해당 문자를 반환한다.

--------------------------------------------------------------------------------

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE "COL1"   -- 2022-02-22 09:44:17
, SYSDATE + 1 "COL2"    -- 2022-02-23 09:44:17 → 하루 뒤
, SYSDATE - 2 "COL3"    -- 2022-02-20 09:44:17 → 이틀 전
, SYSDATE - 30 "COL4"   -- 2022-01-23 09:44:17 →  30일 전
FROM DUAL;

--○ 시간 단위 연산
SELECT SYSDATE "COL1"   -- 2022-02-22 09:44:17
, SYSDATE + 1/24 "COL2"    -- 2022-02-22 10:46:55 → 하루 뒤
, SYSDATE - 2/24 "COL3"    -- 2022-02-22 07:46:55 → 이틀 전
FROM DUAL;


--○ 현재 시간과... 현재 시간 기준 1일 2시간 3분 4초 후를 조회하는 쿼리문을 구성한다.
SELECT SYSDATE "현재시간"
      ,SYSDATE + 1 + 2/24 + 3/1440 + 4/86400 "연산후시간"
FROM DUAL;
--==>>2022-02-22 10:05:16
-- 2022-02-23 12:08:20


-- 방법 2.
SELECT SYSDATE "현재 시간"
, SYSDATE + ((1*24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60) "연산후시간"
FROM DUAL;
--==>>2022-02-22 10:20:23
--2022-02-23 12:23:27


--○ 날짜 - 날짜 = 일수
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD') - TO_DATE('2022-02-22', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 118

--○ 데이터 타입의 변환
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 2022-06-20 00:00:00

SELECT TO_DATE('2022-06-35', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 에러발생
-- (ORA-01847: day of month must be between 1 and last day of month)

SELECT TO_DATE('2022-02-29', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 에러발생
-- (ORA-01839: date not valid for month specified)

SELECT TO_DATE('2022-13-29', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 에러발생
-- (ORA-01843: not a valid month)


--※TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 수행하는 과정에서
-- 내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다.

--○ ADD_MONTHS()
SELECT SYSDATE "COL1"
, ADD_MONTHS(SYSDATE, 2) "COL2"
, ADD_MONTHS(SYSDATE, 3) "COL3"
, ADD_MONTHS(SYSDATE, -2) "COL4"
, ADD_MONTHS(SYSDATE, -3) "COL5"
FROM DUAL;
--==>>
/*
2022-02-22 10:29:58     → 현재
2022-04-22 10:29:58     → 2개월 후
2022-05-22 10:29:58     → 3개월 후
2021-12-22 10:29:58     → 2개월 전
2021-11-22 10:29:58     → 3개월 전
*/
--> 월을 더하고 빼기


--○ MONTH_BETWEEN()
-- 첫 번째 인자값에서 두 번째 인자값을 뺀 개월 수를 반환한다.
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD')) "RESULT"
FROM DUAL;
--==>>236.723889635603345280764635603345280765

--> 개월 수의 차이를 반환하는 함수
-- 결과값의 부호가 『-』로 반환되었을 경우에는
-- 첫 번째 인자값에 해당하는 날짜보다
-- 두 번째 인자값에 해당하는 날짜가 『미래』라는 의미로 확인할 수 있다.


--○ NEXT_DAY()
SELECT NEXT_DAY(SYSDATE, '토') "COL1"
     , NEXT_DAY(SYSDATE, '월') "COL2"
FROM DUAL;
--==>> 2022-02-26 10:38:59
--     2022-02-28 10:38:59

--※ 세션 설정 변겅
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session이(가) 변경되었습니다.

SELECT NEXT_DAY(SYSDATE, '토') "COL1"
     , NEXT_DAY(SYSDATE, '월') "COL2"
FROM DUAL;
--==>> 에러 발생
-- (ORA-01846: not a valid day of the week)

SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1"
     , NEXT_DAY(SYSDATE, 'MON') "COL2"
FROM DUAL;
--==>> 2022-02-26 10:41:04
--     2022-02-28 10:41:04


--※ 세션 설정 다시 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.

SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1"
     , NEXT_DAY(SYSDATE, 'MON') "COL2"
FROM DUAL;
--==>> 에러 발생
-- (ORA-01846: not a valid day of the week)

SELECT NEXT_DAY(SYSDATE, '토') "COL1"
     , NEXT_DAY(SYSDATE, '월') "COL2"
FROM DUAL;
--==>>2022-02-26 10:42:26
--    2022-02-28 10:42:26


--○ LAST_DAY()
--> 해당 날짜가 포함되어 있는 그 달의 마지막 날을 반환한다.
SELECT LAST_DAY(SYSDATE) "COL1"
, LAST_DAY(TO_DATE('2022-02-10', 'YYYY-MM-DD')) "COL2"
, LAST_DAY(TO_DATE('2019-02-10', 'YYYY-MM-DD')) "COL2"
FROM DUAL;
--==>>
/*
2022-02-28 10:45:31
2022-02-28 00:00:00
2019-02-28 00:00:00
*/

--※ 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ 오늘부로... 상기가 군대에 다시 끌려(?)간다..
-- 복무기간은 22개월로 한다.

-- 1. 전역 일자를 구한다.
-- 2. 하루 꼬박꼬박 3끼 식사를 한다고 가정하면
-- 상기가 몇 끼를 먹어야 집에 보내줄까...

SELECT ADD_MONTHS(SYSDATE, 22) "전역날짜"
, (TO_DATE('2023-12-22', 'YYYY-MM--DD')-TO_DATE('2022-2-22', 'YYYY-MM--DD'))*3 "끼니"
, (ADD_MONTHS(SYSDATE,22) - SYSDATE) * 3 "선생님이 푼 방법"
FROM DUAL;

--○ 현재 날짜 및 시각으로부터...
-- 수료일(2022-06-20 18:00:00)까지
-- 남은 기간을... 다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다.
/*
--------------------------------------------------------------------------------
현재시각            |수료일                |일  |시간 | 분 | 초
--------------------------------------------------------------------------------
2022-02-22  11:34:35|2022-06-20 18:00:00   |117 |7    | 15 | 15
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT SYSDATE "현재시간"
, TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
,TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE) "일"
--○ TRUNC() 절삭을 처리해 주는 함수
,MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24),24) "시간"
--○ MOD() 나머지를 반환하는 함수
,MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60),60) "분"
,MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60*60),60) "초"
FROM DUAL;

--『93784』초를... 다시 『일 시간 분 초』로 환산하면...
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) "일"
    , MOD(TRUNC(TRUNC(93784/60)/60), 24) "시간"
    , MOD(TRUNC(93784/60), 60) "분"
    , MOD(93784, 60) "초"
FROM DUAL;


--○이해하는 중 
SELECT SYSDATE "현재시각"
,TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
--,TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE "계산"
,TRUNC(MOD((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)*(24*60*60),60)) "초"
,TRUNC(MOD((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)*(24*60),60)) "분"
FROM DUAL;

--○ 각자 태어난 날짜 및 시각으로부터... 현재까지
-- 얼마만큼의 시간을 살고 있는지...
-- 다음과 같은 형태로 조화할 수 있도록 쿼리문을 구성한다.
/*
--------------------------------------------------------------------------------
현재시각            |생년월일                |일  |시간 | 분 | 초
--------------------------------------------------------------------------------
2022-02-22  11:34:35|1995-08-16 00:00:00     |117 |7    | 15 | 15
*/
SELECT SYSDATE
,TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS') "생년월일"
--,SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS') "계산"
,TRUNC(SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS')) "일"
,TRUNC(MOD((SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS'))*24,24)) "시간"
,TRUNC(MOD((MOD((SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS'))*24,24)*60),60)) "분"
,TRUNC(MOD((MOD((MOD((SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS'))*24,24)*60),60)*60),60)) "초"
FROM DUAL;


--○ 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

--○ 날짜 반올림
SELECT SYSDATE "COL1"               --2022-02-22    → 기본 현재 날짜
, ROUND(SYSDATE, 'YEAR') "COL2"     --2022-01-01    → 년도까지 유효한 데이터(상반기/하반기 기준)
, ROUND(SYSDATE, 'MONTH') "COL3"    --2022-03-01    → 월까지 유효한 데이터 (15일 기준)
, ROUND(SYSDATE, 'DD') "COL4"       --2022-02-23    → 일까지 유효한 데이터 (정오 기준)    
, ROUND(SYSDATE, 'DAY') "COL5"      --2022-02-20    → 일까지 유효한 데이터 (수요일 기준)
FROM DUAL;


--○ 날짜 절삭
SELECT SYSDATE "COL1"               --2022-02-22    → 기본 현재 날짜
, TRUNC(SYSDATE, 'YEAR') "COL2"     --2022-01-01    → 년도까지 유효한 데이터(상반기/하반기 기준)
, TRUNC(SYSDATE, 'MONTH') "COL3"    --2022-02-01    → 월까지 유효한 데이터 (15일 기준)
, TRUNC(SYSDATE, 'DD') "COL4"       --2022-02-22    → 일까지 유효한 데이터 (정오 기준)    
, TRUNC(SYSDATE, 'DAY') "COL5"      --2022-02-20    → 그 전주에 해당하는 일요일
FROM DUAL;

--------------------------------------------------------------------------------

--■■■ 변환 함수 ■■■--

-- TO_CHAR()    : 숫자나 날짜 데이터를 문자 타입으로 변환시켜주는 함수
-- TO_DATE()    : 문자 데이터를 날짜 타입으로 변환시켜주는 함수
-- TO_NUMBER()  : 문자 데이터를 숫자 타입으로 변환시켜주는 함수

--※ 날짜나 통화 형식이 맞지 않을 경우...
--   설정값을 통해 세션을 설정하여 사용할 수 있다.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_CURRENCY = '\';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


--○ 날짜형 → 문자형
 SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "COL1"       --2022-02-22
 , TO_CHAR(SYSDATE,'YYYY') "COL2"                   --2022
 , TO_CHAR(SYSDATE, 'YEAR') "COL3"                  --TWENTY TWENTY-TWO
 , TO_CHAR(SYSDATE, 'MM') "COL4"                    --02
 , TO_CHAR(SYSDATE, 'MONTH') "COL5"                 --2월 
 , TO_CHAR(SYSDATE, 'MON') "COL6"                   --2월 
 , TO_CHAR(SYSDATE, 'DD') "COL7"                    --22
 , TO_CHAR(SYSDATE, 'MM-DD') "COL8"                 --02-22
 , TO_CHAR(SYSDATE, 'DAY') "COL9"                   --화요일
 , TO_CHAR(SYSDATE, 'DY') "COL10"                   --화
 , TO_CHAR(SYSDATE, 'HH24') "COL11"                 --16
 , TO_CHAR(SYSDATE, 'HH') "COL12"                   --04
 , TO_CHAR(SYSDATE, 'HH AM') "COL13"                --04 오후
 , TO_CHAR(SYSDATE, 'HH PM') "COL14"                --04 오후
 , TO_CHAR(SYSDATE, 'MI') "COL15"                   --18
 , TO_CHAR(SYSDATE, 'SS') "COL16"                   --56
 , TO_CHAR(SYSDATE, 'SSSSS') "COL17"                --58736
 , TO_CHAR(SYSDATE, 'Q') "COL18"                    --1 (분기)
 FROM DUAL;
 
 SELECT 7 "COL1"
 , '7' "COL2"
 , TO_CHAR(7) "COL3"

FROM DUAL;
--> 조회 결과가 좌측 정렬인지 우측 정렬인지 확인~!!!

 SELECT '4' "COL1"
 , TO_NUMBER('4') "COL2"
 , 4 "COL3"
  , TO_NUMBER('04') "COL4"
  FROM DUAL;
  --==>>4	4	4	4
  
  SELECT TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) "RESULT"
  FROM DUAL;
  --==>>
  
  --○ EXTRACT()
  SELECT TO_CHAR(SYSDATE, 'YYYY') "COL1" --2022(문자형)    → 연도를 추출하여 문자 타입으로 반환
  , TO_CHAR(SYSDATE, 'MM') "COL2"        --02(문자형)      → 월를 추출하여 문자 타입으로 반환
  , TO_CHAR(SYSDATE, 'DD') "COL3"        --22(문자형)      → 일를 추출하여 문자 타입으로 반환
  , EXTRACT(YEAR FROM SYSDATE) "COL4"    --2022(숫자형)    → 연도를 추출하여 숫자 타입으로 반환
  , EXTRACT(MONTH FROM SYSDATE) "COL5"   --2(숫자형)       → 월를 추출하여 숫자 타입으로 반환
  , EXTRACT(DAY FROM SYSDATE) "COL6"     --22(숫자형)      → 일를 추출하여 숫자 타입으로 반환
FROM DUAL;
--> 연, 월, 일 이외의 다른 항목은 불가~!!!


--○ TO_CHAR() 활용 → 형식 맞춤 표기 결과값 반환
SELECT 60000 "COL1"
, TO_CHAR(60000, '99,999') "COL2"
, TO_CHAR(60000, '$99,999') "COL3"
, TO_CHAR(60000, 'L99,999') "COL4"
, LTRIM(TO_CHAR(60000, 'L99,999')) "RESULT"
FROM DUAL;


--※ 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--○ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회한다.
SELECT SYSDATE "현재 시간"
        , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "1일2시간3분4초후"
FROM DUAL;
--==>>2022-02-22 16:48:45
--2022-02-23 18:51:49

--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분 6초 후를 조회한다.
-- TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "현재 시간"
, SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "연산 시간" 
FROM DUAL;
--==>>
/*
2022-02-22 17:05:08	
2023-04-25 21:10:14
*/

--------------------------------------------------------------------------------

--○ CASE 구문(조건문, 분기문)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2=4' ELSE '5+2는몰라요' END
FROM DUAL;
--==>> 5+2는몰라요

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2=6' END
FROM DUAL;
--==>> 5+2=7

SELECT CASE 1+1 
WHEN 2 THEN '1+1=2' 
WHEN 3 THEN '1+1=3' 
WHEN 4 THEN '1+1=4'
ELSE '난 산수 싫어'
END "RESULT"
FROM DUAL;
--==>> 1+1=2

SELECT CASE WHEN 5+2=4 THEN '5+2=4' 
            WHEN 6-3=2 THEN '6-3=2'
            WHEN 7*1=8 THEN '7*1=8'
            WHEN 6/2=3 THEN '6/2=3'            
            ELSE '모르겠네'
            END "결과"
FROM DUAL;
--==>> 6/2=3


--○ DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2는 몰라요') "RESULT"
FROM DUAL;
--==>>5-2=3

--○ CASE WHEN THEN ELSE END (조건문, 분기문) 활용
SELECT CASE WHEN 5<2 THEN '5<2' 
            WHEN 5>2 THEN '5>2' 
            ELSE '5와 2는 비교불가'
        END "RESULT"
FROM DUAL;
--==>>5>2


SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '은혜만세' 
            WHEN 5>2 OR 2=3 THEN '문정만세' 
            ELSE '호석만세'
        END "RESULT"
FROM DUAL;


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '현수만세'
            WHEN 5<2 AND 2=3 THEN '이삭만세'
ELSE '태형만세'
END "RESULT"
FROM DUAL;

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=3 THEN '현수만세'
            WHEN 5<2 AND 2=3 THEN '이삭만세'
ELSE '태형만세'
END "RESULT"
FROM DUAL;

--------------------------------------------------------------------------------
SELECT *
FROM TBL_SAWON;

--○ TBL_SAWON 테이블을 활용하여
-- 다음과 같은 항목들을 조회할 수 있도록 쿼리문을 구성한다.
-- 사원번호, 사원명, 주민번호, 성별, 입사일
SELECT SANO"사원번호", SANAME"사원명", JUBUN"주민번호", HIREDATE"입사일"
,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자' 
      WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
ELSE '모르겠음'
END "성별"
FROM TBL_SAWON;
/*
1001	김민성	9707251234567	2005-01-03	남자
1002	서민지	9505152234567	1999-11-23	여자
1003	이지연	9905192234567	2006-08-10	여자
1004	이연주	9508162234567	2007-10-10	여자
1005	오이삭	9805161234567	2007-10-10	남자
1006	이현이	8005132234567	1999-10-10	여자
1007	박한이	0204053234567	2010-10-10	남자
1008	선동렬	6803171234567	1998-10-10	남자
1009	선우용녀	6912232234567	1998-10-10	여자
1010	선우선	0303044234567	2010-10-10	여자
1011	남주혁	0506073234567	2012-10-10	남자
1012	남궁민	0208073234567	2012-10-10	남자
1013	남진	6712121234567	1998-10-10	남자
1014	홍수민	0005044234567	2015-10-10	여자
1015	임소민	9711232234567	2007-10-10	여자
1015	이이경	0603194234567	2015-01-20	여자
*/

--○ TBL_SAWON 테이블을 활용하여
-- 다음과 같은 항목들을 조회할 수 있도록 쿼리문을 구성한다.
-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일
--, 정년퇴직일, 근무일수, 남은일수, 급여, 보너스
-- 단, 현재나이는 기본 한국나이 계산법에 따라 연산을 수행한다.
-- 또한, 정년퇴직일은 해당 직원의 나이가 한국나이로 60세가 되는 해의 
-- 그 직원의 입사 월, 일로 연산을 수행한다.
-- 그리고, 보너스는 1000일 이상 2000일 미만 근무한 사원은
-- 그 사우너의 원래 급여 기준 30% 지급, 2000일 이상 근무한 사원은
-- 그 사원의 원래 급여 기준 50% 지급을 할 수 있도록 처리한다.

--ex) 1001 김민성 9707251234567 남성 26 2005-01-03 2056-01-03 212121 223232 3000 4500

SELECT SANO, SANAME, JUBUN
, CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
       WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
    ELSE '성별불명'
    END "성별"
, EXTRACT(YEAR FROM SYSDATE)-(DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20')||SUBSTR(JUBUN,1,2))+1 "현재나이"
,HIREDATE "입사일"
,TRUNC(SYSDATE - HIREDATE) "근무일수"
-- 정년퇴직 = 현재날짜 + (60-현재나이)
-- 남은일수 = 정년퇴직 - 현재날짜
-- TO_DATE("정년퇴직"-SYSDATE) "남은일수"
, TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE)-(DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20')||SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') || '-' || TO_CHAR(HIREDATE, 'MM-DD') "정년퇴직"
, TRUNC(TO_DATE((TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE)-(DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20')||SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') || '-' || TO_CHAR(HIREDATE, 'MM-DD')), 'YYYY-MM-DD') - SYSDATE)"남은일수"
,SAL "급여"
, CASE WHEN TRUNC (SYSDATE - HIREDATE) >= 2000 THEN TO_CHAR(SAL/2)
ELSE '확인불명'
END "보너스"
FROM TBL_SAWON;

-- 서브쿼리...
-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 급여...먼저
SELECT SANO"사원번호", SANAME"사원명", JUBUN"주민번호"
,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
      WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
      ELSE '확인불가'
      END "성별"
-- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)     
,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --현재년도 - (주민번호앞두자리+1899) 
      WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --현재년도 - (주민번호앞두자리+1999)
      ELSE -1
      END "현재나이"
, HIREDATE "입사일"
, SAL "급여"
FROM TBL_SAWON;

SELECT T.ENAME, T.연봉*2
FROM
(
SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0)"연봉" 
FROM EMP
) T;

SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0)"연봉" 
FROM EMP;



-- 서브쿼리...
-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 급여...먼저
SELECT T.사원번호, T.사원명, T.주민번호, T.현재나이, T.입사일
-- 정년퇴직일
-- 정년퇴직년도 → 해당 직원의 나이가 한국나이로 60세가 되는 해
-- 현재 나이가... 57세... 3년 후    2022 → 2025
-- 현재 나이가... 28세... 32년후    2022 → 2054
-- ADD_MONTHS(SYSDATE, 남은년수*12)
--                     --------
-- ADD_MONTHS(SYSDATE, (60-현재나이)*12) → 특정날짜
-- TO_CHAR('특정날짜','YYYY') → 정년퇴직 년도만 문자로 추출
-- TO_CHAR(입사일, 'MM-DD')   → 입사 월일만 문자타입으로 추출
-- TO_CHAR('특정날짜','YYYY')||'-'||TO_CHAR(입사일, 'MM-DD') "정년퇴직일"
-- TO_CHAR(ADD_MONTHS(SYSDATE, (60-현재나이)*12),'YYYY')||'-'||TO_CHAR(입사일, 'MM-DD') "정년퇴직일"
  ,TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12),'YYYY')||'-'||TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
  
  -- 근무일수
  -- 근무일수 = 현재일 - 입사일
  , TRUNC(SYSDATE - T.입사일) "근무일수"
  
  -- 남은일수
  -- 남은일수 = 정년퇴직일 - 현재날짜
  ,TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12),'YYYY')||'-'||TO_CHAR(T.입사일, 'MM-DD') ,'YYYY-MM-DD') - SYSDATE) "남은일수"

  -- 급여
  ,T.급여
  
  -- 보너스
  -- 근무일수가 1000일 이상 2000일 미만 → 원래 급여의 30% 지급
  -- 근무일수가 2000일 이상             → 원래 급여의 50% 지급
  -- 나머지                             → 0
  -------------------------------------------------------------
  -- 근무일수 2000일 이상               → T.급여 * 0.5
  -- 근무일수 1000일 이상               → T.급여 * 0.3
  -- 나머지                             → 0
  -------------------------------------------------------------
  , CASE WHEN TRUNC(SYSDATE-T.입사일) >= 2000 THEN T.급여 * 0.5
         WHEN TRUNC(SYSDATE-T.입사일) >= 1000 THEN T.급여 * 0.3
         ELSE 0
         END "보너스"
FROM
(
    SELECT SANO"사원번호", SANAME"사원명", JUBUN"주민번호", SAL "급여"
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
          WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
          ELSE '확인불가'
          END "성별"
    -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)     
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --현재년도 - (주민번호앞두자리+1899) 
          WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --현재년도 - (주민번호앞두자리+1999)
          ELSE -1
          END "현재나이"
    , HIREDATE "입사일"
    FROM TBL_SAWON
) T;

/*
1001	김민성	9707251234567	26	2005-01-03	2056-01-03	6260	12366	3000	1500
1002	서민지	9505152234567	28	1999-11-23	2054-11-23	8128	11960	4000	2000
1003	이지연	9905192234567	24	2006-08-10	2058-08-10	5676	13316	3000	1500
1004	이연주	9508162234567	28	2007-10-10	2054-10-10	5250	11916	4000	2000
1005	오이삭	9805161234567	25	2007-10-10	2057-10-10	5250	13012	4000	2000
1006	이현이	8005132234567	43	1999-10-10	2039-10-10	8172	6437	1000	500
1007	박한이	0204053234567	21	2010-10-10	2061-10-10	4154	14473	3000	1500
1008	선동렬	6803171234567	55	1998-10-10	2027-10-10	8537	2054	1500	750
1009	선우용녀	6912232234567	54	1998-10-10	2028-10-10	8537	2420	1300	650
1010	선우선	0303044234567	20	2010-10-10	2062-10-10	4154	14838	1600	800
1011	남주혁	0506073234567	18	2012-10-10	2064-10-10	3423	15569	2600	1300
1012	남궁민	0208073234567	21	2012-10-10	2061-10-10	3423	14473	2600	1300
1013	남진	6712121234567	56	1998-10-10	2026-10-10	8537	1689	2200	1100
1014	홍수민	0005044234567	23	2015-10-10	2059-10-10	2328	13742	5200	2600
1015	임소민	9711232234567	26	2007-10-10	2056-10-10	5250	12647	5500	2750
1015	이이경	0603194234567	17	2015-01-20	2065-01-20	2591	15671	1500	750
*/

--○ TBL_SAWON 테이블에 데이터 추가 입력
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1017, '이호석', '9611121234567', SYSDATE, 5000);
--==>>1 행 이(가) 삽입되었습니다.


--○ 확인
SELECT *
FROM TBL_SAWON;

--○ 커밋 완료
COMMIT;


SELECT T.사원번호, T.사원명, T.주민번호, T.현재나이, T.입사일, T.성별
  ,TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12),'YYYY')||'-'||TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
  ,TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12),'YYYY')||'-'||TO_CHAR(T.입사일, 'MM-DD') ,'YYYY-MM-DD') - SYSDATE) "남은일수"
  ,T.급여
  , CASE WHEN TRUNC(SYSDATE-T.입사일) >= 2000 THEN T.급여 * 0.5
         WHEN TRUNC(SYSDATE-T.입사일) >= 1000 THEN T.급여 * 0.3
         ELSE 0
         END "보너스"
FROM
(
    SELECT SANO"사원번호", SANAME"사원명", JUBUN"주민번호", SAL "급여"
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
          WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
          ELSE '확인불가'
          END "성별"
    -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)     
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --현재년도 - (주민번호앞두자리+1899) 
          WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --현재년도 - (주민번호앞두자리+1999)
          ELSE -1
          END "현재나이"
    , HIREDATE "입사일"
    FROM TBL_SAWON
) T;
/*
1001	김민성	9707251234567	26	2005-01-03	2056-01-03	12366	3000	1500
1002	서민지	9505152234567	28	1999-11-23	2054-11-23	11960	4000	2000
1003	이지연	9905192234567	24	2006-08-10	2058-08-10	13316	3000	1500
1004	이연주	9508162234567	28	2007-10-10	2054-10-10	11916	4000	2000
1005	오이삭	9805161234567	25	2007-10-10	2057-10-10	13012	4000	2000
1006	이현이	8005132234567	43	1999-10-10	2039-10-10	6437	1000	500
1007	박한이	0204053234567	21	2010-10-10	2061-10-10	14473	3000	1500
1008	선동렬	6803171234567	55	1998-10-10	2027-10-10	2054	1500	750
1009	선우용녀	6912232234567	54	1998-10-10	2028-10-10	2420	1300	650
1010	선우선	0303044234567	20	2010-10-10	2062-10-10	14838	1600	800
1011	남주혁	0506073234567	18	2012-10-10	2064-10-10	15569	2600	1300
1012	남궁민	0208073234567	21	2012-10-10	2061-10-10	14473	2600	1300
1013	남진	6712121234567	56	1998-10-10	2026-10-10	1689	2200	1100
1014	홍수민	0005044234567	23	2015-10-10	2059-10-10	13742	5200	2600
1015	임소민	9711232234567	26	2007-10-10	2056-10-10	12647	5500	2750
1015	이이경	0603194234567	17	2015-01-20	2065-01-20	15671	1500	750
1017	이호석	9611121234567	27	2022-02-23	2055-02-23	12052	5000	0
*/

-- 위에서 처리한 내용을 기반으로
-- 특정 근무일수의 사원을 확인해야 한다거나...
-- 특정 보너스 금액을 받는 사원을 확인해야 할 경우가 발생할 수 있다.
-- 이와 같은 경우... 해당 쿼리문을 다시 구성해야하는 번거로움을 줄일 수 있도록
-- 뷰(VIEW)를 만들어 저장해 둘 수 있다.


CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.사원번호, T.사원명, T.주민번호, T.현재나이, T.입사일, T.성별
  ,TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12),'YYYY')||'-'||TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
  ,TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12),'YYYY')||'-'||TO_CHAR(T.입사일, 'MM-DD') ,'YYYY-MM-DD') - SYSDATE) "남은일수"
  ,T.급여
  , CASE WHEN TRUNC(SYSDATE-T.입사일) >= 2000 THEN T.급여 * 0.5
         WHEN TRUNC(SYSDATE-T.입사일) >= 1000 THEN T.급여 * 0.3
         ELSE 0
         END "보너스"
FROM
(
    SELECT SANO"사원번호", SANAME"사원명", JUBUN"주민번호", SAL "급여"
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
          WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
          ELSE '확인불가'
          END "성별"
    -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 / 2000년대)     
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --현재년도 - (주민번호앞두자리+1899) 
          WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --현재년도 - (주민번호앞두자리+1999)
          ELSE -1
          END "현재나이"
    , HIREDATE "입사일"
    FROM TBL_SAWON
) T;
--==>> 에러발생
--() → 권한 부족

--○ SYS로 부터 CREATE VIEW 권한을 부여받은 이후 다시 실행
--==>> View VIEW_SAWON이(가) 생성되었습니다.

SELECT *
FROM VIEW_SAWON;

SELECT *
FROM VIEW_SAWON
WHERE 남은일수 >= 10000;

--○ TBL_SAWON 테이블에 데이터 추가 입력
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1018, '신시은', '9910312234567', SYSDATE, 5000);
--==>>1 행 이(가) 삽입되었습니다.

SELECT *
FROM VIEW_SAWON;


--○ 서브쿼리를 활용하여
-- TBL_SAWON 테이블을 다음과 같이 조회할 수 있도록 한다.
/*
-------------------------------------------
사원명  성별  현재나이  급여  나이보너스
-------------------------------------------

단, 나이 보너스는 현재 나이가 50세 이상이면 급여의 70%
    40세 이상 50세 미만이면 급여의 50%
    20세 이상 40세 미만이면 급여의 30% 로 한다.

또한, 완성된 조회 구문을 통해
VIEW_SAWON2 라는 이름의 뷰(VIEW) 를 생성한다.
*/
CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.사원명, T.성별, T.현재나이, T.급여
, CASE WHEN T.현재나이 > 50 THEN T.급여 * 0.7
       WHEN T.현재나이 >= 40 THEN T.급여 * 0.5
       WHEN T.현재나이 >= 20 THEN T.급여 * 0.3
       ELSE 0
       END "나이 보너스"
FROM(
SELECT SANAME"사원명"
, CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '남자'
       WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '여자'
       ELSE '알수없음'
       END "성별"
,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --현재년도 - (주민번호앞두자리+1899) 
      WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --현재년도 - (주민번호앞두자리+1999)
      ELSE -1
      END "현재나이" 
, SAL"급여"
FROM TBL_SAWON
) T;

SELECT *
FROM VIEW_SAWON2;
/*
김민성	남자	26	3000	900
서민지	여자	28	4000	1200
이지연	여자	24	3000	900
이연주	여자	28	4000	1200
오이삭	남자	25	4000	1200
이현이	여자	43	1000	500
박한이	남자	21	3000	900
선동렬	남자	55	1500	1050
선우용녀	여자	54	1300	910
선우선	여자	20	1600	480
남주혁	남자	18	2600	0
남궁민	남자	21	2600	780
남진	남자	56	2200	1540
홍수민	여자	23	5200	1560
임소민	여자	26	5500	1650
이이경	여자	17	1500	0
이호석	남자	27	5000	1500
신시은	여자	24	5000	1500
*/


--------------------------------------------------------------------------------

--○ RANK() → 등수(순위)를 반환하는 함수

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위" --내림차순
FROM EMP;
/*
7839	KING	10	5000	1
7902	FORD	20	3000	2
7788	SCOTT	20	3000	2
7566	JONES	20	2975	4
7698	BLAKE	30	2850	5
7782	CLARK	10	2450	6
7499	ALLEN	30	1600	7
7844	TURNER	30	1500	8
7934	MILLER	10	1300	9
7521	WARD	30	1250	10
7654	MARTIN	30	1250	10
7876	ADAMS	20	1100	12
7900	JAMES	30	950	    13
7369	SMITH	20	800	    14
*/

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여순위"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위" --내림차순
FROM EMP;

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여순위"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여순위" --내림차순
FROM EMP
ORDER BY DEPTNO;
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	6
7934	MILLER	10	1300	3	9
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7876	ADAMS	20	1100	4	12
7369	SMITH	20	800	    5	14
7698	BLAKE	30	2850	1	5
7499	ALLEN	30	1600	2	7
7844	TURNER	30	1500	3	8
7654	MARTIN	30	1250	4	10
7521	WARD	30	1250	4	10
7900	JAMES	30	950	    6	13
*/

--○ DENSE_RANK() → 서열을 반환하는 함수
SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL "급여"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서별급여순위"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "전체급여순위" --내림차순
FROM EMP
ORDER BY DEPTNO;
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	5
7934	MILLER	10	1300	3	8
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	2	3
7876	ADAMS	20	1100	3	10
7369	SMITH	20	800	    4	12
7698	BLAKE	30	2850	1	4
7499	ALLEN	30	1600	2	6
7844	TURNER	30	1500	3	7
7654	MARTIN	30	1250	4	9
7521	WARD	30	1250	4	9
7900	JAMES	30	950	    5	11
*/


--○ EMP 테이블의 사원 데이터를
-- 사원명, 부서번호, 연봉, 부서내연봉순위, 전체연봉순위 항목으로 조회한다.

SELECT ENAME"사원명", DEPTNO"부서번호"
, (SAL * 12) + NVL(COMM,0)"연봉"
, RANK() OVER(PARTITION BY DEPTNO ORDER BY ((SAL * 12) + NVL(COMM,0)) DESC) "부서내연봉순위"
, RANK() OVER(ORDER BY ((SAL * 12) + NVL(COMM,0)) DESC)"전체연봉순위"
FROM EMP
ORDER BY DEPTNO;
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
MILLER	10	15600	3	10
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
ADAMS	20	13200	4	12
SMITH	20	9600	5	14
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
TURNER	30	18000	3	8
MARTIN	30	16400	4	9
WARD	30	15500	5	11
JAMES	30	11400	6	13
*/
SELECT T.사원명, T.부서번호, T.연봉
, RANK() OVER(PARTITION BY T.부서번호 ORDER BY T.연봉 DESC) "부서내연봉순위"
, RANK() OVER(ORDER BY T.연봉 DESC)"전체연봉순위"
FROM 
(
SELECT ENAME"사원명", DEPTNO"부서번호", (SAL * 12) + NVL(COMM,0)"연봉"
FROM EMP
) T;
/*
KING	10	60000	1	1
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
BLAKE	30	34200	1	5
CLARK	10	29400	2	6
ALLEN	30	19500	2	7
TURNER	30	18000	3	8
MARTIN	30	16400	4	9
MILLER	10	15600	3	10
WARD	30	15500	5	11
ADAMS	20	13200	4	12
JAMES	30	11400	6	13
SMITH	20	9600	5	14
*/

--○ EMP 테이블에서 전체 연봉 등수(순위)가 1등부터 5등까지만...
-- 사원명, 부서번호, 연봉, 전체연봉순위 항목으로 조회한다.

SELECT T.사원명, T.부서번호, T.연봉, T.전체연봉순위
FROM 
(
    SELECT ENAME"사원명", DEPTNO"부서번호"
    , (SAL * 12) + NVL(COMM,0)"연봉"
    ,DENSE_RANK() OVER(ORDER BY (SAL * 12) + NVL(COMM,0) DESC)"전체연봉순위"
    FROM EMP
)T
WHERE T.전체연봉순위 <= 5;
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	3
BLAKE	30	34200	4
CLARK	10	29400	5
*/
--==>> 에러 발생
--(ORA-30483:window fuction are not allowed here)

-- ※ 위의 내용은 RANK() OVER() 와 같은 분석 함수를 WHERE 절에서 사용한 경우이며...
-- 이 함수는 WHERE 조건절에서 사용할 수 없기 때문에 발생하는 에러이다.
-- 이 경우, 우리는 INLINE VIEW 를 활용해서 풀이해야 한다. 

--○ EMP 테이블에서 각 부서별로 연봉등수가 1등부터 2등까지만 조회한다.
-- 사원명, 부서번호, 연봉, 부서내연봉등수, 전체연봉등수
-- 항목을 조회할 수 있도록 쿼리문을 구성한다. 
SELECT T.사원명, T.부서번호, T.연봉, T.전체연봉등수, T.부서내연봉등수
FROM 
(
    SELECT ENAME"사원명", DEPTNO"부서번호", (SAL*12)+NVL(COMM,0)"연봉"
    ,RANK() OVER(ORDER BY (SAL*12)+NVL(COMM,0) DESC) "전체연봉등수"
    ,RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12)+NVL(COMM,0) DESC)"부서내연봉등수"
    FROM EMP
)T
WHERE T.부서내연봉등수 IN (1,2)
ORDER BY T.부서번호;

--------------------------------------------------------------------------------
--■■■ 그룹 함수 ■■■--
-- SUM() 합, AVG() 평균, COUNT() 카운트, MAX() 최대값, MIN() 최소값
--, VERIENCE() 분산, STDDEV() 표준편차

--※ 그룹 함수의 가장 큰 특징
-- 처리해야 할 데이터들 중 NULL 이 존재한다면(포함되어 있다면)
-- 이 NULL 은 제외한 상태로 연산을 수행한다는 것이다. 
-- 즉, 그룹 함수가 작동하는 과정에서 NULL 은 연산의 대상에서 제외된다.

--○ SUM() 합
-- EMP 테이블을 대상으로 전체 사원들의 급여 총합을 조회한다.
SELECT SAL
FROM EMP;;
--==>
/*
800
1600
1250
2975
1250
2850
2450
3000
5000
1500
1100
950
3000
1300
*/

SELECT SUM(SAL)
FROM EMP;
--==>>29025

SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> 에러발생
-- (ORA-00937: not a single-group group function)

SELECT SUM(SAL) -- 800+1600+1250+...+
FROM EMP;
--==>> 29025

SELECT COMM
FROM EMP;
/*
(NULL)
300
500
(NULL)
1400
(NULL)
(NULL)
(NULL)
(NULL)
0
(NULL)
(NULL)
(NULL)
(NULL)
*/

SELECT SUM(COMM) --(NULL)+300+500+(NULL)+...+(NULL)
FROM EMP;
--==>2200


--○ COUNT() 행(레코드)의 갯수 조회 → 데이터가 몇 건인지 확인...
SELECT COUNT(ENAME)
FROM EMP;
--==>>14

SELECT COUNT(COMM) -- COMM 컬럼 행의 갯수 조회 → NULL은 제외~!!
FROM EMP;;
--==>>4

SELECT COUNT(*)
FROM EMP;
--==>>14


--○ AVG() 평균 반환
SELECT SUM(SAL) / COUNT(SAL) "RESULT1" --2073.214285714285714285714285714285714286
, AVG(SAL) "RESULT2" --2073.214285714285714285714285714285714286
FROM EMP;

SELECT SUM(COMM) / COUNT(COMM) "RESULT1" --550
, AVG(COMM) "RESULT2"                    --550
FROM EMP;

SELECT SUM(COMM) / COUNT(*) "RESULT"
FROM EMP;
--==>> 157.142857142857142857142857142857142857

--※ 데이터가 NULL 인 컬럼의 레코드는 연산 대상에서 제외되기 때문에
-- 주의하여 연산 처리해야 한다.

--○ VARIANCE(), STDDEV()
-- ※ 표준편차의 제곱이 분산, 분산의 제곱근이 표준편차

SELECT VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
--==>>
/*
1398313.87362637362637362637362637362637
1182.503223516271699458653359613061928508
*/

SELECT POWER(STDDEV(SAL),2) "RESULT"
,VARIANCE(SAL) "RESULT"
FROM EMP;
--==>>1398313.87362637362637362637362637362637
--==>>1398313.87362637362637362637362637362637

SELECT SQRT(VARIANCE(SAL)) "RESULT"
, STDDEV(SAL) "RESULT2"
FROM EMP;
--==>>
/*
1182.503223516271699458653359613061928508
1182.503223516271699458653359613061928508
*/

--○ MAX() / MIN()
-- 최대값 최소값
SELECT MAX(SAL) "RESULT1"
      ,MIN(SAL) "RESULT2"
FROM EMP;
--==>>5000	800


--※ 주의
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> 에러발생
-- (ORA-00937: not a single-group group function)

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
10	8750
*/

SELECT DEPTNO, SAL
FROM EMP
ORDER BY 1;
--==>>
/*
10	2450
10	5000
10	1300
--------
20	2975
20	3000
20	1100
20	800
20	3000
--------
30	1250
30	1500
30	1600
30	950
30	2850
30	1250
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY 1;
/*
10	8750
20	10875
30	9400
*/



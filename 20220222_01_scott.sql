SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ROUND() �ݿø��� ó�����ִ� �Լ�
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

--�� TRUNC() ������ ó���� �ִ� �Լ�
SELECT 48.678 "COL1"    --48.678
    , TRUNC(48.678, 2) "COL2"   --48.67 -- �Ҽ��� ���� ��°�ڸ����� ǥ�� �� �� ��° �Ķ����
    , TRUNC(48.674, 2) "COL3"   --48.67
    , TRUNC(48.674, 1) "COL4"   --48.6
    , TRUNC(48.674, 0) "COL5"   --48
    , TRUNC(48.674) "COL6"      --48    -- �� ��° �Ķ���� ���� 0�� ��� ���� ����
    , TRUNC(48.674, -1) "COL7"  --40
    , TRUNC(48.674, -2) "COL8"  --0
    , TRUNC(68.674, -2) "COL9"  --0
    , TRUNC(48.674, -3) "COL10"  --0    
FROM DUAL;


--�� MOD() �������� ��ȯ�ϴ� �Լ�
SELECT MOD(5,2) "RESULT"
FROM DUAL;
--==>> 1
--> 5�� 2�� ���� ������ ����� ��ȯ


--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5,3) "RESULT"
FROM DUAL;
--==>> 125
--> 5�� 3���� ��������� ��ȯ


--�� SQRT() ��Ʈ ������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2) "RESULT"
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> ��Ʈ 2�� ���� ����� ��ȯ


--�� LOG() �α� �Լ�
-- (����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL �� ���α�, �ڿ��α� ��� �����Ѵ�.)
SELECT LOG(10,100) "COL1"
      ,LOG(10,20) "COL2"
FROM DUAL;
--==>>2	1.30102999566398119521373889472449302677


--�� �ﰢ�Լ�
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>0.8414709848078965066525023216302989996233
--0.5403023058681397174009366074429766037354
--1.55740772465490223050697480745836017308
--> ���� ����, �ڽ���, ź��Ʈ ������� ��ȯ�Ѵ�.


--�� �ﰢ�Լ��� ���Լ�(���� : -1 ~ 1)
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>0.52359877559829887307710723054658381405
--1.04719755119659774615421446109316762805
--0.4636476090008061162142562314612144020295
--> ���� �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�.


--�� SIGN() ���� ��ȣ Ư¡
--> ���� ������� ����̸� 1, 0 �̸� 0, �����̸� -1�� ��ȯ�Ѵ�.
SELECT SIGN(5-2) "COL1", SIGN(5-5) "COL2", SIGN(5-8) "COL3"
FROM DUAL;
--==>> 1	0	-1
--> �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� ���ȴ�.


--�� ASCII(), CHR() �� ���� ����(����)�ϴ� �Լ�
SELECT ASCII('A') "COL1"
     , CHR(65) "COL2"
FROM DUAL;
--==>>65	A
-->��ASCII�� : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�.
-- ��CHR()�� : �Ű������� �Ѱܹ��� �ƽ�Ű�ڵ� ������ �ش� ���ڸ� ��ȯ�Ѵ�.

--------------------------------------------------------------------------------

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE "COL1"   -- 2022-02-22 09:44:17
, SYSDATE + 1 "COL2"    -- 2022-02-23 09:44:17 �� �Ϸ� ��
, SYSDATE - 2 "COL3"    -- 2022-02-20 09:44:17 �� ��Ʋ ��
, SYSDATE - 30 "COL4"   -- 2022-01-23 09:44:17 ��  30�� ��
FROM DUAL;

--�� �ð� ���� ����
SELECT SYSDATE "COL1"   -- 2022-02-22 09:44:17
, SYSDATE + 1/24 "COL2"    -- 2022-02-22 10:46:55 �� �Ϸ� ��
, SYSDATE - 2/24 "COL3"    -- 2022-02-22 07:46:55 �� ��Ʋ ��
FROM DUAL;


--�� ���� �ð���... ���� �ð� ���� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�ϴ� �������� �����Ѵ�.
SELECT SYSDATE "����ð�"
      ,SYSDATE + 1 + 2/24 + 3/1440 + 4/86400 "�����Ľð�"
FROM DUAL;
--==>>2022-02-22 10:05:16
-- 2022-02-23 12:08:20


-- ��� 2.
SELECT SYSDATE "���� �ð�"
, SYSDATE + ((1*24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60) "�����Ľð�"
FROM DUAL;
--==>>2022-02-22 10:20:23
--2022-02-23 12:23:27


--�� ��¥ - ��¥ = �ϼ�
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD') - TO_DATE('2022-02-22', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 118

--�� ������ Ÿ���� ��ȯ
SELECT TO_DATE('2022-06-20', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 2022-06-20 00:00:00

SELECT TO_DATE('2022-06-35', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> �����߻�
-- (ORA-01847: day of month must be between 1 and last day of month)

SELECT TO_DATE('2022-02-29', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> �����߻�
-- (ORA-01839: date not valid for month specified)

SELECT TO_DATE('2022-13-29', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> �����߻�
-- (ORA-01843: not a valid month)


--��TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� �����ϴ� ��������
-- ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������.

--�� ADD_MONTHS()
SELECT SYSDATE "COL1"
, ADD_MONTHS(SYSDATE, 2) "COL2"
, ADD_MONTHS(SYSDATE, 3) "COL3"
, ADD_MONTHS(SYSDATE, -2) "COL4"
, ADD_MONTHS(SYSDATE, -3) "COL5"
FROM DUAL;
--==>>
/*
2022-02-22 10:29:58     �� ����
2022-04-22 10:29:58     �� 2���� ��
2022-05-22 10:29:58     �� 3���� ��
2021-12-22 10:29:58     �� 2���� ��
2021-11-22 10:29:58     �� 3���� ��
*/
--> ���� ���ϰ� ����


--�� MONTH_BETWEEN()
-- ù ��° ���ڰ����� �� ��° ���ڰ��� �� ���� ���� ��ȯ�Ѵ�.
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD')) "RESULT"
FROM DUAL;
--==>>236.723889635603345280764635603345280765

--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
-- ������� ��ȣ�� ��-���� ��ȯ�Ǿ��� ��쿡��
-- ù ��° ���ڰ��� �ش��ϴ� ��¥����
-- �� ��° ���ڰ��� �ش��ϴ� ��¥�� ���̷������ �ǹ̷� Ȯ���� �� �ִ�.


--�� NEXT_DAY()
SELECT NEXT_DAY(SYSDATE, '��') "COL1"
     , NEXT_DAY(SYSDATE, '��') "COL2"
FROM DUAL;
--==>> 2022-02-26 10:38:59
--     2022-02-28 10:38:59

--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT NEXT_DAY(SYSDATE, '��') "COL1"
     , NEXT_DAY(SYSDATE, '��') "COL2"
FROM DUAL;
--==>> ���� �߻�
-- (ORA-01846: not a valid day of the week)

SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1"
     , NEXT_DAY(SYSDATE, 'MON') "COL2"
FROM DUAL;
--==>> 2022-02-26 10:41:04
--     2022-02-28 10:41:04


--�� ���� ���� �ٽ� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1"
     , NEXT_DAY(SYSDATE, 'MON') "COL2"
FROM DUAL;
--==>> ���� �߻�
-- (ORA-01846: not a valid day of the week)

SELECT NEXT_DAY(SYSDATE, '��') "COL1"
     , NEXT_DAY(SYSDATE, '��') "COL2"
FROM DUAL;
--==>>2022-02-26 10:42:26
--    2022-02-28 10:42:26


--�� LAST_DAY()
--> �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� ��ȯ�Ѵ�.
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

--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ���úη�... ��Ⱑ ���뿡 �ٽ� ����(?)����..
-- �����Ⱓ�� 22������ �Ѵ�.

-- 1. ���� ���ڸ� ���Ѵ�.
-- 2. �Ϸ� ���ڲ��� 3�� �Ļ縦 �Ѵٰ� �����ϸ�
-- ��Ⱑ �� ���� �Ծ�� ���� �����ٱ�...

SELECT ADD_MONTHS(SYSDATE, 22) "������¥"
, (TO_DATE('2023-12-22', 'YYYY-MM--DD')-TO_DATE('2022-2-22', 'YYYY-MM--DD'))*3 "����"
, (ADD_MONTHS(SYSDATE,22) - SYSDATE) * 3 "�������� Ǭ ���"
FROM DUAL;

--�� ���� ��¥ �� �ð����κ���...
-- ������(2022-06-20 18:00:00)����
-- ���� �Ⱓ��... ������ ���� ���·� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
/*
--------------------------------------------------------------------------------
����ð�            |������                |��  |�ð� | �� | ��
--------------------------------------------------------------------------------
2022-02-22  11:34:35|2022-06-20 18:00:00   |117 |7    | 15 | 15
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT SYSDATE "����ð�"
, TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"
,TRUNC(TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE) "��"
--�� TRUNC() ������ ó���� �ִ� �Լ�
,MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24),24) "�ð�"
--�� MOD() �������� ��ȯ�ϴ� �Լ�
,MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60),60) "��"
,MOD(TRUNC((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS')-SYSDATE)*24*60*60),60) "��"
FROM DUAL;

--��93784���ʸ�... �ٽ� ���� �ð� �� �ʡ��� ȯ���ϸ�...
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) "��"
    , MOD(TRUNC(TRUNC(93784/60)/60), 24) "�ð�"
    , MOD(TRUNC(93784/60), 60) "��"
    , MOD(93784, 60) "��"
FROM DUAL;


--�������ϴ� �� 
SELECT SYSDATE "����ð�"
,TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"
--,TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE "���"
,TRUNC(MOD((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)*(24*60*60),60)) "��"
,TRUNC(MOD((TO_DATE('2022-06-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE)*(24*60),60)) "��"
FROM DUAL;

--�� ���� �¾ ��¥ �� �ð����κ���... �������
-- �󸶸�ŭ�� �ð��� ��� �ִ���...
-- ������ ���� ���·� ��ȭ�� �� �ֵ��� �������� �����Ѵ�.
/*
--------------------------------------------------------------------------------
����ð�            |�������                |��  |�ð� | �� | ��
--------------------------------------------------------------------------------
2022-02-22  11:34:35|1995-08-16 00:00:00     |117 |7    | 15 | 15
*/
SELECT SYSDATE
,TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS') "�������"
--,SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS') "���"
,TRUNC(SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS')) "��"
,TRUNC(MOD((SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS'))*24,24)) "�ð�"
,TRUNC(MOD((MOD((SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS'))*24,24)*60),60)) "��"
,TRUNC(MOD((MOD((MOD((SYSDATE - TO_DATE('1995-08-16 00:00:00','YYYY-MM-DD HH24:MI:SS'))*24,24)*60),60)*60),60)) "��"
FROM DUAL;


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "COL1"               --2022-02-22    �� �⺻ ���� ��¥
, ROUND(SYSDATE, 'YEAR') "COL2"     --2022-01-01    �� �⵵���� ��ȿ�� ������(��ݱ�/�Ϲݱ� ����)
, ROUND(SYSDATE, 'MONTH') "COL3"    --2022-03-01    �� ������ ��ȿ�� ������ (15�� ����)
, ROUND(SYSDATE, 'DD') "COL4"       --2022-02-23    �� �ϱ��� ��ȿ�� ������ (���� ����)    
, ROUND(SYSDATE, 'DAY') "COL5"      --2022-02-20    �� �ϱ��� ��ȿ�� ������ (������ ����)
FROM DUAL;


--�� ��¥ ����
SELECT SYSDATE "COL1"               --2022-02-22    �� �⺻ ���� ��¥
, TRUNC(SYSDATE, 'YEAR') "COL2"     --2022-01-01    �� �⵵���� ��ȿ�� ������(��ݱ�/�Ϲݱ� ����)
, TRUNC(SYSDATE, 'MONTH') "COL3"    --2022-02-01    �� ������ ��ȿ�� ������ (15�� ����)
, TRUNC(SYSDATE, 'DD') "COL4"       --2022-02-22    �� �ϱ��� ��ȿ�� ������ (���� ����)    
, TRUNC(SYSDATE, 'DAY') "COL5"      --2022-02-20    �� �� ���ֿ� �ش��ϴ� �Ͽ���
FROM DUAL;

--------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

-- TO_CHAR()    : ���ڳ� ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_DATE()    : ���� �����͸� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_NUMBER()  : ���� �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�

--�� ��¥�� ��ȭ ������ ���� ���� ���...
--   �������� ���� ������ �����Ͽ� ����� �� �ִ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
ALTER SESSION SET NLS_CURRENCY = '\';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


--�� ��¥�� �� ������
 SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') "COL1"       --2022-02-22
 , TO_CHAR(SYSDATE,'YYYY') "COL2"                   --2022
 , TO_CHAR(SYSDATE, 'YEAR') "COL3"                  --TWENTY TWENTY-TWO
 , TO_CHAR(SYSDATE, 'MM') "COL4"                    --02
 , TO_CHAR(SYSDATE, 'MONTH') "COL5"                 --2�� 
 , TO_CHAR(SYSDATE, 'MON') "COL6"                   --2�� 
 , TO_CHAR(SYSDATE, 'DD') "COL7"                    --22
 , TO_CHAR(SYSDATE, 'MM-DD') "COL8"                 --02-22
 , TO_CHAR(SYSDATE, 'DAY') "COL9"                   --ȭ����
 , TO_CHAR(SYSDATE, 'DY') "COL10"                   --ȭ
 , TO_CHAR(SYSDATE, 'HH24') "COL11"                 --16
 , TO_CHAR(SYSDATE, 'HH') "COL12"                   --04
 , TO_CHAR(SYSDATE, 'HH AM') "COL13"                --04 ����
 , TO_CHAR(SYSDATE, 'HH PM') "COL14"                --04 ����
 , TO_CHAR(SYSDATE, 'MI') "COL15"                   --18
 , TO_CHAR(SYSDATE, 'SS') "COL16"                   --56
 , TO_CHAR(SYSDATE, 'SSSSS') "COL17"                --58736
 , TO_CHAR(SYSDATE, 'Q') "COL18"                    --1 (�б�)
 FROM DUAL;
 
 SELECT 7 "COL1"
 , '7' "COL2"
 , TO_CHAR(7) "COL3"

FROM DUAL;
--> ��ȸ ����� ���� �������� ���� �������� Ȯ��~!!!

 SELECT '4' "COL1"
 , TO_NUMBER('4') "COL2"
 , 4 "COL3"
  , TO_NUMBER('04') "COL4"
  FROM DUAL;
  --==>>4	4	4	4
  
  SELECT TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) "RESULT"
  FROM DUAL;
  --==>>
  
  --�� EXTRACT()
  SELECT TO_CHAR(SYSDATE, 'YYYY') "COL1" --2022(������)    �� ������ �����Ͽ� ���� Ÿ������ ��ȯ
  , TO_CHAR(SYSDATE, 'MM') "COL2"        --02(������)      �� ���� �����Ͽ� ���� Ÿ������ ��ȯ
  , TO_CHAR(SYSDATE, 'DD') "COL3"        --22(������)      �� �ϸ� �����Ͽ� ���� Ÿ������ ��ȯ
  , EXTRACT(YEAR FROM SYSDATE) "COL4"    --2022(������)    �� ������ �����Ͽ� ���� Ÿ������ ��ȯ
  , EXTRACT(MONTH FROM SYSDATE) "COL5"   --2(������)       �� ���� �����Ͽ� ���� Ÿ������ ��ȯ
  , EXTRACT(DAY FROM SYSDATE) "COL6"     --22(������)      �� �ϸ� �����Ͽ� ���� Ÿ������ ��ȯ
FROM DUAL;
--> ��, ��, �� �̿��� �ٸ� �׸��� �Ұ�~!!!


--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000 "COL1"
, TO_CHAR(60000, '99,999') "COL2"
, TO_CHAR(60000, '$99,999') "COL3"
, TO_CHAR(60000, 'L99,999') "COL4"
, LTRIM(TO_CHAR(60000, 'L99,999')) "RESULT"
FROM DUAL;


--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
SELECT SYSDATE "���� �ð�"
        , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "1��2�ð�3��4����"
FROM DUAL;
--==>>2022-02-22 16:48:45
--2022-02-23 18:51:49

--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
-- TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "���� �ð�"
, SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "���� �ð�" 
FROM DUAL;
--==>>
/*
2022-02-22 17:05:08	
2023-04-25 21:10:14
*/

--------------------------------------------------------------------------------

--�� CASE ����(���ǹ�, �б⹮)
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 4 THEN '5+2=4' ELSE '5+2�¸����' END
FROM DUAL;
--==>> 5+2�¸����

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2=6' END
FROM DUAL;
--==>> 5+2=7

SELECT CASE 1+1 
WHEN 2 THEN '1+1=2' 
WHEN 3 THEN '1+1=3' 
WHEN 4 THEN '1+1=4'
ELSE '�� ��� �Ⱦ�'
END "RESULT"
FROM DUAL;
--==>> 1+1=2

SELECT CASE WHEN 5+2=4 THEN '5+2=4' 
            WHEN 6-3=2 THEN '6-3=2'
            WHEN 7*1=8 THEN '7*1=8'
            WHEN 6/2=3 THEN '6/2=3'            
            ELSE '�𸣰ڳ�'
            END "���"
FROM DUAL;
--==>> 6/2=3


--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2�� �����') "RESULT"
FROM DUAL;
--==>>5-2=3

--�� CASE WHEN THEN ELSE END (���ǹ�, �б⹮) Ȱ��
SELECT CASE WHEN 5<2 THEN '5<2' 
            WHEN 5>2 THEN '5>2' 
            ELSE '5�� 2�� �񱳺Ұ�'
        END "RESULT"
FROM DUAL;
--==>>5>2


SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '��������' 
            WHEN 5>2 OR 2=3 THEN '��������' 
            ELSE 'ȣ������'
        END "RESULT"
FROM DUAL;


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5<2 AND 2=3 THEN '�̻踸��'
ELSE '��������'
END "RESULT"
FROM DUAL;

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=3 THEN '��������'
            WHEN 5<2 AND 2=3 THEN '�̻踸��'
ELSE '��������'
END "RESULT"
FROM DUAL;

--------------------------------------------------------------------------------
SELECT *
FROM TBL_SAWON;

--�� TBL_SAWON ���̺��� Ȱ���Ͽ�
-- ������ ���� �׸���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
-- �����ȣ, �����, �ֹι�ȣ, ����, �Ի���
SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ", HIREDATE"�Ի���"
,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����' 
      WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
ELSE '�𸣰���'
END "����"
FROM TBL_SAWON;
/*
1001	��μ�	9707251234567	2005-01-03	����
1002	������	9505152234567	1999-11-23	����
1003	������	9905192234567	2006-08-10	����
1004	�̿���	9508162234567	2007-10-10	����
1005	���̻�	9805161234567	2007-10-10	����
1006	������	8005132234567	1999-10-10	����
1007	������	0204053234567	2010-10-10	����
1008	������	6803171234567	1998-10-10	����
1009	������	6912232234567	1998-10-10	����
1010	���켱	0303044234567	2010-10-10	����
1011	������	0506073234567	2012-10-10	����
1012	���ù�	0208073234567	2012-10-10	����
1013	����	6712121234567	1998-10-10	����
1014	ȫ����	0005044234567	2015-10-10	����
1015	�Ӽҹ�	9711232234567	2007-10-10	����
1015	���̰�	0603194234567	2015-01-20	����
*/

--�� TBL_SAWON ���̺��� Ȱ���Ͽ�
-- ������ ���� �׸���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.
-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
--, ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�
-- ��, ���糪�̴� �⺻ �ѱ����� ������ ���� ������ �����Ѵ�.
-- ����, ������������ �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ���� 
-- �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
-- �׸���, ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
-- �� ������ ���� �޿� ���� 30% ����, 2000�� �̻� �ٹ��� �����
-- �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�.

--ex) 1001 ��μ� 9707251234567 ���� 26 2005-01-03 2056-01-03 212121 223232 3000 4500

SELECT SANO, SANAME, JUBUN
, CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
       WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
    ELSE '�����Ҹ�'
    END "����"
, EXTRACT(YEAR FROM SYSDATE)-(DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20')||SUBSTR(JUBUN,1,2))+1 "���糪��"
,HIREDATE "�Ի���"
,TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"
-- �������� = ���糯¥ + (60-���糪��)
-- �����ϼ� = �������� - ���糯¥
-- TO_DATE("��������"-SYSDATE) "�����ϼ�"
, TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE)-(DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20')||SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') || '-' || TO_CHAR(HIREDATE, 'MM-DD') "��������"
, TRUNC(TO_DATE((TO_CHAR(ADD_MONTHS(SYSDATE, (60-(EXTRACT(YEAR FROM SYSDATE)-(DECODE(SUBSTR(JUBUN,7,1),'1','19','2','19','20')||SUBSTR(JUBUN,1,2))+1))*12), 'YYYY') || '-' || TO_CHAR(HIREDATE, 'MM-DD')), 'YYYY-MM-DD') - SYSDATE)"�����ϼ�"
,SAL "�޿�"
, CASE WHEN TRUNC (SYSDATE - HIREDATE) >= 2000 THEN TO_CHAR(SAL/2)
ELSE 'Ȯ�κҸ�'
END "���ʽ�"
FROM TBL_SAWON;

-- ��������...
-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, �޿�...����
SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
      WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
      ELSE 'Ȯ�κҰ�'
      END "����"
-- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� / 2000���)     
,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1899) 
      WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1999)
      ELSE -1
      END "���糪��"
, HIREDATE "�Ի���"
, SAL "�޿�"
FROM TBL_SAWON;

SELECT T.ENAME, T.����*2
FROM
(
SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0)"����" 
FROM EMP
) T;

SELECT EMPNO, ENAME, SAL, COMM, SAL*12+NVL(COMM, 0)"����" 
FROM EMP;



-- ��������...
-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, �޿�...����
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.���糪��, T.�Ի���
-- ����������
-- ���������⵵ �� �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��
-- ���� ���̰�... 57��... 3�� ��    2022 �� 2025
-- ���� ���̰�... 28��... 32����    2022 �� 2054
-- ADD_MONTHS(SYSDATE, �������*12)
--                     --------
-- ADD_MONTHS(SYSDATE, (60-���糪��)*12) �� Ư����¥
-- TO_CHAR('Ư����¥','YYYY') �� �������� �⵵�� ���ڷ� ����
-- TO_CHAR(�Ի���, 'MM-DD')   �� �Ի� ���ϸ� ����Ÿ������ ����
-- TO_CHAR('Ư����¥','YYYY')||'-'||TO_CHAR(�Ի���, 'MM-DD') "����������"
-- TO_CHAR(ADD_MONTHS(SYSDATE, (60-���糪��)*12),'YYYY')||'-'||TO_CHAR(�Ի���, 'MM-DD') "����������"
  ,TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')||'-'||TO_CHAR(T.�Ի���, 'MM-DD') "����������"
  
  -- �ٹ��ϼ�
  -- �ٹ��ϼ� = ������ - �Ի���
  , TRUNC(SYSDATE - T.�Ի���) "�ٹ��ϼ�"
  
  -- �����ϼ�
  -- �����ϼ� = ���������� - ���糯¥
  ,TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')||'-'||TO_CHAR(T.�Ի���, 'MM-DD') ,'YYYY-MM-DD') - SYSDATE) "�����ϼ�"

  -- �޿�
  ,T.�޿�
  
  -- ���ʽ�
  -- �ٹ��ϼ��� 1000�� �̻� 2000�� �̸� �� ���� �޿��� 30% ����
  -- �ٹ��ϼ��� 2000�� �̻�             �� ���� �޿��� 50% ����
  -- ������                             �� 0
  -------------------------------------------------------------
  -- �ٹ��ϼ� 2000�� �̻�               �� T.�޿� * 0.5
  -- �ٹ��ϼ� 1000�� �̻�               �� T.�޿� * 0.3
  -- ������                             �� 0
  -------------------------------------------------------------
  , CASE WHEN TRUNC(SYSDATE-T.�Ի���) >= 2000 THEN T.�޿� * 0.5
         WHEN TRUNC(SYSDATE-T.�Ի���) >= 1000 THEN T.�޿� * 0.3
         ELSE 0
         END "���ʽ�"
FROM
(
    SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ", SAL "�޿�"
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
          WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
          ELSE 'Ȯ�κҰ�'
          END "����"
    -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� / 2000���)     
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1899) 
          WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1999)
          ELSE -1
          END "���糪��"
    , HIREDATE "�Ի���"
    FROM TBL_SAWON
) T;

/*
1001	��μ�	9707251234567	26	2005-01-03	2056-01-03	6260	12366	3000	1500
1002	������	9505152234567	28	1999-11-23	2054-11-23	8128	11960	4000	2000
1003	������	9905192234567	24	2006-08-10	2058-08-10	5676	13316	3000	1500
1004	�̿���	9508162234567	28	2007-10-10	2054-10-10	5250	11916	4000	2000
1005	���̻�	9805161234567	25	2007-10-10	2057-10-10	5250	13012	4000	2000
1006	������	8005132234567	43	1999-10-10	2039-10-10	8172	6437	1000	500
1007	������	0204053234567	21	2010-10-10	2061-10-10	4154	14473	3000	1500
1008	������	6803171234567	55	1998-10-10	2027-10-10	8537	2054	1500	750
1009	������	6912232234567	54	1998-10-10	2028-10-10	8537	2420	1300	650
1010	���켱	0303044234567	20	2010-10-10	2062-10-10	4154	14838	1600	800
1011	������	0506073234567	18	2012-10-10	2064-10-10	3423	15569	2600	1300
1012	���ù�	0208073234567	21	2012-10-10	2061-10-10	3423	14473	2600	1300
1013	����	6712121234567	56	1998-10-10	2026-10-10	8537	1689	2200	1100
1014	ȫ����	0005044234567	23	2015-10-10	2059-10-10	2328	13742	5200	2600
1015	�Ӽҹ�	9711232234567	26	2007-10-10	2056-10-10	5250	12647	5500	2750
1015	���̰�	0603194234567	17	2015-01-20	2065-01-20	2591	15671	1500	750
*/

--�� TBL_SAWON ���̺� ������ �߰� �Է�
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1017, '��ȣ��', '9611121234567', SYSDATE, 5000);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_SAWON;

--�� Ŀ�� �Ϸ�
COMMIT;


SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.���糪��, T.�Ի���, T.����
  ,TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')||'-'||TO_CHAR(T.�Ի���, 'MM-DD') "����������"
  ,TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')||'-'||TO_CHAR(T.�Ի���, 'MM-DD') ,'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
  ,T.�޿�
  , CASE WHEN TRUNC(SYSDATE-T.�Ի���) >= 2000 THEN T.�޿� * 0.5
         WHEN TRUNC(SYSDATE-T.�Ի���) >= 1000 THEN T.�޿� * 0.3
         ELSE 0
         END "���ʽ�"
FROM
(
    SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ", SAL "�޿�"
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
          WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
          ELSE 'Ȯ�κҰ�'
          END "����"
    -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� / 2000���)     
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1899) 
          WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1999)
          ELSE -1
          END "���糪��"
    , HIREDATE "�Ի���"
    FROM TBL_SAWON
) T;
/*
1001	��μ�	9707251234567	26	2005-01-03	2056-01-03	12366	3000	1500
1002	������	9505152234567	28	1999-11-23	2054-11-23	11960	4000	2000
1003	������	9905192234567	24	2006-08-10	2058-08-10	13316	3000	1500
1004	�̿���	9508162234567	28	2007-10-10	2054-10-10	11916	4000	2000
1005	���̻�	9805161234567	25	2007-10-10	2057-10-10	13012	4000	2000
1006	������	8005132234567	43	1999-10-10	2039-10-10	6437	1000	500
1007	������	0204053234567	21	2010-10-10	2061-10-10	14473	3000	1500
1008	������	6803171234567	55	1998-10-10	2027-10-10	2054	1500	750
1009	������	6912232234567	54	1998-10-10	2028-10-10	2420	1300	650
1010	���켱	0303044234567	20	2010-10-10	2062-10-10	14838	1600	800
1011	������	0506073234567	18	2012-10-10	2064-10-10	15569	2600	1300
1012	���ù�	0208073234567	21	2012-10-10	2061-10-10	14473	2600	1300
1013	����	6712121234567	56	1998-10-10	2026-10-10	1689	2200	1100
1014	ȫ����	0005044234567	23	2015-10-10	2059-10-10	13742	5200	2600
1015	�Ӽҹ�	9711232234567	26	2007-10-10	2056-10-10	12647	5500	2750
1015	���̰�	0603194234567	17	2015-01-20	2065-01-20	15671	1500	750
1017	��ȣ��	9611121234567	27	2022-02-23	2055-02-23	12052	5000	0
*/

-- ������ ó���� ������ �������
-- Ư�� �ٹ��ϼ��� ����� Ȯ���ؾ� �Ѵٰų�...
-- Ư�� ���ʽ� �ݾ��� �޴� ����� Ȯ���ؾ� �� ��찡 �߻��� �� �ִ�.
-- �̿� ���� ���... �ش� �������� �ٽ� �����ؾ��ϴ� ���ŷο��� ���� �� �ֵ���
-- ��(VIEW)�� ����� ������ �� �� �ִ�.


CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.���糪��, T.�Ի���, T.����
  ,TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')||'-'||TO_CHAR(T.�Ի���, 'MM-DD') "����������"
  ,TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.���糪��)*12),'YYYY')||'-'||TO_CHAR(T.�Ի���, 'MM-DD') ,'YYYY-MM-DD') - SYSDATE) "�����ϼ�"
  ,T.�޿�
  , CASE WHEN TRUNC(SYSDATE-T.�Ի���) >= 2000 THEN T.�޿� * 0.5
         WHEN TRUNC(SYSDATE-T.�Ի���) >= 1000 THEN T.�޿� * 0.3
         ELSE 0
         END "���ʽ�"
FROM
(
    SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ", SAL "�޿�"
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
          WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
          ELSE 'Ȯ�κҰ�'
          END "����"
    -- ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� / 2000���)     
    ,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1899) 
          WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
          THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1999)
          ELSE -1
          END "���糪��"
    , HIREDATE "�Ի���"
    FROM TBL_SAWON
) T;
--==>> �����߻�
--() �� ���� ����

--�� SYS�� ���� CREATE VIEW ������ �ο����� ���� �ٽ� ����
--==>> View VIEW_SAWON��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_SAWON;

SELECT *
FROM VIEW_SAWON
WHERE �����ϼ� >= 10000;

--�� TBL_SAWON ���̺� ������ �߰� �Է�
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1018, '�Ž���', '9910312234567', SYSDATE, 5000);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM VIEW_SAWON;


--�� ���������� Ȱ���Ͽ�
-- TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
-------------------------------------------
�����  ����  ���糪��  �޿�  ���̺��ʽ�
-------------------------------------------

��, ���� ���ʽ��� ���� ���̰� 50�� �̻��̸� �޿��� 70%
    40�� �̻� 50�� �̸��̸� �޿��� 50%
    20�� �̻� 40�� �̸��̸� �޿��� 30% �� �Ѵ�.

����, �ϼ��� ��ȸ ������ ����
VIEW_SAWON2 ��� �̸��� ��(VIEW) �� �����Ѵ�.
*/
CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.�����, T.����, T.���糪��, T.�޿�
, CASE WHEN T.���糪�� > 50 THEN T.�޿� * 0.7
       WHEN T.���糪�� >= 40 THEN T.�޿� * 0.5
       WHEN T.���糪�� >= 20 THEN T.�޿� * 0.3
       ELSE 0
       END "���� ���ʽ�"
FROM(
SELECT SANAME"�����"
, CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','3') THEN '����'
       WHEN SUBSTR(JUBUN,7,1) IN ('2','4') THEN '����'
       ELSE '�˼�����'
       END "����"
,CASE WHEN SUBSTR(JUBUN,7,1) IN ('1','2')
      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1899) 
      WHEN SUBSTR(JUBUN,7,1) IN ('3','4')
      THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999) --����⵵ - (�ֹι�ȣ�յ��ڸ�+1999)
      ELSE -1
      END "���糪��" 
, SAL"�޿�"
FROM TBL_SAWON
) T;

SELECT *
FROM VIEW_SAWON2;
/*
��μ�	����	26	3000	900
������	����	28	4000	1200
������	����	24	3000	900
�̿���	����	28	4000	1200
���̻�	����	25	4000	1200
������	����	43	1000	500
������	����	21	3000	900
������	����	55	1500	1050
������	����	54	1300	910
���켱	����	20	1600	480
������	����	18	2600	0
���ù�	����	21	2600	780
����	����	56	2200	1540
ȫ����	����	23	5200	1560
�Ӽҹ�	����	26	5500	1650
���̰�	����	17	1500	0
��ȣ��	����	27	5000	1500
�Ž���	����	24	5000	1500
*/


--------------------------------------------------------------------------------

--�� RANK() �� ���(����)�� ��ȯ�ϴ� �Լ�

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����" --��������
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

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"
     , RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����" --��������
FROM EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"
     , RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����" --��������
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

--�� DENSE_RANK() �� ������ ��ȯ�ϴ� �Լ�
SELECT EMPNO "�����ȣ", ENAME "�����", DEPTNO "�μ���ȣ", SAL "�޿�"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "�μ����޿�����"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "��ü�޿�����" --��������
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


--�� EMP ���̺��� ��� �����͸�
-- �����, �μ���ȣ, ����, �μ�����������, ��ü�������� �׸����� ��ȸ�Ѵ�.

SELECT ENAME"�����", DEPTNO"�μ���ȣ"
, (SAL * 12) + NVL(COMM,0)"����"
, RANK() OVER(PARTITION BY DEPTNO ORDER BY ((SAL * 12) + NVL(COMM,0)) DESC) "�μ�����������"
, RANK() OVER(ORDER BY ((SAL * 12) + NVL(COMM,0)) DESC)"��ü��������"
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
SELECT T.�����, T.�μ���ȣ, T.����
, RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC) "�μ�����������"
, RANK() OVER(ORDER BY T.���� DESC)"��ü��������"
FROM 
(
SELECT ENAME"�����", DEPTNO"�μ���ȣ", (SAL * 12) + NVL(COMM,0)"����"
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

--�� EMP ���̺��� ��ü ���� ���(����)�� 1����� 5�������...
-- �����, �μ���ȣ, ����, ��ü�������� �׸����� ��ȸ�Ѵ�.

SELECT T.�����, T.�μ���ȣ, T.����, T.��ü��������
FROM 
(
    SELECT ENAME"�����", DEPTNO"�μ���ȣ"
    , (SAL * 12) + NVL(COMM,0)"����"
    ,DENSE_RANK() OVER(ORDER BY (SAL * 12) + NVL(COMM,0) DESC)"��ü��������"
    FROM EMP
)T
WHERE T.��ü�������� <= 5;
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	3
BLAKE	30	34200	4
CLARK	10	29400	5
*/
--==>> ���� �߻�
--(ORA-30483:window fuction are not allowed here)

-- �� ���� ������ RANK() OVER() �� ���� �м� �Լ��� WHERE ������ ����� ����̸�...
-- �� �Լ��� WHERE ���������� ����� �� ���� ������ �߻��ϴ� �����̴�.
-- �� ���, �츮�� INLINE VIEW �� Ȱ���ؼ� Ǯ���ؾ� �Ѵ�. 

--�� EMP ���̺��� �� �μ����� ��������� 1����� 2������� ��ȸ�Ѵ�.
-- �����, �μ���ȣ, ����, �μ����������, ��ü�������
-- �׸��� ��ȸ�� �� �ֵ��� �������� �����Ѵ�. 
SELECT T.�����, T.�μ���ȣ, T.����, T.��ü�������, T.�μ����������
FROM 
(
    SELECT ENAME"�����", DEPTNO"�μ���ȣ", (SAL*12)+NVL(COMM,0)"����"
    ,RANK() OVER(ORDER BY (SAL*12)+NVL(COMM,0) DESC) "��ü�������"
    ,RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12)+NVL(COMM,0) DESC)"�μ����������"
    FROM EMP
)T
WHERE T.�μ���������� IN (1,2)
ORDER BY T.�μ���ȣ;

--------------------------------------------------------------------------------
--���� �׷� �Լ� ����--
-- SUM() ��, AVG() ���, COUNT() ī��Ʈ, MAX() �ִ밪, MIN() �ּҰ�
--, VERIENCE() �л�, STDDEV() ǥ������

--�� �׷� �Լ��� ���� ū Ư¡
-- ó���ؾ� �� �����͵� �� NULL �� �����Ѵٸ�(���ԵǾ� �ִٸ�)
-- �� NULL �� ������ ���·� ������ �����Ѵٴ� ���̴�. 
-- ��, �׷� �Լ��� �۵��ϴ� �������� NULL �� ������ ��󿡼� ���ܵȴ�.

--�� SUM() ��
-- EMP ���̺��� ������� ��ü ������� �޿� ������ ��ȸ�Ѵ�.
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
--==>> �����߻�
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


--�� COUNT() ��(���ڵ�)�� ���� ��ȸ �� �����Ͱ� �� ������ Ȯ��...
SELECT COUNT(ENAME)
FROM EMP;
--==>>14

SELECT COUNT(COMM) -- COMM �÷� ���� ���� ��ȸ �� NULL�� ����~!!
FROM EMP;;
--==>>4

SELECT COUNT(*)
FROM EMP;
--==>>14


--�� AVG() ��� ��ȯ
SELECT SUM(SAL) / COUNT(SAL) "RESULT1" --2073.214285714285714285714285714285714286
, AVG(SAL) "RESULT2" --2073.214285714285714285714285714285714286
FROM EMP;

SELECT SUM(COMM) / COUNT(COMM) "RESULT1" --550
, AVG(COMM) "RESULT2"                    --550
FROM EMP;

SELECT SUM(COMM) / COUNT(*) "RESULT"
FROM EMP;
--==>> 157.142857142857142857142857142857142857

--�� �����Ͱ� NULL �� �÷��� ���ڵ�� ���� ��󿡼� ���ܵǱ� ������
-- �����Ͽ� ���� ó���ؾ� �Ѵ�.

--�� VARIANCE(), STDDEV()
-- �� ǥ�������� ������ �л�, �л��� �������� ǥ������

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

--�� MAX() / MIN()
-- �ִ밪 �ּҰ�
SELECT MAX(SAL) "RESULT1"
      ,MIN(SAL) "RESULT2"
FROM EMP;
--==>>5000	800


--�� ����
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> �����߻�
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



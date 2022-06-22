SELECT USER
FROM DUAL;
--==>> SCOTT

--���� UNION / UNION ALL ����--

--�� �ǽ� ���̺� ����(TBL_JUMUN)
CREATE TABLE TBL_JUMUN              --�ֹ� ���̺� ����
( JUNO      NUMBER                  --�ֹ� ��ȣ
, JECODE    VARCHAR2(30)            --�ֹ��� ��ǰ �ڵ�
, JUSU      NUMBER                  --�ֹ� ����
, JUDAY     DATE DEFAULT SYSDATE    --�ֹ� ����
);
--==>>Table TBL_JUMUN��(��) �����Ǿ����ϴ�.
--> ���� �ֹ��� �߻�(����)�Ǿ��� ���
-- �ֹ� ���뿡 ���� �����Ͱ� �Էµ� �� �ִ� ���̺�

--�� ������ �Է� �� ���� �ֹ� �߻�(����)
INSERT INTO TBL_JUMUN VALUES
(1, '������', 20, TO_DATE('2001-11-01 09:10:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(2, '�ž�', 10, TO_DATE('2001-11-01 10:20:30', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(3, '��˽�', 30, TO_DATE('2001-11-01 11:10:05', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(4, '������', 10, TO_DATE('2001-11-02 13:20:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(5, '������', 20, TO_DATE('2001-11-05 07:30:22', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(6, 'Ȩ����', 70, TO_DATE('2001-11-06 15:20:34', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(7, '����', 50, TO_DATE('2001-11-07 11:10:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(8, '��īĨ', 20, TO_DATE('2001-11-07 19:42:53', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(9, '��īĨ', 20, TO_DATE('2001-11-08 19:42:53', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(10, '��īĨ', 20, TO_DATE('2001-11-09 11:12:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(11, '����', 50, TO_DATE('2001-11-10 12:12:23', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(12, '����', 40, TO_DATE('2001-11-11 08:09:10', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(13, 'Ȩ����', 60, TO_DATE('2001-11-12 09:10:11', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(14, '������', 20, TO_DATE('2001-11-13 10:11:12', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(15, 'Ȩ����',70, TO_DATE('2001-11-14 11:12:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(16, 'Ȩ����',80, TO_DATE('2001-11-15 12:13:14', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(17, 'Ȩ����',90, TO_DATE('2001-11-16 13:14:15', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(18, '������',10, TO_DATE('2001-11-17 14:15:16', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(19, '������',20, TO_DATE('2001-11-19 15:16:17', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_JUMUN VALUES
(20, '������',30, TO_DATE('2001-11-20 16:17:18', 'YYYY-MM-DD HH24:MI:SS'));

--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 20

--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>Session��(��) ����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;
/*
1	������	20	2001-11-01 09:10:12
2	�ž�	10	2001-11-01 10:20:30
3	��˽�	30	2001-11-01 11:10:05
4	������	10	2001-11-02 13:20:11
5	������	20	2001-11-05 07:30:22
6	Ȩ����	70	2001-11-06 15:20:34
7	����	50	2001-11-07 11:10:13
8	��īĨ	20	2001-11-07 19:42:53
9	��īĨ	20	2001-11-08 19:42:53
10	��īĨ	20	2001-11-09 11:12:23
11	����	50	2001-11-10 12:12:23
12	����	40	2001-11-11 08:09:10
13	Ȩ����	60	2001-11-12 09:10:11
14	������	20	2001-11-13 10:11:12
15	Ȩ����	70	2001-11-14 11:12:13
16	Ȩ����	80	2001-11-15 12:13:14
17	Ȩ����	90	2001-11-16 13:14:15
18	������	10	2001-11-17 14:15:16
19	������	20	2001-11-19 15:16:17
20	������	30	2001-11-20 16:17:18
*/

--�� Ŀ��
COMMIT;
--==>>Ŀ�� �Ϸ�.


--�� �߰� ������ �Է� �� 2001�� ���� ���۵� �ֹ��� ����(2022��)���� ��� �߻�~!!!
INSERT INTO TBL_JUMUN VALUES(98764, '����', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98765, '������', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98766, '������', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98767, 'Ȩ����', 40, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98768, '������', 50, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98769, '���Ͻ�', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98770, '����', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98771, '������', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98772, '���Ͻ�', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98773, '������', 90, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98774, '���̽�', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98775, '����Ĩ', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--==>>
/*
1	    ������	20	2001-11-01 09:10:12
2	    �ž�	10	2001-11-01 10:20:30
3	    ��˽�	30	2001-11-01 11:10:05
4	    ������	10	2001-11-02 13:20:11
5	    ������	20	2001-11-05 07:30:22
6	    Ȩ����	70	2001-11-06 15:20:34
7	    ����	50	2001-11-07 11:10:13
8	    ��īĨ	20	2001-11-07 19:42:53
9	    ��īĨ	20	2001-11-08 19:42:53
10	    ��īĨ	20	2001-11-09 11:12:23
11	    ����	50	2001-11-10 12:12:23
12	    ����	40	2001-11-11 08:09:10
13	    Ȩ����	60	2001-11-12 09:10:11
14	    ������	20	2001-11-13 10:11:12
15	    Ȩ����	70	2001-11-14 11:12:13
16	    Ȩ����	80	2001-11-15 12:13:14
17	    Ȩ����	90	2001-11-16 13:14:15
18	    ������	10	2001-11-17 14:15:16
19	    ������	20	2001-11-19 15:16:17
20	    ������	30	2001-11-20 16:17:18
98764	����	10	2022-03-02 09:39:35
98765	������	20	2022-03-02 09:39:37
98766	������	30	2022-03-02 09:39:39
98767	Ȩ����	40	2022-03-02 09:39:40
98768	������	50	2022-03-02 09:39:42
98769	���Ͻ�	30	2022-03-02 09:39:44
98770	����	20	2022-03-02 09:39:46
98771	������	20	2022-03-02 09:39:48
98772	���Ͻ�	20	2022-03-02 09:39:50
98773	������	90	2022-03-02 09:39:52
98774	���̽�	20	2022-03-02 09:39:54
98775	����Ĩ	30	2022-03-02 09:39:56
*/

SELECT *
FROM TBL_JUMUN;

ROLLBACK; -- ���� �߸��ż� �ٽ� �ѹ� > ������ �Է� > Ȯ�� > Ŀ��

--�� Ŀ��
COMMIT;

--�� ��Ⱑ ���� ���θ� � ��...
-- TBL_JUMUN ���̺��� �ʹ� ���ſ��� ��Ȳ
-- ���ø����̼ǰ��� �������� ���� �ֹ� ������ �ٸ� ���̺�
-- ����� �� �ֵ��� ����� ���� �Ұ����� ��Ȳ
-- �⺻�� ��� �����͸� ������� ����� �͵� �Ұ����� ��Ȳ
-- �� ���������...
-- ������� ������ �ֹ� �����͵� ��
-- ���� �߻��� �ֹ� ������ �����ϰ�
-- ������ �����͸� �ٸ� ���̺�(TBL_JUMUNBACKUP)�� ������ �̰��� ������ ��ȹ

CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');
--                                        -------
--                                  2022-03=02 10:09:38
--                                  -------------------
--                                      2022-03-02
--==>> Table TBL_JUMUNBACKUP��(��) �����Ǿ����ϴ�.
--==>> Table TNL_JUMUNBACKUP��(��) �����Ǿ����ϴ�. < �̰� �����ؾ���

SELECT *
FROM TBL_JUMUNBACKUP;
--==>> 
/*
1	������	20	2001-11-01 09:10:12
2	�ž�	10	2001-11-01 10:20:30
3	��˽�	30	2001-11-01 11:10:05
4	������	10	2001-11-02 13:20:11
5	������	20	2001-11-05 07:30:22
6	Ȩ����	70	2001-11-06 15:20:34
7	����	50	2001-11-07 11:10:13
8	��īĨ	20	2001-11-07 19:42:53
9	��īĨ	20	2001-11-08 19:42:53
10	��īĨ	20	2001-11-09 11:12:23
11	����	50	2001-11-10 12:12:23
12	����	40	2001-11-11 08:09:10
13	Ȩ����	60	2001-11-12 09:10:11
14	������	20	2001-11-13 10:11:12
15	Ȩ����	70	2001-11-14 11:12:13
16	Ȩ����	80	2001-11-15 12:13:14
17	Ȩ����	90	2001-11-16 13:14:15
18	������	10	2001-11-17 14:15:16
19	������	20	2001-11-19 15:16:17
20	������	30	2001-11-20 16:17:18
*/
--> TBL_JUMUN ���̺��� �����͵� ��
-- ���� �ֹ� ���� �̿��� �����ʹ� ��� TBL_JUMUNBACKUP ���̺�
-- ����� ��ģ ����

-- TBL_JUMUN ���̺��� �����͵� �� 
-- ����� ��ģ �����͵� ���� �� ��, ���� �߻��� �ֹ� ������ �ƴ� �����͵� ����
DELETE 
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY,'YYYY-MM-DD') != TO_CHAR(SYSDATE,'YYYY-MM-DD');
--==>> 20�� �� ��(��) �����Ǿ����ϴ�.

-- Ȯ��
SELECT *
FROM TBL_JUMUN;
--==>>
/*
98764	����	10	2022-03-02 09:39:35
98765	������	20	2022-03-02 09:39:37
98766	������	30	2022-03-02 09:39:39
98767	Ȩ����	40	2022-03-02 09:39:40
98768	������	50	2022-03-02 09:39:42
98769	���Ͻ�	30	2022-03-02 09:39:44
98770	����	20	2022-03-02 09:39:46
98771	������	20	2022-03-02 09:39:48
98772	���Ͻ�	20	2022-03-02 09:39:50
98773	������	90	2022-03-02 09:39:52
98774	���̽�	20	2022-03-02 09:39:54
98775	����Ĩ	30	2022-03-02 09:39:56
*/

--��Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� ���� ��ǰ �߼��� �̷������ ���� ���� �ֹ� �����͸� �����ϰ�
-- ������ ��� �ֹ� �����͵��� ������ ��Ȳ�̹Ƿ�
-- ���̺��� ��(���ڵ�)�� ������ �پ��� �ſ� �������� ��Ȳ�̴�.

SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;

-- �׷���, ���ݱ��� �ֹ����� ������ ���� ������
-- ��ǰ�� �� �ֹ������� ��Ÿ����� �� ��Ȳ�� �߻��ϰ� �Ǿ���.
-- �׷��ٸ�, TBL_JUMUNBACKUP ���̺��� ���ڵ�(��)��
-- TBL_JUMUN ���̺��� ���ڵ�(��)�� ���ļ�
-- �ϳ��� ���̺��� ��ȸ�ϴ� �Ͱ� ���� ����� Ȯ���� �� �ֵ���
-- ��ȸ�� �̷������ �Ѵ�.

--�� �÷��� �÷��� ���踦 ����Ͽ� ���̺��� �����ϰ��� �ϴ� ���
-- JOIN�� ���������
-- ���ڵ�� ���ڵ带 �����ϰ��� �ϴ� ���
-- UNION / UNION ALL �� ����� �� �ִ�.


SELECT *
FROM TBL_JUMUNBACKUP;
SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT *
FROM TBL_JUMUN;

SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT *
FROM TBL_JUMUN;

-- �� UNION�� �׻� ������� ù ��° �÷��� ��������
-- �������� ������ �����Ѵ�.
-- UNION ALL �� ���յ� �������(���̺��� ���������� ����� �������)
-- ��ȸ�� ����� ��ȯ�Ѵ�.(��, ���� ��� ����)
-- �̷� ���� UNION�� ���ϰ� �� ũ��.(���ҽ� �Ҹ� �� ũ��.)
-- ����, UNION�� ������� �ߺ��� ���� ������ ���
-- �ߺ��� �����ϰ� 1�� �ุ ��ȸ�� ����� ��ȯ�ϰ� �ȴ�. 

--�� ���ݱ��� �ֹ����� �����͸� ����
-- ��ǰ�� �� �ֹ����� ��ȸ�� �� �ִ� �������� �����Ѵ�.
SELECT T.JECODE, SUM(T.JUSU)
FROM(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T
GROUP BY T.JECODE;
--==>>
/*
������	40
����Ĩ	30
������	10
������	50
���Ͻ�	50
���̽�	20
��īĨ	60
������	50
�ž�	10
��˽�	30
������	190
Ȩ����	410
����	170
*/

SELECT JECODE, SUM(JUSU)
FROM TBL_JUMUN
GROUP BY JECODE;

SELECT *
FROM TBL_JUMUN;

--�� ������ �߰� �Է�
INSERT INTO TBL_JUMUN VALUES (98776,'��˽�', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
SELECT *
FROM TBL_JUMUN;
/*
98764	����	10	2022-03-02 09:39:35
98765	������	20	2022-03-02 09:39:37
98766	������	30	2022-03-02 09:39:39
98767	Ȩ����	40	2022-03-02 09:39:40
98768	������	50	2022-03-02 09:39:42
98769	���Ͻ�	30	2022-03-02 09:39:44
98770	����	20	2022-03-02 09:39:46
98771	������	20	2022-03-02 09:39:48
98772	���Ͻ�	20	2022-03-02 09:39:50
98773	������	90	2022-03-02 09:39:52
98774	���̽�	20	2022-03-02 09:39:54
98775	����Ĩ	30	2022-03-02 09:39:56
98776	��˽�	30	2022-03-02 11:28:16
*/

--�� Ŀ��
COMMIT;
--==>>Ŀ�� �Ϸ�.

--�� INTERSECT / MINUS(�� �����հ� ������)

-- TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺���
-- ��ǰ�ڵ�� �ֹ������� ���� �Ȱ��� �ุ �����ϰ��� �Ѵ�.

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
--==>>
/*
��˽�	30
������	20
*/

--�� TBL_JUMUNBACKUP ���̺�� TBL_JUMUN ���̺��� �������
-- ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� ���� ������ 
-- �ֹ���ȣ, ��ǰ�ڵ�, �ֹ���, �ֹ����� �׸����� ��ȸ�Ѵ�.
SELECT T1.��ǰ��ȣ, T2.��ǰ�ڵ�, T2.�ֹ���, T1.�ֹ�����
FROM
(
    SELECT JUNO"��ǰ��ȣ", JECODE"��ǰ�ڵ�", JUSU"�ֹ���", JUDAY"�ֹ�����"
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT *
    FROM TBL_JUMUN
)T1,
(
    SELECT JECODE"��ǰ�ڵ�", JUSU"�ֹ���"
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T2
WHERE T1.��ǰ�ڵ� = T2.��ǰ�ڵ� AND T1.�ֹ��� = T2.�ֹ���;

-- ���1
SELECT T1.JUNO"��ǰ��ȣ", T2.JECODE"��ǰ�ڵ�", T2.JUSU"�ֹ���", T1.JUDAY"�ֹ�����"
FROM
(
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T1 
JOIN
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)T2
ON T1.JECODE = T2.JECODE AND T1.JUSU = T2.JUSU;
/*
1	������	20	2001-11-01 09:10:12
3	��˽�	30	2001-11-01 11:10:05
19	������	20	2001-11-19 15:16:17
98765	������	20	2022-03-02 09:39:37
98776	��˽�	30	2022-03-02 11:28:16
*/

--��� 2.

SELECT T.*
FROM
(
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE T.JECODE IN ('������','��˽�')
  AND T.JUSU IN (20,30);
  /*
1	    ������	20	2001-11-01 09:10:12
3	    ��˽�	30	2001-11-01 11:10:05
19	    ������	20	2001-11-19 15:16:17
20	    ������	30	2001-11-20 16:17:18
98781	������	30	2022-03-02 14:13:55
98765	������	20	2022-03-02 09:39:37
98776	��˽�	30	2022-03-02 11:28:16
  */
  
SELECT *
FROM TBL_JUMUN;

--�� ������ �߰� �Է�
INSERT INTO TBL_JUMUN VALUES(98777, '��˽�', 10, SYSDATE);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98778, '������', 40, SYSDATE);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98779, '������', 20, SYSDATE);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98780, '��˽�', 20, SYSDATE);
--==>>1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_JUMUN VALUES(98781, '������', 30, SYSDATE);

--==>>
/*
98778	������	40	2022-03-02 14:08:43
98779	������	20	2022-03-02 14:09:15
98780	��˽�	20	2022-03-02 14:13:53
98781	������	30	2022-03-02 14:13:55
98764	����	10	2022-03-02 09:39:35
98765	������	20	2022-03-02 09:39:37
98766	������	30	2022-03-02 09:39:39
98767	Ȩ����	40	2022-03-02 09:39:40
98768	������	50	2022-03-02 09:39:42
98769	���Ͻ�	30	2022-03-02 09:39:44
98770	����	20	2022-03-02 09:39:46
98771	������	20	2022-03-02 09:39:48
98772	���Ͻ�	20	2022-03-02 09:39:50
98773	������	90	2022-03-02 09:39:52
98774	���̽�	20	2022-03-02 09:39:54
98775	����Ĩ	30	2022-03-02 09:39:56
98776	��˽�	30	2022-03-02 11:28:16
98777	��˽�	10	2022-03-02 14:08:04
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT T.*
FROM
(
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE T.JECODE IN ('������','��˽�')
  AND T.JUSU IN (20,30);
  
  
--------------------------------------------------------------------------------
--�� TBL_JUMUN_scott.sql ������ ���� ������ ����~!!!
--------------------------------------------------------------------------------

SELECT JUSU,JECODE
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JUSU,JECODE
FROM TBL_JUMUN;
/*
20	������
30	��˽�
30	������
*/


-- ���1
SELECT T1.JUNO"��ǰ��ȣ", T2.JECODE"��ǰ�ڵ�", T2.JUSU"�ֹ���", T1.JUDAY"�ֹ�����"
FROM
(
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T1 
JOIN
(
    SELECT JECODE,JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE,JUSU
    FROM TBL_JUMUN
)T2
ON T1.JECODE = T2.JECODE AND T1.JUSU = T2.JUSU;
/*
1	������	20	2001-11-01 09:10:12
3	��˽�	30	2001-11-01 11:10:05
19	������	20	2001-11-19 15:16:17
20	������	30	2001-11-20 16:17:18
98781	������	30	2022-03-02 14:13:47
98765	������	20	2022-03-02 09:30:30
98776	��˽�	30	2022-03-02 11:28:12
*/

--��� 2.

SELECT T.*
FROM
(
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE T.JECODE IN ('������','��˽�')
  AND T.JUSU IN (20,30);
  --==>>
  /*
1	    ������	20	2001-11-01 09:10:12     ��
3	    ��˽�	30	2001-11-01 11:10:05     ��
19	    ������	20	2001-11-19 15:16:17     ��
20	    ������	30	2001-11-20 16:17:18     ��
98780	��˽�	20	2022-03-02 14:13:43         CHECK~!!
98781	������	30	2022-03-02 14:13:47     ��
98765	������	20	2022-03-02 09:30:30     ��
98776	��˽�	30	2022-03-02 11:28:12     ��
  */

SELECT T.*
FROM
(
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE CONCAT (T.JECODE, T.JUSU) IN ('������20','������30','��˽�30');
/*
1	    ������	20	2001-11-01 09:10:12
3	    ��˽�	30	2001-11-01 11:10:05
19	    ������	20	2001-11-19 15:16:17
20	    ������	30	2001-11-20 16:17:18
98781	������	30	2022-03-02 14:13:47
98765	������	20	2022-03-02 09:30:30
98776	��˽�	30	2022-03-02 11:28:12
*/

SELECT T.*
FROM
(
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO,JECODE,JUSU,JUDAY
    FROM TBL_JUMUN
)T
WHERE CONCAT (T.JECODE, T.JUSU) 
          IN (
              SELECT CONCAT(JECODE, JUSU)
              FROM TBL_JUMUNBACKUP
              INTERSECT
              SELECT CONCAT(JECODE, JUSU)
              FROM TBL_JUMUN
          );
--==>> 
/*
1	    ������	20	2001-11-01 09:10:12
3	    ��˽�	30	2001-11-01 11:10:05
19	    ������	20	2001-11-19 15:16:17
20	    ������	30	2001-11-20 16:17:18
98781	������	30	2022-03-02 14:13:47
98765	������	20	2022-03-02 09:30:30
98776	��˽�	30	2022-03-02 11:28:12
*/

--------------------------------------------------------------------------------

--�� TBL_EMP ���̺��� �޿��� ���� ���� �����
-- �����ȣ, �����, ������, �޿� �׸��� ��ȸ�ϴ� �������� �����Ѵ�.

-- ��������
SELECT MAX(SAL+NVL(COMM,0))
FROM TBL_EMP;

SELECT EMPNO, ENAME, JOB, SAL+NVL(COMM,0)
FROM TBL_EMP 
WHERE SAL = (SELECT MAX(SAL+NVL(COMM,0))
             FROM TBL_EMP);
--==>>7839	KING	PRESIDENT	5000

--��=ANY��
--��=ALL��

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL = ALL(800,1600,1250,2975,1250,2850,1450,3000);
--==> ��ȸ ��� ����

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL >= ALL(SELECT SAL FROM TBL_EMP);
--==>7839	KING	PRESIDENT	5000
-- �ε�ȣ�� ALL() ��ȣ �ȿ� ���� �� �� ã��

--��TBL_EMP ���̺��� 20�� �μ��� �ٹ��ϴ� ��� ��
-- �޿��� ���� ���� ����� 
-- �����ȣ, �����, ������, �޿� �׸��� ��ȸ�ϴ� �������� �����Ѵ�.

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE SAL >= (SELECT SAL FROM TBL_EMP);

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM TBL_EMP
WHERE SAL >= ALL(
            SELECT SAL 
            FROM TBL_EMP 
            WHERE DEPTNO = 20) 
      AND DEPTNO = 20;
 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM TBL_EMP
WHERE SAL >=(
            SELECT MAX(SAL) 
            FROM TBL_EMP 
            WHERE DEPTNO = 20) 
      AND DEPTNO = 20;    
      
--�� TBL_EMP ���̺��� ����(Ŀ�̼�:COMM)�� ���� ���� �����
-- �����ȣ, �����, �μ���ȣ, ������, Ŀ�̼� �׸��� �����Ѵ�.

SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >= ALL(SELECT NVL(COMM,0)
                  FROM TBL_EMP);

SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >= (SELECT MAX(NVL(COMM,0))
               FROM TBL_EMP);
               
SELECT EMPNO, ENAME, DEPTNO, JOB, COMM
FROM TBL_EMP
WHERE COMM >= ALL(SELECT COMM
               FROM TBL_EMP
               WHERE COMM IS NOT NULL);
--==>>7654	MARTIN	30	SALESMAN	1400             

--�� DISTINCT() �ߺ� ��(���ڵ�)�� �����ϴ� �Լ�            
SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE EMPNO = (�����ڷ� ��ϵ� ��ȣ);

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE EMPNO IN (SELECT MGR FROM EMP);
--==>>
/*
7566	JONES	MANAGER
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7788	SCOTT	ANALYST
7839	KING	PRESIDENT
7902	FORD	ANALYST
*/

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE EMPNO IN (SELECT DISTINCT(MGR) FROM EMP);
--==>>
/*
7566	JONES	MANAGER
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7788	SCOTT	ANALYST
7839	KING	PRESIDENT
7902	FORD	ANALYST
*/

SELECT DISTINCT(JOB)
FROM EMP;
--==>>
/*
CLERK
SALESMAN
PRESIDENT
MANAGER
ANALYST
*/

SELECT DISTINCT(DEPTNO)
FROM EMP;
/*
30
20
10
*/

--------------------------------------------------------------------------------
--�� JOIN �߰� �� NATUAL JOIN
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E 
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>>
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	    WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP  
JOIN DEPT;
--==>> ���� �߻�
-- (ORA-00905: missing keyword)

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP  
NATURAL JOIN DEPT;
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	    WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP  
JOIN DEPT
USING(DEPTNO);
--==>>
/*
10	ACCOUNTING	CLARK	2450
10	ACCOUNTING	KING	5000
10	ACCOUNTING	MILLER	1300
20	RESEARCH	JONES	2975
20	RESEARCH	FORD	3000
20	RESEARCH	ADAMS	1100
20	RESEARCH	SMITH	800
20	RESEARCH	SCOTT	3000
30	SALES	    WARD	1250
30	SALES	    TURNER	1500
30	SALES	    ALLEN	1600
30	SALES	    JAMES	950
30	SALES	    BLAKE	2850
30	SALES	    MARTIN	1250
*/

--------------------------------------------------------------------------------

--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT TO_CHAR(HIREDATE, 'YYYY-MM-DD'), SAL
FROM TBL_SAWON;

SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	��μ�	9707251234567	2005-01-03 00:00:00	3000
1002	������	9505152234567	1999-11-23 00:00:00	4000
1003	������	9905192234567	2006-08-10 00:00:00	3000
1004	�̿���	9508162234567	2007-10-10 00:00:00	4000
1005	���̻�	9805161234567	2007-10-10 00:00:00	4000
1006	������	8005132234567	1999-10-10 00:00:00	1000
1007	������	0204053234567	2010-10-10 00:00:00	3000
1008	������	6803171234567	1998-10-10 00:00:00	1500
1009	������	6912232234567	1998-10-10 00:00:00	1300
1010	���켱	0303044234567	2010-10-10 00:00:00	1600
1011	������	0506073234567	2012-10-10 00:00:00	2600
1012	���ù�	0208073234567	2012-10-10 00:00:00	2600
1013	����	6712121234567	1998-10-10 00:00:00	2200
1014	ȫ����	0005044234567	2015-10-10 00:00:00	5200
1015	�Ӽҹ�	9711232234567	2007-10-10 00:00:00	5500
1015	���̰�	0603194234567	2015-01-20 00:00:00	1500
1017	��ȣ��	9611121234567	2022-02-23 14:06:28	5000
1018	�Ž���	9910312234567	2022-02-23 14:39:38	5000
*/

--�� TBL_SAWON ���̺� ���(������ ����) �� �� ���̺� ���� ���質 �������� ���� ����
CREATE TABLE TBL_SAWONBACKUP
AS
SELECT SANO, SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWONBACKUP;

--�� ������ Ȱ��... ����... ���� ���·� ���...

--�� ������ ����
UPDATE TBL_SAWON
SET SANAME = '�ʶ���';
COMMIT;

SELECT *
FROM TBL_SAWON;

-- ������ ����(UPDATE) �� �ҿ�������
UPDATE TBL_SAWON
SET SANAME = (SELECT SANAME 
              FROM TBL_SAWONBACKUP 
              WHERE SANO = TBL_SAWON.SANO)
WHERE SANAME='�ʶ���';
--==>> 18�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

-- 1015�� ����� �� �� �־ �߻��ϴ� �����̰�...

SELECT *
FROM TBL_SAWON;

COMMIT;

-- ���־�~ �ذ�ȰŴ�~
SELECT USER
FROM DUAL;

SELECT *
FROM TBL_INSA;


--�� 20220308_05_scott(plsql).sql ���Ͽ���
-- FN_GENDER() �Լ� ���� �� 
-- TBL_INSA ���̺��� ������� �ֹι�ȣ(SSN)�� ������ ���� ��ȸ

SELECT NAME, SSN, FN_GENDER(SSN) "����"
FROM TBL_INSA;
--==>>
/*
������
*/

SELECT FN_GENDER('751212-1234567')
FROM TBL_INSA;
--==>> ����


SELECT FN_POW(10,3)"���Ȯ��"
FROM DUAL;
--==>>1000

SELECT FN_POW(2,5)"���Ȯ��"
FROM DUAL;
--==>>32

SELECT FN_POW(2,8)"���Ȯ��"
FROM DUAL;
--==>>256

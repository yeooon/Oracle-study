
--1�� �ּ��� ó��(������ �ּ��� ó��)
/*
������
(������)
�ּ���
ó��
*/

-- �� ���� ����Ŭ ������ ������ �ڽ��� ���� ��ȸ
show user
--==>>USER��(��) "SYS"�Դϴ�.
--> sqlplus ������ �� ����ϴ� ��ɾ�

select user
from dual;
--==> SYS

select user
from dual; -- ���� �̰� �ǹ̰� ����?
--==> SYS

select 1+2
from dual;
--==> 3

select 1+5
fromdual;
--==>> ���� �߻�
-- "FROM keyword not found where expected"

select �ֿ밭�ϱ������� f������
from dual;
--==>> ���� �߻�
-- (ORA-00904: "�ֿ밭�ϱ�������": invalid identifier)

select "�ֿ밭�ϱ������� f������"
from dual;
--==>>���� �߻�
--(ORA-00972: identifier is too long)

select '�ֿ밭�ϱ������� f������'
from dual;

SELECT '�� �� �� �� ���ܿ� ����Ŭ ����'
FROM DUAL;
--==>>�� �� �� �� ���ܿ� ����Ŭ ����

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


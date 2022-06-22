SELECT USER
FROM DUAL;
--==>> SCOTT


--�� IF ��(���ǹ�)
-- IF ~ THEN ~ ELSE ~ END IF;

--1. PL/SQL �� IF ������ �ٸ� ����� IF ���ǹ��� ���� �����ϴ�.
-- ��ġ�ϴ� ���ǿ� ���� ���������� �۾��� ������ �� �ֵ��� �Ѵ�.
-- TRUE �̸� THEN �� ELSE ������ ������ �����ϰ�
-- FALSE �� NULL �̸� ELSE �� END IF; ������ ������ �����ϰ� �ȴ�.

--2. ���� �� ����
/*
IF ����
    THEN ó����;
END IF;
*/

/*
IF ����
    THEN ó����;
ELSE
    ó����
END IF;
*/

/*
IF ����
    THEN ó����;
ELSEIF ����
    THEN ó����;
ELSEIF ����
    THEN ó����;    
ELSE ����
    ó����;  
END IF;
*/

SET SERVEROUTPUT ON;

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�


DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'C';
    
    --DBMS_OUTPUT.PUT_LINE(GRADE);
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('EXCELLENT');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('BEST');
    ELSIF GRADE = 'C'
        THEN DBMS_OUTPUT.PUT_LINE('COOL');    
    ELSE 
        DBMS_OUTPUT.PUT_LINE('FAIL');   
    END IF;
END;



--�� CASE ��(���ǹ�)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

--1. ���� �� ����
/*
CASE ����
    WHEN ��1 THEN ���๮;
    WHEN ��2 THEN ���๮;
    ELSE ���๮;
END CASE;    
*/


ACCEPT NUM PROMPT '����1 ����2 �Է��ϼ���';

DECLARE
        -- �ֿ� ���� ����
        SEL NUMBER := &NUM;
        RESULT VARCHAR2(10) := '����';
BEGIN
-- �׽�Ʈ
        --DBMS_OUTPUT.PUT_LINE('SEL :' ||SEL);   
        --DBMS_OUTPUT.PUT_LINE('RESULT'||RESULT);  
        
-- ���� �� ó��
/*
        CASE SEL
            WHEN 1
            THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
            WHEN 2
            THEN DBMS_OUTPUT.PUT_LINE('�����Դϴ�.');
            ELSE
                 DBMS_OUTPUT.PUT_LINE('Ȯ�κҰ�');
        END CASE;
*/
    CASE SEL
        WHEN 1
        THEN RESULT := '����';
        WHEN 2
        THEN RESULT := '����';
        ELSE
            RESULT := 'Ȯ�κҰ�';
        END CASE;    
        
        -- ��� ���
        DBMS_OUTPUT.PUT_LINE('ó�� �����' ||RESULT||'�Դϴ�.');          
END;


--�� �ܺ� �Է� ó��
--ACCEPT ����
--ACCEPT ������ PROMPT '�޼���';
--> �ܺ� �����κ��� �Է¹��� �����͸� ���� ������ ������ ��
-- ��&�ܺκ����� ���·� �����ϰ� �ȴ�.

--�� ���� 2���� �ܺηκ���(����ڷκ���)�Է¹޾�
-- �̵��� ���� ����� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

ACCEPT N1 PROMPT 'ù ��° ������ �Է��ϼ���.';
ACCEPT N2 PROMPT '�� ��° ������ �Է��ϼ���.';

DECLARE
    -- �ֿ� ���� ���� �� �ʱ�ȭ
    NUM1    NUMBER := &N1;    
    NUM2    NUMBER := &N2;
    TOTAL   NUMBER := 0;
BEGIN
    -- ���� �� ó��
    TOTAL := NUM1 + NUM2;
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE(NUM1 || ' + ' || NUM2 || ' = ' || TOTAL);
    
END;

--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ������� �����Ͽ� ����ϴ� ���α׷��� �ۼ��Ѵ�.
-- ��, ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� �ݾ� �Է� : 990
�Է¹��� �ݾ� �Ѿ� : 990��
ȭ����� : ����� 1, ��� 4, ���ʿ� 1, �ʿ� 4
*/

ACCEPT N1 PROMPT '�ݾ� �Է� : ';

DECLARE
    -- �ֿ� ���� ���� �� �ʱ�ȭ
    MONEY NUMBER := &N1;        -- ������ ���� �Է°��� ��Ƶ� ���� 
    MONEY2 NUMBER := &N1;       -- ����� ���� ��Ƶ� ����(���� �������� ���� ���ϱ� ������...)
    
    M500 NUMBER;                -- 500��¥�� ������ ��Ƶ� ����
    M100 NUMBER;                -- 100��¥�� ������ ��Ƶ� ����
    M50 NUMBER;                 -- 50��¥�� ������ ��Ƶ� ����
    M10 NUMBER;                 -- 10��¥�� ������ ��Ƶ� ����
    
BEGIN
    -- ���� �� ó��
    M500 := TRUNC(MONEY/500);
    
    MONEY := MOD(MONEY,500);
    
    M100 := TRUNC(MONEY/100);
    
    MONEY := MOD(MONEY,100);  
    
    M50 := TRUNC(MONEY/50);
    
    MONEY := MOD(MONEY,50);     
    
    M10 := TRUNC(MONEY/10);
    
    -- ��� ���
    
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� : '||MONEY2||'��');
    DBMS_OUTPUT.PUT_LINE('ȭ����� : �����'||M500||', ��� : '||M100||', ���ʿ� : '||M50||', �ʿ� : '||M10);
END;


--�� �⺻ �ݺ���
-- LOOP ~ END LOOP;

--1. ���ǰ� ������� ������ �ݺ��ϴ� ����.

--2. ���� �� ����
/*
LOOP
    -- ���๮
    
    EXIT WHEN ����;   -- ������ ���� ��� �ݺ����� ����������.
END LOOP;    
*/

-- 1 ���� 10������ �� ���(LOOP �� Ȱ��)
DECLARE
-- �ֿ亯������ �� �ʱ�ȭ
    N NUMBER;
BEGIN
-- ����ó��
    N := 1;
    
    LOOP --���������ߴ�
         DBMS_OUTPUT.PUT_LINE(N);
         
         EXIT WHEN N>=10;
         
         N := N + 1;            --��N++;��,��N+=1;��
    
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� WHILE �ݺ���
-- WHILE LOOP ~ END LOOP;

-- 1. ���� ������ TRUE �� ���� �Ϸ��� ������ �ݺ��ϱ� ����
-- WHILE LOOP ������ ����Ѵ�.
-- ������ �ݺ��� ���۵Ǵ� ������ üũ�ϰ� �Ǿ�
-- LOOP ���� ������ �� ���� ������� ���� ��쵵 �ִ�.
-- LOOP �� ������ �� ������ FALSE �̸� �ݺ� ������ Ż���ϰ� �ȴ�.

-- 2. ���� �� ����
/*
WHILE ���� LOOP   -- ������ ���� ��� �ݺ� ����
    -- ���๮;
END LOOP;
*/

-- 1 ���� 10������ �� ��� (WHILE LOOP �� Ȱ��)

DECLARE
    N NUMBER;
BEGIN 
    N := 0;
    WHILE  N<10 LOOP
    N := N+1;
    DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� FOR �ݺ���
-- FOR LOOP ~ END LOOP;

--1. �����ۼ������� 1�� �����Ͽ�
--   ������������ �� ������ �ݺ� �����Ѵ�.

--2. ���� �� ����
/*
FOR ī���� IN [REVERSE] ���ۼ� .. ������ LOOP
    -- ���๮;
END LOOP;
*/

-- 1���� 10������ �� ��� (FOR LOOP �� Ȱ��)
DECLARE
    N NUMBER; 
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ����ڷκ��� ������ ��(������)�� �Է¹޾�
-- �ش� �ܼ��� �������� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.

/*
���� ��)
���ε� ���� �Է� ��ȭâ �� ���� �Է��ϼ��� : 2

2�� ���~~
*/

-- 1. LOOP ���� ���

-- 2. WHILE LOOP ���� ���

-- 3. FOR LOOP ���� ���


--��
ACCEPT NUM PROMPT '���� �Է��ϼ��� : ';
DECLARE
    DAN NUMBER := &NUM;
    N NUMBER;
BEGIN
    -- ����ó��
    N := 1;
    LOOP --���������ߴ�
         DBMS_OUTPUT.PUT_LINE(DAN||'*'||N||'='||DAN*N);
         EXIT WHEN N>8;         
         N := N + 1;
    
    END LOOP;
END;


--��
ACCEPT NUM PROMPT '���� �Է��ϼ��� : ';
DECLARE
    DAN NUMBER := &NUM;
    N NUMBER;
BEGIN
    -- ����ó��
    N := 1;
        WHILE  N<9 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(DAN||'*'||N||'='||DAN*N);
        END LOOP;
END;


--��
ACCEPT NUM PROMPT '���� �Է��ϼ��� : ';

DECLARE
    DAN NUMBER := &NUM;
    N NUMBER;
BEGIN
        FOR N IN 1 .. 9 LOOP
            DBMS_OUTPUT.PUT_LINE(DAN||'*'||N||'='||(DAN*N));
        END LOOP;
END;
--==>>
/*
8*1=8
8*2=16
8*3=24
8*4=32
8*5=40
8*6=48
8*7=56
8*8=64
8*9=72


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ������ ��ü(2�� ~ 9��)�� ����ϴ� PL/SQL ������ �ۼ��Ѵ�.
-- ��, ���� �ݺ���(�ݺ����� ��ø)������ Ȱ���Ѵ�.

/*
���� ��)
==[2��]==
2*1 = 2
    :
9�ܱ���...
*/

--�� FOR ��
DECLARE
    DAN NUMBER;
    N NUMBER;
BEGIN
    -- ����ó��
        FOR DAN IN 1 .. 9 LOOP
            DBMS_OUTPUT.PUT_LINE('');    
            DBMS_OUTPUT.PUT_LINE('==['||DAN||'��]==');        
        FOR N IN 1 .. 9 LOOP
            DBMS_OUTPUT.PUT_LINE(DAN||'*'||N||'='||(DAN*N));
        END LOOP;
        END LOOP;
END;


--�� WHILE ��
DECLARE
    DAN NUMBER;
    N NUMBER;
BEGIN
    DAN := 1;
    WHILE DAN<9 LOOP
    DAN := DAN + 1;
    DBMS_OUTPUT.PUT_LINE('==['||DAN||'��]==');   
        N := 1;
        WHILE N<9 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(DAN||'*'||N||'='||(DAN*N));
        END LOOP;
    END LOOP;
END;


--��
DECLARE
    DAN NUMBER;
    N NUMBER;
BEGIN
    -- ����ó��
    DAN := 1;
    LOOP
    DBMS_OUTPUT.PUT_LINE('==['||DAN||'��]==');  
    EXIT WHEN DAN>8;         
    DAN := DAN + 1;
    
           N := 1;
            LOOP
        DBMS_OUTPUT.PUT_LINE(DAN||'*'||N||'='||(DAN*N)); 
                 EXIT WHEN N>8;         
                 N := N + 1;         
    END LOOP;
    END LOOP;
END;

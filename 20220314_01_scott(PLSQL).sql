SELECT USER
FROM DUAL;
--==>>SCOTT

--�� TBL_��� ���̺��� �������� ����(����)�ϴ� ���ν����� �ۼ��Ѵ�.
-- ���ν��� �� : PRC_���_UPDATE()
/*
���� ��)
EXEC PRC_���_UPDATE(����ȣ, �����Ҽ���);
*/


CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
( 
        --�� �Ű����� ����
        V_����ȣ    IN TBL_���.����ȣ%TYPE
        , V_������    IN TBL_���.������%TYPE
)
IS
        --�� �ʿ��� ���� ����
        V_��ǰ�ڵ�        TBL_��ǰ.��ǰ�ڵ�%TYPE;
        V_����������    TBL_���.������%TYPE;
        V_������        TBL_��ǰ.������%TYPE;
        
        -- ����ó�� 
         USER_DEFINE_ERROR EXCEPTION;
BEGIN
        --�� ������ ������ �� ��Ƴ���
        SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_����������
        FROM TBL_���
        WHERE ����ȣ = V_����ȣ;
        
        --�� ��� ������࿩�� �Ǵ� �ʿ�
        -- ���� ������ ������ �� ������ ������ Ȯ��
        SELECT ������ INTO V_������
        FROM TBL_��ǰ
        WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
        
        -- ���ľ��� �������� ���� ������ ���� �ǽ� ���� �Ǵ�
        -- ��������+���������� < ������������ �� ��Ȳ�̶��... ��������ǿ��� �߻�
        IF(V_������ + V_���������� < V_������)
            -- ���ܹ߻�
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
        
        --�� ����� ������ üũ(UPDATE��TBL_��� / UPDATE��TBL_��ǰ)
        UPDATE TBL_���
        SET ������ = V_������
        WHERE ����ȣ = V_����ȣ;

        --��         
        UPDATE TBL_��ǰ
        SET ������ = ������+V_����������-V_������
        WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
                
        --�� Ŀ��
        COMMIT;
        
        --�� ���� ó�� ����
        EXCEPTION
            WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20002,'������');
                    ROLLBACK;
            WHEN OTHERS
                THEN ROLLBACK;        
END;
--==>> Procedure PRC_���_UPDATE��(��) �����ϵǾ����ϴ�.



/*
1. PRC_�԰�_UPDATE(�԰��ȣ, �԰����)
2. PRC_�԰�_DELETE(�԰��ȣ)
3. PRC_���_DELET(����ȣ)
*/



--1. PRC_�԰�_UPDATE(�԰��ȣ, �԰����)
CREATE OR REPLACE PROCEDURE PRC_�԰�_UPDATE
(
        --�� �Ű����� ����
    V_�԰��ȣ      IN TBL_�԰�.�԰��ȣ%TYPE
  , V_�԰����    IN TBL_�԰�.�԰����%TYPE
)
IS
        --�� �ʿ��� ���� ����
    V_��ǰ�ڵ�          TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_�����԰����      TBL_�԰�.�԰����%TYPE;
    V_������          TBL_��ǰ.������%TYPE;
    USER_DEFINE_ERROR   EXCEPTION;    
BEGIN
        --�� ������ ������ �� ��Ƴ���
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�����԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;

        --�� �԰� ������࿩�� �Ǵ� �ʿ�
        -- ���� ������ ������ �� ������ ������ Ȯ��    
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
    
        -- �԰������ ������ ���� ���� �ֳ�...?
        -- ��� 0���� ������ �������� ������... �������� ���� ���� ���� �ʳ�... 
    IF (V_������ - V_�����԰���� + V_�԰���� < 0)
        THEN RAISE USER_DEFINE_ERROR; 
    END IF;      

        --�� ����� ������ üũ(UPDATE��TBL_�԰� / UPDATE��TBL_��ǰ)    
    UPDATE TBL_�԰�
    SET �԰���� = V_�����԰���� + V_�԰����
    WHERE �԰��ȣ = V_�԰��ȣ;
        --��    
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_�����԰���� + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;

        --�� Ŀ��    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�԰� ���� ����~!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;


--2. PRC_�԰�_DELETE(�԰��ȣ)       

SELECT *
FROM TBL_�԰�;

SELECT *
FROM TBL_��ǰ;

CREATE OR REPLACE PROCEDURE PRC_�԰�_DELETE
(
    V_�԰��ȣ IN TBL_�԰�.�԰��ȣ%TYPE
)
IS
    V_��ǰ�ڵ� TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_�԰���� TBL_�԰�.�԰����%TYPE;
    V_������ TBL_��ǰ.������%TYPE;    

    USER_DEFINE_ERROR EXCEPTION;

BEGIN
    SELECT ��ǰ�ڵ�, �԰���� INTO V_��ǰ�ڵ�, V_�԰����
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;   

    IF (V_������ - V_�԰���� < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ��������
    DELETE
    FROM TBL_�԰�
    WHERE �԰��ȣ = V_�԰��ȣ;
    
    UPDATE TBL_��ǰ
    SET ������ = ������ - V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;   
    
    COMMIT;

    EXCEPTION
        WHEN USER_DEFINE_ERROR
         THEN RAISE_APPLICATION_ERROR(-20004, '�԰� ������ ���� �Ұ�.' );
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
   
END;


--3. PRC_���_DELETE(����ȣ)
CREATE OR REPLACE PROCEDURE PRC_���_DELETE
(
    V_����ȣ IN TBL_���.����ȣ%TYPE
)
IS
    V_��ǰ�ڵ� TBL_��ǰ.��ǰ�ڵ�%TYPE;
    V_������ TBL_���.������%TYPE;
    V_������ TBL_��ǰ.������%TYPE;
BEGIN
    SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�,V_������
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;   
    
    SELECT ������ INTO V_������
    FROM TBL_��ǰ
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;

    DELETE
    FROM TBL_���
    WHERE ����ȣ = V_����ȣ;
    
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_������
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;    

    COMMIT;

    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
            
END;


--------------------------------------------------------------------------------


--���� CURSOR(Ŀ��) ����--

--1. ����Ŭ������ �ϳ��� ���ڵ尡 �ƴ� ���� ���ڵ�� ������
-- �۾� �������� SQL ���� �����ϰ� �� �������� �߻��� ������
-- �����ϱ� ���� Ŀ��(CURSOR)�� ����ϸ�,
-- Ŀ������ �Ͻ����� Ŀ���� ������� Ŀ���� �ִ�.

--2. �Ͻ��� Ŀ���� ��� SQL ������ �����ϸ�
--SQL �� ���� �� ���� �ϳ��� ��(ROW)�� ����ϰ� �ȴ�.
-- �׷��� SQL ���� ������ ����� RESULT SET(RESULT SET)��
-- ���� ��(ROW)���� ������ ���
-- Ŀ��(CURSOR)�� ��������� �����ؾ� ���� ��(ROW)�� �ٷ� �� �ִ�.

--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.

DECLARE
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL  TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM=1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME|| '--' || V_TEL);
END;
--==>>
/*
ȫ�浿--011-2356-4528


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
DECLARE
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL  TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME|| '--' || V_TEL);
END;
--==>> ���� �߻�
-- (ORA-01422: exact fetch returns more than requested number of rows)



--�� Ŀ�� �̿� �� ��Ȳ(���� �� ���� ��)
DECLARE
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL  TBL_INSA.TEL%TYPE;
    V_NUM  TBL_INSA.NUM%TYPE := 1001;
BEGIN
    LOOP
        SELECT NAME, TEL INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM = V_NUM;  -- WHERE NUM = 1001;
        
        DBMS_OUTPUT.PUT_LINE(V_NAME|| '--' || V_TEL);        

        V_NUM := V_NUM +1;
        
        EXIT WHEN V_NUM >= 1061;
        
    END LOOP;
END;
/*
    :
    :
���ѳ�--016-2424-4242
������--010-7549-8654
�̹̰�--016-6542-7546
�����--010-2415-5444
�Ӽ���--011-4151-4154
��ž�--011-4151-4444


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.    
*/

/*
�Ϲݺ��� �� ����
���ܺ��� �� ����

������ Ÿ��
���ܺ����� Ÿ��
Ŀ���� CURSOR(X)

Ŀ��  �� ����

TABLE ���̺��
INDEXT �ε�����
USER ����ڸ�
CURSOR Ŀ����(��)

*/


--�� Ŀ�� �̿� �� ��Ȳ
DECLARE
    -- �ֿ� ���� ����
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL  TBL_INSA.TEL%TYPE;
    
    -- Ŀ�� �̿��� ���� Ŀ�� ����
    CURSOR CUR_INSA_SELECT
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
    
BEGIN
    -- Ŀ�� ����
    OPEN CUR_INSA_SELECT;
    
    -- Ŀ�� ���� �� ����������� �����͵� ó��(�ݺ����� Ȱ���Ͽ� ó��)
    LOOP
        -- �� �� �� �� �޾ƴٰ� ó���ϴ� ���� �� ��������(��������) �� FETCH
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- Ŀ������ �� �̻� �����Ͱ� ����� ������ �ʴ� ���� ... NOTFOUND
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- ���
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
        
    END LOOP;
    
    -- Ŀ�� Ŭ����
    CLOSE CUR_INSA_SELECT;
END;
/*
    :
    :
���ѳ�--016-2424-4242
������--010-7549-8654
�̹̰�--016-6542-7546
�����--010-2415-5444
�Ӽ���--011-4151-4154
��ž�--011-4151-4444


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.    
*/


--------------------------------------------------------------------------------

--���� TRIGGER(Ʈ����) ����--

-- �������� �ǹ� : ��Ƽ�, �˹߽�Ű��, �߱��ϴ�, �����ϴ�.

-- 1.TRIGGER(Ʈ����)�� DML �۾� ��, INSERT, UPDATE, DELETE �۾��� �Ͼ ��
-- �ڵ������� ����Ǵ�(���ߵǴ�, �˹ߵǴ�) ��ü��
-- �̿� ���� Ư¡�� �����Ͽ� DML TRIGGER ��� �θ��⵵ �Ѵ�.
-- TRIGGER �� ���Ἲ �� �ƴ϶�
-- ������ ���� �۾����� �θ� ���ȴ�.

-- �ڵ����� �Ļ��� �� �� ����
-- �߸��� Ʈ����� ����
-- ������ ���� ���� ���� ����
-- �л� �����ͺ��̽� ��� �󿡼� ���� ���Ἲ ���� ����
-- ������ ���� ��Ģ ���� ����
-- ������ �̺�Ʈ �α� ����
-- ������ ���� ����
-- ���� ���̺� ���� ��������
-- ���̺� �׼��� ��� ����

--2. TRIGGER(Ʈ����) �������� COMMIT, ROLLBACK ���� ����� �� ����.

-- 3. Ư¡ �� ����
-- - BEFORE STATEMENT
-- - BEFORE ROW
-- - AFTER STATEMENT
-- - AFTER ROW

-- 4. ���� �� ����
/*
CREATE [OR REPLACE] TRIGGER Ʈ���Ÿ�
    [BEFORE | AFTER]
    �̺�Ʈ1 [OR �̺�Ʈ2 [OR �̺�Ʈ3]] ON ���̺��
    [FOR EACH ROW [WHEN TRIGGER ����]]
[DECLARE]
    -- ���� ����;
BEGIN 
    -- ���� ����;
END    
*/

--���� AFTER STATEMENT TRGGIER ��Ȳ �ǽ� ����--
--�� DML �۾��� ���� �̺�Ʈ ���

--�� TRIGGER(Ʈ����) ���� �� TRG_EVENTLOG
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    --�̺�Ʈ ���� ����(���ǹ��� ���� �б�)
    IF(INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('INSERT ������ ����Ǿ����ϴ�.');
    ELSIF(UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('UPDATE ������ ����Ǿ����ϴ�.');
    ELSIF(DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('DELETE ������ ����Ǿ����ϴ�.');
    END IF;
    
    --COMMIT;
    --�� TRIGGER �������� COMMIT / ROLLBACK ���� ��� �Ұ�~!!!
END;



--���� BEFORE STATEMENT TRGGIER ��Ȳ �ǽ� ����--
-- �� DML �۾� ���� ���� �۾��� ���� ���� ���� Ȯ��

--�� TRIGGER(Ʈ����) ���� �� TRG_TEST1_DML
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE
    INSERT OR DELETE OR UPDATE ON TBL_TEST1
BEGIN
    IF (�۾��ð��� ���� 9�� �����̰ų�... ���� 6�� ���Ķ��...)
    THEN �۾��� �������� ���ϵ��� ó���ϰڴ�.
    END IF;
END;

--

CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE
    INSERT OR DELETE OR UPDATE ON TBL_TEST1
BEGIN
    IF (TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) < 9 OR TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) > 17)  
    THEN �۾��� �������� ���ϵ��� ó���ϰڴ�.= ����� ���� ���ܸ� �߻���ų �� �ֵ��� �ϰڴ�.
    END IF;
END;

--

CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE
    INSERT OR DELETE OR UPDATE ON TBL_TEST1
BEGIN
    IF (TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) < 9 
    OR TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) > 17)  
        THEN RAISE_APPLICATION_ERROR(-20003, '������ 09:00 ~ 18:00 ������ �����մϴ�.');
    END IF;
END;
--==>> Trigger TRG_TEST1_DML��(��) �����ϵǾ����ϴ�.



--���� BEFORE ROW TRIGGIER ��Ȳ �ǽ� ����--
-- �� ���� ���谡 ������ ������(�ڽ�) ������ ���� �����ϴ� ��

--�� TRIGGER(Ʈ����) ���� �� TRG_TEST2_DELETE
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
    BEFORE 
    DELETE ON TBL_TEST2 --�θ����̺� ���� �̺�Ʈ
    FOR EACH ROW    -- ������ ��
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;
END;    
--==>>Trigger TRG_TEST2_DELETE��(��) �����ϵǾ����ϴ�.

--�� ��:OLD��
-- ���� �� ���� ��
-- (INSERT : �Է��ϱ� ���� �ڷ�, DELETE : �����ϱ� ���� �ڷ� ��, ������ �ڷ�)

-- UPDATE : ���������� DELETE �׸��� INSERT �� ���յ� ����
--          UPDATE �ϱ� ������ �����ʹ� ��:OLD��
--          UPDATE ������ ������ �����ʹ� ��:NEW��


--------------------------------------------------------------------------------

--���� AFTER ROW TRIGGER ��Ȳ �ǽ� ����--
--�� ���� ���̺� ���� Ʈ����� ó��

--TBL_�԰�, TBL_��ǰ, TBL_���

--�� TBL_�԰� ���̺��� ������ �Է� ��(��, �԰� �̺�Ʈ �߻� ��)
-- TBL_��ǰ ���̺��� ������ ���� Ʈ���� �ۼ�
-- Ʈ���� �� : TRG_IBGO

CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_�԰�
        FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
            SET ������ = ������ + �����԰�Ǵ��԰����
            WHERE ��ǰ�ڵ� = �����԰�Ǵ»�ǰ�ڵ�;
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_�԰�
        FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
            SET ������ = ������ + �����԰�Ǵ��԰����
            WHERE ��ǰ�ڵ� = �����԰�Ǵ»�ǰ�ڵ�;
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_�԰�
        FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
            SET ������ = ������ + :NEW.�԰����
            WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    END IF;
END;
--==>>Trigger TRG_IBGO��(��) �����ϵǾ����ϴ�.


--�� TBL_�԰� ���̺��� ������ �Է�, ����, ���� ��
-- TBL_��ǰ ���̺��� ������ ���� Ʈ���� �ۼ�
-- Ʈ���� �� : TRG_IBGO
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_�԰�
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_��ǰ
        SET ������ = ������ + :NEW.�԰����
        WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (UPDATING)
        THEN UPDATE TBL_��ǰ
        SET ������ = ������ - :OLD.�԰���� + :NEW.�԰����
        WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
    ELSIF (DELETING)
        THEN UPDATE TBL_��ǰ
        SET ������ = ������ - :OLD.�԰���� -- �̺κ��� �� OLD �ΰ���?
        WHERE ��ǰ�ڵ� = :OLD.��ǰ�ڵ�;        
    END IF;
END;






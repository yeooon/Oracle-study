SELECT USER
FROM DUAL;
--==>>SCOTT

DESC TBL_INSA;
SELECT *
FROM TBL_INSA;

--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.
-- NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
-- ���� ������ �÷� �� NUM �� ������
-- NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
-- �� ������ �Է� ��
-- NUM �÷�(�����ȣ)�� ����
-- ���� �ο��� ��� ��ȣ�� ������ ��ȣ �� ���� ��ȣ�� �ڵ����� �Է� ó���� �� �ִ�
-- ���ν����� �����Ѵ�.
-- ���ν��� �� : PRC_INSA_INSERT()
/*
���� ��)
EXEC PRC_INSA_INSERT('������','970131-2234567',SYSDATE,'����','010-8624-4533','���ߺ�','�븮',2000000,2000000)
���ν��� ȣ��� ó���� ���
1967 ������ 970131-2234567 SYSDATE ���� 010-8624-4533 ���ߺ� �븮 2000000 2000000
�� �����Ͱ� �ű� �Էµ� ��Ȳ
*/


CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
        (V_NAME                 IN TBL_INSA.NAME%TYPE
        ,V_SSN                  IN TBL_INSA.SSN%TYPE
        ,V_IBSADATE             IN TBL_INSA.IBSADATE%TYPE
        ,V_CITY                 IN TBL_INSA.CITY%TYPE
        ,V_TEL                  IN TBL_INSA.TEL%TYPE
        ,V_BUSEO                IN TBL_INSA.BUSEO%TYPE
        ,V_JIKWI                IN TBL_INSA.JIKWI%TYPE
        ,V_BASICPAY             IN TBL_INSA.BASICPAY%TYPE
        ,V_SUDANG               IN TBL_INSA.SUDANG%TYPE
        )
IS
        -- �߰� ���� 
        V_NUM                   TBL_INSA.NUM%TYPE;
BEGIN
        -- �����
        SELECT MAX(NVL(NUM,0))+1 INTO V_NUM
        FROM TBL_INSA;

--INSERT ������ ����
        INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
        VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);

-- Ŀ��
        COMMIT;

END;
--==>>Procedure PRC_INSA_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_��ǰ, TBL_�԰� ���̺��� �������
-- TBL_�԰� ���̺� ������ �Է� ��(��, �԰� �̺�Ʈ �߻� ��)
-- TBL_��ǰ ���̺��� �������� �Բ� ������ �� �ִ� ����� ���� ���ν����� �ۼ��Ѵ�.
-- ��, �� �������� �԰��ȣ�� �ڵ� ���� ó���Ѵ�.(������ ��� X)
-- TBL_�԰� ���̺� ���� �÷�
-- : �԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�
-- ���ν��� �� : PRC_�԰�_INSERT(��ǰ�ڵ�, �԰����, �԰�ܰ�)

-- 'H001', 30, 400
-- �� �԰����̺��� ������ �Է�(���ν��� �Ű������� ���޹��� ���� ������ �� �� �ڵ��Է�)
-- �� ��ǰ���̺��� �ٹ�� ������ 30��

CREATE OR REPLACE PROCEDURE PRC_�԰�_INSERT
(V_��ǰ�ڵ�     IN TBL_��ǰ.��ǰ�ڵ�%TYPE
,V_�԰����     IN TBL_�԰�.�԰����%TYPE
,V_�԰�ܰ�     IN TBL_�԰�.�԰�ܰ�%TYPE
)
IS
-- �߰�����
    V_�԰��ȣ  TBL_�԰�.�԰��ȣ%TYPE;
BEGIN
-- �����
    -- �԰� ��ȣ�� �ڵ� ����    
    SELECT NVL(MAX(�԰��ȣ), 0) INTO V_�԰��ȣ
    FROM TBL_�԰�;
  
-- INSERT ������ ���� 
    INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰����, �԰�ܰ�)
    VALUES((V_�԰��ȣ+1), V_��ǰ�ڵ�, V_�԰����, V_�԰�ܰ�);

    -- �������� �Բ� �����Ǿ�� �Ѵ�...  
    UPDATE TBL_��ǰ
    SET ������ = ������ + V_�԰����
    WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;

-- ���� ó��
    EXCEPTION 
        WHEN OTHERS THEN ROLLBACK;

-- Ŀ��
    COMMIT;
END;
--==>>Procedure PRC_�԰�_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------

--���� ���ν��� �������� ���� ó�� ����--

--�� TBL_MEMBER ���̺� �����͸� �Է��ϴ� ���ν����� �ۼ�
-- ��, �� ���ν����� ���� �����͸� �Է��� ���
-- CITY(����) �׸� '����, ���, ����' �� �Է��� �����ϵ��� �����Ѵ�.
-- �� ���� ���� �ٸ� ������ ���ν��� ȣ���� ���� �Է��ϰ��� �ϴ� ���
-- (��, �Է��� �õ��ϴ� ���)
-- ���ܿ� ���� ó���� �Ϸ��� �Ѵ�.
-- ���ν��� �� : PRC_MEMBER_INSERT()
/*
���� ��)
EXEC PRC_MEMBER_INSERT('�Ӽҹ�','010-1111-1111','����');
--==>> ������ �Է� 0

EXEC PRC_MEMBER_INSERT('�Ӽҹ�','010-1111-1111','�λ�');
--==>> ������ �Է� X
*/

CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME        IN TBL_MEMBER.NAME%TYPE
, V_TEL         IN TBL_MEMBER.TEL%TYPE
, V_CITY        IN TBL_MEMBER.CITY%TYPE
)
IS
    -- �����(�ֿ� ���� ����)
    -- ���� ������ ������ ������ ���� �ʿ��� ���� ����
    V_NUM       TBL_MEMBER.NUM%TYPE;
    
    -- ����� ���� ���ܿ� ���� ���� ���� CHECK~!!!
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    -- ���ν����� ���� �Է� ó���� ���������� �����ؾ� �� ���������� �ƴ����� ���θ�
    -- ���� ���� Ȯ���� �� �ֵ��� �ڵ� ����
    IF(V_CITY NOT IN ('����','���','����'))
        -- ���� �߻� CHECK~!!!
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- ������ ������ �� ��Ƴ���
    SELECT NVL(MAX(NUM),0) INTO V_NUM
    FROM TBL_MEMBER;
    
    -- ������ ���� �� INSERT
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES((V_NUM+1), V_NAME, V_TEL, V_CITY);
    
    -- ���� ó�� ����
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '����, ���, ������ �Է��� �����մϴ�.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��
    COMMIT;
END;
--==>>Procedure PRC_MEMBER_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_��� ���̺� ������ �Է� ��(��, ��� �̺�Ʈ �߻� ��)
-- TBL_��ǰ ���̺��� �������� �����Ǵ� ���ν����� �ۼ��Ѵ�.
-- ��, ����ȣ�� �԰��ȣ�� ���������� �ڵ� ����.
-- ����, �������� ���������� ���� ���...
-- ��� �׼��� ����� �� �ֵ��� ó���Ѵ�.(��� �̷������ �ʵ���...) �� ����ó��Ȱ�� CHECK!!
-- ���ν��� �� : PRC_���_INSERT()
/*
PRC_���_INSERT('H001', 10, 600);

-- ���� ��ǰ ���̺��� �ٹ�� �������� 50��
PRC_���_INSERT('H001', 60, 600);
--==>> �����߻�
-- (������)
*/



CREATE OR REPLACE PROCEDURE PRC_���_INSERT
        ( V_��ǰ�ڵ�    IN TBL_���.��ǰ�ڵ�%TYPE
        , V_������    IN TBL_���.������%TYPE
        , V_���ܰ�    IN TBL_���.���ܰ�%TYPE
        )
IS
         V_����ȣ    TBL_���.����ȣ%TYPE; 
         V_������    TBL_��ǰ.������%TYPE;
         
         USER_DEFINE_ERROR EXCEPTION;
BEGIN   
        -- �̺κ� ����...
        -- ������ ���� ������ ���� ���θ� Ȯ���ϴ� �������� 
        -- ��� �ľ� �� ���� ��� Ȯ���ϴ� ������ ����Ǿ�� �Ѵ�.
        -- �׷��� ���ν��� ȣ�� �� �Ѱܹ޴� �������� �񱳰� �����ϱ� ����...
        SELECT ������ INTO V_������
        FROM TBL_��ǰ
        WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
        
        -- ��� ���������� ������ �� �������� ���� ���� Ȯ��
        -- ������ �ľ��� ���������� ���� ���ν������� �Ѱܹ��� �������� ������
        -- ���� �߻�~!!!
        IF(V_������ > V_������)
            -- ���ܹ߻�
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
        
        -- ����ȣ �ڵ�����
        SELECT NVL(MAX(����ȣ),0) INTO V_����ȣ
        FROM TBL_���;  
        
        -- ������ ���� �� INSERT(TBL_���)
        INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, ������, ���ܰ�)
        VALUES((V_����ȣ+1), V_��ǰ�ڵ�, V_������, V_���ܰ�);
        
        -- ������ ���� �� UPDATE(TBL_��ǰ)
        UPDATE TBL_��ǰ
        SET ������ = ������ - V_������
        WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
        
        --���� ó�� ����
        EXCEPTION
            WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20002,'������');
                    ROLLBACK;
            WHEN OTHERS
                THEN ROLLBACK;
                
        -- Ŀ��
        COMMIT;
END;
--==>> Procedure PRC_���_INSERT��(��) �����ϵǾ����ϴ�.



--�� TBL_��� ���̺��� �������� ����(����)�ϴ� ���ν����� �ۼ��Ѵ�.
-- ���ν��� �� : PRC_���_UPDATE()
/*
���� ��)
EXEC PRC_���_UPDATE(����ȣ, �����Ҽ���);
*/


CREATE OR REPLACE PROCEDURE PRC_���_UPDATE
        ( V_����ȣ    IN TBL_���.����ȣ%TYPE
        , V_������    IN TBL_���.������%TYPE
        )
IS
        -- �ֿ� ���� �߰� ����
        V_��ǰ�ڵ�        TBL_��ǰ.��ǰ�ڵ�%TYPE;
        V_����������    TBL_���.������%TYPE;
        V_������        TBL_��ǰ.������%TYPE;
        -- ����ó�� 
         USER_DEFINE_ERROR EXCEPTION;
BEGIN
        -- ���� ����� Ȯ��
        SELECT ��ǰ�ڵ�, ������ INTO V_��ǰ�ڵ�, V_����������
        FROM TBL_���
        WHERE ����ȣ = V_����ȣ;
        
        -- ��� ���������� ����Ǿ���?
        SELECT ������ INTO V_������
        FROM TBL_��ǰ
        WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
        
        -- ���ܹ߻�~
        IF(V_������ + V_���������� < V_������)
            -- ���ܹ߻�
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
        
        UPDATE TBL_���
        SET ������ = V_������
        WHERE ����ȣ = V_����ȣ;
        
        UPDATE TBL_��ǰ
        SET ������ = ������+V_����������-V_������
        WHERE ��ǰ�ڵ� = V_��ǰ�ڵ�;
                
        -- Ŀ��
        COMMIT;
        
        --���� ó�� ����
        EXCEPTION
            WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20002,'������');
                    ROLLBACK;
            WHEN OTHERS
                THEN ROLLBACK;        
END;    


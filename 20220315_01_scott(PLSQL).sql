SELECT USER
FROM DUAL;
--==>>SCOTT

--○ TBL_입고 테이블의 데이터 입력, 수정, 삭제 시
-- TBL_상품 테이블의 재고수량 변동 트리거 작성
-- 트리거 명 : TRG_IBGO
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_입고
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
        SET 재고수량 = 재고수량 + :NEW.입고수량
        WHERE 상품코드 = :NEW.상품코드;
    ELSIF (UPDATING)
        THEN UPDATE TBL_상품
        SET 재고수량 = 재고수량 - :OLD.입고수량 + :NEW.입고수량 --(-이전입고수량 + 갱신입고수량)
        WHERE 상품코드 = :OLD.상품코드; --원래 찾았어야 했던 코드기 때문에?
    ELSIF (DELETING)
        THEN UPDATE TBL_상품
        SET 재고수량 = 재고수량 - :OLD.입고수량 -- 이부분은 왜 OLD 인거지?(띠용때용 OLD랑 NEW 헷갈리고)
        WHERE 상품코드 = :OLD.상품코드;        
    END IF;
END;
--==>>Trigger TRG_IBGO이(가) 컴파일되었습니다.


--TBL_출고 테이블의 데이터 입력, 수정, 삭제 시 
--TBL_상품 테이블의 재고수량 변동 트리거 작성
--트리거 명 : TRG_CHULGO
CREATE OR REPLACE TRIGGER TRG_CHULGO
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_출고
    FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
        SET 재고수량 = 재고수량 - :NEW.출고수량
        WHERE 상품코드 = :NEW.상품코드;
    ELSIF (UPDATING)
        THEN UPDATE TBL_상품
        SET 재고수량 = 재고수량 + :OLD.출고수량 - :NEW.출고수량
        WHERE 상품코드 = :OLD.상품코드;
    ELSIF (DELETING)
        THEN UPDATE TBL_상품
        SET 재고수량 = 재고수량 + :OLD.출고수량
        WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;    

-- NEW : 데이터가 갱신 될 때 새로 들어온 값
-- OLD : 데이터가 갱신 될 때 존재하고 있는 값
    
-- INSERT 조작 시 OLD : NULL
--                NEW : 입력값
-- UPDATE 조작 시 OLD : 변경 전 값
--                NEW : 변경 후 값
-- DELETE 조작 시 OLD : 삭제 전 값
--                NEW : NEW 값


--------------------------------------------------------------------------------


--■■■ PACKAGE(패키지) ■■■--

--1. PL/SQL의 패키지는 관계되는 타입, 프로그램 객체,
-- 서브 프로그램(PROCEDURE, FUNCTION 등)을
-- 논리적으로 묶어놓은 것으로 
-- 오라클에서 제공하는 패키지 중 하나가 바로 『DBMS_OUTPUT』이다.

--2. 패키지는 서로 유사한 업무에 사용되는 여러 개의 프로시저와 함수를
-- 하나의 패키지로 만들어 관리함으로써 향후 유지보수가 편리하고
-- 전체 프로그램을 모듈화 할 수 있다는 장점이 있다.

--3. 패키지는 명세부(PACKAGE SPECIFICATION)와
-- 몸체부(PACKAGE BODY)로 구성되어 있으며
-- 명세 부분에는 TYPE, CONSTRAINT, VARIABLE, EXCEPTION, CURSOR, SUBPROGRAM이 선언되고
-- 몸체 부분에는 이들의 실제 내용이 존재한다.
-- 그리고, 호출할 때에는 『패키지명.프로시저명』 형식의 참조를 이용해야 한다.

--4. 형식 및 구조(명세부)
/*
CREATE [OR REPLACE] PACKAGE 패키지명
IS
    전역변수 선언;
    커서 선언;
    예외 선언;
    함수 선언;
    프로시저 선언;
        :
END 패키지명;        
*/

--5. 형식 및 구조(몸체부)
/*
CREATE [OR REPLACE] PACKAGE BODY 패키지명
IS
    FUNCTION 함수명 [(인수,...)]
    RETURN 자료형
    IS
        변수 선언;
    BEGIN
        함수 몸체 구성 코드;
        RETURN 값;
    END;
    
    PROCEDURE 프로시저명[(인수, ...)]
    IS 
        변수 선언;
    BEGIN
        프로시저 몸체 구성 코드;
    END;
END 패키지명;
*/

--패키지 등록 실습

--① 명세부 작성
CREATE OR REPLACE PACKAGE INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2;  
END INSA_PACK;
--==>>Package INSA_PACK이(가) 컴파일되었습니다.

--② 몸체부 작성
CREATE OR REPLACE PACKAGE BODY INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2
    IS
        V_RESULT VARCHAR2(20);
    BEGIN
        IF (SUBSTR(V_SSN,8,1) IN ('1','3'))
            THEN V_RESULT := '남자';
        ELSIF (SUBSTR(V_SSN,8,1) IN ('2','4'))   
            THEN V_RESULT := '여자';
        ELSE 
            V_RESULT := '확인불가';
        END IF;
        
        RETURN V_RESULT;
    END;
END INSA_PACK;
--==>>Package Body INSA_PACK이(가) 컴파일되었습니다.






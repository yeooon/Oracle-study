SELECT USER
FROM DUAL;
--==>>SCOTT

--○ TBL_출고 테이블에서 출고수량을 수정(변경)하는 프로시저를 작성한다.
-- 프로시저 명 : PRC_출고_UPDATE()
/*
실행 예)
EXEC PRC_출고_UPDATE(출고번호, 변경할수량);
*/


CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( 
        --① 매개변수 구성
        V_출고번호    IN TBL_출고.출고번호%TYPE
        , V_출고수량    IN TBL_출고.출고수량%TYPE
)
IS
        --③ 필요한 변수 선언
        V_상품코드        TBL_상품.상품코드%TYPE;
        V_이전출고수량    TBL_출고.출고수량%TYPE;
        V_재고수량        TBL_상품.재고수량%TYPE;
        
        -- 예외처리 
         USER_DEFINE_ERROR EXCEPTION;
BEGIN
        --④ 선언한 변수에 값 담아내기
        SELECT 상품코드, 출고수량 INTO V_상품코드, V_이전출고수량
        FROM TBL_출고
        WHERE 출고번호 = V_출고번호;
        
        --⑧ 출고 정상수행여부 판단 필요
        -- 변경 이전의 출고수량 및 현재의 재고수량 확인
        SELECT 재고수량 INTO V_재고수량
        FROM TBL_상품
        WHERE 상품코드 = V_상품코드;
        
        -- ⑨파악한 재고수량에 따라 데이터 변경 실시 여부 판단
        -- 『재고수량+이전출고수량 < 현재출고수량』 인 상황이라면... 사용자정의예외 발생
        IF(V_재고수량 + V_이전출고수량 < V_출고수량)
            -- 예외발생
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
        
        --② 수행될 쿼리문 체크(UPDATE→TBL_출고 / UPDATE→TBL_상품)
        UPDATE TBL_출고
        SET 출고수량 = V_출고수량
        WHERE 출고번호 = V_출고번호;

        --⑤         
        UPDATE TBL_상품
        SET 재고수량 = 재고수량+V_이전출고수량-V_출고수량
        WHERE 상품코드 = V_상품코드;
                
        --⑦ 커밋
        COMMIT;
        
        --⑩ 예외 처리 구문
        EXCEPTION
            WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20002,'재고부족');
                    ROLLBACK;
            WHEN OTHERS
                THEN ROLLBACK;        
END;
--==>> Procedure PRC_출고_UPDATE이(가) 컴파일되었습니다.



/*
1. PRC_입고_UPDATE(입고번호, 입고수량)
2. PRC_입고_DELETE(입고번호)
3. PRC_출고_DELET(출고번호)
*/



--1. PRC_입고_UPDATE(입고번호, 입고수량)
CREATE OR REPLACE PROCEDURE PRC_입고_UPDATE
(
        --① 매개변수 구성
    V_입고번호      IN TBL_입고.입고번호%TYPE
  , V_입고수량    IN TBL_입고.입고수량%TYPE
)
IS
        --③ 필요한 변수 선언
    V_상품코드          TBL_상품.상품코드%TYPE;
    V_이전입고수량      TBL_입고.입고수량%TYPE;
    V_재고수량          TBL_상품.재고수량%TYPE;
    USER_DEFINE_ERROR   EXCEPTION;    
BEGIN
        --④ 선언한 변수에 값 담아내기
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_이전입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;

        --⑧ 입고 정상수행여부 판단 필요
        -- 변경 이전의 재고수량 및 현재의 재고수량 확인    
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;
    
        -- 입고수량이 음수값 나올 일이 있나...?
        -- 재고가 0에서 밑으로 떨어지지 않으면... 음수값이 나올 일이 없지 않나... 
    IF (V_재고수량 - V_이전입고수량 + V_입고수량 < 0)
        THEN RAISE USER_DEFINE_ERROR; 
    END IF;      

        --② 수행될 쿼리문 체크(UPDATE→TBL_입고 / UPDATE→TBL_상품)    
    UPDATE TBL_입고
    SET 입고수량 = V_이전입고수량 + V_입고수량
    WHERE 입고번호 = V_입고번호;
        --⑤    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_이전입고수량 + V_입고수량
    WHERE 상품코드 = V_상품코드;

        --⑦ 커밋    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '입고 수량 부족~!!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;


--2. PRC_입고_DELETE(입고번호)       

SELECT *
FROM TBL_입고;

SELECT *
FROM TBL_상품;

CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
(
    V_입고번호 IN TBL_입고.입고번호%TYPE
)
IS
    V_상품코드 TBL_상품.상품코드%TYPE;
    V_입고수량 TBL_입고.입고수량%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;    

    USER_DEFINE_ERROR EXCEPTION;

BEGIN
    SELECT 상품코드, 입고수량 INTO V_상품코드, V_입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;   

    IF (V_재고수량 - V_입고수량 < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- 삭제구문
    DELETE
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_입고수량
    WHERE 상품코드 = V_상품코드;   
    
    COMMIT;

    EXCEPTION
        WHEN USER_DEFINE_ERROR
         THEN RAISE_APPLICATION_ERROR(-20004, '입고 내역을 삭제 불가.' );
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
   
END;


--3. PRC_출고_DELETE(출고번호)
CREATE OR REPLACE PROCEDURE PRC_출고_DELETE
(
    V_출고번호 IN TBL_출고.출고번호%TYPE
)
IS
    V_상품코드 TBL_상품.상품코드%TYPE;
    V_출고수량 TBL_출고.출고수량%TYPE;
    V_재고수량 TBL_상품.재고수량%TYPE;
BEGIN
    SELECT 상품코드, 출고수량 INTO V_상품코드,V_출고수량
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;   
    
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;

    DELETE
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;
    
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_출고수량
    WHERE 상품코드 = V_상품코드;    

    COMMIT;

    EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;
            
END;


--------------------------------------------------------------------------------


--■■■ CURSOR(커서) ■■■--

--1. 오라클에서는 하나의 레코드가 아닌 여러 레코드로 구성된
-- 작업 영역에서 SQL 문을 실행하고 그 과정에서 발생한 정보를
-- 저장하기 위해 커서(CURSOR)를 사용하며,
-- 커서에는 암시적인 커서와 명시적인 커서가 있다.

--2. 암시적 커서는 모든 SQL 구문에 존재하며
--SQL 문 실행 후 오직 하나의 행(ROW)만 출력하게 된다.
-- 그러나 SQL 문을 실행한 결과물 RESULT SET(RESULT SET)이
-- 여러 행(ROW)으로 구성된 경우
-- 커서(CURSOR)를 명시적으로 선언해야 여러 행(ROW)을 다룰 수 있다.

--○ 커서 이용 전 상황(단일 행 접근 시)
SET SERVEROUTPUT ON;
--==>> 작업이 완료되었습니다.

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
홍길동--011-2356-4528


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--○ 커서 이용 전 상황(다중 행 접근 시)
DECLARE
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL  TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME|| '--' || V_TEL);
END;
--==>> 에러 발생
-- (ORA-01422: exact fetch returns more than requested number of rows)



--○ 커서 이용 전 상황(다중 행 접근 시)
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
정한나--016-2424-4242
전용재--010-7549-8654
이미경--016-6542-7546
김신제--010-2415-5444
임수봉--011-4151-4154
김신애--011-4151-4444


PL/SQL 프로시저가 성공적으로 완료되었습니다.    
*/

/*
일반변수 → 선언
예외변수 → 선언

변수명 타입
예외변수명 타입
커서명 CURSOR(X)

커서  → 정의

TABLE 테이블명
INDEXT 인덱스명
USER 사용자명
CURSOR 커서명(○)

*/


--○ 커서 이용 후 상황
DECLARE
    -- 주요 변수 선언
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL  TBL_INSA.TEL%TYPE;
    
    -- 커서 이용을 위한 커서 정의
    CURSOR CUR_INSA_SELECT
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
    
BEGIN
    -- 커서 오픈
    OPEN CUR_INSA_SELECT;
    
    -- 커서 오픈 시 쏟아져나오는 데이터들 처리(반복문을 활용하여 처리)
    LOOP
        -- 한 행 한 행 받아다가 처리하는 행위 → 가져오다(데려오다) → FETCH
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        -- 커서에서 더 이상 데이터가 쏟아져 나오지 않는 상태 ... NOTFOUND
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' -- ' || V_TEL);
        
    END LOOP;
    
    -- 커서 클로즈
    CLOSE CUR_INSA_SELECT;
END;
/*
    :
    :
정한나--016-2424-4242
전용재--010-7549-8654
이미경--016-6542-7546
김신제--010-2415-5444
임수봉--011-4151-4154
김신애--011-4151-4444


PL/SQL 프로시저가 성공적으로 완료되었습니다.    
*/


--------------------------------------------------------------------------------

--■■■ TRIGGER(트리거) ■■■--

-- 사전적인 의미 : 방아쇠, 촉발시키다, 야기하다, 유발하다.

-- 1.TRIGGER(트리거)란 DML 작업 즉, INSERT, UPDATE, DELETE 작업이 일어날 때
-- 자동적으로 실행되는(유발되는, 촉발되는) 객체로
-- 이와 같은 특징을 강조하여 DML TRIGGER 라고 부르기도 한다.
-- TRIGGER 는 무결성 뿐 아니라
-- 다음에 같은 작업에도 널리 사용된다.

-- 자동으로 파생된 열 값 생성
-- 잘못된 트랜잭션 방지
-- 복잡한 보안 권한 강제 수행
-- 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행
-- 복잡한 업무 규칙 강제 적용
-- 투명한 이벤트 로깅 제공
-- 복잡한 감사 제공
-- 동기 테이블 복제 유지관리
-- 테이블 액세스 통계 수집

--2. TRIGGER(트리거) 내에서는 COMMIT, ROLLBACK 문을 사용할 수 없다.

-- 3. 특징 및 종류
-- - BEFORE STATEMENT
-- - BEFORE ROW
-- - AFTER STATEMENT
-- - AFTER ROW

-- 4. 형식 및 구조
/*
CREATE [OR REPLACE] TRIGGER 트리거명
    [BEFORE | AFTER]
    이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명
    [FOR EACH ROW [WHEN TRIGGER 조건]]
[DECLARE]
    -- 선언 구문;
BEGIN 
    -- 실행 구문;
END    
*/

--■■■ AFTER STATEMENT TRGGIER 상황 실습 ■■■--
--※ DML 작업에 대한 이벤트 기록

--○ TRIGGER(트리거) 생성 → TRG_EVENTLOG
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    --이벤트 종류 구분(조건문을 통한 분기)
    IF(INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('INSERT 쿼리가 실행되었습니다.');
    ELSIF(UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('UPDATE 쿼리가 실행되었습니다.');
    ELSIF(DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('DELETE 쿼리가 실행되었습니다.');
    END IF;
    
    --COMMIT;
    --※ TRIGGER 내에서는 COMMIT / ROLLBACK 구문 사용 불가~!!!
END;



--■■■ BEFORE STATEMENT TRGGIER 상황 실습 ■■■--
-- ※ DML 작업 수행 전에 작업에 대한 가능 여부 확인

--○ TRIGGER(트리거) 생성 → TRG_TEST1_DML
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE
    INSERT OR DELETE OR UPDATE ON TBL_TEST1
BEGIN
    IF (작업시간이 오전 9시 이전이거나... 오후 6시 이후라면...)
    THEN 작업을 수행하지 못하도록 처리하겠다.
    END IF;
END;

--

CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE
    INSERT OR DELETE OR UPDATE ON TBL_TEST1
BEGIN
    IF (TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) < 9 OR TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) > 17)  
    THEN 작업을 수행하지 못하도록 처리하겠다.= 사용자 정의 예외를 발생시킬 수 있도록 하겠다.
    END IF;
END;

--

CREATE OR REPLACE TRIGGER TRG_TEST1_DML
    BEFORE
    INSERT OR DELETE OR UPDATE ON TBL_TEST1
BEGIN
    IF (TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) < 9 
    OR TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) > 17)  
        THEN RAISE_APPLICATION_ERROR(-20003, '직업은 09:00 ~ 18:00 까지만 가능합니다.');
    END IF;
END;
--==>> Trigger TRG_TEST1_DML이(가) 컴파일되었습니다.



--■■■ BEFORE ROW TRIGGIER 상황 실습 ■■■--
-- ※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델

--○ TRIGGER(트리거) 생성 → TRG_TEST2_DELETE
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
    BEFORE 
    DELETE ON TBL_TEST2 --부모테이블에 삭제 이벤트
    FOR EACH ROW    -- 각각의 행
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;
END;    
--==>>Trigger TRG_TEST2_DELETE이(가) 컴파일되었습니다.

--※ 『:OLD』
-- 참조 전 열의 값
-- (INSERT : 입력하기 이전 자료, DELETE : 삭제하기 이전 자료 즉, 삭제할 자료)

-- UPDATE : 내부적으로 DELETE 그리고 INSERT 가 결합된 형태
--          UPDATE 하기 이전의 데이터는 『:OLD』
--          UPDATE 수행한 이후의 데이터는 『:NEW』


--------------------------------------------------------------------------------

--■■■ AFTER ROW TRIGGER 상황 실습 ■■■--
--※ 참조 테이블 관련 트랜잭션 처리

--TBL_입고, TBL_상품, TBL_출고

--○ TBL_입고 테이블의 데이터 입력 시(즉, 입고 이벤트 발생 시)
-- TBL_상품 테이블의 재고수량 변동 트리거 작성
-- 트리거 명 : TRG_IBGO

CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_입고
        FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 + 새로입고되는입고수량
            WHERE 상품코드 = 새로입고되는상품코드;
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_입고
        FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 + 새로입고되는입고수량
            WHERE 상품코드 = 새로입고되는상품코드;
    END IF;
END;


CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_입고
        FOR EACH ROW
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
            SET 재고수량 = 재고수량 + :NEW.입고수량
            WHERE 상품코드 = :NEW.상품코드;
    END IF;
END;
--==>>Trigger TRG_IBGO이(가) 컴파일되었습니다.


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
        SET 재고수량 = 재고수량 - :OLD.입고수량 + :NEW.입고수량
        WHERE 상품코드 = :NEW.상품코드;
    ELSIF (DELETING)
        THEN UPDATE TBL_상품
        SET 재고수량 = 재고수량 - :OLD.입고수량 -- 이부분은 왜 OLD 인거지?
        WHERE 상품코드 = :OLD.상품코드;        
    END IF;
END;






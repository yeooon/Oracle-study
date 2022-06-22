SELECT USER
FROM DUAL;
--==>> TEAM3

--�� �л����̺�(STU) ����
CREATE TABLE STU
( STU_ID       VARCHAR2(10)
, STU_NAME     VARCHAR2(20) NOT NULL
, SSN          VARCHAR2(14) NOT NULL
, PASSWORD     VARCHAR2(20) NOT NULL
, REGIST_DATE  DATE  DEFAULT SYSDATE        
, CONSTRAINT STU_STU_ID_PK PRIMARY KEY(STU_ID)
);
-- �ڸ�Ʈ
COMMENT ON TABLE STU IS '�л��������̺�';
COMMENT ON COLUMN STU.STU_ID IS '�л����̵�';
COMMENT ON COLUMN STU.STU_NAME IS '�л��̸�';
COMMENT ON COLUMN STU.SSN IS '�ֹι�ȣ';
COMMENT ON COLUMN STU.PASSWORD IS '��й�ȣ';
COMMENT ON COLUMN STU.REGIST_DATE IS '�����(�⺻�� SYSDATE)';
-------------------------------------------------------------------------------------------------------------------

--�� Ż������(REASONS_DROPOUT) ���̺� ����
CREATE TABLE REASONS_DROPOUT
( REASONS_DROPOUT_ID    VARCHAR2(10) 
, REASON_DROPOUT        VARCHAR2(40) NOT NULL
, CONSTRAINT REASONS_DROPOUT_ID_PK PRIMARY KEY(REASONS_DROPOUT_ID) -- PK �̸� �ʹ� �� ����
);
-- �ڸ�Ʈ
COMMENT ON TABLE REASONS_DROPOUT IS 'Ż���������̺�';
COMMENT ON COLUMN REASONS_DROPOUT.REASONS_DROPOUT_ID IS 'Ż�������ڵ�';
COMMENT ON COLUMN REASONS_DROPOUT.REASON_DROPOUT IS 'Ż������';

--------------------------------------------------------------------------------------------------------------------
-- �� PROF (����) ���̺� ����
CREATE TABLE PROF
( PROF_ID       VARCHAR2(10)   
, PROF_NAME     VARCHAR2(20)    NOT NULL
, SSN           VARCHAR2(14)    NOT NULL
, PASSWORD      VARCHAR2(20)    NOT NULL
, REGIST_DATE   DATE DEFAULT    SYSDATE
, CONSTRAINT PROF_PROF_ID_PK PRIMARY KEY(PROF_ID)
);

-- PROF (����) ���̺��� �÷� �ڸ�Ʈ �Է�
COMMENT ON COLUMN PROF.PROF_ID IS '����ID';
COMMENT ON COLUMN PROF.PROF_NAME IS '�����̸�';
COMMENT ON COLUMN PROF.SSN IS '�ֹε�Ϲ�ȣ';
COMMENT ON COLUMN PROF.PASSWORD IS '��й�ȣ';
COMMENT ON COLUMN PROF.REGIST_DATE IS '�����';
----------------------------------------------------------------------------------------------------------------------
--�� COURSE (����) ���̺� ����
CREATE TABLE COURSE 
( COURSE_ID     VARCHAR2(10)    
, COURSE_NAME	VARCHAR2(50)    NOT NULL
, CONSTRAINT COURSE_COURSE_ID_PK PRIMARY KEY(COURSE_ID)
);

-- COURSE (����) ���̺��� �÷� �ڸ�Ʈ �Է�
COMMENT ON COLUMN COURSE.COURSE_ID IS '�����ڵ�';
COMMENT ON COLUMN COURSE.COURSE_NAME IS '������';
-----------------------------------------------------------------------------------------------------------------------
--�� BOOK(����) ���̺� ����
CREATE TABLE BOOK 
(
  BOOK_ID	VARCHAR2(10)	            -- �����ڵ�
, BOOK_NAME	VARCHAR2(30)	NOT NULL    -- �����
, BOOK_PUB	VARCHAR2(20)	NOT NULL        -- ���ǻ�
, CONSTRAINT BOOK_BOOK_ID_PK PRIMARY KEY(BOOK_ID)  -- ��������
);
COMMENT ON TABLE BOOK IS '����';
COMMENT ON COLUMN BOOK.BOOK_ID IS '�����ڵ�';
COMMENT ON COLUMN BOOK.BOOK_NAME IS '�����';
COMMENT ON COLUMN BOOK.BOOK_PUB IS '���ǻ�';
-----------------------------------------------------------------------------------------------------------------------
--�� SUBJECT(����) ���̺� ����
CREATE TABLE SUBJECT 
(
  SUBJECT_ID	VARCHAR2(10)	            -- �����ڵ�
, SUBJECT_NAME	VARCHAR2(20)	NOT NULL        -- �����
, CONSTRAINT SUBJECT_SUJECT_ID_PK PRIMARY KEY(SUBJECT_ID)   -- ��������
);
COMMENT ON TABLE SUBJECT IS '����';
COMMENT ON COLUMN SUBJECT.SUBJECT_ID IS '�����ڵ�';
COMMENT ON COLUMN SUBJECT.SUBJECT_NAME IS '�����';
------------------------------------------------------------------------------------------------------------------------
--�� ADMIN(������) ���̺�
CREATE TABLE ADMIN
( ADMIN_ID      VARCHAR2(10) 
, ADMIN_NAME    VARCHAR2(20)    NOT NULL
, SSN           VARCHAR2(14)    NOT NULL
, PASSWORD      VARCHAR2(20)    NOT NULL
, REGIST_DATE   DATE DEFAULT SYSDATE
, CONSTRAINT    ADMIN_ADMIN_ID_PK       PRIMARY KEY(ADMIN_ID)
);

COMMENT ON TABLE ADMIN IS '������';
COMMENT ON COLUMN ADMIN.ADMIN_ID IS '������ID';
COMMENT ON COLUMN ADMIN.ADMIN_NAME IS '�����ڸ�';
COMMENT ON COLUMN ADMIN.SSN IS '�ֹε�Ϲ�ȣ';
COMMENT ON COLUMN ADMIN.REGIST_DATE IS '�����';

------------------------------------------------------------------------------------------------------------------------------
--�� CLASS(���ǽ�) ���̺�
CREATE TABLE CLASS
( CLASS_ID      VARCHAR2(10)  
, CLASS_NAME    VARCHAR2(20)  NOT NULL
, CONSTRAINT    CLASS_CLASS_ID_PK       PRIMARY KEY(CLASS_ID)
);

COMMENT ON TABLE CLASS IS '���ǽ�';
COMMENT ON COLUMN CLASS.CLASS_ID IS '���ǽ��ڵ�';
COMMENT ON COLUMN CLASS.CLASS_NAME IS '���ǽǸ�';
----------------------------------------------------------------------------------------------------------------------------

--�� ���� ���� ���̺� ����
CREATE TABLE OPEN_COUR 
(
  OPEN_COUR_ID	VARCHAR2(10)
, START_DATE	DATE	    
, END_DATE	    DATE	     
, CLASS_ID	    VARCHAR2(10)	
, PROF_ID	    VARCHAR2(10)	
, REGIST_DATE	DATE	       DEFAULT SYSDATE
, COURSE_ID	    VARCHAR2(10)	
, CONSTRAINT OPEN_COUR_ID_PK PRIMARY KEY(OPEN_COUR_ID)
, CONSTRAINT OPEN_COUR_CLASS_ID_FK FOREIGN KEY(CLASS_ID)
                              REFERENCES CLASS(CLASS_ID)
, CONSTRAINT OPEN_COUR_PROF_ID_FK FOREIGN KEY(PROF_ID)
                              REFERENCES PROF(PROF_ID)
, CONSTRAINT OPEN_COUR_COURSE_ID_FK FOREIGN KEY(COURSE_ID)
                              REFERENCES COURSE(COURSE_ID)                              
);
--==>> Table OPEN_COUR��(��) �����Ǿ����ϴ�.

COMMENT ON TABLE OPEN_COUR IS '���� ����';
COMMENT ON COLUMN OPEN_COUR.OPEN_COUR_ID IS '���������ڵ�';
COMMENT ON COLUMN OPEN_COUR.START_DATE IS '���� ������';
COMMENT ON COLUMN OPEN_COUR.END_DATE IS '���� ������';
COMMENT ON COLUMN OPEN_COUR.PROF_ID IS '�������̺� ����ID ����Ű';
COMMENT ON COLUMN OPEN_COUR.REGIST_DATE IS '����� �⺻�� SYSDATE(������)';
COMMENT ON COLUMN OPEN_COUR.COURSE_ID IS '�������̺� �����ڵ� ����Ű';
--==>> Comment��(��) �����Ǿ����ϴ�.

--------------------------------------------------------------------------------

--�� �ߵ�Ż������Ʈ
CREATE TABLE DROPOUT 
(
  DROPOUT_ID	        VARCHAR2(10)	
, APP_ID	            VARCHAR2(10)	
, REASONS_DROPOUT_ID	VARCHAR2(10)	
, DROPOUT_DATE	        DATE	       DEFAULT SYSDATE
, CONSTRAINT DROPOUT_DROPOUT_ID_PK PRIMARY KEY(DROPOUT_ID)
, CONSTRAINT DROPOUT_REASONS_DROPOUT_ID_FK FOREIGN KEY(REASONS_DROPOUT_ID) 
                                           REFERENCES REASONS_DROPOUT(REASONS_DROPOUT_ID)
);

-- APP ���� �Ŀ� �߰�(FK)
ALTER TABLE DROPOUT ADD CONSTRAINT DROPOUT_APP_ID_FK FOREIGN KEY(APP_ID) 
                                                     REFERENCES APP(APP_ID);

-- �ڸ�Ʈ
COMMENT ON TABLE DROPOUT IS '�ߵ�Ż������Ʈ';
COMMENT ON COLUMN DROPOUT.DROPOUT_ID IS '�ߵ�Ż���ڵ�';
COMMENT ON COLUMN DROPOUT.APP_ID IS '������û�ڵ� ������û ID ���� �ܷ�Ű';
COMMENT ON COLUMN DROPOUT.REASONS_DROPOUT_ID IS 'Ż������ ID ���� �ܷ�Ű';
COMMENT ON COLUMN DROPOUT.DROPOUT_DATE IS '�ߵ�Ż������';

--------------------------------------------------------------------------------
-- APP (������û) ���̺� ����
CREATE TABLE APP 
( APP_ID        VARCHAR2(10)    	
, OPEN_COUR_ID  VARCHAR2(10)
, STU_ID	    VARCHAR2(10)
, APP_DATE	    DATE    DEFAULT SYSDATE	
, CONSTRAINT APP_APP_DATE_PK PRIMARY KEY(APP_ID)
, CONSTRAINT APP_OPEN_COUR_ID_FK FOREIGN KEY(OPEN_COUR_ID)
             REFERENCES OPEN_COUR(OPEN_COUR_ID)
, CONSTRAINT APP_STU_ID_FK FOREIGN KEY(STU_ID)
             REFERENCES STU(STU_ID)
);

-- �ڸ�Ʈ �Է�
COMMENT ON TABLE APP IS '������û';
COMMENT ON COLUMN APP.APP_ID IS '������û�ڵ�';
COMMENT ON COLUMN APP.OPEN_COUR_ID IS '�������� ���̺� ���������ڵ� ���� �ܷ�Ű';
COMMENT ON COLUMN APP.STU_ID IS '�л� ���̺� �л�ID ���� �ܷ�Ű';
COMMENT ON COLUMN APP.APP_DATE IS '������û��';

--------------------------------------------------------------------------------
--�� ��������
CREATE TABLE OPEN_SUBJ
( OPEN_SUBJ_ID      VARCHAR2(10)
, START_DATE        DATE
, END_DATE          DATE
, OPEN_COUR_ID      VARCHAR2(10)
, BOOK_ID           VARCHAR2(10)
, SUBJECT_ID        VARCHAR2(10)
, WRITE_POINT       NUMBER(4,2)
, PRACTICE_POINT    NUMBER(4,2)
, ATTEND_POINT      NUMBER(4,2)

, CONSTRAINT OPEN_SUBJ_ID_PK            PRIMARY KEY(OPEN_SUBJ_ID)
, CONSTRAINT OPEN_SUBJ_OPEN_COUR_ID_FK  FOREIGN KEY(OPEN_COUR_ID)
                                        REFERENCES OPEN_COUR(OPEN_COUR_ID)
, CONSTRAINT OPEN_SUBJ_BOOK_ID_FK       FOREIGN KEY(BOOK_ID)
                                        REFERENCES BOOK(BOOK_ID)
, CONSTRAINT OPEN_SUBJ_SUBJECT_ID_FK    FOREIGN KEY(SUBJECT_ID)
                                        REFERENCES SUBJECT(SUBJECT_ID)
);

COMMENT ON TABLE OPEN_SUBJ IS '��������';
COMMENT ON COLUMN OPEN_SUBJ.OPEN_SUBJ_ID IS '���������ڵ�';
COMMENT ON COLUMN OPEN_SUBJ.START_DATE IS '���������';
COMMENT ON COLUMN OPEN_SUBJ.END_DATE IS '����������';
COMMENT ON COLUMN OPEN_SUBJ.OPEN_COUR_ID IS '�����������̺� ���������ڵ� ����Ű';
COMMENT ON COLUMN OPEN_SUBJ.BOOK_ID IS '�������̺� �����ڵ� ����Ű';
COMMENT ON COLUMN OPEN_SUBJ.SUBJECT_ID IS '�������̺� �����ڵ� ����Ű';
COMMENT ON COLUMN OPEN_SUBJ.WRITE_POINT IS '�ʱ����';
COMMENT ON COLUMN OPEN_SUBJ.PRACTICE_POINT IS '�Ǳ����';
COMMENT ON COLUMN OPEN_SUBJ.ATTEND_POINT IS '������';

--------------------------------------------------------------------------------

-- �� ����
CREATE TABLE SCORE 
( SCORE_ID       VARCHAR2(10)
, OPEN_SUBJ_ID   VARCHAR2(10)
, APP_ID         VARCHAR2(10)
, ATTEND_SCORE   NUMBER   
, WRITE_SCORE    NUMBER
, PRACTICE_SCORE NUMBER
, SCORE_DATE     DATE DEFAULT SYSDATE    
, CONSTRAINT SCORE_SCORE_ID_PK PRIMARY KEY(SCORE_ID)
);
-- (FK ������ �߰�)
ALTER TABLE SCORE 
ADD ( CONSTRAINT SCORE_OPEN_SUBJ_ID_FK FOREIGN KEY(OPEN_SUBJ_ID) 
                                       REFERENCES  OPEN_SUBJ(OPEN_SUBJ_ID)
    , CONSTRAINT SCORE_APP_ID_FK  FOREIGN KEY(APP_ID)
                                       REFERENCES APP(APP_ID));
                                       
-- �ڸ�Ʈ 
COMMENT ON TABLE SCORE IS '�������̺�';
COMMENT ON COLUMN SCORE.SCORE_ID IS '�����ڵ� PK'; 
COMMENT ON COLUMN SCORE.OPEN_SUBJ_ID IS '�����������̺� ���������ڵ� ����Ű';
COMMENT ON COLUMN SCORE.APP_ID IS '������û���̺� ������û�ڵ� ����Ű';
COMMENT ON COLUMN SCORE.ATTEND_SCORE IS '��ῡ ���� ����';
COMMENT ON COLUMN SCORE.WRITE_SCORE IS '�ʱ⿡ ���� ����';
COMMENT ON COLUMN SCORE.PRACTICE_SCORE IS '�Ǳ⿡ ���� ����';
COMMENT ON COLUMN SCORE.SCORE_DATE IS '���� ��� ��¥';

--------------------------------------------------------------------------------


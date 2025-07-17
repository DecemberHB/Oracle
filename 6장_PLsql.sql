/*
    날짜 : 2025/07/17
    이름 : 박효빈
    내용 : 6장 PL/SQL
*/

--실습 1-1

SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO, ORACLE!');
    END;
/   
-- 1-2 

DECLARE
    NO NUMBER(4) := 1001;
    NAME VARCHAR(10) := '홍길동';
    HP CHAR(13) := '010-1000-1001';
    ADDR VARCHAR2(100) := '부산광역시';
BEGIN
    --DBMS_OUTPUT.PUT_LINE('번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('이름 :' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화 :' || HP);
    DBMS_OUTPUT.PUT_LINE('주소 :' || ADDR);
END;
/
-- 1-3

DECLARE
   NO   CONSTANT NUMBER(4) := 1001;
    NAME VARCHAR2(10);
    HP   CHAR(13) := '000-0000-0000';
    AGE  NUMBER(2) DEFAULT 1;
    ADDR VARCHAR2(10) NOT NULL := '부산';
 BEGIN
    NAME := '김유신';
    HP := '010-1000-1001';
    DBMS_OUTPUT.PUT_LINE('번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화 : ' || HP);
    DBMS_OUTPUT.PUT_LINE('나이 : ' || AGE);
    DBMS_OUTPUT.PUT_LINE('주소 : ' || ADDR);
 END; 
 /
 
-- 2-2

DECLARE
    NO DEPT.DEPTNO%TYPE;
    NAME DEPT.DNAME%TYPE;
    DTEL DEPT.DTEL%TYPE;
BEGIN 
    SELECT *
    INTO NO, NAME, DTEL
    FROM DEPT
    WHERE DEPTNO = 30;
    
    DBMS_OUTPUT.PUT_LINE('부서번호 : ' || NO);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('전화번호 :' || DTEL);
END;
/

-- 2-3

DECLARE
 --선언
 ROW_DEPT DEPT%ROWTYPE;
BEGIN
 --처리
 SELECT *
 INTO ROW_DEPT
 FROM DEPT
 WHERE DEPTNO = 40;
 
 --출력
 DBMS_OUTPUT.PUT_LINE('부서번호 : ' || ROW_DEPT.DEPTNO);
 DBMS_OUTPUT.PUT_LINE('부서명 : ' || ROW_DEPT.DNAME);
 DBMS_OUTPUT.PUT_LINE('부서hp : ' || ROW_DEPT.DTEL);
END;
/

DECLARE
    -- Record Define
    TYPE REC_DEPT IS RECORD (
        deptno  NUMBER(2),
        dname   DEPT.DNAME%TYPE,
        dtel    DEPT.DTEL%TYPE
    );
    -- Record Declare
    dept_rec REC_DEPT;
 BEGIN
    -- Record Initialize
    dept_rec.deptno := 10;
    dept_rec.dname := '개발부';
    dept_rec.dtel := '부산';    
    -- Record Print
    DBMS_OUTPUT.PUT_LINE('deptno : ' || dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : ' || dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('tel : ' || dept_rec.dtel);    
    DBMS_OUTPUT.PUT_LINE('PL/SQL 종료...');
 END;
 /
 
 --실습 4-1 << 커서 중요 >> 

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    --커서선언
    CURSOR c1 IS SELECT * FROM DEPT WHERE DEPTNO = 40;
BEGIN

--커서 열기
     OPEN c1;
-- 커서 데이터 입력
    FETCH c1 INTO V_DEPT_ROW;
-- 커서 데이터 출력
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('DTEL : ' || V_DEPT_ROW.DTEL);
    
    CLOSE c1;
END;
/


-- 실습 4-2 루프 프로시저 
DECLARE
    V_EMP_ROW EMP%ROWTYPE;
    CURSOR emp_cursor IS SELECT * FROM EMP; 
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO V_EMP_ROW;
        
        DBMS_OUTPUT.PUT_LINE('----------------');
        DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_EMP_ROW.EMPNO);
        DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_EMP_ROW.NAME);
        BMS_OUTPUT.PUT_LINE('EMPNO : ' || V_EMP_ROW.REGDATE);
        EXIT WHEN emp_cursor%NOTFOUND;
    END LOOP;
END;
/
-- 실습 4-3 루프 프로시저

DECLARE    
    CURSOR c1 IS SELECT * FROM DEPT;
 BEGIN    
    FOR c1_rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('------------------------------');
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || c1_rec.DNAME);
        DBMS_OUTPUT.PUT_LINE('DTEL : ' || c1_rec.DTEL);
    END LOOP;
 END;
/


-- 실습 5-1
CREATE PROCEDURE hello_procedure (
    p_name IN VARCHAR2
 )
 IS
 BEGIN
    DBMS_OUTPUT.PUT_LINE('안녕하세요, ' || p_name || '님!');
    DBMS_OUTPUT.PUT_LINE('환영합니다.');
 END;

 EXECUTE hello_procedure('홍길동');-- 프로시저 실행

DROP PROCEDURE hello_procedure;



CREATE FUNCTION get_emp_name (p_empno NUMBER)
 RETURN VARCHAR2
 IS
    v_ename VARCHAR2(010);
 BEGIN
    SELECT ENAME
    INTO v_ename
    FROM EMP
    WHERE EMPNO = p_empno;
    RETURN v_ename;
 END;
/

SELECT get_emp_name(1011) FROM DUAL;


CREATE TABLE emp_log (
    log_date DATE,
    empno NUMBER,
    action VARCHAR2(10)
    );

CREATE TRIGGER trgg_emp_insert
AFTER INSERT ON emp
FOR EACH ROW
BEGIN
    INSERT INTO emp_log (log_date, empno, action)
    VALUES (SYSDATE, :NEW.empno,'INSERT');
END;
/

INSERT INTO emp VALUES (2001,'김유신','M','사원',10,sysdate);

SELECT * FROM emp_log;

DECLARE
    NUM NUMBER := 1;
BEGIN
    IF NUM > 0 THEN
        DBMS_OUTPUT.PUT_LINE('NUM은 0보다 크다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NUM은 0보다 작다.');
    END IF;
    DBMS_OUTPUT.PUT_LINE('EXIT');
END;
/


-- 교재 p26 실습 start
SELECT * FROM emp;
SELECT *
FROM EMP;
SELECT FR
OM emp;
SELECT *
FROM EM
P;
DESC DEPT; -- 테이블에 어떤 컬럼이있는지 확인하는 명령어 DEPT 테이블에 어떤 컬럼이있는지
SELECT * FROM tab; -- 해당 사용자가 만든 모든 테이블 조회 명령어
SELECT empno, ename 
FROM emp; -- SELECT , , << 조회하고싶은 컬럼명 FROM () << 테이블 지정

SET PAGESIZE 15
SET LINESIZE 200
SELECT empno, ename FROM emp;
//편의성 명령어 COL empno FOR 9999 -> empno라는 컬럼의 길이를 숫자 4자리까지 들어가게 설정
//COL ename FOR a8 -> ename이란 컬럼의 길이를 8바이트까지 들어가게 설정
//SET SIZELINE 200 한 화면을 가로롤 200바이트까지 출력되게
//SET PAGESIZE 50 한 페이지에 50줄까지 출력

SELECT dname, 'good mornig~!' "Good Mornig" FROM dept; --SELECT 명령에 표현식 사용하여 출력

SELECT dname, ',it''s deptno: ', deptno "DNAME AND DEPTNO" FROM dept;

SELECT * FROM dept;

SELECT profno, name, pay FROM professor;

SELECT profno "Prof's NO", name AS "Prof's NAME", pay Prof_Pay FROM professor;
-- "" << 별명에 공백이나, 특수문자, 대소문자 구분이 필요한 경우 "별명" 형태로 명령어 입력

SELECT deptno FROM emp;
SELECT DISTINCT deptno FROM emp; --중복된 값 제거하고 출력 emp에서 deptno 중복 제거
SELECT job, ename FROM emp ORDER BY 1,2;

SELECT DISTINCT job, ename FROM emp ORDER BY 1,2;
SELECT DISTINCT job FROM emp ORDER BY job;
//연결연산자로 컬럼을 붙여서 출력
SELECT ename, job FROM emp ORDER BY 1,2;
SELECT ename ||'--'|| job FROM emp;

SELECT ename||' ''s job is '|| job "NAME AND JOB" FROM emp;

SELECT name,id,weight FROM STUDENT;


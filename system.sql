/*
    날짜 : 2025/07/17
    이름 : 박효빈
    내용 : 5장 데이터베이스 객체

*/

// 워크북 p13
// 실습하기 31-

SELECT * FROM DICTIONARY;

SELECE table_name FROM user_tables;

SELECT * FROM DICTIONARY;

select table_name from user_tables;

select owner, table_name from all_tables;


select * from dba_tables;
select * from dba_users;

select instance_name, status, database_status, host_name from V$INSTANCE;


-- 실습 사용자 생성 (관리자계정만 가능) 4-1

 
// *(필수)Oracle 에서 내부 스크립트 실행이나 일반사용자 생성을 가능하게 하기 위한 세션 설정 
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
create user test1 identified by 1234;

-- 실습하기 4-2

select * from all_users;
ALTER USER TEST1 IDENTIFIED BY 1111;

-- 실습하기 4-4

GRANT connect, resource to test1;
grant unlimited tablespace to test1;

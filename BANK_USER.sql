INSERT INTO BANK_CUSTOMER VALUES ('720423-100001','김유신','1','010-1234-1001','경남 김해시');
INSERT INTO BANK_CUSTOMER VALUES ('720423-100002','김춘추','1','010-1234-1002','경남 경주시');
INSERT INTO BANK_CUSTOMER VALUES ('720423-100003','장보고','1','010-1234-1003','전남 완도군');
INSERT INTO BANK_CUSTOMER VALUES ('102-12-51094','(주)정보산업','2','051-500-1004','부산시 부산진구');
INSERT INTO BANK_CUSTOMER VALUES ('930423-100005','이순신','1','010-1234-1005','서울 종로구');

INSERT INTO bank_account (a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date) VALUES
('101-11-1001', 'S1', '자유저축예금', '720423-100001', 1550000, TO_DATE('2011-04-11', 'YYYY-MM-DD'));

INSERT INTO bank_account (a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date) VALUES
('101-11-1002', 'S1', '자유저축예금', '930423-100005', 260000, TO_DATE('2011-05-12', 'YYYY-MM-DD'));

INSERT INTO bank_account (a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date) VALUES
('101-11-1003', 'S1', '자유저축예금', '720423-100003', 75000, TO_DATE('2011-06-13', 'YYYY-MM-DD'));

INSERT INTO bank_account (a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date) VALUES
('101-12-1001', 'S2', '기업전용예금', '102-12-51094', 15000000, TO_DATE('2011-07-14', 'YYYY-MM-DD'));

INSERT INTO bank_account (a_no, a_item_dist, a_item_name, a_c_no, a_balance, a_open_date) VALUES
('101-13-1001', 'S3', '정기저축예금', '720423-100002', 1200000, TO_DATE('2011-08-15', 'YYYY-MM-DD'));

INSERT INTO bank_transaction VALUES ('1','101-11-1001','1','50000','2023-01-01 13:15:10');

INSERT INTO bank_transaction VALUES ('2','101-12-1001','2','1000000','2023-01-02 13:15:12');
INSERT INTO bank_transaction VALUES ('3','101-11-1002','3','260000','2023-01-03 13:15:14');
INSERT INTO bank_transaction VALUES ('4','101-11-1002','2','100000','2023-01-04 13:15:16');
INSERT INTO bank_transaction VALUES ('5','101-11-1003','3','75000','2023-01-05 13:15:18');
INSERT INTO bank_transaction VALUES ('6','101-11-1001','1','150000','2023-01-05 13:15:28');


-- 실습 6-6
select 
	c_no, c_name, c_phone, a_no, a_item_name, a_balance
from bank_customer a 
join bank_account b on a.c_no = b.a_c_no;

select 
	t_dist,
    t_amount,
    t_datetime
from bank_customer a 
join bank_account b on a.c_no = b.a_c_no
join bank_transaction c on b.a_no = c.t_a_no
where c_name = '이순신';

select 
	c_no,
    c_name,
    a_no,
    a_balance,
    a_open_date
from bank_customer a 
join bank_account b on a.c_no = b.a_c_no
where c_dist=1
order by a_balance desc
FETCH FIRST 1 ROWS ONLY;

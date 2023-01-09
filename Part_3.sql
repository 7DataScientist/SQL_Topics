create database cust;

use cust;

create table cust.bank_info
(
age int,
job varchar(20),
marital varchar(20),
education varchar(20),
`default` varchar(5),
balance int,
housing varchar(5),
loan varchar(5),
contact varchar(15),
`day` int,
`month` text,
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(20),
y text
);

select * from cust.bank_info;

SET SQL_SAFE_UPDATES = 0;
SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bank-full.csv'
INTO TABLE cust.bank_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from cust.bank_info limit 50;

create table cust.bank_info_1
(
age int,
job varchar(20),
marital varchar(20),
education varchar(20),
`default` varchar(5),
balance int,
housing varchar(5),
loan varchar(5),
contact varchar(15),
`day` int,
`month` text,
duration int,
campaign int,
pdays int,
previous int,
poutcome varchar(20),
y text
);


insert into cust.bank_info_1 values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no");


select * from cust.bank_info_1;

select count(poutcome) from bank_info_1;

-- DQL

select * from cust.bank_info_1 where job = 'technician';
select * from cust.bank_info_1;

select distinct(job) from cust.bank_info_1;
select * from cust.bank_info_1;

select * from cust.bank_info_1 where job = "retired" and balance > 100;


-- Math Functions
select * from cust.bank_info_1;

select * from cust.bank_info_1 where balance = "max";

select max(balance) from cust.bank_info_1;
select min(balance) from cust.bank_info_1;
select sum(balance) from cust.bank_info_1;
select avg(balance) from cust.bank_info_1;
select count(balance) from cust.bank_info_1;

-- Nested Queries

select * from cust.bank_info_1;
select min(balance) from cust.bank_info_1;

select * from cust.bank_info_1 where balance = (select min(balance) from cust.bank_info_1);
select * from cust.bank_info_1 where balance = (select max(balance) from cust.bank_info_1);
select * from cust.bank_info_1 where balance = (select avg(balance) from cust.bank_info_1);

select max(duration) from cust.bank_info_1;
select * from cust.bank_info_1 where duration = (select max(duration) from cust.bank_info_1) or balance = (select max(balance) from cust.bank_info_1);

-- Grouping

select * from cust.bank_info_1;

select marital,count(marital) from cust.bank_info_1 group by marital;

select marital, sum(balance) from cust.bank_info_1 group by marital;
select marital, avg(balance) from cust.bank_info_1 group by marital;

select marital, count(*), avg(balance), sum(balance) from cust.bank_info_1 group by marital;
select job, count(*), avg(balance), sum(balance) from cust.bank_info_1 group by job;

-- Sum Avg for marital whoes balance > 300

select marital, count(*) where sum(balance) > 300 from cust.bank_info_1 group by marital;
select marital, count(*), avg(balance) sum(balance) > 300 from cust.bank_info_1 group by marital;
select marital, count(*), avg(balance),sum(balance) from cust.bank_info_ 1 > 300 group by marital;

select marital, balance from cust.bank_info_1 where balance > 300;

-- Select --> From --> Group --> Having --> Order By
-- Select --> From --> Where --> Filter --> Order By

-- Having
select marital, sum(balance), avg(balance) as av from cust.bank_info_1 group by marital;
select marital, sum(balance), avg(balance) as av from cust.bank_info_1 group by marital having sum(balance) > 300 order by av desc;

select marital, balance from cust.bank_info_1 order by marital;
select marital, sum(balance), avg(balance) as av from cust.bank_info_1 group by marital having sum(balance) > 300;

-- Procedure in SQL_1

DELIMITER &&
create procedure jon_info()
BEGIN
	select * from cust.bank_info_1 where job = 'technician';
END &&

DELIMITER ;

DELIMITER &&
create procedure jon_info1(IN job1 varchar(50))
BEGIN
	select * from cust.bank_info_1;
	select * from cust.bank_info_1 where job = job1;
END &&

DELIMITER ;

call jon_info();
call jon_info1('blue-collar');






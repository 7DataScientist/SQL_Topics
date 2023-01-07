USE info_org;
SHOW TABLES;


SELECT * FROM degree;
SELECT * FROM salary;
USE students_info;
SHOW TABLES;

SELECT * FROM dept;
SELECT * FROM dept_rank;



-- Student_info DB

CREATE TABLE stu_id(
	student_id int not null auto_increment primary key,
    student_name varchar(50) not null,
    stu_con int
);

SELECT * FROM stu_id;

INSERT INTO stu_id VALUES(1,'A101',9101);
INSERT INTO stu_id VALUES(2,'B101',8101);
INSERT INTO stu_id (student_name,stu_con) VALUES('C101',7101);


CREATE TABLE students(
	student_id int,
    student_name varchar(50) not null,
    age int,
    gender varchar(1),
    location varchar(100)
);

INSERT INTO students VALUES(1,'Ben',26, 'M','Bangalore');
INSERT INTO students VALUES(2,'Gen',22, 'M','Hyderabad');
INSERT INTO students VALUES(3,'Gen',22, '','Hyderabad');
INSERT INTO students VALUES(3,' ',22, '','Chennai');
INSERT INTO students VALUES(3,'Zen ',22, NULL,'Chennai');
INSERT INTO students VALUES(3,'Ten',22, 'Female','KolKata');

CREATE TABLE dept(
	depid int not null auto_increment,
    depname varchar(25),
    depadd varchar(50),
    primary key(depid)
);

INSERT INTO dept VALUES(1,'Chemistry','Floor_1');
INSERT INTO dept VALUES(2,'Chemistry','Floor_1');
INSERT INTO dept VALUES(3,'Physics','Floor_2');
INSERT INTO dept VALUES(4,'Physics','Floor_2');
INSERT INTO dept VALUES(5,'CS','Floor_3');
INSERT INTO dept VALUES(6,'CS','Floor_3');

-- 

SHOW TABLES;

SELECT * FROM students;

-- Data Manu Language (DQL)

-- Exapmle of Student Table from Students_info DB
USE students_info;
SET SQL_SAFE_UPDATES = 0;

DELETE FROM students WHERE students_id = 3;
SELECT * FROM students;


DELETE FROM students WHERE student_id = 3 AND location = 'Hyderabad';
UPDATE students SET student_name = 'Ken' WHERE student_id = 3 AND location = 'Hyderabad';
UPDATE students SET student_name = 'Ren' WHERE student_id = 3 AND student_name = ' ';

SELECT COUNT(gender) FROM students;


/*
ALTER TABLE table_name
ALTER COLUMN column_name datatype;
*/
 -- SET --> WHERE

ALTER TABLE students MODIFY COLUMN gender varchar(6);

ALTER TABLE students ADD COLUMN email varchar(25);
SELECT * FROM students;
ALTER TABLE students DROP COLUMN email;

INSERT INTO students VALUES(4,"Ten","26","Female",'Cochin','ten@gmail.com');

-- ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

/*
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
*/
 -- SET --> WHERE

UPDATE dept SET depname = "Bio-Chemistry" WHERE depid = 2;

SELECT * FROM dept;
DROP TABLE  dept;

UPDATE dept SET depname = "Astro-Physics" WHERE depid = 4;








-- Data Query Language (DQL)


create table emp_info
(
	first_name varchar(50),
	last_name varchar(50),
	id int not null,
	age int,
	city varchar(50),
	state varchar(50),
	PRIMARY KEY (id)
	);
    
SELECT * FROM emp_info;

insert into emp_info values('Eric', 'Wing', 2253, 55, 'US','California');
insert into emp_info values('Brick', 'Wing', 2254,56, 'US', 'Manhatton');
insert into emp_info values('Jonh', 'Pure', 2255, 56, 'UK', 'Wales');
insert into emp_info values('Leroy', 'Brown',2283,61,'Showlow','Arizona');
insert into emp_info values('Elory', 'Cleaver',3669,22,'Globe','Arizona');
insert into emp_info values('Gus', 'Grey',5596,29,'Bagdad ','Arizona');
insert into emp_info values('Ginger', 'Howell',98002,42,'Cottonwood ','Arizona');
insert into emp_info values('Sebastian', 'Smit',92001,23,'Gila Bend ','Arizona');
insert into emp_info values('Mary Ann', 'May',92009,23,'Tuscon ','Arizona');


SELECT * FROM emp_info WHERE age >= 50;
SELECT * FROM emp_info;

SELECT * FROM emp_info WHERE  age >= 40 AND age <= 60;
SELECT first_name, state FROM emp_info WHERE  age >= 40 AND age <= 60;

SELECT COUNT(*) FROM emp_info;


SELECT * FROM emp_info WHERE first_name LIKE 'E%';
SELECT * FROM emp_info WHERE first_name LIKE '%Y';
SELECT * FROM emp_info WHERE first_name LIKE '%R%';

select * from emp_info where last_name = 'Wing' and id = 2253;

-- IMPORT CSV 



USE info_org;
SHOW TABLES;

SELECT * FROM salary;

SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Degree.csv'
INTO TABLE degree
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



--  Data Definition Language (DDL)

CREATE DATABASE info_org;

USE info_org;


/*
Syntax

CREATE TABLE table_name (
--     column1 datatype,
--     column2 datatype,
--     column3 datatype,
--    ....
-- );
*/

CREATE TABLE degree(
			`name` varchar(30),
            proffession varchar(25),
            location varchar(25)
            );
            
CREATE TABLE salary(
			`name` varchar(30),
            proffession varchar(25),
            `date` datetime,
            salary int
            );
            
            
/*
Syntax

CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;

*/
    
CREATE TABLE sal1 AS SELECT `name`, salary FROM salary; 
        
-- to delete a database         
DROP DATABASE info_ogr;
     
-- to delete a table     
DROP TABLE sal1;
            
            
            
-- Data Query Language (DQL)
	
-- Data Manipulation Language (DML)


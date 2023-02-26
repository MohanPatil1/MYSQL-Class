create database hr;
use hr;
show tables;
create table employees (id int,name char(25),doj date);
alter table employees add salary int;
describe employees;
alter table employees add(phone_no int, mailid char(33));#method 1
alter table employees add phone_no int, add mailid char(33);# method 2
alter table employees modify id char(15);
alter table employees modify name int, modify phone_no char(10);
alter table employees rename column id to empno;
alter table employees rename column name to ename, rename column phone_no to mobile_no;
alter table employees drop column empno;
desc employees;
rename table employees to ep_info;
drop table ep_info;
show tables;

/*
#SQL 
DDL( Data Defination language)
create
add
modify
alter
rename
---------------------
DML (Data Manipulation language)
insert
update
delete

*/
create table employees (id int,name char(25),doj date);
insert into employees values (1,'Raj','2023-01-18');
select * from employees;
insert into employees(name,id,doj) values ('Alex',2,'2023-01-15');
insert into employees(name,id) values('Suraj',3);
insert into employees values (4,'Sam',null);
insert into employees value (4,'Tom',null);
update employees set name='king' where id=1;
set sql_safe_updates=0; # disable=0 and enable=1
update employees set doj=current_date() where id>3;

delete from employees where id=1;
delete from employees where id>3;
delete from employees;

select * from employees;

/*
1) Table 3 column--alter (drop column with 1 alter statement)
2) delete all the value from dept column 
*/

/*
1st Day Revision
*/
create database Hr;
use hr; # Connect to data base
show tables;
create table employee (id int,name char(25),doj date);#column has limit 4096 in mysql
alter table employee add salary int;
describe employee;# to view the structure of table
desc employee;# to view the structure of table
alter table employee add phone_no int, add mailid char(33);# method 1 
#alter table employee add (phone_no int,mailid char(33)); # method 2
alter table employee modify id char(25);
alter table employee modify name int ,modify phone_no char(10);
#alter table employee modify (name int ,phone_no char(10));
alter table employee rename column id to empno;
alter table employee rename column name to ename , rename column phone_no to mobile_no;
alter table employee drop column empno;
desc employee;
alter table employee modify mailid char(45);
alter table employee drop ename;
rename table employee to emp_info;
drop table emp_info;
show tables;

/*
#SQL (Structured Query Language)
DDL (Data Defination Language)
CREATE
ALTER
add
modify
rename
drop
RENAME
DROP
TRUNCATE
________________________________________

DML (Data manipulation Language)
insert
update
delete

*/
create table employee (id int,name char(25),doj date);
insert into employee values (1,'renu','2023-02-18');
select * from employee; # To Display table content
insert into employee (name,doj,id) values('Alex','2023-08-12',1);
insert into employee(id,name) values (3,'Suraj');
insert into employee values (4,'Sam',null);
insert into employee value (5,'scott',null);
insert into employee values (6,'Scott',null),(7,'Nair',null);
update employee set name='king' where id=1;
set sql_safe_updates=0;
update employee set name='Alex' where doj='2023-08-12';
update employee set id=2 where name='Alex';
update employee set doj=current_date() where id>=3;

delete from employee where id=1;
delete from employee where id>3;
delete from employee;
select * from employee;

#DROP and DELETE

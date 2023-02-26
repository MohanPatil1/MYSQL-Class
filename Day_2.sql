set autocommit=0;
use hr;
select * from employees;
insert into employees values (2,"raj",null);
commit;
insert into employees values (3," renu",null);
insert into employees values (4,"alex",null);
select * from employees;
rollback;
insert into employees values (1,"alx",null);
Truncate table employees;
rollback;

#Savepoint
insert into employees values (1,"Alex",null);
savepoint a1;
insert into employees values (2,"sam",null);
savepoint a2;
insert into employees values (3,"raj",null);
savepoint a3;
delete from employees;
set sql_safe_updates=0;
rollback to savepoint a3;
select * from employees;
rollback to savepoint a2;
rollback to savepoint a1;
rollback to savepoint a2;

#############################################On delete set null/ On update cascade############
Create table department (deptno int primary key,name char(25) not null);
insert into department values (10,"Sales");
insert into department values (20,"hr"); 
select * from department;

create table employee 
(id int primary key,name char(25) not null,
salary int check(salary>0),deptid int,
foreign key(deptid) references department(deptno) on delete set null on update cascade);


# Revision Day 2#####
/*
TCL (Transaction Control language)-->DML
COMMIT-->save
ROLLBACK-->UNDO
SAVEPOINT--
*/
set autocommit=0;
use hr;
select * from employee;
insert into employee values (1,'sam','2023-02-19');
commit;
insert into employee values (2,'alex',null);
rollback;
select * from employee;
insert into employee values (3,'scott',null);
Truncate Table employee; # Remove all the data except table structured
rollback; # after truncate rollback will not work

#DELETE VS TRUNCATE
insert into employee values(1,'Alex','2023-02-19');
savepoint a1;
insert into employee values (2,'alex',null);
savepoint a2;
insert into employee values (3,'sam',null);
savepoint a3;
insert into employee values (4,'suraj',null);
savepoint a4;
delete from employee;
select * from employee;
set sql_safe_updates=0;
rollback to savepoint a4;
rollback to savepoint a3;
rollback to savepoint a1;
drop table employee;

###################################################################
/*
Rules on Data -->CONSTRAINTS
UNIQUE
NOT NULL
PRIMARY KEY(U+NN)
CHECK (CONDITION)
FOREGIN KEY (REFERNCE KEY)

DELETE
on delete set null

on delete cascade

UPDATE 
on update set null

on update cascade

Cascade -->on update cascade # Whatever updation or deletion we make in parent table it will replicate in chlid table.
           on delete cascade
*/
##################################################on delete set null on update cascade#####
create table department(deptno int primary key,dname char(25) not null);
insert into department values (10,'sales');
insert into department values (20,'hr');
select * from department;

create table employees
(
id int primary key,name char(25) not null,
salary int check(salary>0),deptid int,
foreign key(deptid) references department(deptno)on delete set null on update cascade
);
insert into employees values (101,'suraj',1200,10);
insert into employees values (102,'joy',1000,20);
insert into employees values (103,'Dev',4500,10);
select * from employees;
update department set deptno=30 where deptno=10;
delete from department where deptno=20;
commit;
##################################################on delete cascade on update set null#####
drop table department;
drop table employees;

create table department(deptno int primary key,dname char(25) not null);
insert into department values (10,'sales');
insert into department values (20,'hr');
select * from department;

create table employees
(
id int primary key,name char(25) not null,
salary int check(salary>0),deptid int,
foreign key(deptid) references department(deptno)on delete cascade on update set null
);
select * from employees;
insert into employees values (101,'suraj',1200,10);
insert into employees values (102,'joy',1000,20);
insert into employees values (103,'Dev',4500,10);
update department set deptno=30 where deptno=10;
delete from department where deptno=20;


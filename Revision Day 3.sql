
select * from emp;
select ename,job from emp;

#display name and salary of all column
select ename , sal from emp;

# display the name job role hiredate of all employee
select ename , sal , hiredate from emp;

#display name and annual salary of employees
select ename , sal*12 from emp;

# display name and annual salary of employee after deduction of 100 once
select ename , sal*12-100 from emp;

# display name and annual salary of employee after deduction of 100 every month
select ename , sal*12-100*12 from emp;
select ename , (sal-100)*12 from emp;

select * from emp;
select ename,sal,ifnull(comm,0) ,sal+ ifnull(comm,0) from  emp;
# null is unknown value 
# ifnull(comm,0) -->replace the null values to actual value

#ALIASE
select ename as name,(sal-100)*12 as annual_income from emp;

select distinct deptno from emp;
select distinct job from emp;
select distinct deptno,job from emp;

select 'renu' as name;
select ename ,100 as Deducted_Amt ,(sal-100)*12 from emp;
select ename ,100 as 'Deducted Amt' ,(sal-100)*12 from emp;

# WHERE
select * from emp where ename = 'smith';
# Display the clerk detail
select * from emp where job = 'clerk';

# more than 1250
select * from emp where sal>1250;
# less than 1250
select * from emp where sal<1250;
# do not work in deptno 30
select * from emp where deptno<>30;
select * from emp where deptno!=30;
# start with s
select * from emp where ename like 's%';
# ends with s
select * from emp where ename like '%s';
# Contain s
select * from emp where ename like '%s%';
# dispaly those employees whos names has atleast two 'a'
select * from emp where ename like '%a%a%';
select ename from emp where ename like '%a%a%';
# Names with i in the third position
select ename from emp where ename like '__i%';
# Name with e as second last character
select ename from emp where ename like '%e_';

select * from emp where deptno in (10,20);
# display those employee who earns a salary value of 1250 and 3000
select * from emp where sal in (1250,3000);
select * from emp where sal between 1250 and 3000;
select * from emp where sal>=1250 and sal<=3000;

select * from emp where comm is null;
# Display those employees who works as clerk in deptno 20
select * from emp where job='clerk'and deptno=20 ;
# Display those employees working as clerk and salesman
select * from emp where job='clerk' or job='salesman';
# Display those employees working as clerk and salesman but display only those whose salary more than 1000
select * from emp where sal>1000 and (job='clerk' or job='salesman');
select * from emp where (job='clerk' or job='salesman') and sal>1000;
select * from emp;

/*
LIKE
% -->ZERO OR MORE CHARACTERS
_-->ONLY ONE CHARACTER
*/
use scott;
/*
DQL (DATA QUERY LANGUAGE)
SELECT--> DISPLAY

SELECT [DISTINCT] * ,COLUMN_NAME | EXPRESSION [[AS] ALIAS],..[FROM TABLE NAME] 

[]--> OPTIONAL--AS NEEDED
[WHERE CONDITION(S)]

IN SET
BETWEEN SET 

IS NULL

LOGICAL OPERATOR 
AND--> all condition true
OR-->  atleast one condition should satisfy

=,<=,>=,<,>,<>,!=
Column Comparision operator


*/
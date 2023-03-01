/*
SELECT [DISTINCT] * ,COLUMN_NAME | EXPRESSION [[AS] ALIAS],..[FROM TABLE NAME] 
[]--> OPTIONAL--AS NEEDED
[WHERE CONDITION(S)]DOES NOT SUPPORT ALIAS
[GROUP BY Column_name]
[Having condition on aggregate(column)]
[ORDER BY COLUMN NAME,ALIAS,COLUMN POSITION VALUE ASC(default)|DESC] SUPPORT ALIAS
[LIMIT [<NUMBER OF ROWS TO BE IGNORE>],ROWS TO BE FETCHED]]
*/
use scott;
select ename , sal from emp
order by sal;
select ename , sal from emp
order by sal asc;
select ename , sal from emp
order by sal desc;

select ename as name,sal as salary from emp
where sal>1250; # Alias Not Allowed with where
select ename as name ,sal as salary from emp
order by sal desc;

select ename ,sal, hiredate from emp
order by 1 asc;
select * from emp
order by 1 desc;

select deptno , sal from emp
order by deptno asc,sal desc;

# LIMIT
select * from emp
order by sal desc
limit 1;
# First 3 hired employee
select * from emp
order by hiredate asc
limit 3;
# second last hired employees
select * from emp
order by hiredate asc
limit 1,1;
# second highest paid employee
select * from emp
order by sal desc
limit 1,1;

select * from emp where ename not like 's%';
select * from emp where deptno not in (10,20);
select * from emp where sal not between 1250 and 3000;
select * from emp where comm is not null;
######################################################################
# HW
select * from emp where comm is null or comm=0;
select * from emp where hiredate like '%-12-%';
select * from emp where hiredate like '1982%';
select * from emp where ename like 'j%' and ename like '%s';
select * from emp where ename like 'j%s';
#######################################################################
/*
Functions:
INBUILD FUNCTION:
STRING FUNCTION
NUMBER FUNCTION
DATE FUNCTION
AGGREGATE FUNCTION--> MIN , MAX, AVG, SUM
USER DEFINE FUNCTION
*/
select lower('RENU') as name;
select lower(ENAME),ename from emp;
select upper ('renu') as name;
select right('renu',1) as name;
select right('renu',3) as name;
select left('renu',1) as name;
select left('renu',3) as name;
select length('renu') as name;
select length(length('renu')) as name;

select concat( upper('r') , lower('enu')) as name;
select concat(upper(left('renu',1)),lower(right('renu',3)));
select concat(upper(left('bhushan',1)),lower(right('bhushan',length('bhushan')-1)));
select concat(upper(left(ename,1)),lower(right(ename,length(ename)-1)))as name from emp;
# Substr(<input data>,+/- start printing from this position,+ number of character to be printed)
select substr('Renu nair',1,1) as name ;
select substr('Renu nair',1,3) as name ;
select substr('Renu nair',3,2) as name;
select substr('Renu nair',7,3) as name;
select substr('Renu nair',1) as name;
select substr('Renu nair',9) as name;
select substr('Renu nair',-3,2) as name;
select concat(upper(left(ename,1)),lower(substr(ename,2)))as name from emp;

select instr('renu','r');
select instr('I am Renu','am');
use scott;

# Round Function
select round(1234.5467,2) ;
select round(1234.5467,1) ;
select round(1234.5467,0) ;
select truncate(1234.5467,2) ;
select truncate(1234.5467,1) ;
select truncate(1234.5467,0) ;
select mod(2,2),2%2;

#############################################################################
#Date Functions

select now();
select current_date();
select current_time();

select month(now()); # number value for month
select year(now()); # number value for year
select monthname(now()); # name of month
select day(now()); # number value for day
select dayname(now()); # Week name
select * from emp where month (hiredate)=12;
select * from emp where monthname(hiredate)='December';

# Date Format
select date_format(now(),'%Y'); # 4 digit of year
select date_format(now(),'%y'); # 2 digit of year
select date_format(now(),'%M'); # Full name of month
select date_format(now(),'%m'); # number value for month
select date_format(now(),'%W'); # name of Weekday 
select date_format(now(),'%w'); # number of weekday
select date_format(now(),'%d'); 
select date_format(now(),'%D');
select date_format(now(),'%a');
select date_format(now(),'%b');
select date_format(now(),'%H');

select * from emp where hiredate=str_to_date('20-feb-1981','%d-%b-%Y');

#########################################################################
/*
AGGREGATE FUNCTION
min(),max(),sum(),avg(),count()

*/
select min(sal) from emp;
select max(sal) from emp;
select avg(sal) from emp;
select sum(sal) from emp;

select min(hiredate),max(hiredate) from emp;
select min(ename),max(ename) from emp;

select max(sal),ename from emp ; #error
select count(empno) from emp;
select count(comm) from emp;
select count(*) from emp;

select max(sal),deptno from emp
group by deptno;
select * from emp;
# find the total number of people working in each job
select count(job), job from emp
group by job;
select count(ename) ,job from emp
group by job;

select count(empno),job from emp
group by job
having count(empno)>3;

select sum(sal),deptno from emp
where deptno in (10,20)
group by deptno
having sum(sal)>9600;

select sum(sal), deptno, count(empno) from emp
where ename like 's%' or ename like 'j%'
group by deptno
having sum(sal)>9600 and count(empno)>4;


select min(sal) from emp;
select max(min(sal)) from emp group by deptno; # Nesting a group function not allowed in mysql only
################################################################################

/*
JOINS: DISPLAY DATA

INNER JOIN--. Common Data
OUTER JOIN
LEFT JOIN
RIGHT JOIN
CROSS JOIN
*/
select ename,dname,emp.deptno from emp join dept on (emp.deptno=dept.deptno);
select ename,grade from emp inner join salgrade on sal between losal and hisal;
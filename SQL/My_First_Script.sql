
create table Student(
      student_id varchar(5) primary key,
      student_name varchar(20),
      age int,
      place varchar(20));

insert into Student values('S1','John',21,'TVM');
insert into Student values('S2','Ram',19,'EKM');
insert into Student values('S3','John',20,'Kannur');
insert into Student values('S4','Ali',21,'TVM');
insert into Student values('S5','Priya',18,'EKM');

select * from Student;

-- to update records

update Student set place='Kannur' where student_id='S5';
update Student set age=25 where student_id='S1';

-- copy table

create table Student_copy (like Student);
insert into Student_copy select * from Student;

select * from Student_copy;

-- delete records

delete from Student where student_id = 'S2';


-- select statement

select * from Student where place='EKM' and age=18;
select student_id , student_name from Student where place='EKM' and age=18;
select * from Student where place='EKM' and age<45;
select * from Student where place='EKM' or place='TVM';
select * from Student where (place='EKM' or place='TVM') and age=25;


-- distinct clause - To avoid duplicate values

select distinct student_name from Student;

-- order by descending or ascending (by default)

select * from Student order by student_name;
select * from Student order by student_name asc;
select * from Student order by student_name desc;
select * from Student order by student_name, place;
select * from Student order by student_name desc, place desc;
select * from Student order by student_name desc, place asc;


-- limit clause - Limit the no of row returned

select * from Student limit 2;

-- as (Aliases) - Temporarily renames columns or tables for readability

select age as student_age from Student;
select age as student_age from Student as Student_table;

-- SQL logical operators (and , or , not_ - used in 'where' clause

select * from Student where place = 'TVM' and age = 25;
select * from Student where place = 'TVM' or age = 18;
select * from Student where not place = 'TVM';
select * from Student where not place = 'TVM' and not age=25;

-- Combine logical operators for more complex logic

select * from Student where (place='EKM' or place='TVM') and age=25;

-- SQL comparison operators - compares two values & return TRUE, FALSE or NULL - commonly used in where clause to filter rows

select * from Student where place = 'TVM';
select * from Student where age <> 25;
select * from Student where age != 18;
select * from Student where age > 18;
select * from STudent where age < 18;
select * from STudent where age >= 18;
select * from STudent where age <= 18;

-- between (inclusive range)

select * from Student where age between 18 and 30;

-- in (match any value in a list)

select * from Student where place in ('TVM','EKM');

-- not in (Exclude values in a list)

select * from Student where place not in ('TVM','EKM');

-- is null / is not null

select * from Student where age is null;
select * from Student where age is not null;

-- Alter table - change the structure of a table

-- add - used to add a new column, must specify the column name and its datatype

alter table Student add marks int;
alter table Student add column Email varchar(30);
select * from Student;

-- modify - used to change the definion of an existing colummn such as datatype, size etc

-- works only in mySQL - alter table Student modify column student_name varchar(50);
alter table Student alter column student_name type varchar(50);

-- drop - used to remove a column from a table

alter table Student drop column Email;

-- column name is not case sensitive

select Age from Student;

-- Rename column name

alter table Student rename column age to student_age;

-- rename table

alter table Student_copy rename to Student_table;
select * from Student_table;

-- truncate command - it is a data definition language (DDL) that removes all rows from a table but preserves the structure of the table for future use.

truncate table Student_table;
select * from Student_table;


-- SQL Having

CREATE TABLE Employee (
  EmployeeId int,
  Name varchar(50),
  Gender varchar(10),
  Salary int,
  Department varchar(20),
  Experience int );

INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES  (1, 'Emily Johnson', 'Female', 45000, 'IT', 2),
               (2, 'Michael Smith', 'Male', 65000, 'Sales', 5),
               (3, 'Olivia Brown', 'Female', 55000, 'Marketing', 4),
               (4, 'James Davis', 'Male', 75000, 'Finance', 7),
               (5, 'Sophia Wilson', 'Female', 50000, 'IT', 3);

SELECT * FROM Employee;

-- we calculate the total salary of all employees and display it only if it meets the specified condition

SELECT SUM(Salary) AS Total_Salary FROM Employee HAVING SUM(Salary) >= 250000;


-- we calculate the average salary of all employees and display it only if the average exceeds 55,000

SELECT AVG(Salary) AS Average_Salary FROM Employee HAVING AVG(Salary) > 55000;

-- we find the highest salary among employees and display it only if it exceeds 70,000.

SELECT MAX(Salary) AS Max_Salary from Employee HAVING MAX(Salary) > 70000;


-- we find the least experienced employee and display it only if their experience is less than 3 years

SELECT MIN(Experience) AS Min_Experience FROM Employee HAVING MIN(Experience) < 3;

-- we calculate both the total and average salary of employees and display the results only if the total salary is at least 250,000 and the average salary exceeds 55,000.

SELECT SUM(Salary) AS Total_Salary, AVG(Salary) AS Average_Salary FROM Employee
HAVING SUM(Salary) >= 250000 AND AVG(Salary) > 55000;

--sales table having region, product & amount 

select * from sales;

create table sales(
     region varchar(20),
     product varchar(20),
     amount decimal(7,2)
                  );

insert into sales values('TVM','Paper',25000);
insert into sales values('TVM','Pen',34000.25);
insert into sales values('KLM','Paper',21000);
insert into sales values('EKM','Stationery',10000);
insert into sales values('EKM','Pen',20000.89);
insert into sales values('KLM','Stationery',40000);
insert into sales values('PKD','Paper',39000);
insert into sales values('PKD','Pen',25000);
insert into sales values('EKM','Paper',50000);
insert into sales values('THR','Paper',15000);

select sum(amount) as total_amount from sales
having sum(amount)>200000;

select avg(amount) as average_amount from sales
having avg(amount)>25000;

select max(amount) as max_amount from sales
having max(amount)>40000;

select min(amount) as min_amount from sales
having min(amount)>5000;

select count(product) as product_count from sales
having count(product)>8;


-- student_profile - name, year, subject


create table student_profile(
      roll_no int primary key,
      name varchar(20),
      year int,
      subject varchar(20)
                        );

insert into student_profile values(1,'Rahul',2025,'Maths');
insert into student_profile values(2,'Ram',2025,'Science');
insert into student_profile values(3,'Ajay',2024,'English');
insert into student_profile values(4,'Deepak',2023,'Maths');
insert into student_profile values(5,'Kevin',2025,'Science');
insert into student_profile values(6,'Irfan',2024,'English');
insert into student_profile values(7,'Sonu',2023,'Maths');
insert into student_profile values(8,'Sam',2024,'English');
insert into student_profile values(9,'Janish',2023,'Science');


select * from student_profile;

-- group by single column

select subject, count(*) as student_count
from student_profile group by subject;


select subject, count('year') as student_count
from student_profile group by subject;


-- group by multiple columns

select subject, year, count(*) as student_count
from student_profile group by subject, year;

-- having clause in group by clause


CREATE TABLE Employee_new (
  EmployeeId int primary key,
  Name varchar(50),
  Gender varchar(10),
  Salary int,
  Department varchar(20),
  age int );

INSERT INTO Employee_new values
               (1, 'Emily Johnson', 'Female', 45000, 'IT', 25),
               (2, 'Michael Smith', 'Male', 65000, 'Sales', 45),
               (3, 'Olivia Brown', 'Female', 55000, 'Marketing', 40),
               (4, 'James Davis', 'Male', 75000, 'Finance', 72),
               (5, 'Sophia Wilson', 'Female', 50000, 'IT', 31);

SELECT * FROM Employee_new;

-- filter by total salary

select Name, sum(Salary) as total_salary from Employee_new
group by Name
having sum(Salary) > 50000;

-- fliter by average salary

select age, avg(Salary) as average_salary from Employee_new
group by age
having avg(Salary)>60000;

select Department, avg(Salary) as average_salary from Employee_new
group by Department
having avg(Salary)>60000;

-- between and in

CREATE TABLE Emp(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int,
    Salary int
);

INSERT INTO Emp (EmpID, Name,Country, Age, Salary)
VALUES (1, 'Shubham',  'India','23','30000'),
       (2, 'Aman ',  'Australia','21','45000'),
       (3, 'Naveen', 'Sri lanka','24','40000'),
       (4, 'Aditya',  'Austria','21','35000'),
       (5, 'Nishant', 'Spain','22','25000');

Select * from Emp;

select * from Emp where Salary between 25000 and 40000;

select Name from Emp where age between 22 and 24;

select * from Emp where Salary not between 25000 and 40000;

select * from Emp where Salary in (25000,35000);

select * from Emp where Salary not in (25000,35000);


-- String functions


create table study(
          first_name varchar(20),
          last_name varchar(20),
          subject varchar(30));
          
insert into study values
        ('Vishnu','Sagar','Data Science'),
        ('Janish','jacob','Data Analytics'),
        ('Jithin','Prasad','Python Programming'),
        ('Sam','Alex','Java Programming');

select * from study;


-- 1) concat() - joins two or more strings together

select *,concat(first_name,' ',last_name) as full_name
from study;

-- 2) length()

select *, length(subject) as subject_length
from study;

-- 3) upper()

select *, upper(subject) as subject_upper
from study;

-- 4) lower()

select *, lower(subject) as subject_lower
from study;

-- 5) substring - extract a portion of a string from a specific position

select *, substring(subject,1,6) as subject_substring
from study;

-- 6) replace() - replaces all occrences of a substring with another substring

select *, replace(subject,'Programming','Course') as subject_replaced
from study;


-- Date & TIme Functions

create table joiner(
       employee_id int primary key,
       name varchar(20),
       joined_date date,
       today_date date,
       now_date timestamp
 );

insert into joiner values(1,'Ram','2005-12-30','2023-10-17','2025-10-16 12:30:00');
insert into joiner values(2,'Rahul','2010-09-12','2023-10-17','2025-10-16 12:30:00');
insert into joiner values(3,'Ajay','2015-06-25','2023-10-17','2025-10-16 12:30:00');

select * from joiner;

-- 1) now() - returns the current date & time

select name, now() as current_date_time
from joiner;

-- 2) date() - extracts date portion from a datetime value

select name, date(today_date) as date
from joiner;

-- 3) year() - extract year from date or date time value - works only in mySQL

select name, year(joined_date) as join_year
from joiner;

--In PostgreSQL, the YEAR() function doesn't exist. Instead, you should use the EXTRACT() function to get the year from a date

SELECT name, EXTRACT(YEAR FROM joined_date) AS join_year
FROM joiner;

-- 4) month() - extract month from date or date time value - works only in mySQL

select name, month(joined_date) as join_month
from joiner;

--In PostgreSQL, the month() function doesn't exist. Instead, you should use the EXTRACT() function to get the year from a date

SELECT name, EXTRACT(MONTH FROM joined_date) AS join_month
FROM joiner;

-- 5) datediff() - works only in mySQL

select name, datediff(joined_date,today_date) as days_worked
from joiner;

-- In PostgreSQL, the DATEDIFF() function does not exist. Instead, you can subtract dates directly to get the number of days between them.

SELECT name, (today_date - joined_date) AS days_worked
FROM joiner;

SELECT name, (now_date - joined_date) AS days_worked
FROM joiner;


-- Mathematical functions

create table price(
            product_name varchar(20),
            price decimal(7,4),
            quantity int
);

insert into price values 
             ('Apple',300.3467,34),
             ('Orange',150.7865,45),
             ('Grapes',235.2498,23);

select * from price;

-- 1) round() - rounds a numeric value to a specified no of decimal places

select *, round(price,2) as rounded_price
from price;

-- 2) ceil() / ceiling()

select *, ceil(price) as ceiled_price
from price;

select *, ceiling(price) as ceiled_price
from price;

-- 3) floor()

select *, floor(price) as floored_price
from price;

-- 4) mod() - returns the remainder after dividing one number by another

select *, mod(price,quantity) as mod_value
from price;


-- SQL Joints

create table employees(
            emp_id int primary key,
            name varchar(20),
            dept_id int        
);
insert into employees values 
                  (1,'Alice',10),
                  (2,'Bob',20),
                  (3,'Charlie',30);
select * from employees;    


create table departments(
            dept_id int primary key,
            dept_name varchar(20) 
);
insert into departments values
                   (10,'HR'),
                   (20,'IT'),
                   (40,'Marketing');
select * from departments;

select E.emp_id, E.name, D.dept_name
from employees as E
inner join departments as D
on E.dept_id = D.dept_id;

-- another sample table

create table students(
             stud_id int primary KEY,
             stud_name varchar(30),
             course_id int );
insert into students values 
               (1,'Anjali',101),
               (2,'Rahul',102),
               (3,'Neha',101),
               (4,'Arjun',103),
               (5,'Diya',NULL);

select * from students;

create table courses(
            course_id int primary key,
            course_name varchar(20),
            instructor varchar(20)
);

insert into courses values
               (101,'Python Basics','Mr.Suresh'),
               (102,'Web Development','Ms.Priya'),
               (103,'Data Science','Mr.Arun'),
               (104,'HTML','Ms.Lekha');

select * from courses;

-- Inner Join - Returns records that have matching values in both tables

select students.stud_id, students.stud_name, courses.course_name
from students
inner join courses
on students.course_id = courses.course_id;

select S.stud_id, S.stud_name, C.course_name
from students as S
inner join courses as C
on S.course_id = C.course_id;

select S.stud_id, S.stud_name, C.course_name
from students S
inner join courses C
on S.course_id = C.course_id;


-- show all students with their course names

select S.stud_name, C.course_name
from students S
left join courses C
on S.course_id = C.course_id;

-- list all students along with their instructor name

select S.stud_name, C.instructor
from students S
left join courses C
on S.course_id = C.course_id;

-- find the names of students enrolled in 'Python basics'

select S.stud_name, C.course_name
from students S
left join courses C
on S.course_id = C.course_id
where C.course_name = 'Python Basics';

-- show the course names and count of students enrolled in each course

select C.course_name, count(S.stud_id) as no_of_students
from courses C
full join students S
on S.course_id = C.course_id
where S.course_id is not null
group by C.course_name;

select C.course_name, count(S.stud_id) as total_students
from students S
left join courses C
on S.course_id = C.course_id
where S.course_id is not null
group by C.course_name;8

-- find which instructor teach which student


select C.instructor, S.stud_name
from students S
left join courses C
on S.course_id = C.course_id;

select C.instructor, count(S.stud_id) as no_of_students
from students S
left join courses C
on S.course_id = C.course_id
group by C.instructor;

-- company database


create table Worker(WORKER_ID int primary key,
                   FIRST_NAME varchar(15),
                   LAST_NAME varchar(15),
                   SALARY int,
                   JOINING_DATE timestamp,
                   DEPARTMENT varchar(15)
                                         );
insert into Worker values
(1,	'Monika',	'Arora',	100000,'2014-02-20 09:00:00',	'HR'),
(2,	'Niharika', 'Verma',80000,	'2014-06-11 09:00:00',	'Admin'),
(3,	'Vishal', 'Singhal',	300000,	'2014-02-20 09:00:00',	'HR'),
(4,	'Amitabh', 'Singh',	500000,	'2014-02-20 09:00:00',	'Admin'),
(5,	'Vivek', 'Bhati'	,500000,	'2014-06-11 09:00:00',	'Admin'),
(6	,'Vipul',	'Diwan',	200000,	'2014-06-11 09:00:00',	'Account'),
(7,	'Satish',	'Kumar',	75000,	'2014-01-20 09:00:00',	'Account'),
(8,	'Geetika', 'Chauhan'	,90000,	'2014-04-11 09:00:00',	'Admin');

select * from Worker;

create table Bonus(
              WORKER_REF_ID int primary key,
              BONUS_DATE timestamp,
              BONUS_AMOUNT int
);

insert into Bonus values
(1,	'2016-02-20 00:00:00',	5000),
(2,	'2016-06-11 00:00:00',	3000),
(3,	'2016-02-20 00:00:00',	4000),
(4,	'2016-02-20 00:00:00',	4500),
(5,	'2016-06-11 00:00:00',	3500);

select * from Bonus;

create table Title
          (WORKER_REF_ID int primary key,
          WORKER_TITLE	varchar(15),
          AFFECTED_FROM timestamp);

insert into Title values
(1,	'Manager',	'2016-02-20 00:00:00'),
(2,	'Executive',	'2016-06-11 00:00:00'),
(3,	'Lead',	'2016-06-11 00:00:00'),
(4,	'Asst. Manager',	'2016-06-11 00:00:00'),
(5,	'Manager',	'2016-06-11 00:00:00'),
(6,	'Lead',	'2016-06-11 00:00:00'),
(7,	'Executive',	'2016-06-11 00:00:00'),
(8,	'Executive',	'2016-06-11 00:00:00');

select * from Title;

-- 1)
select FIRST_NAME as WORKER_NAME from Worker;

-- 2)
select upper(FIRST_NAME) from Worker;

-- 3)
select DEPARTMENT from Worker
group by DEPARTMENT;

select distinct DEPARTMENT from Worker;

-- 4)
select left(FIRST_NAME,3) as first_3_letters from Worker;

-- 5)
SELECT FIRST_NAME, position('A' IN FIRST_NAME) AS char_position_of_A
FROM Worker;

SELECT FIRST_NAME, position('a' IN FIRST_NAME) AS char_position_of_a
FROM Worker
where FIRST_NAME = 'Amitabh';

-- 6)
select rtrim(FIRST_NAME) from Worker;

-- 7)
select ltrim(DEPARTMENT) from Worker;

-- 8)
select distinct DEPARTMENT from Worker;

-- 9)
select replace(FIRST_NAME,'a','A') from Worker;

-- 10)
select FIRST_NAME, LAST_NAME, concat(FIRST_NAME,' ', LAST_NAME) as COMPLETE_NAME
from Worker;

-- 13)
select * from Worker
where FIRST_NAME = 'Vipul' or FIRST_NAME = 'Satish';

-- 14)
select * from Worker
where FIRST_NAME not in ('Vipul' , 'Satish');

-- 15)
select * from Worker where DEPARTMENT = 'Admin';

-- 16)

SELECT * FROM Worker
WHERE FIRST_NAME LIKE '%a%';

SELECT * from Worker
WHERE POSITION('a' IN FIRST_NAME) > 0;

-- 17)
select * from Worker
where right(FIRST_NAME, 1) = 'a';

SELECT * FROM Worker
WHERE FIRST_NAME LIKE '%a';

-- 18)
SELECT * FROM Worker
WHERE (FIRST_NAME LIKE '%h') and (length(FIRST_NAME)=6);

-- 19)
SELECT * FROM Worker
where SALARY between 100000 and 500000;

--20)
SELECT * FROM Worker
WHERE EXTRACT(MONTH FROM JOINING_DATE) = 2 AND EXTRACT(YEAR FROM JOINING_DATE) = 2014;

-- 21)
select DEPARTMENT , count(WORKER_ID) as total_employees from Worker
group by DEPARTMENT
having DEPARTMENT = 'Admin';

select DEPARTMENT , count(WORKER_ID) as total_employees from Worker
where DEPARTMENT = 'Admin'
group by DEPARTMENT;

--22)
select FIRST_NAME, LAST_NAME , SALARY from Worker
where SALARY >= 50000 and SALARY <=100000;

-- 23)
select DEPARTMENT, count(WORKER_ID) as total_employees from Worker
group by DEPARTMENT
order by count(WORKER_ID) DESC;

--24)
select Worker.WORKER_ID, Worker.FIRST_NAME, Worker.LAST_NAME, Title.WORKER_TITLE
from Worker
left join Title
on Worker.WORKER_ID = Title.WORKER_REF_ID
where Title.WORKER_TITLE = 'Manager';

-- 25)
select DEPARTMENT, count(DEPARTMENT) as no_of_duplicate_values from Worker
group by DEPARTMENT
having count(DEPARTMENT) > 1;

-- 26)
SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY WORKER_ID) AS rn
  FROM Worker
)
WHERE rn % 2 = 1;

-- 27)
SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY WORKER_ID) AS rn
  FROM Worker
)
WHERE rn % 2 = 0;

-- 28)
create table Worker_copy (like Worker including all);
insert into Worker_copy select * from Worker;


--29)
select * from Bonus
inner join Worker
on Worker.WORKER_ID = Bonus.WORKER_REF_ID;


--30) 
select * from Worker
left join Bonus
on Worker.WORKER_ID = Bonus.WORKER_REF_ID;


-- 31)
select current_timestamp;

--32)
select * from (
select *, row_number() over(order by WORKER_ID) as ROW_NO
from WORKER)
where ROW_NO between 1 and 5;

--33)
select distinct SALARY
from worker
order by SALARY desc
limit 1 offset 4;

--34)
SELECT SALARY
FROM (
    SELECT SALARY,
           DENSE_RANK() OVER (ORDER BY SALARY DESC) AS rank
    FROM Worker
) AS ranked_salaries
where rank = 5;

--35)
SELECT * FROM Worker
WHERE SALARY IN (
    SELECT SALARY FROM Worker
    GROUP BY SALARY
    HAVING COUNT(*) > 1  );

--36) 
select distinct SALARY
from worker
order by SALARY desc
limit 1 offset 1;

--37) 
select * from worker where WORKER_ID = 2
union all
select * from worker where WORKER_ID = 2;

select * from worker where WORKER_ID = 2
union all
select * from worker where WORKER_ID = 2
union all
select * from worker where WORKER_ID <> 2;


--38) same as 29)

--39) 

-- 50 %
WITH numbered AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY WORKER_ID) AS rn
    FROM Worker
),
total AS (
    SELECT COUNT(*) AS cnt FROM Worker
)
SELECT *
FROM numbered, total
WHERE rn <= cnt * 0.5;

-- 75%
WITH numbered AS (
    SELECT *, ROW_NUMBER() OVER (ORDER BY WORKER_ID) AS rn
    FROM Worker
),
total AS (
    SELECT COUNT(*) AS cnt FROM Worker
)
SELECT *
FROM numbered, total
WHERE rn <= cnt * 0.75;

-- 40)
select DEPARTMENT, count(WORKER_ID)
from worker
group by department 
having count(WORKER_ID) < 5;

--41)
select DEPARTMENT, count(WORKER_ID)
from worker
group by department;

-- 42)
select * from 
(select *, row_number() over() as rn from Worker)
order by rn desc
limit 1;

--43)
select * from worker
limit 1;

-- 44)
select * from 
(select *, row_number() over() as rn from Worker)
order by rn desc
limit 5;

--45)
WITH ranked_employees AS (
    SELECT FIRST_NAME,LAST_NAME, DEPARTMENT, SALARY,
           RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS rnk
    FROM Worker
)
SELECT FIRST_NAME,LAST_NAME, DEPARTMENT, SALARY
FROM ranked_employees
WHERE rnk = 1;

--46)
SELECT SALARY
FROM (
    SELECT SALARY,
           DENSE_RANK() OVER (ORDER BY SALARY DESC) AS rank
    FROM Worker
) AS ranked_salaries
where rank <=3;

--47)
SELECT SALARY
FROM (
    SELECT SALARY,
           DENSE_RANK() OVER (ORDER BY SALARY ASC) AS rank
    FROM Worker
) AS ranked_salaries
where rank <=3;

--48)
SELECT SALARY
FROM (
    SELECT SALARY,
           DENSE_RANK() OVER (ORDER BY SALARY DESC) AS rank
    FROM Worker
) AS ranked_salaries
where rank = 6;

--49)
select DEPARTMENT, sum(SALARY) from Worker
group by DEPARTMENT
having sum(SALARY) > 0;

--50)
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM (
    SELECT FIRST_NAME, LAST_NAME, SALARY, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS rank
    FROM Worker
) AS ranked_salaries
where rank = 1;

SELECT FIRST_NAME, LAST_NAME, SALARY
FROM (
    SELECT FIRST_NAME, LAST_NAME, SALARY, DENSE_RANK() OVER (ORDER BY SALARY DESC) AS rank
    FROM Worker
)
where rank = 1;

-- cross join

create table stud_table(
           student_id int primary key,
           student_Name varchar(20) );
insert into stud_table values
            (1,'Aditi'),
            (2,'Rohan');
select * from stud_table;

create table subject(
             subject_id int primary key,
             subject_name varchar(20)
);
insert into subject values
            (101,'Maths'),
            (102,'Science');

select * from subject;

select * from stud_table cross join subject;

-- self join

create table employee_self(
                 Emp_ID int primary key,
                 Emp_Name varchar(20),
                 Manager_ID int  );
insert into employee_self values
                (1,'John',NULL),
                (2,'Priya',1),
                (3,'Raj',1),
                (4,'Neha',2);
select * from employee_self;

select
e.Emp_Name as Employee,
m.Emp_Name as Manager
from employee_self e
join employee_self m
on e.Manager_ID = m.Emp_ID;


select
e.Emp_Name as Employee,
m.Emp_Name as Manager
from employee_self e
left join employee_self m
on e.Manager_ID = m.Emp_ID;

-- Row_number() in SQL

create table emp_data(
             emp_id int primary key,
             name varchar(20),
             dept varchar(20),
             salary int);
insert into emp_data values
             (1,'Riya','HR',50000),
             (2,'Aryan','HR',55000),
             (3,'Meena','IT',70000),
             (4,'Raj','IT',72000);
select * from emp_data;

select name,dept,salary,
row_number() over () as rn
from emp_data;


select name,dept,salary,
row_number() over (order by salary desc) as rn
from emp_data;


select name,dept,salary,
row_number() over (partition by dept order by salary desc) as rn
from emp_data;

-- removing duplicates

create table gmail_data(
                id int primary key,
                name varchar(10),
                gmail varchar(30)
);
insert into gmail_data values
                (1,'Aditi','aditi@gmail.com'),
                (2,'Arya','arya@gmail.com'),
                (3,'Aditi','aditi@gmail.com');
select * from gmail_data;

with DuplicateCheck as (
select * , row_number() over (partition by gmail order by id) as rn from gmail_data)
delete from DuplicateCheck
where rn > 1;





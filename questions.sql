-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
--@block
SELECT RTRIM(first_name) FROM worker

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
--@block
SELECT LTRIM(first_name) FROM worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
--@block
SELECT distinct department,LENGTH(department) from worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
--@block
SELECT REPLACE(first_name, 'a','A') FROM worker; 

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
-- @block
SELECT concat(first_name, last_name) as full_name FROM worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
--@block
SELECT * FROM worker ORDER BY first_name ASC;


-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.

--@block
SELECT * FROM worker ORDER BY first_name ASC , department DESC;


-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
--@block
SELECT * from worker WHERE first_name in ('Vipul','Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
--@block
SELECT salary,first_name from worker WHERE first_name NOT in ('Vipul','Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
--@block
SELECT * from worker WHERE department LIKE 'Admi%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
-- @block
SELECT * from worker WHERE  first_name LIKE '%a%';
-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
-- @block
SELECT * FROM worker WHERE first_name::varchar like '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
-- @block
SELECT * from worker WHERE  first_name::varchar LIKE '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

-- @block
SELECT * from worker WHERE salary BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
-- @block
select * from worker where extract(month from joining_date)=2 and extract(year from joining_date)=202from workerfrom worker0 ;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
--@block
select department ,count(*) from worker where department='Admin' group by department;

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.

-- @block
select concat(first_name,last_name) as full_name,salary from worker where salary BETWEEN 50000 AND 100000; 

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
-- @block
select department,count(*) from worker group by department order by count(*) DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
-- @block
select * from worker as w inner join title as t on w.worker_id=t.worker_ref_id where t.worker_title='Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
-- @block
select worker_title,count(*) from title group by worker_title having count(*) > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
-- select * from worker where MOD (WORKER_ID, 2) != 0; 

-- @block
select * from worker where MOD (WORKER_ID, 2) != 0;

-- Q-27. Write an SQL query to show only even rows from a table. 


-- Q-28. Write an SQL query to clone a new table from another table.
-- @block
create table worker_copy as select * from worker;
-- ! without data 
-- @block

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
-- @block 
select worker.* from worker inner join worker_copy using(worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
-- @block
select worker.* from worker left join worker_copy using(worker_id) where worker_copy.worker_id is null;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL

-- @block
select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.

-- @block
select * from worker order by salary DESC limit 5;


-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
-- @block
select * from worker ORDER BY salary limit 1 offset 4;

-- if multiple people with same salary exitsts
-- @block
select * from worker 
where salary = (select distinct salary from worker ORDER BY salary desc limit 1 offset 5);

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
 --- with corelated subquery

-- @block


 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.

-- @block
select distinct w1.* from worker w1 , worker w2 
where w1.salary = w2.salary and not w1.worker_id = w2.worker_id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
-- @block
select * from worker w1
where 1 = 
(select count(distinct salary) from worker w2 
where w1.salary < w2.salary);

-- @block
select * from worker ORDER BY salary desc;
-- Q-37. Write an SQL query to show one row twice in results from a table.

-- @block
select * from worker UNION all select * from worker ORDER BY worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
-- @block
select worker.* , bonus.bonus_amount from bonus right join worker 
on bonus.worker_ref_id = worker.worker_id where bonus.worker_ref_id is null; 

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

-- @block
select * from worker ORDER BY worker_id LIMIT (select count(*) from worker)/2 

-- Q-40. Write an SQL query to fetch the departments that have less than 5 people in it.
-- @block
select department, count(department) as dc from worker GROUP BY department having count(department) < 5;


-- Q-41. Write an SQL query to show all departments along with the number of people in there.
-- @block
select department,count(department) from worker GROUP BY department;

-- Q-42. Write an SQL query to show the last record from a table.
-- @block
select * from worker ORDER BY worker_id LIMIT 1 offset (select count(*) from worker)-1;

-- Q-43. Write an SQL query to fetch the first row of a table.
-- @block
select  * from worker where worker_id = (select min(worker_id) from worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
-- @block
select * from worker ORDER BY worker_id 
LIMIT 5 offset (select count(*) from worker) - 5;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
-- @block
select * from worker w1
where w1.salary = (select max(salary) from worker w2 where
w1.department = w2.department);

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.
-- @block
select * from worker w1
where 3 >= (select count(distinct salary) from worker w2 where
w1.salary <= w2.salary) ORDER BY salary desc;

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

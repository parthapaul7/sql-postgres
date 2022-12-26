--@block

SELECT first_name as worker_name from worker;

--@block
SELECT UPPER(first_name) FROM worker 

--@block
SELECT distinct department from worker;

-- how to do this with group by
--@block
SELECT department, count(*) from worker group by department;

-- @block

SELECT SUBSTRING(first_name,1,3) FROM worker 

-- @block
select POSITION('b' in first_name) from worker WHERE first_name = 'Amitabh'; 

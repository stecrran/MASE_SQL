select * from lab2.details;

# Part 2
# Q1
select firstName, lastName, age from lab2.details WHERE age = (select MAX(age) from lab2.details);

# Q2
select firstName, lastName, age from lab2.details WHERE age = (select MIN(age) from lab2.details);

# Q3
select round(AVG(hours),0) AS "average hours worked" from lab2.details;

# Q4
select sum(rate*hours) from lab2.details where gender = 'F';

# Q5
select sum(rate*hours) from lab2.details where gender = 'M';

# Q6
select department, round(avg(age)) from lab2.details group by department;

# Q7
select position, round(avg(age)) from lab2.details group by position;

# Q8 
select department, gender, count(*) from lab2.details group by department, gender;

# Q9
select department, 
count(case when gender = 'F' then 1 end) as Female_Count,
count(case when gender = 'M' then 1 end) as Male_Count
from lab2.details group by department order by department;

# Q10
SELECT firstName, lastName, (rate*hours) as Wage 
FROM lab2.details
order by Wage DESC
limit 3;

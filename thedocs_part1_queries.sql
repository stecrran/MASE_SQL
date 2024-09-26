# Part 1
# Q1
select count(*) as Number_of_Patients from thedocs.patients;

# Q2
select firstName, lastName, town from thedocs.patients where town = "Athlone";

# Q3
select drug_name from thedocs.drugs where cost = 2.95;

# Q4
select drug_name, cost from thedocs.drugs where cost > 3.50;

# Q5
select firstName, lastName, dateOfBirth from thedocs.patients where dateOfBirth = (select max(dateOfBirth) from thedocs.patients);

# Q6
select firstName, lastName, dateOfBirth from thedocs.patients where dateOfBirth = (select min(dateOfBirth) from thedocs.patients);

# Q7
select count(*) as Number_of_Doctors from thedocs.doctors;

# Q8
select firstName, lastName from thedocs.doctors order by lastName desc;

# Q9
select firstName, lastName from thedocs.doctors where firstName like '%a';

# Q10
select speciality, 
count(case when gender = 'F' then 1 end) as Female_Count,
count(case when gender = 'M' then 1 end) as Male_Count
from thedocs.doctors group by speciality order by speciality;


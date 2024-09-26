# Q1
select count(distinct(speciality)) as number_of_specialities from doctors;

# Q2
select upper(speciality) from doctors;

# Q3
select count(*) as paediatrician_prescriptions from prescriptions where doc_id = 5;

# Q4
#select doc_id from prescriptions where pat_id = 6;
select firstName, lastName from doctors inner join prescriptions on doctors.doc_id = prescriptions.doc_id where pat_id = 6;

# Q5
# check: select patients.firstName, patients.lastName, prescriptions.date_perscribed from patients left join prescriptions on patients.pat_id = prescriptions.pat_id;
select patients.firstName, patients.lastName from patients left join prescriptions on patients.pat_id = prescriptions.pat_id where prescriptions.pat_id is null;

# Q6
insert into drugs values(7, "Dexamethasone", 0);
#select * from drugs;
#delete from drugs where drug_name="Dexamethasone";

# Q7
#check: select drugs.drug_name, doc_id from drugs left join prescriptions on drugs.drug_id = prescriptions.drug_id;
select drugs.drug_name from drugs left join prescriptions on drugs.drug_id = prescriptions.drug_id where prescriptions.doc_id is null;

# Q8
alter table drugs add Manufacturer VARCHAR(20);
select * from drugs;

# Q9
update drugs set manufacturer="GlaxoSmithKline" where drug_name = "Calpol" or drug_name = "Panadol";

# Q10
select "doctor" as type, firstName, lastName from doctors
union
select "patient" as type, firstname, lastName from patients;

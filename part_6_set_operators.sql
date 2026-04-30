set search_path to nairobi_academy,city_hospital;


select * from nairobi_academy_students;
select * from subjects;
select * from exam_results;

select * from appointments;
select * from patients;
select * from departments;
select * from prescriptions;
select * from doctors;

--1.Write a UNION query to show a combined list of all unique cities from the students table and the patients table. Order alphabetically.
select city
from nairobi_academy_students
union
select city
from patients 
order by city asc;

--2.Write a UNION ALL query to combine all student first names and all patient full names into one list. Add a second column called source that says 'Student' or 'Patient' so you can tell where each name came from.
select
    first_name AS name,
    'Student' AS source
from nairobi_academy_students
union all
select 
    full_name AS name,
    'Patient' AS source
from patients;

--3.Write an INTERSECT query to find cities that appear in BOTH the students table and the patients table - cities that are home to both students and patients.
select city
from nairobi_academy_students
intersect
select city
from patients;

--4.Write a query that combines all of the following into one result using UNION ALL - student names (labelled 'Student'), patient full names (labelled 'Patient'), and doctor full names (labelled 'Doctor'). Order the final result by the source label, then by name.
select 
    first_name AS name,
    'Student' AS source
from nairobi_academy_students
union all
select 
    full_name AS name,
    'Patient' AS source
from patients
union all
select 
    full_name AS name,
    'Doctor' AS source
from doctors
order by source,name;
    
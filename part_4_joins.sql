
set search_path to city_hospital;
select * from appointments;
select * from patients;
select * from departments;
select * from prescriptions;


select * from doctors;

--1.Write an INNER JOIN query to show each appointment alongside the patient's full name, the doctor's full name, the appointment date, and the diagnosis.
select p.full_name,d.full_name,a.appt_date
from patients as p
inner join doctors as d
on p.patient_id=d.doctor_id
inner join appointments as a
on a.appointment_id=a.patient_id;

--2.Write a LEFT JOIN query to show ALL patients - and if they have an appointment, show the appointment date and diagnosis. Patients with no appointments should still appear with NULL values
select p.patient_id,
     a.appt_date,
     a.diagnosis
from patients as p
left join appointments as a
on a.patient_id=p.patient_id;

--3.Write a RIGHT JOIN query to show ALL doctors - and if they have seen a patient, show the patient name. Doctors with no appointments should still appear.
SELECT 
    d.doctor_id,
    d.full_name,
    p.full_name
FROM appointments as a
RIGHT JOIN doctors as d
    ON a.doctor_id = d.doctor_id
LEFT JOIN patients as p
    ON a.patient_id = p.patient_id;

--4.Write a query using LEFT JOIN and WHERE IS NULL to find all patients who have NEVER had an appointment. Show patient full_name and city.
SELECT 
    p.full_name,
    p.city
FROM patients as p
LEFT JOIN appointments  as a
    ON p.patient_id = a.patient_id
WHERE a.patient_id IS NULL;

--5.Write a three-table INNER JOIN to show each appointment with: the patient name, the doctor name, and the medicine prescribed (from prescriptions). Show appointment_id, patient name, doctor name, and medicine_name.
SELECT 
    a.appointment_id,
    p.full_name,
    d.full_name,
    pr.medicine_name
FROM appointments as a
INNER JOIN patients as p
    ON a.patient_id = p.patient_id
INNER JOIN doctors as d
    ON a.doctor_id = d.doctor_id
INNER JOIN prescriptions pr
    ON a.appointment_id = pr.appointment_id;




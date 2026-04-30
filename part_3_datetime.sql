set search_path to nairobi_academy;
select * from nairobi_academy_students;
--1.Write a query to extract the birth year, birth month, and birth day from each student's date_of_birth as three separate columns. Show first_name alongside them.
select first_name,
   to_char(date_of_birth,'yyyy') as birth_year,
   to_char(date_of_birth,'mm') as birth_month,
   to_char(date_of_birth,'dd') as day_of_birth
  from nairobi_academy_students;

--2.Write a query to show each student's full name, their date_of_birth, and their age in complete years. Order from oldest to youngest.
select concat(first_name,'  ',last_name) as full_name,date_of_birth,
DATE_PART('year', AGE(CURRENT_DATE, date_of_birth)) :: INT AS age
FROM nairobi_academy_students
ORDER BY date_of_birth ASC;

--3.Write a query to display each exam date in this exact format: 'Friday, 15th March 2024'.. Call the column formatted_date.
select* from exam_results;

select 
   to_char(exam_date,'day ddth month yyyy')as formated_date
   from exam_results;





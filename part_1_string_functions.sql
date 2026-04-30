set search_path to nairobi_academy;
select *
from nairobi_academy_students;
select *
from exam_results;
select *
from subjects;
-- 1.Write a query to display each student's full name in UPPERCASE and their city in lowercase.Name the columns upper_name and lower_city.
select UPPER(concat(first_name,'  ',last_name))as upper_name,
    LOWER(city) as lower_city
    from nairobi_academy_students;

--2.Write a query to show each student's first name and the LENGTH of their first name.Order the results from longest to shortest name.
select first_name, length(first_name)
from nairobi_academy_students
order by length(first_name) desc;

--3.Write a query to show each subject's name and a short version - the first 4 characters of the subject name ... called short_name. Also show the full subject name length.
select subject_name,
substring(subject_name,4) as short_name,
length(substring(subject_name,4))
from subjects;

--4.Write a query using CONCAT to produce a sentence for each student in this format: 'Amina Wanjiku is in Form 3 and comes from Nairobi'. Call the column student_summary.
select concat(first_name,'  ','is in',class,'  ',city)
from nairobi_academy_students;


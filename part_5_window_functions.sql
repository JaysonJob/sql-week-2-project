set search_path to nairobi_academy;
select * from nairobi_academy_students;
select * from subjects;
select * from exam_results;


--1.Write a query using ROW_NUMBER() to assign a unique rank to each exam result, ordered from highest mark to lowest. Show result_id, student_id, marks, and row_num.
select result_id,student_id,marks,
row_number()over(order by marks desc) as row_number
from exam_results;

--2.Write a query using RANK() and DENSE_RANK() on exam results ordered by marks descending. Show both columns side by side so the difference between them is visible
select marks,
    rank()over(order by marks desc) as rank_number,
    dense_rank()over(order by marks desc) as dense_number
    from exam_results
 order by marks desc;


--3.Write a query using NTILE(3) to divide all exam results into 3 performance bands (1 = top, 2 = middle, 3 = bottom). Show result_id, marks, and band.
select result_id,marks,
NTILE(3)over(order by marks desc) as bands
from exam_results;


--4.Write a query using AVG() OVER(PARTITION BY student_id) to show each exam result alongside that student's personal average mark. Show student_id, marks, and student_avg rounded to 2 decimal places.
SELECT 
    student_id,
    marks,
    ROUND(AVG(marks)over(partition by student_id), 2) AS student_avg
FROM exam_results;


--5.Write a query using LAG() to show each exam result alongside the previous result's marks for the same student. Also calculate the improvement (current marks minus previous marks). Use PARTITION BY student_id.
SELECT 
    student_id,
    marks,
    LAG(marks) OVER (PARTITION BY student_id ORDER BY result_id) AS previous_marks,
   LAG(marks) OVER (PARTITION BY student_id ORDER BY result_id) AS improvement
FROM exam_results;
use college_db;
-- 1. Display the first name and percentage of students whose percentage is above the average percentage.
select avg(percentage) from students;
select first_name,percentage from students
where percentage>(select avg(percentage) from students);
-- 2. Display the first name and percentage of the student with the highest 
select max(percentage) from students;
select first_name,percentage from students
where percentage=(select max(percentage) from students);
-- 3. Display the first name and department of students who are in the same department as Parvathy.
select * from students;
select department from students where first_name='parvathy';
select first_name,department from students
where department=(select department from students where first_name='parvathy');
-- 4. Display the enrollment ID and marks of enrollments with marks above the average marks of all enrollments.
select avg(marks) from enrollments;
select enrollment_id,marks from enrollments
where marks>(select avg(marks) from enrollments);
-- 5. Display the course name and credits of courses that have more credits than the average credits.
select avg(credits) from courses;
select  course_name,credits from courses
where credits> (select avg(credits) from courses);
-- 6. Display the first name of students who are enrolled in course 101.
select student_id from enrollments where course_id=101;
select first_name,student_id from students
where student_id in (select student_id from enrollments where course_id=101);
-- 7. Display the first name of students who are not enrolled in any course.
select * from enrollments;
select * from students;
select student_id from enrollments;
select first_name,student_id from students
where student_id not in (select student_id from enrollments);
-- 8. Display the course name of courses in which at least one student scored above 90.
select course_id from enrollments where marks>90;
select course_name,course_id from courses
where course_id in(select course_id from enrollments where marks>90);
 -- 9. Display the first name of students who have at least one semester result recorded.
 select student_id from enrollments;
 select first_name,student_id from students 
 where student_id in(select student_id from enrollments);
-- 10. Display the first name and percentage of students whose percentage is higher than every Mechanical student's percentage. Ignore students whose percentage is not available.
select percentage from students
where department='Mechanical' and percentage is not null;
select first_name,percentage, department from students 
where percentage >all (select percentage from students where department='Mechanical' and percentage is not null);
-- 11. Display the first name and percentage of students whose percentage is higher than at least one Commerce student's percentage. Ignore students whose percentage is not available.
select percentage from students where department='commerce' and percentage is not null;
select first_name,department,percentage from students
where percentage >any (select percentage from students where department='commerce' and percentage is not null); 
-- 12. Display the departments whose average percentage is above the average percentage of all students.
select avg( percentage) from students;
select department from students 
group by department having avg(percentage)>(select avg(percentage) from students);
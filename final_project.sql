-- create database
CREATE DATABASE final_project;

-- use database
USE final_project;

-- create student table
CREATE TABLE students (student_id INT AUTO_INCREMENT PRIMARY KEY, firstname VARCHAR(10) NOT NULL, lastname VARCHAR (10) NOT NULL, email VARCHAR(50) NOT NULL, birth_date DATE NOT NULL, enrollment_date DATE NOT NULL);

-- create table departments
CREATE TABLE departments (department_id INT AUTO_INCREMENT PRIMARY KEY, department_name VARCHAR(20) NOT NULL);

-- create table courses
CREATE TABLE courses (course_id INT AUTO_INCREMENT PRIMARY KEY, course_name VARCHAR (20) NOT NULL, department_id INT NOT NULL, credits INT NOT NULL, FOREIGN KEY (department_id) REFERENCES departments(department_id));

-- create table instructors
CREATE TABLE instructors (instructor_id INT AUTO_INCREMENT PRIMARY KEY, firstname VARCHAR(10) NOT NULL, lastname VARCHAR (10) NOT NULL, email VARCHAR(50) NOT NULL, department_id INT NOT NULL, FOREIGN KEY (department_id) REFERENCES departments(department_id));

-- create table enrollments
CREATE TABLE enrollments (enrollment_id INT AUTO_INCREMENT PRIMARY KEY,student_id INT NOT NULL,course_id INT NOT NULL,enrollment_date DATE NOT NULL,FOREIGN KEY (student_id) REFERENCES students(student_id),FOREIGN KEY (course_id) REFERENCES courses(course_id));

-- insert into students
INSERT INTO students (student_id, firstname, lastname, email, birth_date, enrollment_date)
VALUES (1, 'Alice', 'Brown', 'alice@example.com', '2001-05-10', '2023-01-15'),
(2, 'Bob', 'Smith', 'bob@example.com', '2000-07-20', '2021-08-22'),
(3, 'Charlie', 'Davis', 'charlie@example.com', '2002-03-14', '2022-09-10'),
(4, 'Diana', 'Miller', 'diana@example.com', '1999-12-11', '2020-01-05'),
(5, 'Eva', 'Wilson', 'eva@example.com', '2003-02-17', '2024-02-10'),
(6, 'Frank', 'Moore', 'frank@example.com', '1998-11-25', '2018-06-10');

-- insert into departments
INSERT INTO departments (department_id, department_name)
VALUES (1, 'Mathematics'),
(2, 'Computer Science'),
(3, 'Physics');

-- insert into courses
INSERT INTO courses (course_id, course_name, department_id, credits)
VALUES (1, 'Intro to SQL', 1, 3),
(2, 'Data Structures', 2, 4),
(3, 'Algebra', 1, 3),
(4, 'Discrete Math', 1, 4),
(5, 'Operating Systems', 2, 3),
(6, 'Networking', 2, 3),
(7, 'Quantum Physics', 3, 3);

-- insert into instructors
INSERT INTO instructors (instructor_id, firstname, lastname, email, department_id)
VALUES (1, 'John', 'Taylor', 'john.taylor@example.com', 2),
(2, 'Sara', 'Lee', 'sara.lee@example.com', 1),
(3, 'David', 'Clark', 'david.clark@example.com', 3);

-- insert into enrollments
INSERT INTO enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (1, 1, 1, '2023-01-15'),
(2, 1, 2, '2023-01-15'),
(3, 2, 1, '2021-08-22'),
(4, 2, 3, '2021-08-22'),
(5, 3, 1, '2022-09-10'),
(6, 3, 2, '2022-09-10'),
(7, 4, 2, '2020-01-05'),
(8, 4, 4, '2020-01-05'),
(9, 5, 1, '2024-02-10'),
(10, 5, 5, '2024-02-10'),
(11, 6, 1, '2018-06-10'),
(12, 6, 6, '2018-06-10'),
(13, 1, 3, '2023-01-15'),
(14, 2, 2, '2021-08-22'),
(15, 3, 5, '2022-09-10');

-- 1st Question CRUD in all tables
-- create
INSERT INTO students (student_id,firstname, lastname, email, birth_date, enrollment_date)
VALUES (7,'George', 'King', 'george.king@example.com', '2000-10-05', '2025-06-01');

INSERT INTO enrollments(enrollment_id, student_id, course_id, enrollment_date)
VALUES (16,7,6,'2025-06-01');

-- read
SELECT * FROM courses;

-- update
UPDATE students
SET email = 'charlie.davis@gmail.com'
WHERE firstname='charlie';

-- delete
DELETE FROM instructors
WHERE instructor_id=3;

-- 2nd Question select all students enrolled after 2022
SELECT * from students WHERE YEAR(enrollment_date) > '2022';

-- 3rd Question select all course by mathematics department limit 5
SELECT * FROM courses WHERE department_id = 1 LIMIT 5;

-- 4th Question select number of students enrolled in each course filter out by more than 5 students
SELECT c.course_name, count(*) as number_of_studnets FROM enrollments as e JOIN courses as c ON c.course_id=e.course_id GROUP BY c.course_name HAVING count(*) > 3;

-- 5th Question select students who enrolled in intro to sql and data structure
SELECT s.student_id, CONCAT(s.firstname, ' ', s.lastname) AS student_name FROM students s JOIN enrollments e ON s.student_id = e.student_id WHERE e.course_id IN (1, 2) GROUP BY s.student_id, student_name HAVING COUNT(e.course_id) = 2;

-- 6th Question select students who enrolled in intro to sql either data structure
SELECT s.student_id, CONCAT(s.firstname," ",s.lastname) as student_name, e.enrollment_date FROM students as s JOIN enrollments as e ON s.student_id=e.student_id WHERE e.course_id =1 OR e.course_id=2;

-- 7th Question select avergea credits
SELECT AVG(credits) as Average_Credits FROM courses;

-- 8th Question select highest salary of instructors from Computer Science department
ALTER TABLE instructors ADD salary INT;

UPDATE instructors
SET salary=80000
WHERE instructor_id=1;

UPDATE instructors
SET salary=95000
WHERE instructor_id=2;

SELECT instructor_id, CONCAT(firstname," ",lastname)as instructor_Name, MAX(salary) as high_salary  FROM instructors WHERE department_id=2 GROUP BY instructor_id,CONCAT(firstname," ",lastname);

-- 9th Quesiton count the number of students enrolled in each department
SELECT d.department_name, COUNT(e.student_id) AS number_of_students FROM enrollments e JOIN courses c ON e.course_id = c.course_id JOIN departments d ON c.department_id = d.department_id GROUP BY d.department_name;

-- 10th Question select student with their corresponding course
SELECT CONCAT(s.firstname," ",s.lastname) as student_name,c.course_name FROM students as s JOIN enrollments as e ON s.student_id=e.student_id JOIN courses as c ON e.course_id=c.course_id;

-- 11th Question select all student with their course if any
SELECT CONCAT(s.firstname," ",s.lastname) as student_name,c.course_name FROM students as s LEFT JOIN enrollments as e ON s.student_id=e.student_id LEFT JOIN courses as c ON e.course_id=c.course_id;

-- 12th Question select course which have more than 3 students
SELECT CONCAT(s.firstname, " ", s.lastname) AS student_name, c.course_name FROM students s JOIN enrollments e ON s.student_id = e.student_id JOIN courses c ON e.course_id = c.course_id WHERE e.course_id IN (SELECT course_id FROM enrollments GROUP BY course_id HAVING COUNT(student_id) > 3);

-- 13th Question Extract the year from enrollment date of students
SELECT YEAR(enrollment_date) AS enrollment_year FROM students;

-- 14th Question concate the instructors name
SELECT CONCAT(i.firstname," ",i.lastname) as Name FROM instructors as i;

-- 15th Question calcualate running total of students
SELECT *, SUM(student_id) OVER(ORDER BY student_id) as Running_Total FROM enrollments;

-- 16th Question
SELECT *, CASE
WHEN YEAR(CURDATE()) - YEAR(enrollment_date) >= 4 THEN 'Senior'
ELSE 'Junior'
END AS Label_Students
FROM students;

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
CREATE TABLE instructors (instructor_id INT AUTO_INCREMENT PRIMARY KEY, firstname VARCHAR(10) NOT NULL, lastname VARCHAR (10) NOT NULL, email VARCHAR(50) NOT NULL, department_id INT NOT NULL, FOREIGN KEY (department_id) REFERENCES departments(department_id)) 
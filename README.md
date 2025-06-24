# Final Project - Student Enrollment System (MySQL)

This project implements a normalized relational database for managing student enrollments, departments, courses, instructors, and more in a university-like system using MySQL.

---

## 📂 Database Schema

The project uses the following relational tables:

- **students**: Stores student personal information and enrollment date
- **departments**: Holds department names
- **courses**: Contains course details linked to departments
- **instructors**: Instructor details linked to departments
- **enrollments**: Records which student is enrolled in which course

---

## 🧱 Table Structures

### `students`
| Field           | Type         |
|----------------|--------------|
| student_id      | INT (PK)     |
| firstname       | VARCHAR(10)  |
| lastname        | VARCHAR(10)  |
| email           | VARCHAR(50)  |
| birth_date      | DATE         |
| enrollment_date | DATE         |

### `departments`
| Field           | Type         |
|----------------|--------------|
| department_id   | INT (PK)     |
| department_name | VARCHAR(20)  |

### `courses`
| Field        | Type         |
|-------------|--------------|
| course_id    | INT (PK)     |
| course_name  | VARCHAR(20)  |
| department_id| INT (FK)     |
| credits      | INT          |

### `instructors`
| Field         | Type         |
|---------------|--------------|
| instructor_id | INT (PK)     |
| firstname     | VARCHAR(10)  |
| lastname      | VARCHAR(10)  |
| email         | VARCHAR(50)  |
| department_id | INT (FK)     |
| salary        | INT          |

### `enrollments`
| Field          | Type         |
|----------------|--------------|
| enrollment_id  | INT (PK)     |
| student_id     | INT (FK)     |
| course_id      | INT (FK)     |
| enrollment_date| DATE         |

---

## ✅ Sample Queries Covered

### CRUD Operations
- Insert, Read, Update, Delete operations on all tables

### Analytical Queries
1. Students enrolled after 2022
2. Courses from the Mathematics department
3. Courses with more than 3 students
4. Students enrolled in both or either specific courses
5. Average course credits
6. Highest salary among instructors in a specific department
7. Student count by department
8. All students with their courses (including those not enrolled)
9. Courses with more than 3 enrollments
10. Year extracted from enrollment date
11. Instructor name concatenation
12. Running total of students using window functions
13. Classify students as Junior or Senior using `CASE` statement

---

## 🛠 How to Use

1. Copy the SQL script (`CREATE`, `INSERT`, and queries)
2. Run it in your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or CLI)
3. Explore queries and modify based on your academic or learning needs

---

## 📚 Requirements

- MySQL 8.0+
- SQL knowledge (Intermediate)
- Tools: Any MySQL GUI or CLI

---

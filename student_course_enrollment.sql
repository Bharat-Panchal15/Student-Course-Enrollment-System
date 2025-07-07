CREATE DATABASE student_enrollment;
USE student_enrollment;

CREATE TABLE students(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    birth_date DATE
);

CREATE TABLE courses(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    instructor VARCHAR(100)
);

CREATE TABLE enrollments(
	student_id INT,
    course_id INT,
    enrollment_on DATE,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    PRIMARY KEY (student_id,course_id)
);


INSERT INTO students(name,email,birth_date)
VALUES
('Bharat','b@gmail.com','2007-02-15'),
('Lucky','l@gmail.com','2013-02-15'),
('Naitk','n@gmail.com','2007-04-03'),
('Gouri','g@gmail.com','2004-10-18'),
('Sahil','s@gmail.com','2008-08-12');

INSERT INTO courses(name,instructor)
VALUES
('HTML','Mr. Verma'),
('CSS','Mr. Roy'),
('Javascript','Mr. Sharma'),
('Python Basics','Mr. Panchal'),
('Web Development','Ms. Shraddha');

INSERT INTO enrollments(student_id,course_id,enrollment_on)
VALUES
(1,4,'2025-05-02'),
(2,1,'2024-05-28'),
(1,3,'2025-06-05'),
(3,4,'2024-10-10'),
(5,1,'2023-09-14'),
(1,1,'2024-06-06'),
(1,5,'2025-02-27'),
(2,5,'2025-03-30');

-- 1. Show students with their enrolled course names
SELECT s.name AS stud_name,
CASE
	WHEN c.name is NULL THEN 'No course enrolled'
    ELSE c.name
END AS course_name
FROM students s
LEFT JOIN enrollments ON student_id = s.id
LEFT JOIN courses c ON course_id = c.id;

-- 2. Count total students per course
SELECT c.name AS course_name,
COUNT(e.student_id) AS student_count
FROM courses c
LEFT JOIN enrollments e ON e.course_id = c.id
GROUP BY c.name;

-- 3.Show students not enrolled in any course
SELECT name
FROM students
WHERE id NOT IN (
	SELECT DISTINCT student_id
    FROM enrollments
);

-- 4.Find the instructor of the course "Python Basics"
SELECT instructor
FROM courses
WHERE name = 'Python Basics';

-- 5.Show the youngest and oldest student
SELECT name AS youngest_student
FROM students
ORDER BY birth_date DESC
LIMIT 1;

SELECT name AS oldest_student
FROM students
ORDER BY birth_date ASC
LIMIT 1;

-- 6. Count how many students each instructor is teaching (via course link)
SELECT c.instructor, COUNT(e.student_id)  AS student_count
FROM courses c
LEFT JOIN enrollments e ON e.course_id = c.id
GROUP BY c.instructor;

-- add index on email in students
CREATE INDEX email_idx
ON students(email);

-- Add VIEW for students enrolled in "Web Development"
CREATE OR REPLACE VIEW web_dev_students AS
SELECT s.name
FROM students s
WHERE s.id = ANY (
	SELECT DISTINCT student_id
    FROM enrollments
    WHERE course_id = 5
);

-- Add CASE statement to categorize students by age group
SELECT name, 
	CASE
		WHEN TIMESTAMPDIFF(YEAR,birth_date,CURDATE()) < 18 THEN 'Juvenile'
        WHEN 18 <= TIMESTAMPDIFF(YEAR,birth_date,CURDATE()) < 50 THEN 'Adult'
        ELSE 'Senior Citizen'
        END AS student_age
FROM students;
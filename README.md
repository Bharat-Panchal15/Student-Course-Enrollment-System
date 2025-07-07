# Student Course Enrollment System (MySQL)

A database-driven project built using MySQL to manage students, courses, and their enrollments. This project includes a relational schema design with realistic data and a wide range of SQL queries — covering everything from joins and groupings to views and indexing.

---

## 🧱 Database Structure

- **Database Name:** `student_enrollment`
- **Tables:**
  - `students`: Contains student details including name, email, and birthdate
  - `courses`: Contains course names and instructors
  - `enrollments`: Mapping table showing which students enrolled in which courses

---

## 🔐 Constraints & Keys

- `PRIMARY KEY` on IDs for all tables
- `FOREIGN KEY` relationships between students, courses, and enrollments
- `UNIQUE` constraint on student email
- Composite `PRIMARY KEY` on `enrollments` for many-to-many mapping

---

## 📝 Sample Queries Included

1. List students and their enrolled course names
2. Count number of students per course
3. Find students not enrolled in any course
4. Find the instructor of a specific course
5. Identify the youngest and oldest students
6. Count students taught by each instructor
7. Categorize students into age groups using `CASE`
8. Create a `VIEW` for students enrolled in "Web Development"
9. Add an `INDEX` on student emails for performance

---

## 📂 Files

- `student_enrollment.sql` – Contains all schema, inserts, and queries

---

## ▶️ How to Run

1. Open your MySQL client or GUI (e.g., MySQL Workbench)
2. Run the `student_enrollment.sql` script
3. Query the database using the examples provided

---

## 📌 Highlights

- Joins (`LEFT JOIN`)  
- Aggregation (`GROUP BY`, `COUNT()`)  
- `CASE` statements  
- Views  
- Indexing  
- Subqueries and filtering

---

## 👤 Author

- Bharat Panchal  
- [GitHub Profile](https://github.com/Bharat-Panchal15)

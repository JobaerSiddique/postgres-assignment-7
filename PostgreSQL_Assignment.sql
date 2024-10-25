-- Active: 1729747291721@@127.0.0.1@5432@university_db
create TABLE students(
    student_id INTEGER PRIMARY KEY UNIQUE,
    student_name TEXT NOT NULL,
    age INTEGER not NULL,
    email TEXT UNIQUE NOT NULL,
    frontend_mark INTEGER not Null,
    backend_mark INTEGER not NULL,
    "status" text NOT NULL DEFAULT 'Null'
)

create table courses(
    course_id INTEGER  PRIMARY KEY UNIQUE,
    course_name TEXT not NULL,
    credits INTEGER NOT NULL
   
)

CREATE TABLE enrollment (
    enrollment_id INTEGER PRIMARY KEY UNIQUE,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
);



INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark) VALUES
(2, 'Zoya', 23, 'zoya@example.com', 52, 58 ),
(3, 'Nabil', 22, 'nabil@example.com', 37, 46 ),
(4, 'Rafi', 24, 'rafi@example.com', 41, 40 ),
(5, 'Sophia', 22, 'sophia@example.com', 50, 52 ),
(6, 'Hasan', 23, 'hasan@gmail.com', 43, 39 );

INSERT INTO courses (course_id, course_name, credits) VALUES
(1, 'Next.js', 3),
(2, 'React.js', 4),
(3, 'Database', 3),
(4, 'Prisma', 3);


INSERT INTO enrollment (enrollment_id, student_id, course_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 2);

--Query 1:
--Insert a new student record with the following details:

INSERT INTO students (student_id, student_name, age, email, frontend_mark, backend_mark) VALUES(
    7,'Zarif',20,'zarif@example.com',50,55
)

-- Query 2:

SELECT  student_name as s from students s
JOIN enrollment e on s.student_id = e.student_id
JOIN courses c on c.course_id = e.course_id
WHERE c.course_name = 'Next.js';





UPDATE students
SET status = 'Awarded'
WHERE student_id = (
    SELECT student_id
    FROM students
    ORDER BY (frontend_mark + backend_mark) DESC
    LIMIT 1
);
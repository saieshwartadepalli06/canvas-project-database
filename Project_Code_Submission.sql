DROP TABLE IF EXISTS Student;
CREATE TABLE Student( 
	student_id INTEGER NOT NULL,
	first_name VARCHAR (35) NOT NULL,
	last_name VARCHAR (35) NOT NULL,
	email_id VARCHAR (200),
	birth_date DATE,
	PRIMARY KEY (student_id)
);

DROP TABLE IF EXISTS Course;
CREATE TABLE Course(
	course_id INTEGER NOT NULL,
	course_name VARCHAR(255) NULL NULL,
	PRIMARY KEY (course_id)
);

DROP TABLE IF EXISTS Teacher;
CREATE TABLE Teacher( 
	teacher_id INTEGER NOT NULL,
	first_name VARCHAR (35) NOT NULL,
	last_name varchar (35) NOT NULL,
	email_id VARCHAR (200),
	birth_date DATE,
	PRIMARY KEY (teacher_id)
);

DROP TABLE IF EXISTS Register;
CREATE TABLE Register(
register_id integer not null,
course_id INTEGER,
student_id INTEGER,
teacher_id Integer,
primary KEY (register_id),
CONSTRAINT register_fk_course_id foreign KEY (course_id) REFERENCES Course (course_id),
CONSTRAINT register_fk_student_id foreign KEY (student_id) REFERENCES Student (student_id),
CONSTRAINT register_fk_teacher_id foreign KEY (teacher_id) REFERENCES Teacher (teacher_id)
);

DROP TABLE IF EXISTS Assignments;
CREATE TABLE Assignments(
	assignment_id INTEGER NOT NULL,
	assignment_date DATE NOT NULL,
	course_id INTEGER,
	assignment_name VARCHAR(255) NOT NULL,
	assignment_grade float(20),
	PRIMARY KEY(assignment_id),
	CONSTRAINT course_fKEY_course_id FOREIGN KEY (course_id) REFERENCES Course (course_id)
);

DROP TABLE IF EXISTS Document_type;
CREATE TABLE Document_type(
	assignment_id INTEGER NOT null,
	PRIMARY KEY(assignment_id),
	document_type VARCHAR(20),
	CONSTRAINT assignment_fKEY_assignment_id FOREIGN KEY (assignment_id) REFERENCES Assignments (assignment_id)
);

DROP TABLE IF EXISTS Quiz;
CREATE TABLE Quiz(
	quiz_id INTEGER NOT NULL,
	quiz_date DATE NOT NULL,
	course_id INTEGER,
	quiz_name VARCHAR(255) NOT NULL,
	quiz_grade float(20),
	PRIMARY KEY(quiz_id),
	CONSTRAINT course_fKEY_course_id FOREIGN KEY (course_id) REFERENCES Course (course_id)
);

DROP TABLE IF EXISTS Question_type;
CREATE TABLE Question_type(
	question_type_id INTEGER NOT null,
	quiz_id INTEGER NOT null,
	blank_type VARCHAR(255),
	PRIMARY KEY(question_type_id),
	CONSTRAINT quiz_fKEY_quiz_id FOREIGN KEY (quiz_id) REFERENCES Quiz (quiz_id)
);

DROP TABLE IF EXISTS Grade;
CREATE TABLE Grade(
	course_id INTEGER,
	student_id INTEGER NOT NULL,
	assignment_id INTEGER,
	quiz_id INTEGER,
	grade_points FLOAT NOT NULL,
	PRIMARY KEY(student_id),
	CONSTRAINT course_fKEY_course_id FOREIGN KEY (course_id) REFERENCES Course (course_id),
	CONSTRAINT student_fKEY_student_id FOREIGN KEY (student_id) REFERENCES Student (student_id),
	CONSTRAINT assignment_fKEY_assignment_id FOREIGN KEY (assignment_id) REFERENCES Assignments (assignment_id),
	CONSTRAINT quiz_fKEY_quiz_id FOREIGN KEY (quiz_id) REFERENCES Quiz (quiz_id)
);

DROP TABLE IF EXISTS Discussion;
CREATE TABLE Discussion(
	discussion_id INTEGER NOT NULL,	
	comment_name VARCHAR(255),
	course_id INTEGER,
	PRIMARY KEY (discussion_id),
	CONSTRAINT dis_fKEY_course_id FOREIGN KEY (course_id) REFERENCES Course (course_id)
);


DROP TABLE IF EXISTS Message;
CREATE TABLE Message(
message_type VARCHAR(255),
discussion_id INTEGER NOT null,
CONSTRAINT mes_fKEY_discussion_id foreign KEY (discussion_id) REFERENCES Discussion (discussion_id),
primary KEY (discussion_id)
);

DROP TABLE IF EXISTS Quiz_Reminder;
CREATE TABLE Quiz_Reminder(
	student_id INTEGER,
	quiz_id INTEGER NOT NULL,
	quiz_date DATE,
	quiz_name VARCHAR(255),
	PRIMARY KEY (quiz_id),
	CONSTRAINT quiz_rem_fKEY_student_id FOREIGN KEY (student_id) REFERENCES Student (student_id),
	CONSTRAINT quiz_rem_fKEY_quiz_id FOREIGN KEY (quiz_id) REFERENCES Quiz (quiz_id)
);

DROP TABLE IF EXISTS Assignment_Reminder;
CREATE TABLE Assignment_Reminder(
	student_id INTEGER,
	assignment_id INTEGER NOT NULL,	
	assignment_date DATE,
	assignment_name VARCHAR(255),
	PRIMARY KEY (assignment_id),
	CONSTRAINT assign_rem_fKEY_student_id foreign KEY (student_id) REFERENCES Student (student_id),
	CONSTRAINT assign_rem_fKEY_assignment_id foreign KEY (assignment_id) REFERENCES Assignments (assignment_id)
);

DROP TABLE IF EXISTS Announcement;
CREATE TABLE Announcement(
	announcement_id INTEGER NOT NULL,
	announcement_date DATE,
	content_text VARCHAR(255),
	course_id integer,
	PRIMARY KEY (announcement_id),
	CONSTRAINT announcement_fKEY_course_id foreign KEY (course_id) REFERENCES Course (course_id)
);

DROP TABLE IF EXISTS Announcement_history;
CREATE TABLE Announcement_history(
	announcement_id INTEGER NOT NULL,
	student_id INTEGER,
	content_text varchar(255),
	announcement_date_visit date,
	PRIMARY KEY (announcement_id),
	CONSTRAINT anh_fKEY_announcement_id FOREIGN KEY (announcement_id) REFERENCES Announcement (announcement_id),	
	CONSTRAINT anh_fKEY_student_id FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

DROP TABLE IF EXISTS Assignment_history;
CREATE TABLE Assignment_history(
assignment_id INTEGER NOT NULL,
course_id INTEGER,
student_id INTEGER,
assignment_name VARCHAR(255),
assignment_date_visit date,
PRIMARY KEY (assignment_id),
CONSTRAINT ah_fKEY_assignment_id FOREIGN KEY (assignment_id) REFERENCES Assignments (assignment_id),
CONSTRAINT ah_fKEY_student_id FOREIGN KEY (student_id) REFERENCES Student (student_id),
CONSTRAINT ah_fKEY_course_id FOREIGN KEY (course_id) REFERENCES Course (course_id)
);

DROP TABLE IF EXISTS Quiz_history;
CREATE TABLE Quiz_history(
student_id INTEGER,
course_id INTEGER,
quiz_id INTEGER NOT null,
quiz_date_visit date,
PRIMARY KEY (quiz_id),
CONSTRAINT qh_fKEY_student_id FOREIGN KEY (student_id) REFERENCES Student (student_id),
CONSTRAINT qh_fKEY_course_id FOREIGN KEY (course_id) REFERENCES Course (course_id),
CONSTRAINT ah_fKEY_quiz_id FOREIGN KEY (quiz_id) REFERENCES Quiz (quiz_id)
);

DROP TABLE IF EXISTS Calendar;
CREATE TABLE Calendar(
	quiz_id INTEGER,
	assignment_id INTEGER,
	student_id INTEGER NOT NULL,
	quiz_date DATE NOT NULL,
	assignment_date DATE NOT NULL,
	PRIMARY KEY (student_id),
	CONSTRAINT quiz_fKEY_quiz_id FOREIGN KEY (quiz_id) REFERENCES Quiz (quiz_id),
	CONSTRAINT assignment_fKEY_assignment_id FOREIGN KEY (assignment_id) REFERENCES Assignments (assignment_id),
	CONSTRAINT student_fKEY_student_id FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

-- Student table
INSERT INTO Student (student_id, first_name, last_name, email_id, birth_date) VALUES
(1, 'Jelene', 'Fletcher', 'jfletcher0@dailymail.co.uk', '2002-07-31'),
(2, 'Kittie', 'Hemerijk', 'khemerijk1@mediafire.com', '2000-09-10'),
(3, 'Lorelei', 'Clowley', 'lclowley2@zimbio.com', '1999-09-08'),
(4, 'Livvy', 'Clixby', 'lclixby3@harvard.edu', '2001-06-20'),
(5, 'Paulie', 'Chess', 'pchess4@scientificamerican.com', '2004-12-29'),
(6, 'Brenden', 'Taborre', 'btaborre5@shutterfly.com', '2001-04-04'),
(7, 'Bertrando', 'Forrest', 'bforrest6@yolasite.com', '2003-06-19'),
(8, 'Fred', 'Leahy', 'fleahy7@washington.edu', '2001-11-22'),
(9, 'Coretta', 'Challicombe', 'cchallicombe8@studiopress.com', '2002-10-15'),
(10, 'Steffie', 'Moiser', 'smoiser9@loc.gov', '2000-06-22');

-- Course table
INSERT INTO Course (course_id, course_name) VALUES
(1, 'Introduction to Business Analytics'),
(2, 'Database Theory and Design'),
(3, 'Data Structures and Java'),
(4, 'Artificial Intelligence'),
(5, 'Software Engineering'),
(6, 'Business Development'),
(7, 'Cyber Security'),
(8, 'Statistics and Predictive Analysis'),
(9, 'Data Engineering'),
(10, 'Data Visualization');

-- Teacher table
INSERT INTO Teacher (teacher_id, first_name, last_name, email_id, birth_date) VALUES
(1, 'Dr. Jane', 'Smith', 'jane.smith@example.com', '1975-01-01'),
(2, 'Prof. John', 'Brown', 'john.brown@example.com', '1980-02-02'),
(3, 'Dr. Mary', 'Davis', 'mary.davis@example.com', '1985-03-03'),
(4, 'Prof. William', 'Johnson', 'william.johnson@example.com', '1990-04-04'),
(5, 'Dr. Elizabeth', 'Wilson', 'elizabeth.wilson@example.com', '1995-05-05'),
(6, 'Prof. Julio', 'Leftwich', 'jleftwichl@chicagotribune.com', '1960-06-05'),
(7, 'Dr. Gabrielle', 'Kemme', 'gkemmem@vk.com', '1970-05-30'),
(8, 'Dr. Gabrielle', 'Tonkes', 'ltonkesn@slideshare.net', '1982-11-22'),
(9, 'Prof. Aron', 'Larrosa', 'alarrosao@nba.com', '1958-08-11'),
(10, 'Prof. Lindy', 'Hoggins', 'lhogginsp@nba.com', '1965-10-10');

-- Register table
INSERT INTO Register (register_id, course_id, student_id, teacher_id) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 2, 2, 2),
(4, 3, 3, 3),
(5, 4, 4, 4),
(6, 5, 5, 5),
(7, 6, 6, 6),
(8, 7, 7, 7),
(9, 8, 8, 8),
(10, 9, 9, 9),
(11, 10, 10, 10),
(12, 1, 10, 1),
(13, 5, 6, 5),
(14, 4, 7, 4),
(15, 3, 9, 3);

-- Assignments table
INSERT INTO Assignments (assignment_id, assignment_date, course_id, assignment_name, assignment_grade) VALUES
(1, '2023-03-01', 1, 'Assignment 1', 3.8),
(2, '2023-03-05', 2, 'Assignment 1',   4),
(3, '2023-03-10', 3, 'Assignment 1', 3.2),
(4, '2023-03-15', 4, 'Assignment 1', 3.94),
(5, '2023-03-20', 5, 'Assignment 1',  3.5),
(6, '2023-03-25', 6, 'Assignment 1',  3.8),
(7, '2023-03-30', 7, 'Assignment 1',  3.5),
(8, '2023-03-31', 8, 'Assignment 2',  4),
(9, '2023-04-05', 9, 'Assignment 2',  3.94),
(10, '2023-04-10', 10, 'Assignment 2', 3.2);

-- Document_type table
INSERT INTO Document_type (assignment_id, document_type) VALUES
(1, 'pdf'),
(2, 'doc'),
(3, 'pdf'),
(4, 'pdf'),
(5, 'doc'),
(6, 'doc'),
(7, 'pdf'),
(8, 'doc'),
(9, 'html'),
(10, 'html');


-- Quiz Table
INSERT INTO Quiz (quiz_id, quiz_date, course_id, quiz_name, quiz_grade) values
(1,'2023-03-02',1,'Introduction to Business Analytics Quiz 2', 3.4),
(2,'2023-03-04',2,'Database Theory and Design Quiz 1', 3.5),
(3,'2023-03-09',3,'Data Structures and Java Quiz 1', 3.6),
(4,'2023-03-14',4,'Artificial Intelligence Quiz 2', 4),
(5,'2023-03-19',5,'Software Engineering Quiz 3', 3.8),
(6,'2023-04-01',5,'Software Engineering Quiz 3', 3.75),
(7,'2023-03-29',5,'Software Engineering Quiz 3', 3.94),
(8,'2023-03-21',5,'Software Engineering Quiz 3', 4),
(9,'2023-04-06',5,'Software Engineering Quiz 3', 3.8),
(10,'2023-04-09',5,'Software Engineering Quiz 3', 3.5);

-- Discussion

INSERT INTO Discussion (discussion_id, comment_name, course_id) VALUES
(1, 'What is the most challenging topic in this course?', 1),
(2, 'I am having trouble with joins in SQL. Any tips?', 2),
(3, 'Has anyone started on the programming assignment yet?', 3),
(4, 'What are your thoughts on the latest AI news?', 4),
(5, 'Let''s discuss our project ideas and form groups!', 5);

-- Message 

INSERT INTO Message (message_type, discussion_id) VALUES
('Question', 1),
('Request', 2),
('Discussion', 3),
('Opinion', 4),
('Proposal', 5);

-- Quiz reminder

INSERT INTO Quiz_Reminder (student_id, quiz_id, quiz_date, quiz_name) VALUES
(1, 1, '2023-03-09', 'Introduction to Business Analytics Quiz 2'),
(2, 2, '2023-03-04', 'Database Theory & Design Quiz 1'),
(3, 3, '2023-03-02', 'Data Structures and Java Quiz 1'),
(4, 4, '2023-03-19', 'Artificial Intelligence Quiz 2'),
(5, 5, '2023-03-14', 'Software Engineering Quiz 3'),
(6, 6, '2023-03-19', 'Software Engineering Quiz 3');

-- Assignment_reminder

INSERT INTO Assignment_Reminder (student_id, assignment_id, assignment_date, assignment_name) VALUES 
(1, 1, '2023-03-01', 'Assignment 1'),
(2, 2, '2023-03-05', 'Assignment 2'),
(3, 3, '2023-03-10', 'Assignment 3'),
(4, 4, '2023-03-15', 'Assignment 4'),
(5, 5, '2023-03-20', 'Assignment 5');

-- Announcement

INSERT INTO Announcement (announcement_id, announcement_date, content_text, course_id)
VALUES (11, '2023-03-23', 'Reminder: Assignment 1 is due tomorrow.', 1),
       (12, '2023-03-23', 'The quiz for Database Systems has been postponed to next week.', 2),
       (13, '2023-03-23', 'The midterm exam for Introduction to Computer Science will be held on April 1st.', 3),
       (14, '2023-03-23', 'There will be no class for Software Engineering on March 24th.', 4),
       (15, '2023-03-23', 'The guest lecture for Artificial Intelligence will be held on March 25th.', 5);

-- Calendar
insert into calendar (quiz_id, assignment_id, student_id, quiz_date, assignment_date) values 
(1, 1, 1, '2023-03-02', '2023-03-01'),
(2, 2, 2, '2023-03-04', '2023-03-03'),
(3, 3, 3, '2023-03-09', '2023-03-08');

-- Quiz History

insert into quiz_history (student_id, course_id, quiz_id, quiz_date_visit) values 
(1, 1, 1, '2023-03-04'),
(2, 2, 2, '2023-03-09'),
(3, 3, 3, '2023-03-14'),
(4, 4, 4, '2023-03-19'),
(5, 5, 5, '2023-03-24'),
(6, 6, 6, '2023-03-24'),
(7, 7, 7, '2023-04-04');

-- Grade 

insert into grade (course_id, student_id, assignment_id, quiz_id, grade_points) values 
(1, 1, 1, 1, 3.8),
(2, 2, 2, 2, 4),
(3, 3, 3, 3, 3.5),
(4, 4, 4, 4, 3.8),
(5, 5, 5, 5, 4),
(6, 6, 6, 6, 3.3),
(7, 7, 7, 7, 3.75),
(8, 8, 8, 8, 3.94),
(9, 9, 9, 9, 4),
(10, 10, 10, 10, 3.8);

-- Question Type

insert into question_type (question_type_id, quiz_id, blank_type) values 
(1, 1, 'Multiple Choice'),
(2, 2, 'Multiple Choice'),
(3, 3, 'Fill in the blank'),
(4, 4, 'Multiple Choice'),
(5, 5, 'Fill in the blank');

-- Announcement_history 
insert into announcement_history (announcement_id, student_id, content_text, announcement_date_visit) values
(11, 1, 'Reminder: Assignment 1 is due tomorrow.', '2023-03-23'),
(12, 2, 'The quiz for Database Systems has been postponed to next week.', '2023-03-23'),
(13, 3, 'The midterm exam for Introduction to Computer Science will be held on April 1st.', '2023-03-23'),
(14, 4, 'There will be no class for Software Engineering on March 24th.', '2023-03-23'),
(15, 5, 'The guest lecture for Artificial Intelligence will be held on March 25th.', '2023-03-23');

-- Assignment_history 
insert into assignment_history (assignment_id, course_id, student_id, assignment_name, assignment_date_visit) values
(1, 1, 1, 'Assignment 1','2023-03-01'),
(2, 2, 2, 'Assignment 1','2023-03-05'),
(3, 3, 3, 'Assignment 1','2023-03-10'),
(4, 4, 4, 'Assignment 1','2023-03-15'),
(5, 5, 5, 'Assignment 1','2023-03-20'),
(6, 6, 6, 'Assignment 1','2023-03-25'),
(7, 7, 7, 'Assignment 1','2023-03-30'),
(8, 8, 8, 'Assignment 2','2023-03-31'),
(9, 9, 9, 'Assignment 2','2023-04-05'),
(10, 10, 10, 'Assignment 2','2023-04-10');

-- Sample Insert Statements 

select * from student;

select * from course;

select * from teacher;

select * from quiz;

select * from assignments;

-- Sample Queries

select student.student_id, student.first_name, student.last_name, grade.grade_points from student
inner join grade on student.student_id = grade.student_id;

select student.student_id, student.first_name, student.last_name, course.course_name
from register
inner join course on course.course_id = register.course_id
inner join student on student.student_id = register.student_id;

select student.student_id, student.first_name, course.course_name, 
	   (sum(assignments.assignment_grade)/count(course.course_id) + sum(quiz.quiz_grade)/count(course.course_id))/2 as total_grade
from student 
inner join register on register.student_id = student.student_id 
inner join assignments on assignments.course_id = register.course_id
inner join course on register.course_id = course.course_id 
inner join quiz on quiz.course_id = course.course_id 
group by course.course_name, student.student_id, course.course_id
order by total_grade desc;

with cte_student as (
	select s.student_id ,
		   s.first_name,
		   s.last_name,
		   g.grade_points,
		   c.course_name,
		   rank () over (partition by g.grade_points order by g.grade_points desc nulls last) as order_rank
	from student as s 
	inner join register as r on s.student_id = r.student_id  
	inner join grade g on g.course_id = r.course_id 
	inner join course c on c.course_id = g.course_id 
) 
select distinct cte.student_id, cte.first_name as student_first_name,
	   cte.last_name as student_last_name, cte.course_name, cte.grade_points as gpa
from cte_student as cte
where cte.order_rank = 1
group by cte.grade_points, cte.course_name, cte.first_name, cte.last_name, cte.student_id;

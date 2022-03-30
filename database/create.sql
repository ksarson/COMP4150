create schema student_information_system;

create table room(
	room_id int(3) not null,
	room_num varchar(4),
	building varchar(30),
	capacity int(3),
	primary key(room_id)
);

create table Student(
	student_id int(9) not null,
	first_name varchar(20),
	last_name varchar(20),
	email varchar(30),
	major varchar(30),
	gpa double(3, 1),
	department_id char(2) not null,
	primary key(student_id)
);

create table student_records(
	record_id int(4) not null,
	student_id int(9) not null,
	section_rec char(4) not null,
	grade int(2),
	status varchar(30),
	year int(4),
	semester char(1),
	primary key(record_id)
);

create table course(
	course_id varchar(8) not null,
	course_name varchar(30), 
	description varchar(100),
	department_id char(2) not null,
	primary key(course_id)
);

create table department(
	department_id char(2) not null,
	department_name varchar(20),
	primary key(department_id)
);

create table professor(
	professor_id int(4) not null,
	first_name varchar(20),
	last_name varchar(20),
	email varchar(30),
	department_id char(2) not null,
	primary key(professor_id)
);

create table section_records(
	section_id int(2) not null,
	section_rec char(4) not null,
	course_id varchar(8) not null,
	professor_id int(4) not null,
	room_id int(3) not null,
	day_of_week varchar(30),
	start_time varchar(20),
	end_time varchar(20),
	primary key(section_rec)
);

-- Foreign Keys for Student
ALTER TABLE student
ADD FOREIGN KEY(department_id) 
REFERENCES department(department_id);

-- Foreign Keys for student_records
ALTER TABLE student_records
ADD FOREIGN KEY(student_id) 
REFERENCES student(student_id);

ALTER TABLE student_records
ADD FOREIGN KEY(section_rec) 
REFERENCES section_records(section_rec);

-- Foreign Keys for Professor
ALTER TABLE professor
ADD FOREIGN KEY(department_id) 
REFERENCES department(department_id);

-- Foreign Keys for Course
ALTER TABLE course
ADD FOREIGN KEY(department_id) 
REFERENCES department(department_id);

-- Foreign Keys for section_records
ALTER TABLE section_records
ADD FOREIGN KEY(course_id) 
REFERENCES course(course_id);

ALTER TABLE section_records
ADD FOREIGN KEY(professor_id) 
REFERENCES professor(professor_id);

ALTER TABLE section_records
ADD FOREIGN KEY(room_id) 
REFERENCES room(room_id);
);
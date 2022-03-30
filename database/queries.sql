--1
--Select all of the courses that a certain student is taking
select c.course_name from course c
join section_records ser on ser.course_id = C.course_id
join student_records sr on sr.section_rec = ser.section_rec
join student s on s.student_id = sr.student_id where s.student_id = 100000001;

--2
--Select all of the courses that a certain professor is teaching
select c.course_name from course c, professor p, section_records s where
c.course_id = s.course_id and p.professor_id = s.professor_id and
p.first_name = 'BOBBY';

--3
--Select all of the courses where a student gets an A
select c.course_name from course c
join section_records se on se.course_id = c.course_id
join student_records sr on sr.section_rec = se.section_rec
join student s on s.student_id = sr.student_id
where s.student_id = 100000002 and sr.grade >= 80;

--4 
--Select all students taking a specific course
select s.student_id, s.first_name, s.last_name from student s
join student_records sr on sr.student_id = s.student_id
join section_records se on se.section_rec = sr.section_rec
join course c on c.course_id = se.course_id
where c.course_id = 'COMP1050';

--5
--Select the room that a course is being taught in
select r.building, r.room_num from room r
join section_records sr on sr.room_id = r.room_id
join course c on c.course_id = sr.course_id
where c.course_id = 'COMP2080';

--6 
--Select all students currently taking a course with a certain professor
select s.student_id, s.first_name, s.last_name from student s
join student_records sr on sr.student_id = s.student_id
join section_records se on se.section_rec = sr.section_rec
join professor p on se.professor_id = p.professor_id
where p.professor_id = 9001;

--7 
--Select the department names of all students
select s.first_name, s.last_name, d.department_name from Student s
join department d on d.department_id = s.department_id;

--8
--Select all courses are offered by a department
select c.course_id, c.course_name from course c
join department d on d.department_id = c.department_id
where d.department_id = 'COMPUTER SCIENCE';

--9
--Select all students on the honour roll
select s.student_id, s.first_name, s.last_name from student s where s.gpa >= 80.0;

--10
--Update grades to add a 5% curve to the grades of all students in a certain section of a course
DELIMITER $$
CREATE PROCEDURE applyCurve (
    IN sec char(4)
)
BEGIN
	UPDATE student_records SET grade = grade * 1.05 where
	section_rec = sec; 
END$$
DELIMITER ;

-- enter in section-rec name

--11
--Delete a student from a course who voluntarily dropped it online
declare
	create or replace trigger delete_student_warning
	before delete on student_records

	declare
		begin
			-- execute query if they say yes
		end;

		cursor c1 for
		select sr.record_id from student_records sr
		join sectrion_records se on se.section_rec = sr.section_rec
		join course c on c.course_id = se.course_id
		where sr.student_id = 100000001 
		and c.course_id = 'COMP1050' for update;
		exit_loop boolean;
		continue handler for not found set exit_loop = true;

begin
	open c1;
	vw_loop: loop
		delete from student_records where current of c;
		if exit_loop then
        	close c1;
        	leave vw_loop;
     	end if;
	end loop vw_loop;
end;

--12
--Update a student’s major
declare
	create procedure update_major(id number(9), major_name varchar2(30))
		begin
			update student
			set major = major_name
			where student_id = id;	
		end;
begin
	update_major(100000001, 'Business');
end;

--15
--Calculate the average of a course section
declare
	cursor c1 is
	select sr.record_id, sr.grade from student_records sr
	join section_records se on se.section_rec = sr.section_rec
	where se.course_id = 'COMP2260' and se.section_id = 1 for update;

	grade_total number;
	average number;

begin
	
	for c in c1 loop
		grade_total := grade_total + c.grade;
	end loop;

	open c1;

	average := grade_total / c1%ROWCOUNT; 

	-- do something with average

	close c1;
end;

--16
-- query for specific course id to get each section 
-- for when it was offered and how many students
select se.section_rec, c.course_id, c.course_name, se.section_id, p.first_name, p.last_name, p.professor_id, se.semester ,se.year, count(sr.record_id) 'num_students' from course c
    join section_records se on se.course_id = c.course_id
    left join student_records sr on sr.section_rec = se.section_rec
    join professor p on p.professor_id = se.professor_id
    WHERE c.course_id = 'COMP2080'
    group by se.section_rec, c.course_id, c.course_name, se.section_id, p.first_name,se.year;


--18
--when they click on the section record get all the student that took it
select se.section_rec, sr.grade, s.first_name, s.last_name, s.student_id, s.email, sr.status
from section_records se
join student_records sr on sr.section_rec = se.section_rec
join student s on s.student_id = sr.student_id;

--19 
-- average of a section
select se.section_rec, se.course_id, se.section_id, avg(sr.grade)
from section_records se
join student_records sr on se.section_rec = sr.section_rec
group by se.section_rec, se.course_id, se.section_id;

--20
-- click on professor, get section
select p.professor_id, p.first_name, p.last_name, se.section_rec, se.year from professor p
join section_records se on se.professor_id = p.professor_id;

-- 21
-- procedure for getting grades, used in calculateGPA,
DELIMITER $$
CREATE PROCEDURE getGrades (
	IN id integer,
    INOUT total integer,
    INOUT number123 integer
)
BEGIN

	DECLARE finished INTEGER DEFAULT 0;
	declare tempGrade integer;
    
    DEClARE c1 
        CURSOR FOR 
            Select grade from student_records where
            student_id = id;

	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
	
    open c1;
    
    doLoop: LOOP
        FETCH c1 INTO tempGrade;
        IF finished = 1 THEN 
            LEAVE doLoop;
        END IF;
        
        SET total = total + tempGrade;
        set number123 = number123 + 1;
    END LOOP doLoop;
    
    close c1;
    
END$$
DELIMITER ;

set @total = 0;
set @number123 = 0;
CALL getGrades(952539633, @total, @number123);
select @total, @number123;

-- 22
-- calculate gpa
drop procedure if exists calculateGPA;

DELIMITER $$
CREATE PROCEDURE calculateGPA()
BEGIN
	
    declare id integer;
    declare total integer;
    declare num_of_courses integer;
    declare new_avg double;
    
    DECLARE finished INTEGER DEFAULT 0;
    
    DEClARE c1 
        CURSOR FOR 
		SELECT student_id FROM student;
    
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
    
	open c1;
    
    doLoop: LOOP
        FETCH c1 INTO id;
        set total = 0;
        set num_of_courses = 0;
        set new_avg = 0.0;
        IF finished = 1 THEN 
            LEAVE doLoop;
        END IF;
		
		call getGrades(id, total, num_of_courses);
        set new_avg = cast(total as double) / cast(num_of_courses as double);
        -- select cast(total as double) / cast(num_of_courses as double);
        update student set gpa = new_avg where student_id = id;
        -- select new_avg;
    END LOOP doLoop;
    
    close c1;
    
END$$
DELIMITER ;

-- TRIGGER
-- to recalculate gpa after a curve
CREATE TRIGGER after_curve 
    after UPDATE ON student_records
    FOR EACH ROW 
	CALL calculateGPA();

-- 23
-- Procedure to add a student
drop procedure if exists addStudent;

DELIMITER $$
CREATE PROCEDURE addStudent(
	IN first varchar(20),
    IN last varchar(20),
    IN major varchar(30)
)
BEGIN
	
    declare email varchar(30);
	declare dep_code char(2);
    declare id integer(9);
    
    set email = concat(concat(left(first, 1), last), '@uwindsor.ca');
    
    CASE major
		WHEN 'Computer Science' THEN set dep_code = 'CS'; 
		WHEN 'Chemistry' THEN set dep_code = 'CS';
		WHEN 'Business' THEN set dep_code = 'CS';
		WHEN 'Engineering' THEN set dep_code = 'CS';
        else set dep_code = 'NA';
	END CASE;
    
    set id = (select student_id from student order by student_id desc limit 1) + 1;
	INSERT INTO STUDENT VALUES(id, first, last, email, major, 0, dep_code);
    
END$$
DELIMITER ;

call addStudent('Majid', 'Joseph', 'Computer Science');

-- 24
-- Procedure to get an average of a section
DELIMITER $$
CREATE PROCEDURE get_average(
	IN sec_rec char(4),
    INOUT total_grade integer,
    INOUT number_of_students integer,
    OUT average double
)
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    declare temp_grade integer;
    
	DEClARE c1 
        CURSOR FOR 
		SELECT grade FROM student_records sr where sr.section_rec = sec_rec;
    
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;    
	
    open c1;
    
    doLoop: LOOP
		fetch c1 into temp_grade;
        if finished = 1 then
			leave doLoop;
		end if;
        -- select temp_grade;
        set total_grade = total_grade + temp_grade;
        set number_of_students = number_of_students + 1;
        -- select total_grade;
    END LOOP;
    set average = cast(total_grade as double) / cast(number_of_students as double);
	-- select total_grade, number_of_students;
    
    close c1;
END$$
DELIMITER ;

set @total = 0;
set @num = 0;
call get_average('3000', @total, @num, @avg1);
select @avg1;

-- 25 
-- Query to get how many students each professor has taught
select p.professor_id, p.first_name, p.last_name, count(sr.student_id) from professor p
join section_records se on se.professor_id = p.professor_id
join student_records sr on sr.section_rec = se.section_rec
group by p.professor_id, p.first_name, p.last_name;


-- 26
-- Procedure to get number of students in a department
DELIMITER $$
CREATE PROCEDURE get_department_count(
	IN dep_id char(2),
    INOUT total integer
)
BEGIN
	
    declare temp integer;
	DECLARE finished INTEGER DEFAULT 0;
	
    DEClARE c1 
        CURSOR FOR 
        select student_id from student where department_id = dep_id;
        
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;    
        
	open c1;
    
    doLoop: LOOP
		fetch c1 into temp;
        if finished = 1 then
			leave doLoop;
		end if;
        set total = total + 1;
    end LOOP;
    
    close c1;
    
END$$
DELIMITER ;

set @total = 0;
call get_department_count('CS', @total);
select @total;
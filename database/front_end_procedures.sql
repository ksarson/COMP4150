-- Procedure to apply a 5% curve to a section
DELIMITER $$
CREATE PROCEDURE apply_curve (
    IN sec char(4)
)
BEGIN
	UPDATE student_records SET grade = grade * 1.05 where
	section_rec = sec; 
END$$
DELIMITER ;

-- Procedure to get grade total and number of courses
DELIMITER $$
CREATE PROCEDURE get_grades (
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
            student_id = id and status != 'IP';

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

-- Procedure to calculate and update GPAs
DELIMITER $$
CREATE PROCEDURE calculate_GPA()
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
		
		call get_grades(id, total, num_of_courses);
        set new_avg = cast(total as double) / cast(num_of_courses as double);
        update student set gpa = new_avg where student_id = id;
    END LOOP doLoop;
    
    close c1;
    
END$$
DELIMITER ;

-- Trigger for whenever a curve is applied through applyCurve(...)
CREATE TRIGGER after_student_records_change 
    after UPDATE ON student_records
    FOR EACH ROW 
	CALL calculate_GPA();

-- Procedure to add a student to the database
DELIMITER $$
CREATE PROCEDURE add_student(
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

-- Procedure to change a students grade in a section
DELIMITER $$
CREATE PROCEDURE change_grade(
    IN s_id integer,
    IN rec_id integer,
    IN new_grade integer
)
BEGIN
    
    declare q integer;
    
    set q = (select grade from student_records where record_id = rec_id and student_id = s_id);
    
    IF q is not null THEN 
        update student_records set grade = new_grade where record_id = rec_id and student_id = s_id;
        if new_grade >= 50 then
            update student_records set status = 'PASS' where record_id = rec_id and student_id = s_id;
        else 
            update student_records set status = 'PASS' where record_id = rec_id and student_id = s_id;
        end if;
    END IF;
    
END$$
DELIMITER ;

-- Procedure to add a student to a section
DELIMITER $$
CREATE PROCEDURE add_student_to_section(
	IN s_id int(9),
    IN sec_rec char(4)
)
BEGIN
    declare year1 int(4);
    declare sem char(1);
	declare last_r_id int(4);
	
	set year1 = (select year from section_records where section_rec = sec_rec);
    set sem = (select semester from section_records where section_rec = sec_rec);
		
	if year1 = 2019 and sem = 'F' then
		set last_r_id = (select record_id from student_records order by record_id desc limit 1) + 1;
        insert into student_records values(last_r_id, s_id, sec_rec, 0, 'IP', year1, sem);
	end if;
    
END$$
DELIMITER ;

-- Procedure to drop a student from a section
DELIMITER $$
CREATE PROCEDURE drop_student_from_section(
	IN s_id int(9),
    IN sec_rec char(4)
)
BEGIN
    declare year1 int(4);
    declare r_id int(4);
    declare sem char(1);
    
    set r_id = (select record_id from student_records where student_id = s_id and section_rec = sec_rec);
    set year1 = (select year from student_records where student_id = s_id and section_rec = sec_rec);
    set sem = (select semester from student_records where student_id = s_id and section_rec = sec_rec);
    
    if r_id is not null and year1 = 2019 and sem = 'F' then
		delete from student_records s where s.record_id = r_id;
    end if;
    
END$$
DELIMITER ;

-- Procedure to change a student's major
DELIMITER $$
CREATE PROCEDURE change_major(
	IN s_id int(9),
    IN new_major varchar(30)
)
BEGIN
	update student set major = new_major where student_id = s_id;
END$$
DELIMITER ;

-- Procedure to get an average of a section
-- Please check queries.sql #24 to see how to call it
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
        set total_grade = total_grade + temp_grade;
        set number_of_students = number_of_students + 1;
    END LOOP;
    set average = cast(total_grade as double) / cast(number_of_students as double);
    
    close c1;
END$$
DELIMITER ;

-- Procedure to add a professor
DELIMITER $$
CREATE PROCEDURE add_professor(
    IN first varchar(20),
    IN last varchar(20),
    IN dep_code char(2)
)
BEGIN
    
    declare id int(4);
    declare email varchar(30);
    
    set id = (select professor_id from professor order by professor_id DESC limit 1) + 1;
    set email = concat(concat(left(first, 1), last), '@uwindsor.ca'); 
    INSERT INTO PROFESSOR VALUES(id, first, last, email, dep_code);
END$$
DELIMITER ;

-- Procedure to add a professor to a section
DELIMITER $$
CREATE PROCEDURE add_professor_to_section(
    IN p_id int(4),
    IN sec_rec char(4)
)
label:BEGIN
    
    declare day_loop varchar(30);
    declare start_loop varchar(20);
    
    declare sem char(2);
    declare year1 int(4);
    declare day1 varchar(30);
    declare start1 varchar(20);
    
    DECLARE finished INTEGER DEFAULT 0;
    
    DEClARE c1 
        CURSOR FOR 
        SELECT sr.day_of_week, sr.start_time FROM section_records sr where sr.professor_id = p_id
        and sr.year = 2019 and sr.semester = 'F';
    
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
    
    set sem = (select semester from section_records where section_rec = sec_rec);
    set year1 = (select sr.year from section_records sr where section_rec = sec_rec);
    set day1 = (select day_of_week from section_records where section_rec = sec_rec);
    set start1 = (select start_time from section_records where section_rec = sec_rec);
    
    if sec_rec not in (select section_rec from section_records) then
        leave label;
    end if;
    
    if not(year1 = 2019 and sem = 'F') then
        leave label;
    end if;
    
    if not((select department_id from professor where professor_id = p_id) = 
        (select department_id from course c join section_records sr on c.course_id = sr.course_id where sr.section_rec = sec_rec)) then
        leave label;
    end if;
    
    open c1;
    doLoop: LOOP
        fetch c1 into day_loop, start_loop;
        if finished = 1 then
            leave doLoop;
        end if;
        
        if day_loop = day1 and start_loop = start1 then
            leave label;
        end if;
        
    END LOOP;
    close c1;
    
    update section_records set professor_id = p_id where section_rec = sec_rec;
END$$
DELIMITER ;

drop procedure if exists create_section;

-- Procedure to add a section
DELIMITER $$
CREATE PROCEDURE create_section(
    IN course_id varchar(8),
    IN prof_id int(4),
    IN room_id int(3),
    IN day1 varchar(30),
    IN start1 varchar(20),
    IN end1 varchar(20)
)
BEGIN
    
    declare sec_id int(2);
    declare sec_rec char(4);
    
    set sec_id = (select section_id from section_records sr where sr.course_id = course_id and sr.year = 2019 and sr.semester = 'F' order by section_id desc limit 1);
    set sec_rec = (select section_rec from section_records sr order by section_rec desc limit 1) + 1;
    
    if sec_id is null then
        set sec_id = 1;
    else
        set sec_id = sec_id + 1;
    end if;
    
    insert into section_records values(sec_id, sec_rec, course_id, prof_id, room_id, 2019, 'F', day1, start1, end1);
    
END$$
DELIMITER ;

-- Procedure to get number of students in a department
-- Please check queries.sql # to see how to call it
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


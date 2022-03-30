-- Procedure for getting grades, used in calculateGPA
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

-- Calculate GPA
drop procedure if exists calculateGPA;

DELIMITER $$
CREATE PROCEDURE calculateGPA()
BEGIN
	
    declare id integer;
    declare total integer;
    declare num_of_courses integer;
    declare new_avg double;
    
    DECLARE finished INTEGER DEFAULT 0;
    
    DECLARE c1 
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
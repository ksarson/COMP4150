-- SQL - Set up Project
CREATE SCHEMA student_info;
CREATE USER 'app'@'%' IDENTIFIED WITH mysql_native_password BY 'Password123';
GRANT ALL ON student_info.* TO 'app'@'%';
USE student_info;
-- Create the tables

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
	course_name varchar(50), 
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
	year int(4),
	semester char(1),
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

INSERT INTO ROOM VALUES (101, '1120', 'ERIE HALL', 110);
INSERT INTO ROOM VALUES (102, '1118', 'ERIE HALL', 60);
INSERT INTO ROOM VALUES (103, '3130', 'ERIE HALL', 35);
INSERT INTO ROOM VALUES (201, '1250', 'ESSEX HALL', 105);
INSERT INTO ROOM VALUES (202, '1230', 'ESSEX HALL', 55);
INSERT INTO ROOM VALUES (203, '1267', 'ESSEX HALL', 30);

INSERT INTO DEPARTMENT VALUES ('CS', 'Computer Science');
INSERT INTO DEPARTMENT VALUES ('CH', 'Chemistry');
INSERT INTO DEPARTMENT VALUES ('BU', 'Business');
INSERT INTO DEPARTMENT VALUES ('EN', 'Engineering');

insert into student values(100000000,'Jacki','Mcelyea','JMcelyea@uwindsor.ca','Computer Science',74.44,'CS');
insert into student values(100000001,'Rowena','Julio','RJulio@uwindsor.ca','Computer Science',63.89,'CS');
insert into student values(100000002,'Faith','Kolesar','FKolesar@uwindsor.ca','Chemistry',64.56,'CH');
insert into student values(100000003,'Vonnie','Rohrbaugh','VRohrbaugh@uwindsor.ca','Chemistry',50.11,'CH');
insert into student values(100000004,'Gilberte','Ober','GOber@uwindsor.ca','Computer Science',54.5,'CS');
insert into student values(100000005,'Carline','Trew','CTrew@uwindsor.ca','Computer Science',56.44,'CS');
insert into student values(100000006,'Alesia','Stead','AStead@uwindsor.ca','Chemistry',53.11,'CH');
insert into student values(100000007,'Easter','Harrison','EHarrison@uwindsor.ca','Engineering',45.0,'EN');
insert into student values(100000008,'Arianne','Weidman','AWeidman@uwindsor.ca','Computer Science',52.78,'CS');
insert into student values(100000009,'Kym','Fulk','KFulk@uwindsor.ca','Engineering',40.11,'EN');
insert into student values(100000010,'Juanita','Munsey','JMunsey@uwindsor.ca','Business',43.22,'BU');
insert into student values(100000011,'Emeline','Pomeroy','EPomeroy@uwindsor.ca','Chemistry',66.89,'CH');
insert into student values(100000012,'Lizzie','Mcfate','LMcfate@uwindsor.ca','Chemistry',47.56,'CH');
insert into student values(100000013,'Verda','Carrales','VCarrales@uwindsor.ca','Business',59.33,'BU');
insert into student values(100000014,'Shiela','Heber','SHeber@uwindsor.ca','Chemistry',39.67,'CH');
insert into student values(100000015,'Elicia','Balas','EBalas@uwindsor.ca','Business',61.78,'BU');
insert into student values(100000016,'Tiffanie','Wiese','TWiese@uwindsor.ca','Chemistry',46.33,'CH');
insert into student values(100000017,'Monica','Hammaker','MHammaker@uwindsor.ca','Engineering',56.78,'EN');
insert into student values(100000018,'Hung','Clampitt','HClampitt@uwindsor.ca','Computer Science',57.44,'CS');
insert into student values(100000019,'Glennis','Royston','GRoyston@uwindsor.ca','Engineering',59.89,'EN');
insert into student values(100000020,'Hassan','Hamann','HHamann@uwindsor.ca','Chemistry',54.78,'CH');
insert into student values(100000021,'Carman','Hillwig','CHillwig@uwindsor.ca','Engineering',57.44,'EN');
insert into student values(100000022,'Briana','Streater','BStreater@uwindsor.ca','Business',40.78,'BU');
insert into student values(100000023,'Marcelene','Brophy','MBrophy@uwindsor.ca','Computer Science',52.11,'CS');
insert into student values(100000024,'Liane','Vaquera','LVaquera@uwindsor.ca','Chemistry',55.89,'CH');
insert into student values(100000025,'Ching','Bigler','CBigler@uwindsor.ca','Chemistry',60.33,'CH');
insert into student values(100000026,'Lincoln','Engberg','LEngberg@uwindsor.ca','Engineering',55.7,'EN');
insert into student values(100000027,'Victor','Conners','VConners@uwindsor.ca','Computer Science',62.78,'CS');
insert into student values(100000028,'Vada','Myron','VMyron@uwindsor.ca','Business',56.2,'BU');
insert into student values(100000029,'Risa','Hazen','RHazen@uwindsor.ca','Business',59.89,'BU');
insert into student values(100000030,'Blondell','Decarlo','BDecarlo@uwindsor.ca','Business',59.78,'BU');
insert into student values(100000031,'Debby','Efird','DEfird@uwindsor.ca','Business',50.78,'BU');
insert into student values(100000032,'Josef','Deeb','JDeeb@uwindsor.ca','Computer Science',49.78,'CS');
insert into student values(100000033,'Shannan','Pasley','SPasley@uwindsor.ca','Chemistry',63.22,'CH');
insert into student values(100000034,'Rickey','Koury','RKoury@uwindsor.ca','Business',51.7,'BU');
insert into student values(100000035,'Alvina','Kabel','AKabel@uwindsor.ca','Engineering',64.78,'EN');
insert into student values(100000036,'Mellie','Barlowe','MBarlowe@uwindsor.ca','Business',54.89,'BU');
insert into student values(100000037,'Jerry','Calley','JCalley@uwindsor.ca','Engineering',61.1,'EN');
insert into student values(100000038,'Vicente','Kearns','VKearns@uwindsor.ca','Chemistry',47.0,'CH');
insert into student values(100000039,'Vance','Bialek','VBialek@uwindsor.ca','Chemistry',66.0,'CH');
insert into student values(100000040,'Rufina','Wiggs','RWiggs@uwindsor.ca','Business',58.3,'BU');
insert into student values(100000041,'Cristy','Lis','CLis@uwindsor.ca','Chemistry',61.56,'CH');
insert into student values(100000042,'Sergio','Pocock','SPocock@uwindsor.ca','Engineering',66.0,'EN');
insert into student values(100000043,'Eulah','Zemlicka','EZemlicka@uwindsor.ca','Engineering',51.89,'EN');
insert into student values(100000044,'Millie','Davy','MDavy@uwindsor.ca','Chemistry',63.2,'CH');
insert into student values(100000045,'Herlinda','Kreger','HKreger@uwindsor.ca','Computer Science',63.67,'CS');
insert into student values(100000046,'Roselyn','Mcquaid','RMcquaid@uwindsor.ca','Business',69.3,'BU');
insert into student values(100000047,'Gabriele','Villagran','GVillagran@uwindsor.ca','Business',55.33,'BU');
insert into student values(100000048,'Emogene','Morain','EMorain@uwindsor.ca','Business',62.56,'BU');
insert into student values(100000049,'Mildred','Bulli','MBulli@uwindsor.ca','Computer Science',50.78,'CS');

INSERT INTO PROFESSOR VALUES (9001, 'BOBBY', 'JEAN', 'BJEAN@UWINDSOR.CA', 'CS');
INSERT INTO PROFESSOR VALUES (9002, 'CLAIRE', 'BAKER', 'CBAKER@UWINDSOR.CA', 'CS');
INSERT INTO PROFESSOR VALUES (9003, 'HAROLD', 'BEAUMONT', 'HBEAUMONT@UWINDSOR.CA', 'CH');
INSERT INTO PROFESSOR VALUES (9004, 'KATIE', 'SMITH', 'KSMITH@UWINDSOR.CA', 'CH');
INSERT INTO PROFESSOR VALUES (9005, 'BRANDON', 'BROWN', 'BBROWN@UWINDSOR.CA', 'BU');
INSERT INTO PROFESSOR VALUES (9006, 'WILLIAM', 'DAVIS', 'WDAVIS@UWINDSOR.CA', 'EN');

INSERT INTO COURSE VALUES ('COMP1050', 'INTRO TO PROGRAMMING', 'DESCRIPTION OF COMP1050', 'CS');
INSERT INTO COURSE VALUES ('COMP2080', 'OOP USING JAVA', 'DESCRIPTION OF COMP2080', 'CS');
INSERT INTO COURSE VALUES ('COMP2260', 'DATABASE MANAGEMENT SYSTEMS', 'DESCRIPTION OF COMP2260', 'CS');
INSERT INTO COURSE VALUES ('CHEM3470', 'SPECTROSCOPIC STRUCTURE IDENTIFICATION', 'DESCRIPTION OF CHEM3470', 'CH');
INSERT INTO COURSE VALUES ('CHEM3801', 'PRINCIPLES OF INSTRUMENTAL ANALYSIS', 'DESCRIPTION OF CHEM3810', 'CH');
INSERT INTO COURSE VALUES ('CHEM4540', 'BIO AND SUSTAINABLE MATERIALS', 'DESCRIPTION OF CHEM4540', 'CH');
INSERT INTO COURSE VALUES ('BUSS4540', 'BUSINESS MANAGEMENT', 'DESCRIPTION OF BUSS4540', 'BU');
INSERT INTO COURSE VALUES ('BUSS2500', 'ECONOMICS I', 'DESCRIPTION OF BUSS2500', 'BU');
INSERT INTO COURSE VALUES ('BUSS1000', 'ECONOMICS II', 'DESCRIPTION OF BUSS1000', 'BU');
INSERT INTO COURSE VALUES ('ENGI4540', 'MECHANICS I', 'DESCRIPTION OF ENGI4540', 'EN');
INSERT INTO COURSE VALUES ('ENGI3540', 'MECHANICS II', 'DESCRIPTION OF ENGI3540', 'EN');
INSERT INTO COURSE VALUES ('ENGI1000', 'ENGINEERING PRINCIPLES', 'DESCRIPTION OF ENGI1000', 'EN');

insert into section_records values(01,'3000','COMP1050',9003,202,2019,'S','Sunday','7:00pm','9:50pm');
insert into section_records values(02,'3001','COMP1050',9001,203,2019,'S','Saturday','11:30am','12:50pm');
insert into section_records values(01,'3002','COMP2080',9005,202,2019,'F','Friday','2:30pm','3:50pm');
insert into section_records values(02,'3003','COMP2080',9002,202,2019,'F','Saturday','4:00pm','5:20pm');
insert into section_records values(01,'3004','COMP2260',9003,103,2014,'W','Sunday','5:30pm','6:50pm');
insert into section_records values(02,'3005','COMP2260',9005,103,2014,'W','Thursday','2:30pm','3:50pm');
insert into section_records values(01,'3006','CHEM3470',9005,103,2019,'S','Tuesday','7:00pm','9:50pm');
insert into section_records values(02,'3007','CHEM3470',9002,102,2019,'S','Saturday','4:00pm','5:20pm');
insert into section_records values(01,'3008','CHEM3801',9003,101,2011,'W','Sunday','1:00pm','2:20pm');
insert into section_records values(02,'3009','CHEM3801',9004,203,2011,'W','Tuesday','1:00pm','2:20pm');
insert into section_records values(01,'3010','CHEM4540',9004,202,2018,'W','Sunday','7:00pm','9:50pm');
insert into section_records values(02,'3011','CHEM4540',9003,202,2018,'W','Friday','1:00pm','2:20pm');
insert into section_records values(01,'3012','BUSS4540',9006,203,2015,'S','Friday','4:00pm','5:20pm');
insert into section_records values(02,'3013','BUSS4540',9004,202,2015,'S','Monday','5:30pm','6:50pm');
insert into section_records values(01,'3014','BUSS2500',9001,102,2019,'S','Wednesday','1:00pm','2:20pm');
insert into section_records values(02,'3015','BUSS2500',9003,103,2019,'S','Saturday','1:00pm','2:20pm');
insert into section_records values(01,'3016','BUSS1000',9006,103,2014,'S','Sunday','5:30pm','6:50pm');
insert into section_records values(02,'3017','BUSS1000',9003,102,2014,'S','Thursday','5:30pm','6:50pm');
insert into section_records values(01,'3018','ENGI4540',9005,203,2018,'F','Monday','8:30am','9:50am');
insert into section_records values(02,'3019','ENGI4540',9001,101,2018,'F','Sunday','1:00pm','2:20pm');
insert into section_records values(01,'3020','ENGI3540',9001,103,2013,'S','Friday','11:30am','12:50pm');
insert into section_records values(02,'3021','ENGI3540',9005,202,2013,'S','Friday','10:00am','11:20am');
insert into section_records values(01,'3022','ENGI1000',9003,102,2015,'F','Tuesday','10:00am','11:20am');
insert into section_records values(02,'3023','ENGI1000',9001,202,2015,'F','Friday','8:30am','9:50am');

insert into student_records values(1000,100000000,'3010',14,'FAIL','2018','W');
insert into student_records values(1001,100000000,'3016',30,'FAIL','2014','S');
insert into student_records values(1002,100000000,'3002',0,'IP','2019','F');
insert into student_records values(1003,100000000,'3000',98,'PASS','2019','S');
insert into student_records values(1004,100000000,'3012',76,'PASS','2015','S');
insert into student_records values(1005,100000000,'3008',97,'PASS','2011','W');
insert into student_records values(1006,100000000,'3023',96,'PASS','2015','F');
insert into student_records values(1007,100000000,'3018',81,'PASS','2018','F');
insert into student_records values(1008,100000000,'3020',99,'PASS','2013','S');
insert into student_records values(1009,100000000,'3015',79,'PASS','2019','S');
insert into student_records values(1010,100000001,'3010',90,'PASS','2018','W');
insert into student_records values(1011,100000001,'3003',0,'IP','2019','F');
insert into student_records values(1012,100000001,'3015',53,'PASS','2019','S');
insert into student_records values(1013,100000001,'3013',56,'PASS','2015','S');
insert into student_records values(1014,100000001,'3009',81,'PASS','2011','W');
insert into student_records values(1015,100000001,'3018',15,'FAIL','2018','F');
insert into student_records values(1016,100000001,'3020',78,'PASS','2013','S');
insert into student_records values(1017,100000001,'3022',85,'PASS','2015','F');
insert into student_records values(1018,100000001,'3016',22,'FAIL','2014','S');
insert into student_records values(1019,100000001,'3005',95,'PASS','2014','W');
insert into student_records values(1020,100000002,'3011',98,'PASS','2018','W');
insert into student_records values(1021,100000002,'3021',91,'PASS','2013','S');
insert into student_records values(1022,100000002,'3007',46,'FAIL','2019','S');
insert into student_records values(1023,100000002,'3000',91,'PASS','2019','S');
insert into student_records values(1024,100000002,'3002',0,'IP','2019','F');
insert into student_records values(1025,100000002,'3008',25,'FAIL','2011','W');
insert into student_records values(1026,100000002,'3022',80,'PASS','2015','F');
insert into student_records values(1027,100000002,'3015',39,'FAIL','2019','S');
insert into student_records values(1028,100000002,'3012',91,'PASS','2015','S');
insert into student_records values(1029,100000002,'3017',20,'FAIL','2014','S');
insert into student_records values(1030,100000003,'3001',10,'FAIL','2019','S');
insert into student_records values(1031,100000003,'3012',39,'FAIL','2015','S');
insert into student_records values(1032,100000003,'3015',13,'FAIL','2019','S');
insert into student_records values(1033,100000003,'3005',48,'FAIL','2014','W');
insert into student_records values(1034,100000003,'3010',96,'PASS','2018','W');
insert into student_records values(1035,100000003,'3003',0,'IP','2019','F');
insert into student_records values(1036,100000003,'3008',52,'PASS','2011','W');
insert into student_records values(1037,100000003,'3017',99,'PASS','2014','S');
insert into student_records values(1038,100000003,'3018',73,'PASS','2018','F');
insert into student_records values(1039,100000003,'3022',21,'FAIL','2015','F');
insert into student_records values(1040,100000004,'3001',99,'PASS','2019','S');
insert into student_records values(1041,100000004,'3013',58,'PASS','2015','S');
insert into student_records values(1042,100000004,'3018',15,'FAIL','2018','F');
insert into student_records values(1043,100000004,'3023',75,'PASS','2015','F');
insert into student_records values(1044,100000004,'3004',89,'PASS','2014','W');
insert into student_records values(1045,100000004,'3006',32,'FAIL','2019','S');
insert into student_records values(1046,100000004,'3021',28,'FAIL','2013','S');
insert into student_records values(1047,100000004,'3011',91,'PASS','2018','W');
insert into student_records values(1048,100000004,'3015',24,'FAIL','2019','S');
insert into student_records values(1049,100000004,'3009',34,'FAIL','2011','W');
insert into student_records values(1050,100000005,'3007',75,'PASS','2019','S');
insert into student_records values(1051,100000005,'3008',52,'PASS','2011','W');
insert into student_records values(1052,100000005,'3001',77,'PASS','2019','S');
insert into student_records values(1053,100000005,'3017',14,'FAIL','2014','S');
insert into student_records values(1054,100000005,'3005',20,'FAIL','2014','W');
insert into student_records values(1055,100000005,'3003',0,'IP','2019','F');
insert into student_records values(1056,100000005,'3018',58,'PASS','2018','F');
insert into student_records values(1057,100000005,'3022',92,'PASS','2015','F');
insert into student_records values(1058,100000005,'3015',54,'PASS','2019','S');
insert into student_records values(1059,100000005,'3013',66,'PASS','2015','S');
insert into student_records values(1060,100000006,'3005',15,'FAIL','2014','W');
insert into student_records values(1061,100000006,'3023',78,'PASS','2015','F');
insert into student_records values(1062,100000006,'3003',0,'IP','2019','F');
insert into student_records values(1063,100000006,'3016',19,'FAIL','2014','S');
insert into student_records values(1064,100000006,'3006',93,'PASS','2019','S');
insert into student_records values(1065,100000006,'3008',35,'FAIL','2011','W');
insert into student_records values(1066,100000006,'3018',42,'FAIL','2018','F');
insert into student_records values(1067,100000006,'3021',97,'PASS','2013','S');
insert into student_records values(1068,100000006,'3012',51,'PASS','2015','S');
insert into student_records values(1069,100000006,'3010',48,'FAIL','2018','W');
insert into student_records values(1070,100000007,'3000',18,'FAIL','2019','S');
insert into student_records values(1071,100000007,'3003',0,'IP','2019','F');
insert into student_records values(1072,100000007,'3017',39,'FAIL','2014','S');
insert into student_records values(1073,100000007,'3018',79,'PASS','2018','F');
insert into student_records values(1074,100000007,'3022',10,'FAIL','2015','F');
insert into student_records values(1075,100000007,'3006',21,'FAIL','2019','S');
insert into student_records values(1076,100000007,'3020',12,'FAIL','2013','S');
insert into student_records values(1077,100000007,'3010',90,'PASS','2018','W');
insert into student_records values(1078,100000007,'3009',41,'FAIL','2011','W');
insert into student_records values(1079,100000007,'3005',95,'PASS','2014','W');
insert into student_records values(1080,100000008,'3000',48,'FAIL','2019','S');
insert into student_records values(1081,100000008,'3010',97,'PASS','2018','W');
insert into student_records values(1082,100000008,'3007',81,'PASS','2019','S');
insert into student_records values(1083,100000008,'3002',0,'IP','2019','F');
insert into student_records values(1084,100000008,'3004',20,'FAIL','2014','W');
insert into student_records values(1085,100000008,'3021',22,'FAIL','2013','S');
insert into student_records values(1086,100000008,'3009',40,'FAIL','2011','W');
insert into student_records values(1087,100000008,'3015',37,'FAIL','2019','S');
insert into student_records values(1088,100000008,'3019',42,'FAIL','2018','F');
insert into student_records values(1089,100000008,'3017',88,'PASS','2014','S');
insert into student_records values(1090,100000009,'3017',62,'PASS','2014','S');
insert into student_records values(1091,100000009,'3014',10,'FAIL','2019','S');
insert into student_records values(1092,100000009,'3000',46,'FAIL','2019','S');
insert into student_records values(1093,100000009,'3003',0,'IP','2019','F');
insert into student_records values(1094,100000009,'3012',18,'FAIL','2015','S');
insert into student_records values(1095,100000009,'3010',32,'FAIL','2018','W');
insert into student_records values(1096,100000009,'3008',27,'FAIL','2011','W');
insert into student_records values(1097,100000009,'3018',68,'PASS','2018','F');
insert into student_records values(1098,100000009,'3005',81,'PASS','2014','W');
insert into student_records values(1099,100000009,'3020',17,'FAIL','2013','S');
insert into student_records values(1100,100000010,'3013',17,'FAIL','2015','S');
insert into student_records values(1101,100000010,'3014',29,'FAIL','2019','S');
insert into student_records values(1102,100000010,'3021',61,'PASS','2013','S');
insert into student_records values(1103,100000010,'3007',55,'PASS','2019','S');
insert into student_records values(1104,100000010,'3004',18,'FAIL','2014','W');
insert into student_records values(1105,100000010,'3019',82,'PASS','2018','F');
insert into student_records values(1106,100000010,'3003',0,'IP','2019','F');
insert into student_records values(1107,100000010,'3008',40,'FAIL','2011','W');
insert into student_records values(1108,100000010,'3017',42,'FAIL','2014','S');
insert into student_records values(1109,100000010,'3022',45,'FAIL','2015','F');
insert into student_records values(1110,100000011,'3015',64,'PASS','2019','S');
insert into student_records values(1111,100000011,'3006',79,'PASS','2019','S');
insert into student_records values(1112,100000011,'3023',93,'PASS','2015','F');
insert into student_records values(1113,100000011,'3016',83,'PASS','2014','S');
insert into student_records values(1114,100000011,'3000',40,'FAIL','2019','S');
insert into student_records values(1115,100000011,'3002',0,'IP','2019','F');
insert into student_records values(1116,100000011,'3020',79,'PASS','2013','S');
insert into student_records values(1117,100000011,'3005',51,'PASS','2014','W');
insert into student_records values(1118,100000011,'3012',16,'FAIL','2015','S');
insert into student_records values(1119,100000011,'3018',97,'PASS','2018','F');
insert into student_records values(1120,100000012,'3019',53,'PASS','2018','F');
insert into student_records values(1121,100000012,'3016',19,'FAIL','2014','S');
insert into student_records values(1122,100000012,'3003',0,'IP','2019','F');
insert into student_records values(1123,100000012,'3015',15,'FAIL','2019','S');
insert into student_records values(1124,100000012,'3008',39,'FAIL','2011','W');
insert into student_records values(1125,100000012,'3020',35,'FAIL','2013','S');
insert into student_records values(1126,100000012,'3011',73,'PASS','2018','W');
insert into student_records values(1127,100000012,'3001',75,'PASS','2019','S');
insert into student_records values(1128,100000012,'3006',98,'PASS','2019','S');
insert into student_records values(1129,100000012,'3013',21,'FAIL','2015','S');
insert into student_records values(1130,100000013,'3016',76,'PASS','2014','S');
insert into student_records values(1131,100000013,'3012',84,'PASS','2015','S');
insert into student_records values(1132,100000013,'3018',88,'PASS','2018','F');
insert into student_records values(1133,100000013,'3008',11,'FAIL','2011','W');
insert into student_records values(1134,100000013,'3003',0,'IP','2019','F');
insert into student_records values(1135,100000013,'3021',49,'FAIL','2013','S');
insert into student_records values(1136,100000013,'3004',83,'PASS','2014','W');
insert into student_records values(1137,100000013,'3011',94,'PASS','2018','W');
insert into student_records values(1138,100000013,'3014',39,'FAIL','2019','S');
insert into student_records values(1139,100000013,'3001',10,'FAIL','2019','S');
insert into student_records values(1140,100000014,'3009',35,'FAIL','2011','W');
insert into student_records values(1141,100000014,'3007',17,'FAIL','2019','S');
insert into student_records values(1142,100000014,'3017',31,'FAIL','2014','S');
insert into student_records values(1143,100000014,'3002',0,'IP','2019','F');
insert into student_records values(1144,100000014,'3011',31,'FAIL','2018','W');
insert into student_records values(1145,100000014,'3004',37,'FAIL','2014','W');
insert into student_records values(1146,100000014,'3023',98,'PASS','2015','F');
insert into student_records values(1147,100000014,'3020',24,'FAIL','2013','S');
insert into student_records values(1148,100000014,'3012',23,'FAIL','2015','S');
insert into student_records values(1149,100000014,'3001',61,'PASS','2019','S');
insert into student_records values(1150,100000015,'3015',37,'FAIL','2019','S');
insert into student_records values(1151,100000015,'3000',64,'PASS','2019','S');
insert into student_records values(1152,100000015,'3005',95,'PASS','2014','W');
insert into student_records values(1153,100000015,'3013',58,'PASS','2015','S');
insert into student_records values(1154,100000015,'3010',51,'PASS','2018','W');
insert into student_records values(1155,100000015,'3017',68,'PASS','2014','S');
insert into student_records values(1156,100000015,'3003',0,'IP','2019','F');
insert into student_records values(1157,100000015,'3019',83,'PASS','2018','F');
insert into student_records values(1158,100000015,'3006',77,'PASS','2019','S');
insert into student_records values(1159,100000015,'3020',23,'FAIL','2013','S');
insert into student_records values(1160,100000016,'3011',19,'FAIL','2018','W');
insert into student_records values(1161,100000016,'3019',90,'PASS','2018','F');
insert into student_records values(1162,100000016,'3001',53,'PASS','2019','S');
insert into student_records values(1163,100000016,'3016',41,'FAIL','2014','S');
insert into student_records values(1164,100000016,'3004',17,'FAIL','2014','W');
insert into student_records values(1165,100000016,'3006',31,'FAIL','2019','S');
insert into student_records values(1166,100000016,'3002',0,'IP','2019','F');
insert into student_records values(1167,100000016,'3013',24,'FAIL','2015','S');
insert into student_records values(1168,100000016,'3023',85,'PASS','2015','F');
insert into student_records values(1169,100000016,'3015',57,'PASS','2019','S');
insert into student_records values(1170,100000017,'3021',64,'PASS','2013','S');
insert into student_records values(1171,100000017,'3004',87,'PASS','2014','W');
insert into student_records values(1172,100000017,'3014',28,'FAIL','2019','S');
insert into student_records values(1173,100000017,'3003',0,'IP','2019','F');
insert into student_records values(1174,100000017,'3008',91,'PASS','2011','W');
insert into student_records values(1175,100000017,'3006',62,'PASS','2019','S');
insert into student_records values(1176,100000017,'3016',68,'PASS','2014','S');
insert into student_records values(1177,100000017,'3012',26,'FAIL','2015','S');
insert into student_records values(1178,100000017,'3001',34,'FAIL','2019','S');
insert into student_records values(1179,100000017,'3010',51,'PASS','2018','W');
insert into student_records values(1180,100000018,'3013',49,'FAIL','2015','S');
insert into student_records values(1181,100000018,'3010',91,'PASS','2018','W');
insert into student_records values(1182,100000018,'3009',75,'PASS','2011','W');
insert into student_records values(1183,100000018,'3004',70,'PASS','2014','W');
insert into student_records values(1184,100000018,'3000',67,'PASS','2019','S');
insert into student_records values(1185,100000018,'3007',36,'FAIL','2019','S');
insert into student_records values(1186,100000018,'3002',0,'IP','2019','F');
insert into student_records values(1187,100000018,'3014',23,'FAIL','2019','S');
insert into student_records values(1188,100000018,'3020',47,'FAIL','2013','S');
insert into student_records values(1189,100000018,'3016',59,'PASS','2014','S');
insert into student_records values(1190,100000019,'3004',22,'FAIL','2014','W');
insert into student_records values(1191,100000019,'3007',50,'PASS','2019','S');
insert into student_records values(1192,100000019,'3015',38,'FAIL','2019','S');
insert into student_records values(1193,100000019,'3003',0,'IP','2019','F');
insert into student_records values(1194,100000019,'3021',52,'PASS','2013','S');
insert into student_records values(1195,100000019,'3013',91,'PASS','2015','S');
insert into student_records values(1196,100000019,'3022',61,'PASS','2015','F');
insert into student_records values(1197,100000019,'3018',93,'PASS','2018','F');
insert into student_records values(1198,100000019,'3001',57,'PASS','2019','S');
insert into student_records values(1199,100000019,'3011',75,'PASS','2018','W');
insert into student_records values(1200,100000020,'3018',85,'PASS','2018','F');
insert into student_records values(1201,100000020,'3011',38,'FAIL','2018','W');
insert into student_records values(1202,100000020,'3021',72,'PASS','2013','S');
insert into student_records values(1203,100000020,'3013',27,'FAIL','2015','S');
insert into student_records values(1204,100000020,'3009',34,'FAIL','2011','W');
insert into student_records values(1205,100000020,'3022',98,'PASS','2015','F');
insert into student_records values(1206,100000020,'3003',0,'IP','2019','F');
insert into student_records values(1207,100000020,'3016',62,'PASS','2014','S');
insert into student_records values(1208,100000020,'3001',57,'PASS','2019','S');
insert into student_records values(1209,100000020,'3014',20,'FAIL','2019','S');
insert into student_records values(1210,100000021,'3005',37,'FAIL','2014','W');
insert into student_records values(1211,100000021,'3013',46,'FAIL','2015','S');
insert into student_records values(1212,100000021,'3017',65,'PASS','2014','S');
insert into student_records values(1213,100000021,'3009',98,'PASS','2011','W');
insert into student_records values(1214,100000021,'3022',73,'PASS','2015','F');
insert into student_records values(1215,100000021,'3018',44,'FAIL','2018','F');
insert into student_records values(1216,100000021,'3010',38,'FAIL','2018','W');
insert into student_records values(1217,100000021,'3003',0,'IP','2019','F');
insert into student_records values(1218,100000021,'3014',38,'FAIL','2019','S');
insert into student_records values(1219,100000021,'3020',78,'PASS','2013','S');
insert into student_records values(1220,100000022,'3008',12,'FAIL','2011','W');
insert into student_records values(1221,100000022,'3013',46,'FAIL','2015','S');
insert into student_records values(1222,100000022,'3004',15,'FAIL','2014','W');
insert into student_records values(1223,100000022,'3006',95,'PASS','2019','S');
insert into student_records values(1224,100000022,'3011',13,'FAIL','2018','W');
insert into student_records values(1225,100000022,'3021',62,'PASS','2013','S');
insert into student_records values(1226,100000022,'3014',66,'PASS','2019','S');
insert into student_records values(1227,100000022,'3023',17,'FAIL','2015','F');
insert into student_records values(1228,100000022,'3003',0,'IP','2019','F');
insert into student_records values(1229,100000022,'3017',41,'FAIL','2014','S');
insert into student_records values(1230,100000023,'3002',0,'IP','2019','F');
insert into student_records values(1231,100000023,'3001',22,'FAIL','2019','S');
insert into student_records values(1232,100000023,'3015',75,'PASS','2019','S');
insert into student_records values(1233,100000023,'3007',48,'FAIL','2019','S');
insert into student_records values(1234,100000023,'3020',73,'PASS','2013','S');
insert into student_records values(1235,100000023,'3005',11,'FAIL','2014','W');
insert into student_records values(1236,100000023,'3022',93,'PASS','2015','F');
insert into student_records values(1237,100000023,'3016',25,'FAIL','2014','S');
insert into student_records values(1238,100000023,'3018',40,'FAIL','2018','F');
insert into student_records values(1239,100000023,'3008',82,'PASS','2011','W');
insert into student_records values(1240,100000024,'3004',14,'FAIL','2014','W');
insert into student_records values(1241,100000024,'3002',0,'IP','2019','F');
insert into student_records values(1242,100000024,'3011',37,'FAIL','2018','W');
insert into student_records values(1243,100000024,'3001',87,'PASS','2019','S');
insert into student_records values(1244,100000024,'3019',17,'FAIL','2018','F');
insert into student_records values(1245,100000024,'3021',70,'PASS','2013','S');
insert into student_records values(1246,100000024,'3007',97,'PASS','2019','S');
insert into student_records values(1247,100000024,'3008',96,'PASS','2011','W');
insert into student_records values(1248,100000024,'3016',22,'FAIL','2014','S');
insert into student_records values(1249,100000024,'3012',63,'PASS','2015','S');
insert into student_records values(1250,100000025,'3019',76,'PASS','2018','F');
insert into student_records values(1251,100000025,'3015',49,'FAIL','2019','S');
insert into student_records values(1252,100000025,'3012',58,'PASS','2015','S');
insert into student_records values(1253,100000025,'3020',57,'PASS','2013','S');
insert into student_records values(1254,100000025,'3008',88,'PASS','2011','W');
insert into student_records values(1255,100000025,'3004',98,'PASS','2014','W');
insert into student_records values(1256,100000025,'3007',57,'PASS','2019','S');
insert into student_records values(1257,100000025,'3003',0,'IP','2019','F');
insert into student_records values(1258,100000025,'3010',21,'FAIL','2018','W');
insert into student_records values(1259,100000025,'3017',39,'FAIL','2014','S');
insert into student_records values(1260,100000026,'3013',77,'PASS','2015','S');
insert into student_records values(1261,100000026,'3000',63,'PASS','2019','S');
insert into student_records values(1262,100000026,'3005',86,'PASS','2014','W');
insert into student_records values(1263,100000026,'3017',39,'FAIL','2014','S');
insert into student_records values(1264,100000026,'3010',67,'PASS','2018','W');
insert into student_records values(1265,100000026,'3019',15,'FAIL','2018','F');
insert into student_records values(1266,100000026,'3006',46,'FAIL','2019','S');
insert into student_records values(1267,100000026,'3014',18,'FAIL','2019','S');
insert into student_records values(1268,100000026,'3023',59,'PASS','2015','F');
insert into student_records values(1269,100000026,'3008',87,'PASS','2011','W');
insert into student_records values(1270,100000027,'3012',60,'PASS','2015','S');
insert into student_records values(1271,100000027,'3016',62,'PASS','2014','S');
insert into student_records values(1272,100000027,'3001',65,'PASS','2019','S');
insert into student_records values(1273,100000027,'3010',35,'FAIL','2018','W');
insert into student_records values(1274,100000027,'3020',91,'PASS','2013','S');
insert into student_records values(1275,100000027,'3009',96,'PASS','2011','W');
insert into student_records values(1276,100000027,'3022',77,'PASS','2015','F');
insert into student_records values(1277,100000027,'3006',25,'FAIL','2019','S');
insert into student_records values(1278,100000027,'3004',54,'PASS','2014','W');
insert into student_records values(1279,100000027,'3003',0,'IP','2019','F');
insert into student_records values(1280,100000028,'3010',38,'FAIL','2018','W');
insert into student_records values(1281,100000028,'3022',88,'PASS','2015','F');
insert into student_records values(1282,100000028,'3013',29,'FAIL','2015','S');
insert into student_records values(1283,100000028,'3000',70,'PASS','2019','S');
insert into student_records values(1284,100000028,'3004',94,'PASS','2014','W');
insert into student_records values(1285,100000028,'3018',41,'FAIL','2018','F');
insert into student_records values(1286,100000028,'3014',14,'FAIL','2019','S');
insert into student_records values(1287,100000028,'3016',22,'FAIL','2014','S');
insert into student_records values(1288,100000028,'3021',83,'PASS','2013','S');
insert into student_records values(1289,100000028,'3007',83,'PASS','2019','S');
insert into student_records values(1290,100000029,'3018',34,'FAIL','2018','F');
insert into student_records values(1291,100000029,'3002',0,'IP','2019','F');
insert into student_records values(1292,100000029,'3004',42,'FAIL','2014','W');
insert into student_records values(1293,100000029,'3007',33,'FAIL','2019','S');
insert into student_records values(1294,100000029,'3011',78,'PASS','2018','W');
insert into student_records values(1295,100000029,'3014',58,'PASS','2019','S');
insert into student_records values(1296,100000029,'3008',30,'FAIL','2011','W');
insert into student_records values(1297,100000029,'3001',98,'PASS','2019','S');
insert into student_records values(1298,100000029,'3022',90,'PASS','2015','F');
insert into student_records values(1299,100000029,'3020',76,'PASS','2013','S');
insert into student_records values(1300,100000030,'3002',0,'IP','2019','F');
insert into student_records values(1301,100000030,'3021',78,'PASS','2013','S');
insert into student_records values(1302,100000030,'3018',77,'PASS','2018','F');
insert into student_records values(1303,100000030,'3023',82,'PASS','2015','F');
insert into student_records values(1304,100000030,'3013',24,'FAIL','2015','S');
insert into student_records values(1305,100000030,'3011',40,'FAIL','2018','W');
insert into student_records values(1306,100000030,'3007',55,'PASS','2019','S');
insert into student_records values(1307,100000030,'3000',45,'FAIL','2019','S');
insert into student_records values(1308,100000030,'3008',57,'PASS','2011','W');
insert into student_records values(1309,100000030,'3005',80,'PASS','2014','W');
insert into student_records values(1310,100000031,'3015',28,'FAIL','2019','S');
insert into student_records values(1311,100000031,'3004',29,'FAIL','2014','W');
insert into student_records values(1312,100000031,'3010',36,'FAIL','2018','W');
insert into student_records values(1313,100000031,'3001',21,'FAIL','2019','S');
insert into student_records values(1314,100000031,'3019',70,'PASS','2018','F');
insert into student_records values(1315,100000031,'3008',32,'FAIL','2011','W');
insert into student_records values(1316,100000031,'3021',94,'PASS','2013','S');
insert into student_records values(1317,100000031,'3003',0,'IP','2019','F');
insert into student_records values(1318,100000031,'3006',50,'PASS','2019','S');
insert into student_records values(1319,100000031,'3023',97,'PASS','2015','F');
insert into student_records values(1320,100000032,'3003',0,'IP','2019','F');
insert into student_records values(1321,100000032,'3020',69,'PASS','2013','S');
insert into student_records values(1322,100000032,'3000',14,'FAIL','2019','S');
insert into student_records values(1323,100000032,'3013',45,'FAIL','2015','S');
insert into student_records values(1324,100000032,'3019',31,'FAIL','2018','F');
insert into student_records values(1325,100000032,'3007',72,'PASS','2019','S');
insert into student_records values(1326,100000032,'3023',31,'FAIL','2015','F');
insert into student_records values(1327,100000032,'3017',91,'PASS','2014','S');
insert into student_records values(1328,100000032,'3004',65,'PASS','2014','W');
insert into student_records values(1329,100000032,'3011',30,'FAIL','2018','W');
insert into student_records values(1330,100000033,'3002',0,'IP','2019','F');
insert into student_records values(1331,100000033,'3001',89,'PASS','2019','S');
insert into student_records values(1332,100000033,'3017',86,'PASS','2014','S');
insert into student_records values(1333,100000033,'3008',27,'FAIL','2011','W');
insert into student_records values(1334,100000033,'3022',37,'FAIL','2015','F');
insert into student_records values(1335,100000033,'3014',87,'PASS','2019','S');
insert into student_records values(1336,100000033,'3012',23,'FAIL','2015','S');
insert into student_records values(1337,100000033,'3021',50,'PASS','2013','S');
insert into student_records values(1338,100000033,'3010',86,'PASS','2018','W');
insert into student_records values(1339,100000033,'3018',84,'PASS','2018','F');
insert into student_records values(1340,100000034,'3016',59,'PASS','2014','S');
insert into student_records values(1341,100000034,'3006',62,'PASS','2019','S');
insert into student_records values(1342,100000034,'3004',94,'PASS','2014','W');
insert into student_records values(1343,100000034,'3015',20,'FAIL','2019','S');
insert into student_records values(1344,100000034,'3009',98,'PASS','2011','W');
insert into student_records values(1345,100000034,'3020',16,'FAIL','2013','S');
insert into student_records values(1346,100000034,'3000',23,'FAIL','2019','S');
insert into student_records values(1347,100000034,'3022',72,'PASS','2015','F');
insert into student_records values(1348,100000034,'3018',16,'FAIL','2018','F');
insert into student_records values(1349,100000034,'3013',57,'PASS','2015','S');
insert into student_records values(1350,100000035,'3015',26,'FAIL','2019','S');
insert into student_records values(1351,100000035,'3008',76,'PASS','2011','W');
insert into student_records values(1352,100000035,'3005',84,'PASS','2014','W');
insert into student_records values(1353,100000035,'3018',65,'PASS','2018','F');
insert into student_records values(1354,100000035,'3001',99,'PASS','2019','S');
insert into student_records values(1355,100000035,'3011',76,'PASS','2018','W');
insert into student_records values(1356,100000035,'3003',0,'IP','2019','F');
insert into student_records values(1357,100000035,'3020',63,'PASS','2013','S');
insert into student_records values(1358,100000035,'3016',11,'FAIL','2014','S');
insert into student_records values(1359,100000035,'3013',83,'PASS','2015','S');
insert into student_records values(1360,100000036,'3006',46,'FAIL','2019','S');
insert into student_records values(1361,100000036,'3016',82,'PASS','2014','S');
insert into student_records values(1362,100000036,'3022',47,'FAIL','2015','F');
insert into student_records values(1363,100000036,'3014',45,'FAIL','2019','S');
insert into student_records values(1364,100000036,'3010',88,'PASS','2018','W');
insert into student_records values(1365,100000036,'3021',53,'PASS','2013','S');
insert into student_records values(1366,100000036,'3001',60,'PASS','2019','S');
insert into student_records values(1367,100000036,'3012',60,'PASS','2015','S');
insert into student_records values(1368,100000036,'3003',0,'IP','2019','F');
insert into student_records values(1369,100000036,'3005',13,'FAIL','2014','W');
insert into student_records values(1370,100000037,'3021',22,'FAIL','2013','S');
insert into student_records values(1371,100000037,'3013',77,'PASS','2015','S');
insert into student_records values(1372,100000037,'3019',63,'PASS','2018','F');
insert into student_records values(1373,100000037,'3009',92,'PASS','2011','W');
insert into student_records values(1374,100000037,'3015',79,'PASS','2019','S');
insert into student_records values(1375,100000037,'3011',61,'PASS','2018','W');
insert into student_records values(1376,100000037,'3006',93,'PASS','2019','S');
insert into student_records values(1377,100000037,'3004',42,'FAIL','2014','W');
insert into student_records values(1378,100000037,'3022',64,'PASS','2015','F');
insert into student_records values(1379,100000037,'3017',18,'FAIL','2014','S');
insert into student_records values(1380,100000038,'3014',20,'FAIL','2019','S');
insert into student_records values(1381,100000038,'3017',74,'PASS','2014','S');
insert into student_records values(1382,100000038,'3018',11,'FAIL','2018','F');
insert into student_records values(1383,100000038,'3000',19,'FAIL','2019','S');
insert into student_records values(1384,100000038,'3021',53,'PASS','2013','S');
insert into student_records values(1385,100000038,'3006',59,'PASS','2019','S');
insert into student_records values(1386,100000038,'3013',76,'PASS','2015','S');
insert into student_records values(1387,100000038,'3010',88,'PASS','2018','W');
insert into student_records values(1388,100000038,'3003',0,'IP','2019','F');
insert into student_records values(1389,100000038,'3008',23,'FAIL','2011','W');
insert into student_records values(1390,100000039,'3003',0,'IP','2019','F');
insert into student_records values(1391,100000039,'3012',50,'PASS','2015','S');
insert into student_records values(1392,100000039,'3008',78,'PASS','2011','W');
insert into student_records values(1393,100000039,'3016',85,'PASS','2014','S');
insert into student_records values(1394,100000039,'3015',91,'PASS','2019','S');
insert into student_records values(1395,100000039,'3007',76,'PASS','2019','S');
insert into student_records values(1396,100000039,'3020',61,'PASS','2013','S');
insert into student_records values(1397,100000039,'3004',21,'FAIL','2014','W');
insert into student_records values(1398,100000039,'3022',37,'FAIL','2015','F');
insert into student_records values(1399,100000039,'3011',95,'PASS','2018','W');
insert into student_records values(1400,100000040,'3019',54,'PASS','2018','F');
insert into student_records values(1401,100000040,'3007',88,'PASS','2019','S');
insert into student_records values(1402,100000040,'3009',92,'PASS','2011','W');
insert into student_records values(1403,100000040,'3001',88,'PASS','2019','S');
insert into student_records values(1404,100000040,'3014',48,'FAIL','2019','S');
insert into student_records values(1405,100000040,'3012',18,'FAIL','2015','S');
insert into student_records values(1406,100000040,'3020',77,'PASS','2013','S');
insert into student_records values(1407,100000040,'3023',56,'PASS','2015','F');
insert into student_records values(1408,100000040,'3017',25,'FAIL','2014','S');
insert into student_records values(1409,100000040,'3005',37,'FAIL','2014','W');
insert into student_records values(1410,100000041,'3022',76,'PASS','2015','F');
insert into student_records values(1411,100000041,'3008',63,'PASS','2011','W');
insert into student_records values(1412,100000041,'3016',45,'FAIL','2014','S');
insert into student_records values(1413,100000041,'3001',36,'FAIL','2019','S');
insert into student_records values(1414,100000041,'3019',71,'PASS','2018','F');
insert into student_records values(1415,100000041,'3020',78,'PASS','2013','S');
insert into student_records values(1416,100000041,'3006',82,'PASS','2019','S');
insert into student_records values(1417,100000041,'3011',16,'FAIL','2018','W');
insert into student_records values(1418,100000041,'3002',0,'IP','2019','F');
insert into student_records values(1419,100000041,'3015',87,'PASS','2019','S');
insert into student_records values(1420,100000042,'3003',0,'IP','2019','F');
insert into student_records values(1421,100000042,'3007',84,'PASS','2019','S');
insert into student_records values(1422,100000042,'3018',59,'PASS','2018','F');
insert into student_records values(1423,100000042,'3011',93,'PASS','2018','W');
insert into student_records values(1424,100000042,'3016',96,'PASS','2014','S');
insert into student_records values(1425,100000042,'3021',57,'PASS','2013','S');
insert into student_records values(1426,100000042,'3001',21,'FAIL','2019','S');
insert into student_records values(1427,100000042,'3012',25,'FAIL','2015','S');
insert into student_records values(1428,100000042,'3004',73,'PASS','2014','W');
insert into student_records values(1429,100000042,'3023',86,'PASS','2015','F');
insert into student_records values(1430,100000043,'3020',34,'FAIL','2013','S');
insert into student_records values(1431,100000043,'3012',23,'FAIL','2015','S');
insert into student_records values(1432,100000043,'3008',94,'PASS','2011','W');
insert into student_records values(1433,100000043,'3004',54,'PASS','2014','W');
insert into student_records values(1434,100000043,'3019',58,'PASS','2018','F');
insert into student_records values(1435,100000043,'3000',48,'FAIL','2019','S');
insert into student_records values(1436,100000043,'3014',38,'FAIL','2019','S');
insert into student_records values(1437,100000043,'3016',53,'PASS','2014','S');
insert into student_records values(1438,100000043,'3002',0,'IP','2019','F');
insert into student_records values(1439,100000043,'3010',65,'PASS','2018','W');
insert into student_records values(1440,100000044,'3014',28,'FAIL','2019','S');
insert into student_records values(1441,100000044,'3001',85,'PASS','2019','S');
insert into student_records values(1442,100000044,'3007',60,'PASS','2019','S');
insert into student_records values(1443,100000044,'3017',11,'FAIL','2014','S');
insert into student_records values(1444,100000044,'3021',86,'PASS','2013','S');
insert into student_records values(1445,100000044,'3018',90,'PASS','2018','F');
insert into student_records values(1446,100000044,'3023',89,'PASS','2015','F');
insert into student_records values(1447,100000044,'3011',80,'PASS','2018','W');
insert into student_records values(1448,100000044,'3012',66,'PASS','2015','S');
insert into student_records values(1449,100000044,'3009',37,'FAIL','2011','W');
insert into student_records values(1450,100000045,'3016',50,'PASS','2014','S');
insert into student_records values(1451,100000045,'3021',55,'PASS','2013','S');
insert into student_records values(1452,100000045,'3003',0,'IP','2019','F');
insert into student_records values(1453,100000045,'3012',92,'PASS','2015','S');
insert into student_records values(1454,100000045,'3006',40,'FAIL','2019','S');
insert into student_records values(1455,100000045,'3022',90,'PASS','2015','F');
insert into student_records values(1456,100000045,'3000',73,'PASS','2019','S');
insert into student_records values(1457,100000045,'3008',63,'PASS','2011','W');
insert into student_records values(1458,100000045,'3015',96,'PASS','2019','S');
insert into student_records values(1459,100000045,'3010',14,'FAIL','2018','W');
insert into student_records values(1460,100000046,'3005',86,'PASS','2014','W');
insert into student_records values(1461,100000046,'3007',54,'PASS','2019','S');
insert into student_records values(1462,100000046,'3000',84,'PASS','2019','S');
insert into student_records values(1463,100000046,'3013',65,'PASS','2015','S');
insert into student_records values(1464,100000046,'3020',39,'FAIL','2013','S');
insert into student_records values(1465,100000046,'3009',75,'PASS','2011','W');
insert into student_records values(1466,100000046,'3019',98,'PASS','2018','F');
insert into student_records values(1467,100000046,'3016',64,'PASS','2014','S');
insert into student_records values(1468,100000046,'3015',37,'FAIL','2019','S');
insert into student_records values(1469,100000046,'3022',91,'PASS','2015','F');
insert into student_records values(1470,100000047,'3004',30,'FAIL','2014','W');
insert into student_records values(1471,100000047,'3003',0,'IP','2019','F');
insert into student_records values(1472,100000047,'3009',34,'FAIL','2011','W');
insert into student_records values(1473,100000047,'3016',28,'FAIL','2014','S');
insert into student_records values(1474,100000047,'3014',52,'PASS','2019','S');
insert into student_records values(1475,100000047,'3006',73,'PASS','2019','S');
insert into student_records values(1476,100000047,'3023',82,'PASS','2015','F');
insert into student_records values(1477,100000047,'3011',45,'FAIL','2018','W');
insert into student_records values(1478,100000047,'3020',96,'PASS','2013','S');
insert into student_records values(1479,100000047,'3018',58,'PASS','2018','F');
insert into student_records values(1480,100000048,'3010',33,'FAIL','2018','W');
insert into student_records values(1481,100000048,'3003',0,'IP','2019','F');
insert into student_records values(1482,100000048,'3004',85,'PASS','2014','W');
insert into student_records values(1483,100000048,'3023',42,'FAIL','2015','F');
insert into student_records values(1484,100000048,'3008',70,'PASS','2011','W');
insert into student_records values(1485,100000048,'3015',58,'PASS','2019','S');
insert into student_records values(1486,100000048,'3001',60,'PASS','2019','S');
insert into student_records values(1487,100000048,'3018',99,'PASS','2018','F');
insert into student_records values(1488,100000048,'3020',21,'FAIL','2013','S');
insert into student_records values(1489,100000048,'3012',95,'PASS','2015','S');
insert into student_records values(1490,100000049,'3006',61,'PASS','2019','S');
insert into student_records values(1491,100000049,'3015',43,'FAIL','2019','S');
insert into student_records values(1492,100000049,'3000',66,'PASS','2019','S');
insert into student_records values(1493,100000049,'3003',0,'IP','2019','F');
insert into student_records values(1494,100000049,'3005',87,'PASS','2014','W');
insert into student_records values(1495,100000049,'3023',94,'PASS','2015','F');
insert into student_records values(1496,100000049,'3008',25,'FAIL','2011','W');
insert into student_records values(1497,100000049,'3013',37,'FAIL','2015','S');
insert into student_records values(1498,100000049,'3016',29,'FAIL','2014','S');
insert into student_records values(1499,100000049,'3019',15,'FAIL','2018','F');

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


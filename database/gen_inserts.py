import os
import sys
from random import randint
import random

names = ['Jacki Mcelyea',
'Rowena Julio',
'Faith Kolesar',
'Vonnie Rohrbaugh',
'Gilberte Ober',
'Carline Trew',
'Alesia Stead',
'Easter Harrison',
'Arianne Weidman',
'Kym Fulk',
'Juanita Munsey',
'Emeline Pomeroy',
'Lizzie Mcfate',
'Verda Carrales',
'Shiela Heber',
'Elicia Balas',
'Tiffanie Wiese',
'Monica Hammaker',
'Hung Clampitt',
'Glennis Royston',
'Hassan Hamann',
'Carman Hillwig',
'Briana Streater',
'Marcelene Brophy',
'Liane Vaquera',
'Ching Bigler',
'Lincoln Engberg',
'Victor Conners',
'Vada Myron',
'Risa Hazen',
'Blondell Decarlo',
'Debby Efird',
'Josef Deeb',
'Shannan Pasley',
'Rickey Koury',
'Alvina Kabel',
'Mellie Barlowe',
'Jerry Calley',
'Vicente Kearns',
'Vance Bialek',
'Rufina Wiggs',
'Cristy Lis',
'Sergio Pocock',
'Eulah Zemlicka',
'Millie Davy',
'Herlinda Kreger',
'Roselyn Mcquaid',
'Gabriele Villagran',
'Emogene Morain',
'Mildred Bulli']

student_number_start = 100000000
professor_id_start = 9001
section_rec_start = 3000
student_records_id_start = 1000

file_name = ''
semesters = ['S', 'W', 'F']
student_numbers = []
dep_names = ['Computer Science', 'Chemistry', 'Business', 'Engineering']
dep_id = ['CS', 'CH', 'BU', 'EN']
prof_id = []
prof_names = ['Bobby Jean', 'Claire Baker', 'Harold Beaumont', 'Katie Smith', 'Brandon Brown', 'William Davis']
section_numbers = []
room_ids = [101, 102, 103, 201, 202, 203] 
week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
times = ['8:30am-9:50am', '10:00am-11:20am', '11:30am-12:50pm', '1:00pm-2:20pm', '2:30pm-3:50pm', '4:00pm-5:20pm', '5:30pm-6:50pm', '7:00pm-9:50pm']
course_names = ['COMP1050', 'COMP2080', 'COMP2260', 'CHEM3470', 'CHEM3801', 'CHEM4540', 'BUSS4540', 'BUSS2500', 'BUSS1000', 'ENGI4540', 'ENGI3540', 'ENGI1000']
GPAs = []
student_insert = []
sec_dict = {}
course_sec_dict = {}

room_insert = [
	"INSERT INTO ROOM VALUES (101, '1120', 'ERIE HALL', 110);",
	"INSERT INTO ROOM VALUES (102, '1118', 'ERIE HALL', 60);",
	"INSERT INTO ROOM VALUES (103, '3130', 'ERIE HALL', 35);",
	"INSERT INTO ROOM VALUES (201, '1250', 'ESSEX HALL', 105);",
	"INSERT INTO ROOM VALUES (202, '1230', 'ESSEX HALL', 55);",
	"INSERT INTO ROOM VALUES (203, '1267', 'ESSEX HALL', 30);"
]

department_insert = [
	"INSERT INTO DEPARTMENT VALUES ('CS', 'Computer Science');",
	"INSERT INTO DEPARTMENT VALUES ('CH', 'Chemistry');",
	"INSERT INTO DEPARTMENT VALUES ('BU', 'Business');",
	"INSERT INTO DEPARTMENT VALUES ('EN', 'Engineering');"
]

professor_insert = [
	"INSERT INTO PROFESSOR VALUES (9001, 'BOBBY', 'JEAN', 'BJEAN@UWINDSOR.CA', 'CS');",
	"INSERT INTO PROFESSOR VALUES (9002, 'CLAIRE', 'BAKER', 'CBAKER@UWINDSOR.CA', 'CS');",
	"INSERT INTO PROFESSOR VALUES (9003, 'HAROLD', 'BEAUMONT', 'HBEAUMONT@UWINDSOR.CA', 'CH');",
	"INSERT INTO PROFESSOR VALUES (9004, 'KATIE', 'SMITH', 'KSMITH@UWINDSOR.CA', 'CH');",
	"INSERT INTO PROFESSOR VALUES (9005, 'BRANDON', 'BROWN', 'BBROWN@UWINDSOR.CA', 'BU');",
	"INSERT INTO PROFESSOR VALUES (9006, 'WILLIAM', 'DAVIS', 'WDAVIS@UWINDSOR.CA', 'EN');"
]

course_insert = [
	"INSERT INTO COURSE VALUES ('COMP1050', 'INTRO TO PROGRAMMING', 'DESCRIPTION OF COMP1050', 'CS');",
	"INSERT INTO COURSE VALUES ('COMP2080', 'OOP USING JAVA', 'DESCRIPTION OF COMP2080', 'CS');",
	"INSERT INTO COURSE VALUES ('COMP2260', 'DATABASE MANAGEMENT SYSTEMS', 'DESCRIPTION OF COMP2260', 'CS');",
	"INSERT INTO COURSE VALUES ('CHEM3470', 'SPECTROSCOPIC STRUCTURE IDENTIFICATION', 'DESCRIPTION OF CHEM3470', 'CH');",
	"INSERT INTO COURSE VALUES ('CHEM3801', 'PRINCIPLES OF INSTRUMENTAL ANALYSIS', 'DESCRIPTION OF CHEM3810', 'CH');",
	"INSERT INTO COURSE VALUES ('CHEM4540', 'BIO AND SUSTAINABLE MATERIALS', 'DESCRIPTION OF CHEM4540', 'CH');",
	"INSERT INTO COURSE VALUES ('BUSS4540', 'BUSINESS MANAGEMENT', 'DESCRIPTION OF BUSS4540', 'BU');",
	"INSERT INTO COURSE VALUES ('BUSS2500', 'ECONOMICS I', 'DESCRIPTION OF BUSS2500', 'BU');",
	"INSERT INTO COURSE VALUES ('BUSS1000', 'ECONOMICS II', 'DESCRIPTION OF BUSS1000', 'BU');",
	"INSERT INTO COURSE VALUES ('ENGI4540', 'MECHANICS I', 'DESCRIPTION OF ENGI4540', 'EN');",
	"INSERT INTO COURSE VALUES ('ENGI3540', 'MECHANICS II', 'DESCRIPTION OF ENGI3540', 'EN');",
	"INSERT INTO COURSE VALUES ('ENGI1000', 'ENGINEERING PRINCIPLES', 'DESCRIPTION OF ENGI1000', 'EN');"
]

student_records_insert = []
section_records_insert = []

def insert_other_data(data):
	f = open(file_name, 'a')

	for line in data:
		f.write(line + '\n')

	f.write('\n')
	f.close()
	return

def rand_num(n):
	range_start = 10**(n-1)
	range_end = (10**n)-1
	return randint(range_start,range_end)

def rand_num_range(start, end):
	return random.randint(start, end)

def gen_gpa():
	return round(random.uniform(50.0 , 99.0), 2)

def gen_students():
	
	output = ''

	for i in range(0, len(names)):
		output = 'insert into student values('
		
		num = str(student_numbers[i])
		output += num + ','
		name = names[i].split()
		output += '\'' + name[0] + '\','
		output += '\'' + name[1] + '\','
		output += '\'' + name[0][0] + name[1] + '@uwindsor.ca\','
		index = rand_num_range(0, len(dep_names) - 1)
		output += '\'' + dep_names[index] + '\','
		output += str(GPAs[i]) + ','
		output += '\'' + dep_id[index] + '\');'
		student_insert.append(output)
	return

def gen_section_records():

	output = ''
	pos = 0
	for i in range(0, len(course_names)):
		year = str(rand_num_range(2010, 2019))
		semester = semesters[rand_num_range(0, len(semesters) - 1)]

		for j in range(0, 2):
			output = 'insert into section_records values('
			
			output += '0' + str(j + 1) + ','
			sec = section_numbers[pos]
			output += '\'' + str(sec) + '\','
			output += '\'' + course_names[i] + '\','
			course_sec_dict[sec] = course_names[i]
			output += str(prof_id[rand_num_range(0, len(prof_id) - 1)]) + ','
			output += str(room_ids[rand_num_range(0, len(room_ids) - 1)]) + ','
			output += year + ','
			output += '\'' + semester + '\','
			output += '\'' + week[rand_num_range(0, len(week) - 1)] + '\','
			
			time_slot = times[rand_num_range(0, len(times) - 1)].split('-')
			output += '\'' + time_slot[0] + '\',' + '\'' + time_slot[1] + '\');'
			section_records_insert.append(output)
			pos += 1
			sec_dict[sec] = str(semester) + str(year)
		
def gen_student_records():
	
	global student_records_id_start

	output = ''
	num_records = 10
	for student in range(0, len(names)):
		grade_total = 0
		records = []
		total = 0
		c = []
		for i in range(0, num_records):
			output = 'insert into student_records values('
			
			output += str(student_records_id_start) + ','
			student_records_id_start += 1

			output += str(student_numbers[student]) + ','

			section_rec = 0
			while True:
				section_rec = section_numbers[rand_num_range(0, len(section_numbers) - 1)]
				if section_rec not in records and course_sec_dict[section_rec] not in c:
					records.append(section_rec)
					c.append(course_sec_dict[section_rec])
					break;
				records.append(section_rec)
				c.append(course_sec_dict[section_rec])


			semester = sec_dict[section_rec][0]
			year = sec_dict[section_rec][1:]

			grade = 0
			if not (year == '2019' and semester == 'F'):
				grade = rand_num(2)
				grade_total += grade
				total += 1

			output += '\'' + str(section_rec) + '\','
			output += str(grade) + ','

			if year == '2019' and semester == 'F':
				output += '\'IP\','
			elif grade >= 50:
				output += '\'PASS\','
			elif grade < 50:
				output += '\'FAIL\',' 

			output += '\'' + year + '\','
			output += '\'' + semester + '\');'
			student_records_insert.append(output)
		GPAs.append(round((grade_total / total), 2))
	return

def prepare_for_inserts():
	global student_number_start
	global professor_id_start
	global section_rec_start

	for i in range(0, len(names)):
		num = str(student_number_start)
		student_number_start += 1
		student_numbers.append(num)

	for i in range(0, len(prof_names)):
		prof_id.append(professor_id_start)
		professor_id_start += 1

	for i in range(0, len(course_names) * 2):
		section_numbers.append(section_rec_start)
		section_rec_start += 1

def check_args():
	if len(sys.argv) != 2:
		print('ERROR: Please run as...')
		print('\tpython3 gen_inserts.py <insert file>')
	else:
		global file_name
		file_name = sys.argv[1]
		f = open(file_name, 'w')
		f.close()
		prepare_for_inserts()
		

		gen_section_records()
		gen_student_records()
		gen_students()
		insert_other_data(room_insert)
		insert_other_data(department_insert)
		insert_other_data(student_insert)
		insert_other_data(professor_insert)
		insert_other_data(course_insert)
		insert_other_data(section_records_insert)
		insert_other_data(student_records_insert)
	return

def main():
	check_args()

if __name__ == '__main__':
	main()
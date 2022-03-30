var db = require("../bin/db");

exports.getAllStudents = async callback => {
  const connection = db.get();
  connection.query("SELECT * FROM STUDENT", (err, rows, fields) => {
    if (err) callback(null);
    else callback(rows);
  });
};

exports.getStudentDetails = async (id, callback) => {
  const connection = db.get();
  connection.query(
    "SELECT * FROM STUDENT WHERE student_id = ?",
    [id],
    (err, rows, fields) => {
      if (err) callback(null);
      else callback(rows);
    }
  );
};

exports.getStudentCourses = async (id, callback) => {
  const connection = db.get();
  connection.query(
    // c.course_id, c.course_name, sr.year, c.start_time, c.end_time, sr.grade, sr.status
    `select c.course_id, c.course_name, sr.year, ser.start_time, ser.end_time, sr.semester, sr.grade, sr.status, sr.record_id from course c
    join section_records ser on ser.course_id = c.course_id
    join student_records sr on sr.section_rec = ser.section_rec
    join student s on s.student_id = sr.student_id where s.student_id = ?`,
    [id],
    (err, rows, fields) => {
      if (err) callback(err);
      else callback(rows);
    }
  );
};

exports.addStudent= async (req, callback) => {
  const connection = db.get();
  console.log(req);
  connection.query(
    `CALL add_student(?, ?, ?)`,
    [req.first, req.last, req.major],
    (err, rows, fields) => {
      if (err) callback(err);
      else callback(rows);
    }
  );
}

exports.addCourse = async (req, callback) => {
  const connection = db.get();
  console.log(req)
  connection.query(
    `CALL add_student_to_section(?, ?)`,
    [req.studentId, req.sectionRec],
    (err, rows, fields) => {
      if (err) callback(err);
      else callback(rows);
    }
  );
}

exports.updateGrade = async (req, callback) => {
  const connection = db.get();
  console.log(req)
  connection.query(
    `CALL change_grade(?, ?, ?)`,
    [req.studentId, req.recId, req.newGrade],
    (err, rows, fields) => {
      if (err) callback(err);
      else callback(rows);
    }
  );
}
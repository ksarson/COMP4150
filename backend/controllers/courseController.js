var db = require("../bin/db");
// GET ALL COURSES
exports.getAllCourses = async callback => {
  const connection = db.get();
  connection.query("SELECT * FROM COURSE", (err, rows, fields) => {
    if (err) callback(null);
    else callback(rows);
  });
};
// Obtain course details
exports.getCourseById = async (cid, callback) => {
  const connection = db.get();
  connection.query(
    "SELECT * FROM course WHERE course_id = ?",
    [cid],
    (err, rows, fields) => {
      if (err) callback(null);
      else callback(rows);
    }
  );
};

exports.getAllSectionsByCourseId = async (cid, callback) => {
  const connection = db.get();
  console.log(cid);
  connection.query(
    `
    select se.section_rec, c.course_id, c.course_name, c.department_id,se.section_id, p.last_name, p.first_name, p.professor_id, se.semester ,se.year, count(sr.record_id) 'num_students' from course c
    join section_records se on se.course_id = c.course_id
    left join student_records sr on sr.section_rec = se.section_rec
    join professor p on p.professor_id = se.professor_id
    WHERE c.course_id = ?
    group by se.section_rec, c.course_id, c.course_name, se.section_id, p.first_name,se.year;
    `,
    [cid],
    (err, rows, fields) => {
      if (err) callback(null);
      else callback(rows);
    }
  );
};

exports.getSectionById = async (sid, callback) => {
  const connection = db.get();
  connection.query(
    `
    select se.section_rec, sr.grade, s.first_name, s.last_name, s.student_id, s.email
    from section_records se
    join student_records sr on sr.section_rec = se.section_rec
    join student s on s.student_id = sr.student_id
    where se.section_rec = ?
    `,
    [sid],
    (err, rows, fields) => {
      if (err) callback(null);
      else callback(rows);
    }
  );
};

exports.getSectionProfessor = async (pid, callback) => {
  const connection = db.get();
  connection.query(
    `
    select * from professor where professor_id = ?
    `,
    [pid],
    (err, rows, fields) => {
      if (err) callback(null);
      else callback(rows);
    }
  );
};

exports.dropStudent = async (req, callback) => {
  const connection = db.get();
  console.log(req);
  connection.query(
    `CALL drop_student_from_section(?, ?)`,
    [req.studentId, req.secRec],
    (err, rows, fields) => {
      if (err) callback(err);
      else callback(rows);
    }
  );
};
exports.addSection = async (req, callback) => {
  const connection = db.get();
  console.log(req);
  connection.query(
    `CALL create_section(?, ?, ?, ?, ?, ?)`,
    [req.courseId, req.profId, req.roomId, req.day, req.start, req.end],
    (err, rows, fields) => {
      if (err) callback(err);
      else callback(rows);
    }
  );
};

exports.applyCurveToSection = async (sid, callback) => {
  const connection = db.get();
  connection.query(
    `
    call apply_curve(?)
    `,
    [sid],
    (err, rows, fields) => {
      if (err) callback(null);
      else callback(rows);
    }
  );
};

exports.addProfessorToSection = async (req, callback) => {
  const connection = db.get();
  console.log(req)
  connection.query(
    `
    call add_professor_to_section(?, ?)
    `,
    [req.profId, +req.secRec],
    (err, rows, fields) => {
      if (err) callback(null);
      else callback(rows);
    }
  );
};
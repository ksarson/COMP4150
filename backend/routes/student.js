var express = require("express");
var router = express.Router();
const student = require("../controllers/studentController");

// Get ALL Students
router.get("/", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    student.getAllStudents(res => {
      if (res) {
        resolve(res);
      } else {
        reject("ERROR ON QUERY");
      }
    });
  });

  promise.then(val => {
      res.status(200).json({
        info: "Success!",
        total: val.length,
        data: val
      });
  })
});

// GET a SPECIFIC Student Courses
router.get("/courses/:id", function(req, res) {
    const promise = new Promise((resolve, reject) => {
        student.getStudentCourses(req.params.id, res => {
          if (res) {
            resolve(res);
          } else {
            reject("ERROR ON QUERY");
          }
        });
      });
      promise.catch(err => {
          console.error('FUCK')
      })
      promise.then(val => {
          res.status(200).json({
            info: "Success!",
            total: val.length,
            data: val
          });
      })
});

// GET a SPECIFIC Student details
router.get("/details/:id", function(req, res) {
  const promise = new Promise((resolve, reject) => {
      student.getStudentDetails(req.params.id, res => {
        if (res) {
          resolve(res);
        } else {
          reject("ERROR ON QUERY");
        }
      });
    });
    promise.catch(err => {
        console.error('FUCK')
    })
    promise.then(val => {
        res.status(200).json({
          info: "Success!",
          total: val.length,
          data: val
        });
    })
});

// Add a new student
router.post("/add", function(req, res) {
  const promise = new Promise((resolve, reject) => {
      student.addStudent(req.body, res => {
        if (res) {
          resolve(res);
        } else {
          reject("ERROR ON QUERY");
        }
      });
    });
    promise.catch(err => {
        console.error('FUCK')
    })
    promise.then(val => {
        res.status(200).json({
          info: "Success!",
          total: val.length,
          data: val
        });
    })
});
// Add student to COURSE
router.post("/add-to-course", function(req, res) {
  const promise = new Promise((resolve, reject) => {
      student.addCourse(req.body, res => {
        if (res) {
          resolve(res);
        } else {
          reject("ERROR ON QUERY");
        }
      });
    });
    promise.catch(err => {
        console.error('FUCK')
    })
    promise.then(val => {
        res.status(200).json({
          info: "Success!",
          total: val.length,
          data: val
        });
    })
});

// Add student to COURSE
router.post("/update-grade", function(req, res) {
  const promise = new Promise((resolve, reject) => {
      student.updateGrade(req.body, res => {
        if (res) {
          resolve(res);
        } else {
          reject("ERROR ON QUERY");
        }
      });
    });
    promise.catch(err => {
        console.error('FUCK')
    })
    promise.then(val => {
        res.status(200).json({
          info: "Success!",
          total: val.length,
          data: val
        });
    })
});


module.exports = router;

var express = require("express");
var router = express.Router();
const professor = require("../controllers/professorController");
// Get ALL Professors
router.get("/", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    professor.getAllProfessors(res => {
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

// GET a SPECIFIC Student RECORD
router.get("/courses/:id", function(req, res) {
    const promise = new Promise((resolve, reject) => {
        professor.getCourses(req.params.id, res => {
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
      professor.addProfessor(req.body, res => {
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

var express = require("express");
var router = express.Router();
const course = require("../controllers/courseController");
// Get ALL Courses
router.get("/", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.getAllCourses(res => {
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

// Get ALL Sections for a Course
router.get("/:id", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.getCourseById(req.params.id, res => {
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
  });
})

// Get ALL Sections for a Course
router.get("/sections/:id", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.getAllSectionsByCourseId(req.params.id, res => {
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

// Get a specific Section for a Course
router.get("/section/:id", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.getSectionById(req.params.id, res => {
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

// Get Professor of a Section
router.get("/section/professor/:id", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.getSectionProfessor(req.params.id, res => {
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

// Get Remove student from a Section
router.post("/section/remove-student", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.dropStudent(req.body, res => {
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

// Add Section to a course student from a Section
router.post("/section/add", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.addSection(req.body, res => {
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

// Add Section to a course student from a Section
router.post("/section/curve", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.applyCurveToSection(req.body.sectionId, res => {
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


// Add Section to a course student from a Section
router.post("/section/professor", function(req, res) {
  const promise = new Promise((resolve, reject) => {
    course.addProfessorToSection(req.body, res => {
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


module.exports = router;
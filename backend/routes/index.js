var express = require("express");
var router = express.Router();

router.use('/student', require('./student'))
router.use('/professor', require('./professor'))
router.use('/course', require('./course'))
router.use('/room', require('./room'))
module.exports = router
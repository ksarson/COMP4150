const express = require("express");
const logger = require("morgan");
const bodyParser = require("body-parser");
// Database
const db = require("./bin/db");
// This will be our application entry. We'll setup our server here.
const http = require("http");
// Set up the express app
const app = express();
db.connect();
// Log requests to the console.
app.use(logger("dev"));
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*"); // update to match the domain you will make the request from
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
  });
// Parse incoming requests data (https://github.com/expressjs/body-parser)
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use('/api', require('./routes'))
// Setup a default catch-all route that sends back a welcome message in JSON format.
app.get("*", (req, res) => {
  res.status(404).send({
    info: 'This path was not mapped',
    url: req.path
  })

});
const port = parseInt(process.env.PORT, 10) || 3000;
app.set("port", port);
const server = http.createServer(app);
server.listen(port);
module.exports = app;

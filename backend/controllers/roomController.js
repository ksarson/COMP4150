var db = require("../bin/db");

exports.getAllRooms = async callback => {
  const connection = db.get();
  connection.query("SELECT * FROM ROOM", (err, rows, fields) => {
    if (err) callback(null);
    else callback(rows);
  });
};


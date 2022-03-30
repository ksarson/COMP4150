var mysql = require('mysql2');

var pool = null;

exports.connect = function() {
    pool = mysql.createPool({
        host: 'localhost',
        user: 'app',
        password: 'Password123',
        database: 'student_info'
        
    });
    console.log('Pool Created!')
}

exports.get = () => {
    return pool;
}
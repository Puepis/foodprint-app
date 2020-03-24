
// Here we set up the mySQL connection
const mysql = require('mysql');

// local mySQL db connection
const connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'Gosuisbad123)!)!',
    database : 'foodprint_db'
});

// connect to db
connection.connect((err) => {
        if (err) throw err;

        /*const setupUsers = 'CREATE TABLE IF NOT EXISTS users (
          id INT AUTO_INCREMENT PRIMARY KEY
          first_name VARCHAR(20) NOT NULL,
          last_name VARCHAR(20) NOT NULL,
          email VARCHAR(40) NOT NULL,
          username VARCHAR(20) NOT NULL,
          password BINARY(60) NOT NULL,
          last_login INT
        );

        connection.query(setupUsers, (err, res) => {
          if (err) throw err;
          console.log("Users table created!")
        });*/
    }
);

module.exports = connection;

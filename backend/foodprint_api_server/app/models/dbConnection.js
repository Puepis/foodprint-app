
require('dotenv').config()
const mysql = require('promise-mysql');

let pool;
const createPool = async () => {
  pool = await mysql.createPool({
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    socketPath: `/cloudsql/${process.env.CLOUD_SQL_CONNECTION_NAME}`,
  });
};
createPool();

module.exports = pool;

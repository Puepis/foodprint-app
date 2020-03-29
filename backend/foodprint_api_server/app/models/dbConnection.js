
require('dotenv').config();
const mysql = require('mysql');

const pool = mysql.createPool({
    user: process.env.GCLOUD_SQL_USERNAME,
    database: process.env.GCLOUD_DB_NAME,
    socketPath: `/cloudsql/${process.env.CLOUD_SQL_CONNECTION_NAME}`
});

module.exports = pool;


/*
 * Here we define the logic for our user controller
 */

const jwt = require('jsonwebtoken');
const jwtDecode = require('jwt-decode');
const connection = require('../models/dbConnection.js');
const bcrypt = require('bcrypt');

const util = require('util');
//const query = util.promisify(connection.query).bind(connection);

// Bad secret key
const KEY = "m YiNcredibL y(!!!!)!1)<'SEcret>)Key'!";

// User object
const User = require('../models/userModel');

exports.registerUser = (req, res) => {

    const { firstName, lastName, email, username, password, password2} = req.body;

    let errors = [];

    // Check required fields
    if (!firstName || !lastName || !email || !username || !password) {
        errors.push({msg: 'Please fill in all fields'});
    }

    // Check that passwords match
    /*if (password !== password2) {
        errors.push({msg: 'Passwords do not match'});
    }*/

    // Password length - can use third party library
    if (password.length < 6) {
        errors.push({msg: 'Password should be at least 6 characters'});
    }

    if (errors.length > 0) {
        res.status(400).json({error: true, message: 'Errors found', errors: errors});
    } else {

        // Retrieve user
        connection.query("SELECT FROM users WHERE email = ?", email,
        (err, result) => {

            // User exists
            if (result) {
                errors.push({msg: 'Email is already registered!'});
                res.status(409);
                res.send("Email is already registered!");
            } else {
                const newUser = new User({firstName, lastName, email, username, password});

                // Hash Password
                bcrypt.genSalt(10, (err, salt) =>
                    bcrypt.hash(newUser.password, salt, (err, hash) => {
                        if (err) throw err;
                        newUser.password = hash;

                        connection.query("INSERT INTO users (first_name, last_name, email, username, password) \
                        VALUES (?, ?, ?, ?, ?)", [newUser.firstName, newUser.lastName, newUser.email, newUser.username, newUser.password],
                        (err) => console.log(err));
                        res.status(201);
                        res.send("Success");
                    }
                ))
            }
        });
    }
};

exports.loginUser = async (req, res) => {
    const {username, password} = req.body;

    try {

        // Get user
        const rows = await connection.query("SELECT * FROM users WHERE (username) = ?", username);

        if (rows[0]) {
            // Convert binary object to string
            const buff = new Buffer.from(rows[0].password, 'base60');
            const text = buff.toString('ascii');

            // Verify password
            const match = await bcrypt.compare(password, text);

            if (match) {
                const payload = {
                    firstName: rows[0].first_name,
                    lastName: rows[0].last_name,
                    username: rows[0].username,
                };

                // Construct JWT
                const token = jwt.sign(payload, KEY, {algorithm: 'HS256', expiresIn: "10 minutes"});

                // Store time created into user table
                const timeCreated = jwtDecode(token).iat;
                await connection.query("UPDATE users SET last_login = ? WHERE username = ?", [timeCreated, payload.username]);
                res.send(token);

            } else {
                console.error("Wrong Password");
                res.status(401);
                res.send("Invalid Password");
            }
        } else {
            console.error("Failure");
            res.status(401);
            res.send("Invalid username");
        }
    } catch (e) {
        console.error(e);
        res.status(401);
    }
}

exports.getData = async (req, res) => {

    const token = req.get('Authorization');
    const decoded = jwtDecode(token);
    const timeCreated = decoded.iat;
    const username = decoded.username;

    try {
        jwt.verify(token, KEY, {algorithm: 'HS256'});

        const query_login = await connection.query("SELECT last_login FROM users WHERE username = ?", username);

        // Last login
        const last_login = query_login[0].last_login;
        // Token expired
        if (timeCreated < last_login) {
            res.status(401).send("Unauthorized");
        }

        // Send the id of the user back
        const query_id = await connection.query("SELECT id FROM users WHERE username = ?", username);
        const id = query_id[0].id;
        res.send(id.toString());
    } catch {
        res.status(401);
    }
}

/*
 * This function handles the logout logic for the application.
 */
exports.logout = async (req, res) => {

    try {
        // Update user's token creation time
        const username = req.body.username;

        // Get current time (seconds since epoch)
        const now = Math.round(Date.now() / 1000);
        await connection.query('UPDATE users SET last_login = ? WHERE username = ?', [now, username]);
        res.status(200);
        res.send("Logged Out");
    } catch (e) {
        res.status(401);
        console.error("Can't log out");
    }
}

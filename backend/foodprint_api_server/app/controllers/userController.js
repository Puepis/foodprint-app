
/*
 * Here we define the logic for our user controller
 */

const jwt = require('jsonwebtoken');
const jwtDecode = require('jwt-decode');
const connection = require('../models/dbConnection');
const bcrypt = require('bcrypt');

// Async/await
const util = require('util');
const query = util.promisify(connection.query).bind(connection);

require('dotenv').config();

// User object
const User = require('../models/userModel');

exports.registerUser = async (req, res) => {

    const { firstName, lastName, email, username, password, password2} = req.body;

    let errors = [];

    // Check required fields
    if (!firstName || !lastName || !email || !username || !password) {
        errors.push({msg: 'Please fill in all fields'});
    }

    // Password length - can use third party library
    if (password.length < 6) {
        errors.push({msg: 'Password should be at least 6 characters'});
    }

    if (errors.length > 0) {
        res.status(400).json({error: true, message: 'Errors found', errors: errors});
    }

    try {
        // TODO: handle case where username is the same
        const existing = await query("SELECT * FROM users WHERE email = ?", email);

        // Non-empty object
        if (existing.length > 0) {
            errors.push({msg: 'Email is already registered!'});
            res.status(400).json(errors);
        }
        else {
            const newUser = new User({firstName, lastName, email, username, password});

            // Hash Passwords
            const salt = await bcrypt.genSalt(10);
            newUser.password = await bcrypt.hash(newUser.password, salt);

            await query("INSERT INTO users (first_name, last_name, email, username, password) \
            VALUES (?, ?, ?, ?, ?)", [newUser.firstName, newUser.lastName, newUser.email, newUser.username, newUser.password]);

            res.status(201).send("Success");
        }
    } catch (e) {
        res.status(401).json(e);
    }
};

exports.loginUser = async (req, res) => {
    const {username, password} = req.body;

    try {
        // Get user
        const rows = await query("SELECT * FROM users WHERE username = ?", username);

        // User exists
        if (rows[0]) {
            // Convert binary object to string
            const buff = new Buffer.from(rows[0].password, 'base60');
            const text = buff.toString('ascii');

            // Verify password
            const match = await bcrypt.compare(password, text);

            // Correct password
            if (match) {
                const payload = {
                    firstName: rows[0].first_name,
                    lastName: rows[0].last_name,
                    username: rows[0].username,
                };

                // Construct JWT
                const token = jwt.sign(payload, process.env.KEY, {algorithm: 'HS256', expiresIn: "10 minutes"});

                // Store time created into user table
                const timeCreated = jwtDecode(token).iat;
                await query("UPDATE users SET last_login = ? WHERE username = ?", [timeCreated, payload.username]);
                res.status(200).send(token);
            }
            else {
                res.status(401).send("Invalid Password");
            }
        }
        else {
            res.status(401).send("Invalid username");
        }
    } catch (e) {
        res.status(401).json(e);
    }
};

exports.getData = async (req, res) => {

    // Decode JWT
    const token = req.get('Authorization');
    const decoded = jwtDecode(token);
    const timeCreated = decoded.iat;
    const username = decoded.username;

    try {
        jwt.verify(token, process.env.KEY, {algorithm: 'HS256'});

        const query_login = await query("SELECT last_login FROM users WHERE username = ?", username);

        // Last login
        const last_login = query_login[0].last_login;

        // Token expired
        if (timeCreated < last_login) {
            res.status(401).send("Unauthorized");
        }

        // Send the id of the user back
        const query_id = await query("SELECT id FROM users WHERE username = ?", username);
        const id = query_id[0].id;
        res.send(id.toString());
    } catch {
        res.status(401);
    }
};

/*
 * This function handles the logout logic for the application.
 */
exports.logout = async (req, res) => {

    try {
        // Update user's token creation time
        const username = req.body.username;

        // Get current time (seconds since epoch)
        const now = Math.round(Date.now() / 1000);
        await query('UPDATE users SET last_login = ? WHERE username = ?', [now, username]);
        res.status(200).send("Logged Out");
    } catch (e) {
        res.status(401).send("Can't log out");
    }
}

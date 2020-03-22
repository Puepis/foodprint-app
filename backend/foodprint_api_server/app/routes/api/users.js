
/*
 * This module defines the endpoints for users
 */

const express = require('express');
const router = express.Router();
const controller = require('../../controllers/userController');

router.post('/register', controller.registerUser);
router.post('/login', controller.loginUser);
router.post('/logout', controller.logout);
router.get('/data', controller.getData);

module.exports = router;



/*
 * This module defines the endpoints for restaurants
 */

const express = require('express');
const router = express.Router();
const controller = require('../../controllers/photoController');

// Routes
router.post('/save', controller.savePhoto);

module.exports = router;

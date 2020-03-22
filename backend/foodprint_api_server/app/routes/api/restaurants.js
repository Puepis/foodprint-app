
/*
 * This module defines the endpoints for restaurants
 */

const express = require('express');
const router = express.Router();
const controller = require('../../controllers/restaurantController');

router.get('/', controller.listRestaurants);
router.post('/', controller.addNewRestaurant);

module.exports = router;

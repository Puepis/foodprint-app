

/*
 * This module defines the endpoints for restaurants
 */

const express = require('express');
const router = express.Router();
const controller = require('../../controllers/photoController');

//router.get('/', controller.listPhotos);
router.post('/save', controller.savePhoto);
//router.get('/:photoId', controller.getPhoto);
//router.delete('/:photoId', controller.deletePhoto);

module.exports = router;


// Use this to perform queries
const Photo = require('../models/photoModel');

// Database connection instance
const connection = require('../models/dbConnection.js');
const util = require('util');
const query = util.promisify(connection.query).bind(connection);

exports.savePhoto = async (req, res) => {

    console.log(req.body);
    const newPhoto = new Photo(req.body);

    try {
      const result = await connection.query("INSERT INTO photos (image_data, caption, user_id, price, time_stamp) \
      VALUES (?, ?, ?, ?, ?)", [newPhoto.imageData, newPhoto.caption, newPhoto.userId, newPhoto.price, newPhoto.timeStamp]);
      res.status(200).send("Success in saving photo.");

    } catch (e) {
        console.error(e);
        res.status(401);
    }
};

// Remove these
exports.getPhoto = function(req, res) {
    Photo.getPhotoById(req.params.photoId,
        function(err, photo) {
            if (err) {
                res.json(err);
            }
            res.json(photo);
        }
    );
};
exports.deletePhoto = function(req, res) {
    Photo.removePhoto(req.params.photoId,
        function(err, photo) {
            if (err) {
                res.json(err);
            }
            res.json({ message: 'Photo successfully deleted' });
        }
    );
};

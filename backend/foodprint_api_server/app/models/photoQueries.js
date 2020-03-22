

// Database connection instance
const connection = require('./dbConnection.js');

// user object constructor
const Photo = function(photo) {
    this.image_path = photo.image_path;
    this.image_name = photo.image_name;
    this.image_caption = photo.image_caption;
    this.timestamp = photo.timestamp;
    this.user_id = null;
    this.restaurant_id = null;
    this.price = photo.price;
};

Photo.addPhoto = function (newPhoto, result) {
    connection.query("INSERT INTO photos set ?", newPhoto,
        function (err, res) {
            if (err) {
                console.log(`error: ${err}`);
                result(err, null);
            }
            else {
                result(null, res.insertId);
            }
        }
    );
};

Photo.getAllPhotos = function (result) {

    // mySQL Query
    connection.query("SELECT * FROM photos",
        function (err, res) {
            if(err) {
                console.log(`error: ${err}`);
                result(null, err);
            }
            else {
                result(null, res);
            }
        }
    );
};

Photo.getPhotoById = function (id, result) {
    connection.query(`SELECT * FROM photos WHERE id = ${id}`,
        function (err, res) {
            if(err) {
                console.log(`error: ${err}`);
                result(err, null);
            }
            else {
                result(null, res);
            }
        }
    );
};

Photo.removePhoto = function(id, result) {
     connection.query(`DELETE FROM photos WHERE id = ${id}`,
        function (err, res) {
            if(err) {
                console.log(`error: ${err}`);
                result(null, err);
            }
            else {
                result(null, res);
            }
        }
    );
};

module.exports = Photo;

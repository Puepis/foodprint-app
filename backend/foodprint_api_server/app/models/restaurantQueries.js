
// Database connection instance
const connection = require('./dbConnection.js');

// user object constructor
const Restaurant = function(restaurant) {
    this.restaurant_name = restaurant.restaurant_name;
    this.address = restaurant.address;
    this.lat = restaurant.lat;
    this.lng = restaurant.lng;
    this.rating = restaurant.rating;
    this.cuisine = restaurant.cuisine;
};

Restaurant.addRestaurant = function (newRestaurant, result) {
    connection.query("INSERT INTO restaurants set ?", newRestaurant,
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

Restaurant.getAllRestaurants = function (result) {

    // mySQL Query
    connection.query("SELECT * FROM restaurants",
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

module.exports = Restaurant;

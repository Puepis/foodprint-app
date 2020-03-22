
// Use this to perform queries
const Restaurant = require('../models/restaurantQueries');

exports.listRestaurants = (req, res) => {
    Restaurant.getAllRestaurants(
        function(err, restaurant) {
            if (err) {
                res.json(err);
            }
            res.json(restaurant);
        }
    );
};

exports.addNewRestaurant = (req, res) => {

    // Body of request
    const newRestaurant = new Restaurant(req.body);
    console.log(req.body);

    // Handles null error
    if (!newRestaurant.rating) {
        res.status(400).json({ error:true, message: 'Please provide a rating' });
    }

    else {
        Restaurant.addRestaurant(newRestaurant,
            function(err, restaurant) {
                if (err) {
                    res.json(err);
                }
                res.json(restaurant);
            }
        );
    }
};

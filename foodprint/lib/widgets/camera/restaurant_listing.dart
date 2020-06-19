import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/models/places_data/restaurant_result.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/widgets/camera/image_details.dart';

class RestaurantListing extends StatelessWidget {
  final UserModel user;
  final File imageFile;
  final List<RestaurantResult> restaurants;
  const RestaurantListing({Key key, @required this.imageFile, @required this.restaurants, @required this.user}) : super(key: key);

  Widget _listRestaurants() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          itemCount: restaurants.length,
          itemBuilder: (context, index) => Container(
            height: 50,
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ImageDetail(
                      user: user,
                      imageFile: imageFile,
                      restaurant: restaurants[index],
                    )
                )).then((result) {
                  final bool saved = result as bool;
                  if (saved != null) {
                    Navigator.of(context).pop(result); // pop back to camera
                  }
                });
              },
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Icon(Icons.restaurant, color: Colors.white),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      child: Text(
                        restaurants[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: const Center(
            child: Text(
              "Select your location!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: restaurants.isNotEmpty ? Column(
          children: <Widget>[
           _listRestaurants()
          ],
        ) : const Text("No restaurants found")
      ),
    );
  }
}



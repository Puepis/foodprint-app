import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:foodprint/widgets/camera/image_details.dart';

class RestaurantListing extends StatelessWidget {
  final UserModel user;
  final File imageFile;
  final List<Result> restaurants;
  RestaurantListing({Key key, @required this.imageFile, @required this.restaurants, @required this.user}) : super(key: key);

  Widget _listRestaurants() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: restaurants.length,
        itemBuilder: (context, index) => Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ImageDetail(
                      user: user,
                      imageFile: imageFile,
                      restaurant: restaurants[index],
                    )
                )).then((result) {
                  bool saved = result as bool;
                  if (saved != null) {
                    Navigator.of(context).pop(result); // pop back to camera
                  }
                });
              },
              child: Text(restaurants[index].name),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Center(
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
        child: Column(
          children: <Widget>[
            if (restaurants.length > 0) _listRestaurants()
          ],
        ),
      ),
    );
  }
}



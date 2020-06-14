import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/camera/image_details.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/places_data/result.dart';

class RestaurantListing extends StatelessWidget {
  final UserModel user;
  final File imageFile;
  final List<Result> restaurants;
  RestaurantListing({Key key, @required this.imageFile, @required this.restaurants, @required this.user}) : super(key: key);

  Widget _listRestaurants() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
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
                ));
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
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Here's what we found",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
            ),
            if (restaurants != null) _listRestaurants()
          ],
        ),
      ),
    );
  }
}



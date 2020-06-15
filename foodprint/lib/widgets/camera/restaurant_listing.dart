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
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: restaurants.length,
          itemBuilder: (context, index) => Container(
            height: 50,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
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
                  bool saved = result as bool;
                  if (saved != null) {
                    Navigator.of(context).pop(result); // pop back to camera
                  }
                });
              },
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.restaurant, color: Colors.white),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      child: Text(
                        restaurants[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
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
        child: restaurants.length > 0 ? Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           _listRestaurants()
          ],
        ) : Text("No restaurants found")
      ),
    );
  }
}



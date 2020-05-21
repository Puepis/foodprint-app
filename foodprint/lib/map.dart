
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodMap extends StatefulWidget {
  final LatLng initialPos;
  final Map<Restaurant, List<File>> restaurantPhotos; // TODO: sort photos chronologically
  FoodMap({Key key, @required this.initialPos, @required this.restaurantPhotos}) : super(key: key);
  @override
  _FoodMapState createState() => _FoodMapState();
}

class _FoodMapState extends State<FoodMap> {
  GoogleMapController mapController;
  LatLng _currentPos;
  final LatLng toronto = LatLng(43.651070, -79.347015);
  Map<String, Marker> _markers = {};

  // Returns a void function
  Function createMap(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
      setState(() {
        widget.restaurantPhotos.forEach((res, photos) {
          final marker = Marker(
              markerId: MarkerId(res.id),
              position: LatLng(res.latitude, res.longitude),
              // TODO: display photos
              infoWindow: InfoWindow(
                  title: res.name,
                  snippet: photos.length == 1 ? "You've taken one photo here!"
                      : "You've taken ${photos.length} photos here!"
              ),
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => RestaurantCard(
                      restaurant: res,
                      photos: photos,
                    )
                );
              }
          );
          _markers[res.name] = marker;
        });
      });
    }
    return _onMapCreated;
  }

  @override
  Widget build(BuildContext context) {

    // Add marker indicating current location
    if (widget.initialPos != null) {
      _currentPos = widget.initialPos;
      _markers["current_location"] = Marker(
        markerId: MarkerId("current"),
        position: widget.initialPos,
        onTap: () {},
      );

      // Move camera to current location
      if (mapController != null) {
        mapController.moveCamera(
            CameraUpdate.newLatLng(
                LatLng(_currentPos.latitude, _currentPos.longitude)
            )
        );
      }
    } else {
      _currentPos = toronto; // default location
    }

    return Stack(
      children: [
        GoogleMap(
          onMapCreated: createMap(context),
          initialCameraPosition: CameraPosition(
              target: _currentPos,
              zoom: 18.5
          ),
          onCameraMove: (CameraPosition position) {
            _currentPos = position.target;
          },
          markers: Set<Marker>.of(_markers.values),
        ),
        // TODO: Search bar
      ]
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final List<File> photos;
  const RestaurantCard({Key key, this.restaurant, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0)
          ),
          color: Colors.white
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            restaurant.name,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Gotham",
              fontWeight: FontWeight.bold,
              fontSize: 24
           ),
          ),
          Row(
            children: getRatings(restaurant.rating)
          ),
          SizedBox(height: 20.0),
          Text(
            "YOUR PHOTOS",
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "Gotham",
              fontSize: 10
            ),
          ),
          SizedBox(height: 5.0),
          getPhotos(),
        ]
      ),
    );
  }

  Widget getPhotos() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        itemBuilder: (BuildContext context, int index) {
          File imgFile = photos[index];
          return Container(
            width: 100,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 5.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(imgFile),
                    fit: BoxFit.cover
                )
            ),
          );
        },
      ),
    );
  }
  
  List<Widget> getRatings(double rating) {
    List<Widget> ratings = [
      Text(
        rating.toString(),
        style: TextStyle(
          color: Colors.grey,
          fontFamily: "Gotham",
          fontWeight: FontWeight.bold,
          fontSize: 14
        ),
      ),
    ];

    for (int i = 0; i < 5; ++i) {
      if (rating - i >= 1) { // full star
        ratings.add(
            Icon(
              Icons.star,
              color: Colors.yellow,
            )
        );
      } else if (rating - i < 1 && i < rating) { // half star
        ratings.add(
            Icon(
                Icons.star_half,
                color: Colors.yellow
            )
        );
      } else { // no star
        ratings.add(
            Icon(
              Icons.star_border,
              color: Colors.black,
            )
        );
      }
    }
    return ratings;
  }
}



import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/service/locator.dart';
import 'package:foodprint/widgets/map/restaurant_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class FoodMap extends StatefulWidget {
  final LatLng initialPos;
  FoodMap({Key key, @required this.initialPos }) : super(key: key);
  @override
  _FoodMapState createState() => _FoodMapState();
}

class _FoodMapState extends State<FoodMap> {
  GoogleMapController mapController;
  LatLng _currentPos;
  Map<String, Marker> _markers = {};

  // Returns a void function
  Function createMap(BuildContext context, Map foodprint) {
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }
    return _onMapCreated;
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);
    _markers = generateMarkers(user.foodprint);

    // Add marker indicating current location
    if (widget.initialPos != null) {
      _currentPos = widget.initialPos;
     // _markers["current_location"] = Marker(
     //   markerId: MarkerId("current"),
     //   position: widget.initialPos,
     //   onTap: () {},
     // );

      // Move widgets.camera to current location
      if (mapController != null) {
        mapController.moveCamera(
            CameraUpdate.newLatLng(
                LatLng(_currentPos.latitude, _currentPos.longitude)
            )
        );
      }
    } else {
      _currentPos = Geolocator.toronto; // default location
    }

    return Stack(
      children: [
        GoogleMap(
          onMapCreated: createMap(context, user.foodprint),
          initialCameraPosition: CameraPosition(
              target: _currentPos,
              zoom: 16.0
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

  Map<String, Marker> generateMarkers(Map<Restaurant, List<FoodprintPhoto>> foodprint) {
    Map<String, Marker> result = {};
    foodprint.forEach((rest, photoList) {
      final marker = Marker(
          markerId: MarkerId(rest.id),
          position: LatLng(rest.latitude, rest.longitude),
          infoWindow: InfoWindow(
              title: rest.name,
              snippet: photoList.length == 1 ? "You've taken one photo here!"
                  : "You've taken ${photoList.length} photos here!"
          ),
          onTap: () {
            // Show restaurant info
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => RestaurantCard(
                  restaurant: rest,
                  photos: photoList,
                )
            );
          }
      );
      result[rest.name] = marker;
    });
    return result;
  }
}


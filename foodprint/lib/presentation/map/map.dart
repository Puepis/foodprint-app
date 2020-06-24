
import 'package:flutter/material.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/map/restaurant_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodMap extends StatefulWidget {
  final FoodprintEntity foodprint;
  final LatLng initialPos;
  const FoodMap({Key key, @required this.initialPos, @required this.foodprint }) : super(key: key);
  @override
  _FoodMapState createState() => _FoodMapState();
}

class _FoodMapState extends State<FoodMap> {
  final LatLng _toronto = const LatLng(43.6529, 43.6529); // TODO: REMOVE constant 
  GoogleMapController _mapController;
  LatLng _currentPos;
  Map<String, Marker> _markers = {};
  
  @override
  Widget build(BuildContext context) {
    _markers = generateMarkers(widget.foodprint); 

    // Add marker indicating current location
    if (widget.initialPos != null) {
      _currentPos = widget.initialPos;

      // Move widgets.camera to current location
      if (_mapController != null) {
        _mapController.moveCamera(
            CameraUpdate.newLatLng(
                LatLng(_currentPos.latitude, _currentPos.longitude)
            )
        );
      }
    } else {
      _currentPos = _toronto; // default location
    }

    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) => _mapController = controller,
          initialCameraPosition: CameraPosition(
              target: _currentPos,
              zoom: 16.0
          ),
          onCameraMove: (CameraPosition position) {
            _currentPos = position.target;
          },
          markers: Set<Marker>.of(_markers.values),
        ),
      ]
    );
  }

  Map<String, Marker> generateMarkers(FoodprintEntity foodprint) {
    final Map<String, Marker> result = {};
    foodprint.restaurantPhotos.forEach((RestaurantEntity restaurant, List<PhotoEntity> photos) {
      final marker = Marker(
          markerId: MarkerId(restaurant.restaurantID.getOrCrash()),
          position: LatLng(restaurant.latitude.getOrCrash(), restaurant.longitude.getOrCrash()),
          infoWindow: InfoWindow(
              title: restaurant.restaurantName.getOrCrash(),
              snippet: photos.length == 1 ? "You've taken one photo here!"
                  : "You've taken ${photos.length} photos here!"
          ),
          onTap: () {
            // Show restaurant info
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => RestaurantCard(
                  restaurant: restaurant,
                  photos: photos,
                )
            );
          }
      );
      result[restaurant.restaurantID.getOrCrash()] = marker;
    });
    return result;
  }
}


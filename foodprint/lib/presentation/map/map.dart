import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/map/restaurant_preview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodMap extends StatefulWidget {
  final FoodprintEntity foodprint;
  final LatLng initialPos;
  const FoodMap({Key key, @required this.initialPos, @required this.foodprint})
      : assert(initialPos != null),
        super(key: key);
  @override
  _FoodMapState createState() => _FoodMapState();
}

class _FoodMapState extends State<FoodMap> {
  GoogleMapController _mapController;
  LatLng _currentPos;
  Map<String, Marker> _markers = {};
  bool _showRecenterButton = false;
  bool _didRecenter = false;

  @override
  Widget build(BuildContext context) {
    _markers = generateMarkers(widget.foodprint);

    // Add marker indicating current location
    if (widget.initialPos != null) {
      _currentPos = widget.initialPos;

      // Move camera to initial location
      if (_mapController != null) {
        _mapController.moveCamera(CameraUpdate.newLatLng(
            LatLng(_currentPos.latitude, _currentPos.longitude)));
      }
    }

    return Stack(children: [
      GoogleMap(
        onMapCreated: (controller) => _mapController = controller,
        initialCameraPosition: CameraPosition(target: _currentPos, zoom: 16.0),
        onCameraIdle: () {},
        onCameraMove: (CameraPosition position) {
          _currentPos = position.target;

          // Only re-render once
          if (!_showRecenterButton && !_didRecenter) {
            setState(() {
              _showRecenterButton = true;
            });
          }

          // Moved away from initial position
          if (_didRecenter) {
            _didRecenter = false;
          }
        },
        markers: Set<Marker>.of(_markers.values),
      ),
      if (_showRecenterButton)
        Positioned(bottom: 65, right: 10, child: recenterButton())
    ]);
  }

  Widget recenterButton() => Material(
    shape: const CircleBorder(),
    elevation: 8.0,
      child: Container(
          width: 43,
          height: 43,
          child: Ink(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: InkWell(
              onTap: () {
                if (_mapController != null) {
                  setState(() {
                    _didRecenter = true;
                    _showRecenterButton = false;
                  });
                  _mapController.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(widget.initialPos.latitude,
                              widget.initialPos.longitude))));
                }
              },
              child: const Icon(
                Icons.gps_fixed,
                size: 26,
              ),
            ),
          ),
        ),
  );

  Map<String, Marker> generateMarkers(FoodprintEntity foodprint) {
    final Map<String, Marker> result = {};
    foodprint.restaurantPhotos
        .forEach((RestaurantEntity restaurant, List<PhotoEntity> photos) {
      final marker = Marker(
          markerId: MarkerId(restaurant.restaurantID.getOrCrash()),
          position: LatLng(restaurant.latitude.getOrCrash(),
              restaurant.longitude.getOrCrash()),
          onTap: () {
            // Show restaurant info
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => RestaurantPreview(
                      restaurant: restaurant,
                      photos: photos,
                    ));
          });
      result[restaurant.restaurantID.getOrCrash()] = marker;
    });
    return result;
  }
}

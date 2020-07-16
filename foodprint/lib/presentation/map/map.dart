import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_location.dart';
import 'package:foodprint/presentation/map/restaurant_preview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodMap extends StatefulWidget {
  final FoodprintEntity foodprint;
  const FoodMap({Key key, @required this.foodprint}) : super(key: key);
  @override
  _FoodMapState createState() => _FoodMapState();
}

class _FoodMapState extends State<FoodMap> {
  final Completer<GoogleMapController> _mapController = Completer();
  LatLng _currentPos;
  Map<String, Marker> _markers = {};
  bool _showRecenterButton = false;
  bool _didRecenter = true;
  MapType _currentMapType = MapType.normal;
  InheritedLocation _initialPos;
  final double mapZoom = 16.0;

  @override
  Widget build(BuildContext context) {
    // Initialize variables
    _initialPos = InheritedLocation.of(context);
    _currentPos = LatLng(_initialPos.latitude, _initialPos.longitude);
    _markers = generateMarkers(widget.foodprint);

    return Stack(children: [
      GoogleMap(
        mapType: _currentMapType,
        onMapCreated: (controller) => _mapController.complete(controller),
        initialCameraPosition:
            CameraPosition(target: _currentPos, zoom: mapZoom),
        onCameraIdle: () {
          if (!_showRecenterButton && !_didRecenter) {
            setState(() {
              _didRecenter = true;
            });
          }
        },
        onCameraMove: _onCameraMove,
        markers: Set<Marker>.of(_markers.values),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 35, 16, 16),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FloatingActionButton(
                heroTag: "map_type",
                backgroundColor: Colors.white,
                onPressed: _onMapTypeButtonPressed,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                child: const Icon(Icons.map, size: 32.0),
              ),
              const SizedBox(height: 16.0),
              if (_showRecenterButton && !_didRecenter)
                FloatingActionButton(
                  heroTag: "recenter",
                  backgroundColor: Colors.white,
                  onPressed: _onRecenterButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  child: const Icon(Icons.gps_fixed, size: 32.0),
                ),
            ],
          ),
        ),
      ),
    ]);
  }

  void _onCameraMove(CameraPosition position) {
    _currentPos = position.target;

    print("$_showRecenterButton, $_didRecenter");

    // Moving away
    if (!_showRecenterButton && _didRecenter) {
      setState(() {
        _showRecenterButton = true;
        _didRecenter = false;
      });
    }
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  Future<void> _onRecenterButtonPressed() async {
    if (_mapController != null) {
      final GoogleMapController controller = await _mapController.future;
      setState(() {
        _showRecenterButton = false;
      });
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: mapZoom,
          target: LatLng(_initialPos.latitude, _initialPos.longitude))));
    }
  }

  Map<String, Marker> generateMarkers(FoodprintEntity foodprint) {
    final Map<String, Marker> result = {};
    foodprint.restaurantPhotos
        .forEach((RestaurantEntity restaurant, List<PhotoEntity> photos) {
      final marker = Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
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

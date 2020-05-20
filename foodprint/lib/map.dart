
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodMap extends StatefulWidget {
  final LatLng initialPos;
  final Map<Restaurant, List<File>> restaurantPhotos;
  FoodMap({Key key, @required this.initialPos, @required this.restaurantPhotos}) : super(key: key);
  @override
  _FoodMapState createState() => _FoodMapState();
}

class _FoodMapState extends State<FoodMap> {
  GoogleMapController mapController;
  LatLng _currentPos;
  final LatLng toronto = LatLng(43.651070, -79.347015);
  Map<String, Marker> _markers = {};

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
              snippet: res.rating.toString()
            )
          );
          _markers[res.name] = marker;
        });
      });
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

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
          target: _currentPos,
          zoom: 18.5
      ),
      onCameraMove: (CameraPosition position) {
        _currentPos = position.target;
      },
      markers: Set<Marker>.of(_markers.values),
    );
  }
}

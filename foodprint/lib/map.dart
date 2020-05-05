
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FoodMap extends StatefulWidget {
  final LatLng initialPos;
  FoodMap({Key key, @required this.initialPos}) : super(key: key);
  @override
  _FoodMapState createState() => _FoodMapState();
}

class _FoodMapState extends State<FoodMap> {
  GoogleMapController mapController;
  LatLng _currentPos;
  final LatLng toronto = LatLng(43.651070, -79.347015);
  List<Marker> markers = <Marker>[];

  void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
  }

  @override
  Widget build(BuildContext context) {

    // Add marker indicating current location
    if (widget.initialPos != null) {
      _currentPos = widget.initialPos;
      markers.add(
          Marker(
            markerId: MarkerId("current"),
            position: widget.initialPos,
            onTap: () {},
          )
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
        print(position.target.toString());
      },
      markers: Set<Marker>.of(markers),
    );
  }
}

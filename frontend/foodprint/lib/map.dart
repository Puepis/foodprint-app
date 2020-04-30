
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

  void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
  }

  @override
  void initState() {
    _currentPos = widget.initialPos == null ? toronto : widget.initialPos;
    print("Init called");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Build called");
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _currentPos,
        zoom: 12.0,
      ),
      onCameraMove: (CameraPosition position) {
        _currentPos = position.target;
        print(position.target.toString());
      },
    );
  }
}

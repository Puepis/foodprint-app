
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/location/i_locator_repository.dart';
import 'package:foodprint/domain/location/location_failure.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@LazySingleton(as: UserLocator)
class DeviceLocationClient implements UserLocator {
  final Location location;

  DeviceLocationClient({@required this.location});
  
  @override
  Future<Either<LocationFailure, LatLng>> getLocation() async {

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData pos;

    // Check service
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return left(const LocationFailure.locationServiceDisabled());
      }
    }

    // Check permissions
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return left(const LocationFailure.permissionDenied());
      }
    }

    pos = await location.getLocation(); // get location
    return right(LatLng(pos.latitude, pos.longitude));
  }
}

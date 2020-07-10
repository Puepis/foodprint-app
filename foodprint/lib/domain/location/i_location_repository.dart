

import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/location/location_failure.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class ILocationRepository {
  Future<Either<LocationFailure, LatLng>> getLocation();
}
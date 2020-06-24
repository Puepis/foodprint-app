import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:foodprint/domain/location/i_location_repository.dart';
import 'package:foodprint/domain/location/location_failure.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ILocationRepository _locationClient;

  LocationBloc(this._locationClient);
  @override
  LocationState get initialState => LocationStateInitial();

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is LocationRequested) {
      final Either<LocationFailure, LatLng> result =
          await _locationClient.getLocation();
      yield result.fold((f) => GetLocationFailure(f),
          (location) => GetLocationSuccess(location));
    }
  }
}

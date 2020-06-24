import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:foodprint/domain/location/i_locator_repository.dart';
import 'package:foodprint/domain/location/location_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final UserLocator _locationClient;

  LocationBloc(this._locationClient);
  @override
  LocationState get initialState => const LocationState.initial();

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is LocationRequested) {
      final Either<LocationFailure, LatLng> result =
          await _locationClient.getLocation();
      yield result.fold((f) => LocationState.getLocationFailure(failure: f),
          (location) => LocationState.getLocationSuccess(latlng: location));
    }
  }
}

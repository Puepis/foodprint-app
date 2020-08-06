import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/restaurants/i_restaurant_search_respository.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_failure.dart';
import 'package:injectable/injectable.dart';

part 'restaurant_search_event.dart';
part 'restaurant_search_state.dart';

/// BloC reponsible for the business logic behind the restaurant search process.
///
/// Maps incoming [RestaurantSearchEvent] to [RestaurantSearchState].
@injectable
class RestaurantSearchBloc
    extends Bloc<RestaurantSearchEvent, RestaurantSearchState> {
  /// Repository that handles the restaurant search
  final IRestaurantSearchRepository _client;

  RestaurantSearchBloc(this._client) : super(SearchStateEmpty());

  @override
  Stream<RestaurantSearchState> mapEventToState(
    RestaurantSearchEvent event,
  ) async* {
    if (event is ResetNearbySearch) {
      yield SearchStateEmpty();
    }
    if (event is NearbyRestaurantsSearched) {
      yield* _mapNearbySearchToState(event.latitude, event.longitude);
    }
  }

  Stream<RestaurantSearchState> _mapNearbySearchToState(
      double latitude, double longitude) async* {
    yield SearchStateLoading();
    Either<RestaurantFailure, List<RestaurantEntity>> failureOrSuccess;

    // Doesn't need additional validation since coordinates should already be validated
    final Latitude lat = Latitude(latitude);
    final Longitude lng = Longitude(longitude);

    if (lat.isValid() && lng.isValid()) {
      // Use the repository to search for restaurants
      failureOrSuccess =
          await _client.searchNearbyRestaurants(latitude: lat, longitude: lng);

      // Create new state
      yield failureOrSuccess.fold((f) => SearchStateError(failure: f),
          (r) => NearbySearchStateSuccess(restaurants: r));
    }
  }
}

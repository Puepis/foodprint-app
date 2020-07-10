import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/restaurants/i_restaurant_search_respository.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_failure.dart';
import 'package:injectable/injectable.dart';

part 'restaurant_search_event.dart';
part 'restaurant_search_state.dart';

@injectable
class RestaurantSearchBloc
    extends Bloc<RestaurantSearchEvent, RestaurantSearchState> {
  final IRestaurantSearchRepository _client;

  RestaurantSearchBloc(this._client);

  @override
  RestaurantSearchState get initialState => SearchStateEmpty();

  @override
  Stream<RestaurantSearchState> mapEventToState(
    RestaurantSearchEvent event,
  ) async* {
    if (event is RestaurantSearched) {
      yield SearchStateLoading();

      Either<RestaurantFailure, List<RestaurantEntity>> failureOrSuccess;

      // Doesn't need additional validation since coordinates should already be validated
      final Latitude lat = Latitude(event.latitude);
      final Longitude lng = Longitude(event.longitude);

      if (lat.isValid() && lng.isValid()) {
        // Use the repository to search for restaurants
        failureOrSuccess =
            await _client.searchRestaurants(latitude: lat, longitude: lng);

        // Create new state
        yield failureOrSuccess.fold((failure) => SearchStateError(failure),
            (success) => SearchStateSuccess(success));
      }
    }
  }
}

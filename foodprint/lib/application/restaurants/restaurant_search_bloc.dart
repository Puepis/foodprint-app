import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/manual_search/autocomplete_result_entity.dart';
import 'package:foodprint/domain/manual_search/search_cache.dart';
import 'package:foodprint/domain/restaurants/i_restaurant_search_respository.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'restaurant_search_event.dart';
part 'restaurant_search_state.dart';

/// BloC reponsible for the business logic behind the restaurant search process.
///
/// Maps incoming [RestaurantSearchEvent] to [RestaurantSearchState]
@injectable
class RestaurantSearchBloc
    extends Bloc<RestaurantSearchEvent, RestaurantSearchState> {
  /// Repository that handles the restaurant search
  final IRestaurantSearchRepository _client;

  /// Cache that stores previously-searched terms
  final AutocompleteSearchCache _cache;

  RestaurantSearchBloc(this._client, this._cache);

  @override
  RestaurantSearchState get initialState => SearchStateEmpty();

  /// Overriding transformEvents in order to debounce the AutocompleteRestaurantsSearched event
  /// to give the user time to stop typing before searching.
  @override
  Stream<Transition<RestaurantSearchEvent, RestaurantSearchState>>
      transformEvents(
          Stream<RestaurantSearchEvent> events,
          TransitionFunction<RestaurantSearchEvent, RestaurantSearchState>
              transitionFn) {
    // No delay
    final nonDebounceStream =
        events.where((event) => event is NearbyRestaurantsSearched);

    // Only emit events after 300ms have passed
    final debounceStream = events
        .where((event) => event is AutocompleteRestaurantsSearched)
        .debounceTime(const Duration(milliseconds: 300));
    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<RestaurantSearchState> mapEventToState(
    RestaurantSearchEvent event,
  ) async* {
    if (event is NearbyRestaurantsSearched) {
      yield* _mapNearbySearchToState(event.latitude, event.longitude);
    }
    if (event is AutocompleteRestaurantsSearched) {
      yield* _mapAutocompleteSearchToState(
          event.input, event.latitude, event.longitude);
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

  Stream<RestaurantSearchState> _mapAutocompleteSearchToState(
      String input, double latitude, double longitude) async* {
    if (input.isEmpty) {
      yield SearchStateEmpty();
    } else {
      yield SearchStateLoading();
      final Latitude lat = Latitude(latitude);
      final Longitude lng = Longitude(longitude);

      if (_cache.contains(input)) {
        yield AutocompleteSearchSuccess(predictions: _cache.get(input));
      } else {
        Either<RestaurantFailure, List<AutocompleteResultEntity>>
            failureOrSuccess;

        failureOrSuccess = await _client.autocompleteSearch(
            input: input, latitude: lat, longitude: lng);

        yield failureOrSuccess.fold((f) => SearchStateError(failure: f), (p) {
          _cache.set(input, p); // update cache
          return AutocompleteSearchSuccess(predictions: p);
        });
      }
    }
  }
}

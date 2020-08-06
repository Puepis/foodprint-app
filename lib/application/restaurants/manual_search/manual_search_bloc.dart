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
import 'package:foodprint/domain/restaurants/value_objects.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'manual_search_event.dart';
part 'manual_search_state.dart';

/// BloC reponsible for the business logic behind the manual restaurant search process.
///
/// Maps incoming [ManualSearchEvent] to [ManualSearchState].
@injectable
class ManualSearchBloc extends Bloc<ManualSearchEvent, ManualSearchState> {
  /// Repository that handles the restaurant search
  final IRestaurantSearchRepository _client;

  /// Cache that stores previously-searched terms
  final AutocompleteSearchCache _cache;

  ManualSearchBloc(this._client, this._cache) : super(ManualSearchInitial());

  /// Overriding transformEvents in order to debounce the AutocompleteRestaurantsSearched event
  /// to give the user time to stop typing before searching.
  @override
  Stream<Transition<ManualSearchEvent, ManualSearchState>> transformEvents(
      Stream<ManualSearchEvent> events,
      TransitionFunction<ManualSearchEvent, ManualSearchState> transitionFn) {
    // No delay
    final nonDebounceStream =
        events.where((event) => event is! AutocompleteSearched);

    // Only emit events after 300ms have passed
    final debounceStream = events
        .where((event) => event is AutocompleteSearched)
        .debounceTime(const Duration(milliseconds: 300));
    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<ManualSearchState> mapEventToState(
    ManualSearchEvent event,
  ) async* {
    if (event is ResetManualSearch) {
      yield ManualSearchInitial();
    }
    if (event is AutocompleteSearched) {
      yield* _mapAutocompleteSearchToState(
          event.input, event.latitude, event.longitude);
    }
    if (event is RestaurantDetailSearched) {
      yield* _mapRestaurantDetailSearchToState(event.id);
    }
  }

  Stream<ManualSearchState> _mapAutocompleteSearchToState(
      String input, double latitude, double longitude) async* {
    if (input.isEmpty) {
      yield AutocompleteSearchEmptyState();
    } else {
      yield AutocompleteSearchLoading();
      final Latitude lat = Latitude(latitude);
      final Longitude lng = Longitude(longitude);

      if (_cache.contains(input)) {
        yield AutocompleteSearchSuccess(
            predictions: _cache.get(input), searchedStr: input);
      } else {
        final Either<RestaurantFailure, List<AutocompleteResultEntity>>
            failureOrSuccess = await _client.autocompleteSearch(
                input: input, latitude: lat, longitude: lng);

        yield failureOrSuccess.fold((f) => SearchStateError(failure: f), (p) {
          _cache.set(input, p); // update cache
          return AutocompleteSearchSuccess(predictions: p, searchedStr: input);
        });
      }
    }
  }

  Stream<ManualSearchState> _mapRestaurantDetailSearchToState(
      String id) async* {
    final resID = RestaurantID(id);

    if (resID.isValid()) {
      yield PlaceDetailSearchLoading();
      final Either<RestaurantFailure, RestaurantEntity> failureOrSuccess =
          await _client.fetchRestaurantDetails(id: resID);

      yield failureOrSuccess.fold((l) => SearchStateError(failure: l),
          (r) => PlaceDetailSearchSuccess(restaurant: r));
    }
  }
}

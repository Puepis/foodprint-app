import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/manual_search/autocomplete_result_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_failure.dart';

// Creates an abstraction between the infrastructure layer and the business logic (domain) layer
abstract class IRestaurantSearchRepository {
  Future<Either<RestaurantFailure, List<RestaurantEntity>>>
      searchNearbyRestaurants({
    @required Latitude latitude,
    @required Longitude longitude,
  });

  Future<Either<RestaurantFailure, List<AutocompleteResultEntity>>> autocompleteSearch({
    @required String input,
    @required Latitude latitude,
    @required Longitude longitude
  });
}

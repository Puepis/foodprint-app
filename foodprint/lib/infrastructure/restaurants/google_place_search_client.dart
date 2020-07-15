import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/manual_search/autocomplete_result_entity.dart';
import 'package:foodprint/domain/restaurants/i_restaurant_search_respository.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_failure.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';
import 'package:foodprint/infrastructure/restaurants/autocomplete_search_response.dart';
import 'package:foodprint/infrastructure/restaurants/nearby_search_response.dart';
import 'package:foodprint/infrastructure/restaurants/place_detail_search_response.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

// This class is responsible for searching for nearby restaurants and converting the response data into entities
@LazySingleton(as: IRestaurantSearchRepository)
class GooglePlaceSearchClient implements IRestaurantSearchRepository {
  static const String nearbySearchBaseUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json";


  static const String autocompleteSearchBaseUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";

  static const String placeDetailsBaseUrl =
      "https://maps.googleapis.com/maps/api/place/details/json";

  /// Uses the Google Maps API to search for restaurants around ([latitude], [longitude])
  ///
  /// If the search fails, a left([RestaurantFailure]) is returned indicating that
  /// something went wrong. Otherwise, a list of at most 5 restaurants is returned.
  @override
  Future<Either<RestaurantFailure, List<RestaurantEntity>>>
      searchNearbyRestaurants({Latitude latitude, Longitude longitude}) async {
    final lat = latitude.getOrCrash();
    final lng = longitude.getOrCrash();

    // Search url
    final String url =
        '$nearbySearchBaseUrl?key=${DotEnv().env['GOOGLE_API_KEY']}&location=$lat,$lng&rankby=distance&type=restaurant';

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      final status = data['status'];

      if (status == "OK") {
        var restaurants =
            GoogleNearbySearchResponse.parseResults(data['results'] as List);

        // Limit to 5 restaurants
        if (restaurants.length > 5) {
          restaurants = restaurants.sublist(0, 5);
        }
        return right(restaurants); // success

      } else if (status == "ZERO_RESULTS") {
        return right([]);
      } else if (status == "REQUEST_DENIED") {
        return left(const RestaurantFailure.requestDenied());
      } else if (status == "INVALID_REQUEST") {
        return left(const RestaurantFailure.invalidRequest());
      } else if (status == "OVER_QUERY_LIMIT") {
        return left(const RestaurantFailure.overQueryLimit());
      } else {
        return left(const RestaurantFailure.unexpectedSearchFailure());
      }
    } catch (e) {
      return left(const RestaurantFailure.unexpectedSearchFailure());
    }
  }

  @override
  Future<Either<RestaurantFailure, List<AutocompleteResultEntity>>>
      autocompleteSearch(
          {String input, Latitude latitude, Longitude longitude}) async {
    final String url =
        "$autocompleteSearchBaseUrl?key=${DotEnv().env['GOOGLE_API_KEY']}&input=$input&types=establishment&location=${latitude.getOrCrash()},${longitude.getOrCrash()}&radius=20000&strictbounds";

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      final status = data['status'];

      if (status == "OK") {
        final result = GoogleAutocompleteSearchResponse.fromJson(
            data as Map<String, dynamic>);
        return right(result.predictions); // success

      } else if (status == "ZERO_RESULTS") {
        return right([]);
      } else if (status == "REQUEST_DENIED") {
        return left(const RestaurantFailure.requestDenied());
      } else if (status == "INVALID_REQUEST") {
        return left(const RestaurantFailure.invalidRequest());
      } else if (status == "OVER_QUERY_LIMIT") {
        return left(const RestaurantFailure.overQueryLimit());
      } else {
        return left(const RestaurantFailure.unexpectedSearchFailure());
      }
    } catch (e) {
      return left(const RestaurantFailure.unexpectedSearchFailure());
    }
  }

  @override
  Future<Either<RestaurantFailure, RestaurantEntity>> fetchRestaurantDetails(
      {RestaurantID id}) async {
    final String url =
        "$placeDetailsBaseUrl?place_id=${id.getOrCrash()}&fields=place_id,name,geometry,rating&key=${DotEnv().env['GOOGLE_API_KEY']}";

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      final status = data['status'];

      if (status == "OK") {
        final result = GooglePlaceDetailSearchResponse.fromJson(
            data as Map<String, dynamic>);
        return right(result.restaurant); // success

      } else if (status == "ZERO_RESULTS" || status == "NOT_FOUND") {
        // location was valid before but not now
        return left(const RestaurantFailure.notFound());
      } else if (status == "REQUEST_DENIED") {
        return left(const RestaurantFailure.requestDenied());
      } else if (status == "INVALID_REQUEST") {
        return left(const RestaurantFailure.invalidRequest());
      } else if (status == "OVER_QUERY_LIMIT") {
        return left(const RestaurantFailure.overQueryLimit());
      } else {
        return left(const RestaurantFailure.unexpectedSearchFailure());
      }
    } catch (e) {
      return left(const RestaurantFailure.unexpectedSearchFailure());
    }
  }
}

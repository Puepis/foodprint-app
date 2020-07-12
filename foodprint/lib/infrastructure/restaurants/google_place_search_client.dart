import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/restaurants/i_restaurant_search_respository.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_failure.dart';
import 'package:foodprint/infrastructure/restaurants/place_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

// This class is responsible for searching for nearby restaurants and converting the response data into entities
@LazySingleton(as: IRestaurantSearchRepository)
class GooglePlaceSearchClient implements IRestaurantSearchRepository {
  static const String baseUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  /// Uses the Google Maps API to search for restaurants around ([latitude], [longitude])
  ///
  /// If the search fails, a left([RestaurantFailure]) is returned indicating that
  /// something went wrong. Otherwise, a list of at most 5 restaurants is returned.
  @override
  Future<Either<RestaurantFailure, List<RestaurantEntity>>> searchRestaurants(
      {Latitude latitude, Longitude longitude}) async {
    final lat = latitude.getOrCrash();
    final lng = longitude.getOrCrash();

    // Search url
    final String url =
        '$baseUrl?key=${DotEnv().env['GOOGLE_API_KEY']}&location=$lat,$lng&rankby=distance&type=restaurant';

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data['status'] == "OK") {
        var restaurants =
            GooglePlaceResponse.parseResults(data['results'] as List);

        // Limit to 5 restaurants
        if (restaurants.length > 5) {
          restaurants = restaurants.sublist(0, 5);
        }
        return right([]); // success

      } else if (data['status'] == "REQUEST_DENIED") {
        return left(const RestaurantFailure.requestDenied());
      } else {
        return left(const RestaurantFailure.unexpectedSearchFailure());
      }
    } catch (e) {
      return left(const RestaurantFailure.unexpectedSearchFailure());
    }
  }
}



import 'dart:convert';

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

  // TODO: secure API key
  static const String _apiKey = "AIzaSyCmqpu5zqDTZzDPLYTpWhMNGOz2CHOmUNU";
  static const String baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  @override
  Future<Either<RestaurantFailure, List<RestaurantEntity>>> searchRestaurants({Latitude latitude, Longitude longitude}) async {

    final lat = latitude.getOrCrash();
    final lng = longitude.getOrCrash();

    final String url = '$baseUrl?key=$_apiKey&location=$lat,$lng&rankby=distance&type=restaurant';

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      if (data['status'] == "OK") {
        final restaurants = 
          GooglePlaceResponse.parseResults(data['results'] as List).sublist(0, 5); // 5 closest restaurants
        return right(restaurants); // success

      } else if (data['status'] == "REQUEST_DENIED") {
        return left(const RestaurantFailure.requestDenied());

      } else {

        return left(const RestaurantFailure.unexpectedSearchFailure());
      }
    }
    catch (e) {
      return left(const RestaurantFailure.unexpectedSearchFailure());
    }
  }
}
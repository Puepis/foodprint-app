import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/foodprint/foodprint_failure.dart';
import 'package:foodprint/domain/foodprint/i_foodprint_repository.dart';
import 'package:foodprint/domain/restaurants/i_restaurant_search_respository.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';
import 'package:foodprint/infrastructure/foodprint/foodprint_dto.dart';
import 'package:foodprint/infrastructure/photos/photo_dtos.dart';
import 'package:foodprint/infrastructure/restaurants/restaurant_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

/// Responsible for communicating with the remote API to process the
/// user's foodprint.
@LazySingleton(as: IFoodprintRepository)
class RemoteFoodprintClient implements IFoodprintRepository {
  final IRestaurantSearchRepository _client;
  RemoteFoodprintClient(this._client);

  /// Fetches the user's foodprint given the user's [token]
  @override
  Future<Either<FoodprintFailure, FoodprintEntity>> getFoodprint(
      {@required JWT token}) async {
    final res = await http.get(
        '${DotEnv().env['SERVER_IP']}/api/users/foodprint',
        headers: {"authorization": "Bearer ${token.getOrCrash()}"});

    if (res.statusCode == 200) {
      final FoodprintEntity foodprint =
          (await _parseFoodprint(jsonDecode(res.body) as Map<String, dynamic>))
              .toEntity();
      return right(foodprint);
    } else if (res.statusCode == 403) {
      return left(const FoodprintFailure.unauthorizedToken());
    } else {
      return left(const FoodprintFailure.serverError());
    }
  }

  List<PhotoDTO> _parsePhotos(List photos) {
    return photos
        .map((i) => PhotoDTO.fromJSON(i as Map<String, dynamic>))
        .toList();
  }

  Future<FoodprintDTO> _parseFoodprint(Map<String, dynamic> json) async {
    final restaurants = json['foodprint'] as List;
    final Map<RestaurantDTO, List<PhotoDTO>> result = {};
    for (final restaurant in restaurants) {
      RestaurantDTO key;

      // Construct restaurant entity from the place id
      final placeID = restaurant['place_id'] as String;
      final fetchDetails =
          await _client.fetchRestaurantDetails(id: RestaurantID(placeID));

      fetchDetails.fold((l) => null, (r) => key = RestaurantDTO.fromEntity(r));
      final List<PhotoDTO> photos = _parsePhotos(restaurant['photos'] as List);
      if (key != null) result[key] = photos;
    }
    return FoodprintDTO(restaurantPhotos: result);
  }
}

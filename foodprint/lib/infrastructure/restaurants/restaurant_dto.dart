

import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_dto.freezed.dart';

// Data transfer object = model
@freezed
abstract class RestaurantDTO implements _$RestaurantDTO {
  const RestaurantDTO._();

  const factory RestaurantDTO({
    @required String placeId,
    @required String restaurantName,
    @required double rating,
    @required double latitude,
    @required double longitude,
  }) = _RestaurantDTO;

  // Convert entity to DTO
  factory RestaurantDTO.fromEntity(RestaurantEntity restaurant) {
    return RestaurantDTO(
      placeId: restaurant.restaurantID.getOrCrash(), 
      restaurantName: restaurant.restaurantName.getOrCrash(),
      rating: restaurant.restaurantRating.getOrCrash(),
      latitude: restaurant.latitude.getOrCrash(),
      longitude: restaurant.longitude.getOrCrash() 
    );
  }

  // Convert DTO to entity
  RestaurantEntity toEntity() {
    return RestaurantEntity(
      restaurantID: RestaurantID(placeId),
      restaurantName: RestaurantName(restaurantName),
      restaurantRating: RestaurantRating(rating),
      latitude: Latitude(latitude),
      longitude: Longitude(longitude),
    );
  }

  // Deserialize JSON
  factory RestaurantDTO.fromPlaceSearch(Map<String, dynamic> json) {
    return RestaurantDTO(
      placeId: json['place_id'] as String,
      restaurantName: json['name'].toString(),
      rating: (json['rating'] as num)?.toDouble() ?? -1,
      latitude: (json['geometry']['location']['lat'] as num)?.toDouble(),
      longitude: (json['geometry']['location']['lng'] as num)?.toDouble() 
    );
  }

  factory RestaurantDTO.fromFoodprintAPI(Map<String, dynamic> json) {
    return RestaurantDTO(
      placeId: json['restaurant_id'] as String,
      restaurantName: json['restaurant_name'] as String,
      rating: (json['restaurant_rating'] as num)?.toDouble(),
      latitude: (json['restaurant_lat'] as num)?.toDouble(),
      longitude: (json['restaurant_lng'] as num)?.toDouble()
    );
  }
}


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
    @required List<String> types,
  }) = _RestaurantDTO;

  // Convert entity to DTO
  factory RestaurantDTO.fromEntity(RestaurantEntity restaurant) {
    return RestaurantDTO(
      placeId: restaurant.restaurantID.getOrCrash(), 
      restaurantName: restaurant.restaurantName.getOrCrash(),
      rating: restaurant.restaurantRating.getOrCrash(),
      latitude: restaurant.latitude.getOrCrash(),
      longitude: restaurant.longitude.getOrCrash(), 
      types: restaurant.types.getOrCrash(),
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
      types: RestaurantTypes(types),
    );
  }

  // Deserialize JSON
  factory RestaurantDTO.fromPlaceSearches(Map<String, dynamic> json) {
    return RestaurantDTO(
      placeId: json['place_id'] as String,
      restaurantName: json['name'] as String,
      rating: json['rating'] == null ? -1.0 : double.parse(json['rating'].toString()),
      latitude: double.parse(json['geometry']['location']['lat'].toString()),
      longitude: double.parse(json['geometry']['location']['lng'].toString()),
      types: List<String>.from(json['types'] as List), 
    );
  }


  factory RestaurantDTO.fromFoodprintAPI(Map<String, dynamic> json) {
    return RestaurantDTO(
      placeId: json['restaurant_id'] as String,
      restaurantName: json['restaurant_name'] as String,
      rating: double.parse(json['restaurant_rating'].toString()),
      latitude: double.parse(json['restaurant_lat'].toString()),
      longitude: double.parse(json['restaurant_lng'].toString()),
      types: List<String>.from(json['restaurant_types'] as List)
    );
  }
}
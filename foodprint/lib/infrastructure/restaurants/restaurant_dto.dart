

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
    @required String address,
    @required String restaurantName,
    @required double rating,
    @required int priceLevel,
    @required double latitude,
    @required double longitude,
  }) = _RestaurantDTO;

  // Convert entity to DTO
  factory RestaurantDTO.fromEntity(RestaurantEntity restaurant) {
    return RestaurantDTO(
      placeId: restaurant.restaurantID.getOrCrash(), 
      address: restaurant.restaurantAddress.getOrCrash(), 
      restaurantName: restaurant.restaurantName.getOrCrash(),
      rating: restaurant.restaurantRating.getOrCrash(),
      priceLevel: restaurant.restaurantPriceLevel.getOrCrash(),
      latitude: restaurant.latitude.getOrCrash(),
      longitude: restaurant.longitude.getOrCrash() 
    );
  }

  // Convert DTO to entity
  RestaurantEntity toEntity() {
    return RestaurantEntity(
      restaurantAddress: RestaurantAddress(address),
      restaurantID: RestaurantID(placeId),
      restaurantName: RestaurantName(restaurantName),
      restaurantRating: RestaurantRating(rating),
      restaurantPriceLevel: RestaurantPriceLevel(priceLevel),
      latitude: Latitude(latitude),
      longitude: Longitude(longitude),
    );
  }

  // Deserialize JSON
  factory RestaurantDTO.fromPlaceSearch(Map<String, dynamic> json) {
    return RestaurantDTO(
      placeId: json['place_id'] as String,
      address: json['formatted_address'].toString(),
      restaurantName: json['name'].toString(),
      rating: (json['rating'] as num)?.toDouble(),
      priceLevel: json['price_level'] as int,
      latitude: (json['geometry']['location']['lat'] as num)?.toDouble(),
      longitude: (json['geometry']['location']['lng'] as num)?.toDouble() 
    );
  }

  factory RestaurantDTO.fromFoodprintAPI(Map<String, dynamic> json) {
    return RestaurantDTO(
      placeId: json['restaurant_id'] as String,
      address: json['restaurant_address'] as String,
      restaurantName: json['restaurant_name'] as String,
      rating: (json['restaurant_rating'] as num)?.toDouble(),
      priceLevel: json['price_level'] as int,
      latitude: (json['restaurant_lat'] as num)?.toDouble(),
      longitude: (json['restaurant_lng'] as num)?.toDouble()
    );
  }
}
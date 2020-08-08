import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_dto.freezed.dart';

@freezed
abstract class RestaurantDTO implements _$RestaurantDTO {
  const RestaurantDTO._();

  const factory RestaurantDTO({
    @required String placeId,
    @required String name,
    @required double rating,
    @required double latitude,
    @required double longitude,
    @required List<String> types,
  }) = _RestaurantDTO;

  // Convert entity to DTO
  factory RestaurantDTO.fromEntity(RestaurantEntity restaurant) {
    return RestaurantDTO(
      placeId: restaurant.id.getOrCrash(),
      name: restaurant.name.getOrCrash(),
      rating: restaurant.rating.getOrCrash(),
      latitude: restaurant.latitude.getOrCrash(),
      longitude: restaurant.longitude.getOrCrash(),
      types: restaurant.types.getOrCrash(),
    );
  }

  // Convert DTO to entity
  RestaurantEntity toEntity() {
    return RestaurantEntity(
      id: RestaurantID(placeId),
      name: RestaurantName(name),
      rating: RestaurantRating(rating),
      latitude: Latitude(latitude),
      longitude: Longitude(longitude),
      types: RestaurantTypes(types),
    );
  }

  // Deserialize JSON
  factory RestaurantDTO.fromPlaceSearches(Map<String, dynamic> json) {
    return RestaurantDTO(
      placeId: json['place_id'] as String,
      name: json['name'] as String,
      rating: json['rating'] == null
          ? 0.01
          : double.parse(json['rating'].toString()),
      latitude: double.parse(json['geometry']['location']['lat'].toString()),
      longitude: double.parse(json['geometry']['location']['lng'].toString()),
      types: _parseTypesFromPlaceSearches(json['types'] as List),
    );
  }

  static List<String> _parseTypesFromPlaceSearches(List types) {
    // Only keep one of [bar, bakery, cafe, restaurant]
    final List<String> result = List<String>.from(types);
    if (result.contains("bar")) {
      return ["bar"];
    }
    if (result.contains("bakery")) {
      return ["bakery"];
    }
    if (result.contains("cafe")) {
      return ["cafe"];
    }
    return ["restaurant"];
  }
}

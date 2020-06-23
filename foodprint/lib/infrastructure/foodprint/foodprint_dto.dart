
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/infrastructure/photos/photo_dtos.dart';
import 'package:foodprint/infrastructure/restaurants/restaurant_dtos.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foodprint_dto.freezed.dart';

// Foodprint model
@freezed
abstract class FoodprintDTO implements _$FoodprintDTO {
  const FoodprintDTO._();

  const factory FoodprintDTO({
    @required Map<RestaurantDTO, List<PhotoDTO>> restaurantPhotos
  }) = _FoodprintDTO;

  // Convert entity to DTO
  factory FoodprintDTO.fromEntity(FoodprintEntity foodprint) {
    return FoodprintDTO(
      restaurantPhotos: foodprint.restaurantPhotos.map((key, value) => 
        MapEntry(RestaurantDTO.fromEntity(key), value.map((e) => PhotoDTO.fromEntity(e)).toList()))
    );
  }

  FoodprintEntity toEntity() {
    return FoodprintEntity(
      restaurantPhotos: restaurantPhotos.map((key, value) => 
        MapEntry(key.toEntity(), value.map((e) => e.toEntity()).toList())) 
    );
  }


  factory FoodprintDTO.fromJSON(Map<String, dynamic> json) {
    return FoodprintDTO(
        restaurantPhotos: parseFoodprint(json['foodprint'] as List)
    );
  }

  // Each foodprint response is a list of restaurants with a .photos field
  static Map<RestaurantDTO, List<PhotoDTO>> parseFoodprint(List restaurants){
    final Map<RestaurantDTO, List<PhotoDTO>> result = {};
    for (final restaurant in restaurants) {
      final key = RestaurantDTO.fromJSON(restaurant as Map<String, dynamic>);
      final List<PhotoDTO> photos = parsePhotos(restaurant['photos'] as List);
      result[key] = photos;
    }
    return result;
  }

  static List<PhotoDTO> parsePhotos(List photos){
    return photos.map((i) => PhotoDTO.fromJSON(i as Map<String, dynamic>)).toList();
  }
}


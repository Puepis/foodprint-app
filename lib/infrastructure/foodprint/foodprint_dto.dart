
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/infrastructure/photos/photo_dtos.dart';
import 'package:foodprint/infrastructure/restaurants/restaurant_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foodprint_dto.freezed.dart';

/// Foodprint data-transfer-object (intermediary between JSON and classes). 
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
}


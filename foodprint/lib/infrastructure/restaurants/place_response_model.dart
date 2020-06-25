import 'package:flutter/material.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/infrastructure/restaurants/restaurant_dto.dart';

class GooglePlaceResponse {
  final List<String> attributions;
  final List<RestaurantEntity> results;
  GooglePlaceResponse({@required this.attributions, @required this.results});

  factory GooglePlaceResponse.fromJson(Map<String, dynamic> json) {
    return GooglePlaceResponse(
      attributions: List<String>.from(json['html_attributions'] as List),
      results: parseResults(json['results'] as List),
    );
  }

  static List<RestaurantEntity> parseResults(List results) {
    return results.map((i) => RestaurantDTO.fromPlaceSearch(i as Map<String, dynamic>).toEntity()).toList();
  }
}

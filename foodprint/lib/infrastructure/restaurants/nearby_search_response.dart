import 'package:flutter/material.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/infrastructure/restaurants/restaurant_dto.dart';

class GoogleNearbySearchResponse {
  final List<String> attributions;
  final List<RestaurantEntity> results;
  GoogleNearbySearchResponse({@required this.attributions, @required this.results});

  factory GoogleNearbySearchResponse.fromJson(Map<String, dynamic> json) {
    return GoogleNearbySearchResponse(
      attributions: List<String>.from(json['html_attributions'] as List),
      results: parseResults(json['results'] as List),
    );
  }

  static List<RestaurantEntity> parseResults(List results) {
    return results.map((i) => RestaurantDTO.fromNearbyPlaceSearch(i as Map<String, dynamic>).toEntity()).toList();
  }
}

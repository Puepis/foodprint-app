import 'package:flutter/material.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/infrastructure/restaurants/restaurant_dto.dart';

class GoogleNearbySearchResponse {
  final String status;
  final List<String> attributions;
  final List<RestaurantEntity> results;
  GoogleNearbySearchResponse(
      {@required this.status,
      @required this.attributions,
      @required this.results});

  factory GoogleNearbySearchResponse.fromJson(Map<String, dynamic> json) {
    return GoogleNearbySearchResponse(
      status: json['status'] as String,
      attributions: List<String>.from(json['html_attributions'] as List),
      results: parseResults(json['results'] as List),
    );
  }

  static List<RestaurantEntity> parseResults(List results) {
    return results
        .map((i) => RestaurantDTO.fromPlaceSearches(i as Map<String, dynamic>)
            .toEntity())
        .toList();
  }
}

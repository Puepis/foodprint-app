import 'package:flutter/material.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/infrastructure/restaurants/restaurant_dto.dart';

class GooglePlaceDetailSearchResponse {
  final String status;
  final List<String> attributions;
  final RestaurantEntity restaurant;
  GooglePlaceDetailSearchResponse(
      {@required this.status,
      @required this.attributions,
      @required this.restaurant});

  factory GooglePlaceDetailSearchResponse.fromJson(Map<String, dynamic> json) {
    return GooglePlaceDetailSearchResponse(
      status: json['status'] as String,
      attributions: List<String>.from(json['html_attributions'] as List),
      restaurant: parseResults(json['result'] as Map<String, dynamic>),
    );
  }

  static RestaurantEntity parseResults(Map<String, dynamic> result) {
    return RestaurantDTO.fromPlaceSearches(result).toEntity();
  }
}

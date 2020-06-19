import 'package:flutter/material.dart';
import 'restaurant_result.dart';

class GooglePlaceResponse {
  final List<String> attributions;
  final List<RestaurantResult> results;
  GooglePlaceResponse({@required this.attributions, @required this.results});

  factory GooglePlaceResponse.fromJson(Map<String, dynamic> json) {
    return GooglePlaceResponse(
      attributions: List<String>.from(json['html_attributions'] as List),
      results: parseResults(json['results'] as List),
    );
  }

  static List<RestaurantResult> parseResults(List results) {
    return results.map((i) => RestaurantResult.fromJson(i as Map<String, dynamic>)).toList();
  }
}

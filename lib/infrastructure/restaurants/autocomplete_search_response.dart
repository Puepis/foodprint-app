import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/manual_search/autocomplete_result_entity.dart';

class GoogleAutocompleteSearchResponse {
  final String status;
  final List<AutocompleteResultEntity> predictions;

  GoogleAutocompleteSearchResponse(
      {@required this.status, @required this.predictions});

  factory GoogleAutocompleteSearchResponse.fromJson(Map<String, dynamic> json) {
    return GoogleAutocompleteSearchResponse(
      status: json['status'] as String,
      predictions: parseResults(json['predictions'] as List),
    );
  }

  static List<AutocompleteResultEntity> parseResults(List results) {
    return results
        .map(
            (e) => AutocompleteResultEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

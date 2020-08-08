import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';

/// The result of a Google autocomplete search.
class AutocompleteResultEntity {
  final RestaurantID id;
  final RestaurantName name;
  final String secondaryText;
  final List<String> types;

  AutocompleteResultEntity(
      {@required this.id,
      @required this.name,
      @required this.secondaryText,
      @required this.types})
      : assert(secondaryText != null);

  factory AutocompleteResultEntity.fromJson(Map<String, dynamic> json) {
    return AutocompleteResultEntity(
        types: List<String>.from(json['types'] as List),
        id: RestaurantID(json['place_id'] as String),
        name: RestaurantName(
            json['structured_formatting']['main_text'] as String),
        secondaryText:
            json['structured_formatting']['secondary_text'] as String);
  }
}

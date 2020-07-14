import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';

class AutocompleteResultEntity {
  final RestaurantID id;
  final RestaurantName name;
  final String secondaryText;

  AutocompleteResultEntity(
      {@required this.id, @required this.name, @required this.secondaryText})
      : assert(secondaryText != null);

  factory AutocompleteResultEntity.fromJson(Map<String, dynamic> json) {
    return AutocompleteResultEntity(
        id: RestaurantID(json['place_id'] as String),
        name: RestaurantName(
            json['structured_formatting']['main_text'] as String),
        secondaryText:
            json['structured_formatting']['secondary_text'] as String);
  }
}

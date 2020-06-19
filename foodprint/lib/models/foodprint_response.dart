
/*
 * This model class defines the information stored with every photograph taken.
 */

import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';

class FoodprintResponse {

  final Map<Restaurant, List<FoodprintPhoto>> foodprint;
  FoodprintResponse({this.foodprint});

  factory FoodprintResponse.fromJson(Map<String, dynamic> json) {
    return FoodprintResponse(
        foodprint: parseFoodprint(json['foodprint'] as List<dynamic>)
    );
  }

  // Each foodprint response is a list of restaurants with a .photos field
  static Map<Restaurant, List<FoodprintPhoto>> parseFoodprint(List<dynamic> restaurants){
    final Map<Restaurant, List<FoodprintPhoto>> result = {};
    for (final restaurant in restaurants) {
      final key = Restaurant.fromJson(restaurant as Map<String, dynamic>);
      final List<FoodprintPhoto> photos = parsePhotos(restaurant['photos'] as List<dynamic>);
      result[key] = photos;
    }
    return result;
  }

  static List<FoodprintPhoto> parsePhotos(List<dynamic> list){
    return list.map((i) => FoodprintPhoto.fromPG(i as Map<String, dynamic>)).toList();
  }
}
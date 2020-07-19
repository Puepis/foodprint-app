import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

class RestaurantPhotosArgs {
  final RestaurantEntity restaurant;
  final List<PhotoEntity> photos;
  RestaurantPhotosArgs({@required this.photos, @required this.restaurant});
}

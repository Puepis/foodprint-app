import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

class FullImageArgs {
  final PhotoEntity photo;
  final RestaurantEntity restaurant;

  FullImageArgs(this.photo, this.restaurant);
}

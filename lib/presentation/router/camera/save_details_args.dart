import 'dart:io';

import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

class SaveDetailsArgs {
  final RestaurantEntity restaurant;
  final File imageFile;

  SaveDetailsArgs(this.restaurant, this.imageFile);
}

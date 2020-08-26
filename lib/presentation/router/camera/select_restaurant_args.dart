import 'dart:io';

import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

class SelectRestaurantArgs {
  final File imageFile;
  final List<RestaurantEntity> restaurants;
  final double latitude;
  final double longitude;

  SelectRestaurantArgs(this.imageFile, this.restaurants,
      this.latitude, this.longitude);
}

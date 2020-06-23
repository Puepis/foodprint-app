import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

// Interface
abstract class ILocalFoodprintRepository {

  // Add a photo to the current local foodprint
  FoodprintEntity addPhotoToFoodprint({
    @required PhotoEntity newPhoto,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity oldFoodprint
  }); 

  // Update the local foodprint with an edited photo
  FoodprintEntity editPhotoInFoodprint({
    @required PhotoEntity photo,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity oldFoodprint
  });

  // Delete a photo from local foodprint
  FoodprintEntity removePhotoFromFoodprint({
    @required PhotoEntity photo,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity oldFoodprint
  });
}
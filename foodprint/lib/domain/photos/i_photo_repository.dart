import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/user.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/photos/photo_failure.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

// Interface
abstract class IPhotoRepository {
  
  // Save a new photo and return the updated foodprint
  Future<Either<PhotoFailure, FoodprintEntity>> saveNewPhoto({
    @required User user,
    @required PhotoEntity photo,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity oldFoodprint
  });

  // Edit an existing photo and return the updated foodprint
  Future<Either<PhotoFailure, FoodprintEntity>> updatePhotoDetails({
    @required PhotoEntity oldPhoto,
    @required PhotoDetailEntity photoDetail,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity oldFoodprint
  });

  // Delete an existing photo and return the updated foodprint
  Future<Either<PhotoFailure, FoodprintEntity>> deletePhoto({
    @required PhotoEntity photo,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity oldFoodprint
  });
}
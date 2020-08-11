import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/photos/photo_failure.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';

/// The abstract interface representing the actions users can take with their
/// photos.
abstract class IPhotoRepository {
  // Save a new photo and return the updated foodprint
  Future<Either<PhotoFailure, PhotoEntity>> saveNewPhoto({
    @required UserID userID,
    @required PhotoData data,
    @required PhotoEntity photo,
    @required RestaurantID placeID,
  });

  // Edit an existing photo and return the updated foodprint
  Future<Either<PhotoFailure, Unit>> updatePhoto({
    @required PhotoEntity newPhoto,
  });

  // Delete an existing photo and return the updated foodprint
  Future<Either<PhotoFailure, Unit>> deletePhoto({
    @required PhotoEntity photo,
  });

  Future<Either<PhotoFailure, Unit>> updateFavourite({
    @required PhotoEntity updatedPhoto,
  });
}

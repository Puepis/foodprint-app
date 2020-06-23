import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/photos/foodprint_photo_entity.dart';
import 'package:foodprint/domain/photos/photo_failure.dart';

// Interface
abstract class IPhotoRepository {
  Future<Either<PhotoFailure, Unit>> create(FoodprintPhotoEntity photo);
  Future<Either<PhotoFailure, Unit>> update(FoodprintPhotoEntity photo);
  Future<Either<PhotoFailure, Unit>> delete(FoodprintPhotoEntity photo);
}
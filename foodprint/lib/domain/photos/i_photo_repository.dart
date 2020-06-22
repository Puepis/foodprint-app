import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/photos/foodprint_photo.dart';
import 'package:foodprint/domain/photos/photo_failure.dart';

abstract class IPhotoRepository {
  Future<Either<PhotoFailure, Unit>> create(FoodprintPhoto photo);
  Future<Either<PhotoFailure, Unit>> update(FoodprintPhoto photo);
  Future<Either<PhotoFailure, Unit>> delete(FoodprintPhoto photo);
}
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/foodprint/foodprint_failure.dart';

abstract class IFoodprintRepository {
  Future<Either<FoodprintFailure, FoodprintEntity>> getFoodprint(
      {@required JWT token});
}

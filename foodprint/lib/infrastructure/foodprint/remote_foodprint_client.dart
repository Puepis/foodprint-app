

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/foodprint/foodprint_failure.dart';
import 'package:foodprint/domain/foodprint/i_remote_foodprint_repository.dart';
import 'package:foodprint/infrastructure/core/tokens.dart';
import 'package:foodprint/infrastructure/foodprint/foodprint_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IRemoteFoodprintRepository)
class RemoteFoodprintClient implements IRemoteFoodprintRepository {

  // Fetch the user's foodprint
  @override
  Future<Either<FoodprintFailure, FoodprintEntity>> getFoodprint({@required JWT token}) async {

    final res = await http.get(
        '$serverIP/api/users/foodprint',
        headers: {"authorization": "Bearer ${token.getOrCrash()}"}
    );

    if (res.statusCode == 200) {
      final FoodprintEntity foodprint = FoodprintDTO.fromJSON(jsonDecode(res.body) as Map<String, dynamic>).toEntity();
      return right(foodprint);
    } 
    else if (res.statusCode == 403) {
      return left(const FoodprintFailure.unauthorizedToken());
    }
    else {
      return left(const FoodprintFailure.serverError());
    }
  }
}
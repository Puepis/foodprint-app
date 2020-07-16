import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/foodprint/foodprint_failure.dart';
import 'package:foodprint/domain/foodprint/i_remote_foodprint_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'foodprint_event.dart';
part 'foodprint_state.dart';
part 'foodprint_bloc.freezed.dart';

// Foodprint BLoC
@injectable
class FoodprintBloc extends Bloc<FoodprintEvent, FoodprintState> {
  final IRemoteFoodprintRepository _remoteClient;

  FoodprintBloc(this._remoteClient) : super(const FoodprintState.initial());

  @override
  Stream<FoodprintState> mapEventToState(
    FoodprintEvent event,
  ) async* {
    yield const FoodprintState.inProgress(); // reset state
    yield* event.map(foodprintRequested: (e) async* {
      yield* _mapFoodprintRequestedToState(e.token);
    }, localFoodprintUpdated: (e) async* {
      yield FoodprintState.foodprintUpdated(foodprint: e.newFoodprint);
    });
  }

  Stream<FoodprintState> _mapFoodprintRequestedToState(JWT token) async* {
    final Either<FoodprintFailure, FoodprintEntity> result =
        await _remoteClient.getFoodprint(token: token);
    yield result.fold(
        (f) => FoodprintState.fetchFoodprintFailure(f),
        (foodprint) =>
            FoodprintState.fetchFoodprintSuccess(foodprint: foodprint));
  }
}

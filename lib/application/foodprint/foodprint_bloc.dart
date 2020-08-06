import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/foodprint/foodprint_failure.dart';
import 'package:foodprint/domain/foodprint/i_foodprint_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'foodprint_event.dart';
part 'foodprint_state.dart';
part 'foodprint_bloc.freezed.dart';

/// The BLoC that is reponsible for retrieving the user's foodprint.
///
/// Maps incoming [FoodprintEvent] to [FoodprintState].
@injectable
class FoodprintBloc extends Bloc<FoodprintEvent, FoodprintState> {
  final IFoodprintRepository _remoteClient;

  FoodprintBloc(this._remoteClient) : super(const FoodprintState.initial());

  @override
  Stream<FoodprintState> mapEventToState(
    FoodprintEvent event,
  ) async* {
    yield const FoodprintState.inProgress(); // reset state
    yield* _mapFoodprintRequestedToState(event.token);
  }

  Stream<FoodprintState> _mapFoodprintRequestedToState(JWT token) async* {
    final Either<FoodprintFailure, FoodprintEntity> result =
        await _remoteClient.getFoodprint(token: token);
    yield result.fold(
        (failure) => FoodprintState.fetchFoodprintFailure(failure),
        (foodprint) =>
            FoodprintState.fetchFoodprintSuccess(foodprint: foodprint));
  }
}

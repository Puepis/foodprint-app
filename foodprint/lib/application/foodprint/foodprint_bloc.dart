import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/foodprint/foodprint_failure.dart';
import 'package:foodprint/domain/foodprint/i_local_foodprint_repository.dart';
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
  final ILocalFoodprintRepository _localClient;

  FoodprintBloc(this._remoteClient, this._localClient);
  
  @override
  FoodprintState get initialState => const FoodprintState.intial();

  @override
  Stream<FoodprintState> mapEventToState(
    FoodprintEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

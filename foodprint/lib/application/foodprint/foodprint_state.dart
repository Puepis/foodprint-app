part of 'foodprint_bloc.dart';

@freezed
abstract class FoodprintState with _$FoodprintState {
  const factory FoodprintState.initial() = FoodprintStateInitial;
  const factory FoodprintState.inProgress() = InProgress;
  const factory FoodprintState.fetchFoodprintSuccess({@required FoodprintEntity foodprint}) = FetchFoodprintSuccess;
  const factory FoodprintState.fetchFoodprintFailure(FoodprintFailure failure) = FetchFoodprintFailure;
}
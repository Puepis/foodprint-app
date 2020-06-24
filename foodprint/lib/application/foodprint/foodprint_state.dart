part of 'foodprint_bloc.dart';

@freezed
abstract class FoodprintState with _$FoodprintState {
  const factory FoodprintState.initial() = Initial;
  const factory FoodprintState.inProgress() = InProgress;
  const factory FoodprintState.fetchFoodprintSuccess({@required FoodprintEntity foodprint}) = FetchFoodprintSuccess;
  const factory FoodprintState.fetchFoodprintFailure(FoodprintFailure failure) = FetchFoodprintFailure;
  const factory FoodprintState.foodprintUpdated({@required FoodprintEntity foodprint}) = FoodprintUpdated;
}
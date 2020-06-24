part of 'foodprint_bloc.dart';

@freezed
abstract class FoodprintEvent with _$FoodprintEvent {
  const factory FoodprintEvent.foodprintRequested({
    @required JWT token 
  }) = FoodprintRequested;
  const factory FoodprintEvent.localFoodprintUpdated({
    @required FoodprintEntity newFoodprint
  }) = LocalFoodprintUpdated;
}

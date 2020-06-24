part of 'photo_actions_bloc.dart';

@freezed
abstract class PhotoActionsEvent with _$PhotoActionsEvent {
  const factory PhotoActionsEvent.deleted({
    @required PhotoEntity photo,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity foodprint
  }) = Deleted;

  const factory PhotoActionsEvent.edited({
    @required PhotoEntity oldPhoto,
    @required String newName,
    @required String newPrice,
    @required String newComments,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity foodprint 
  }) = Edited;
  
  const factory PhotoActionsEvent.saved({
    @required UserID userID,
    @required File imageFile,
    @required String itemName,
    @required String price,
    @required String comments,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity foodprint
  }) = Saved;
}

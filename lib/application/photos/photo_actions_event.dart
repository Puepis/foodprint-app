part of 'photo_actions_bloc.dart';

@freezed
abstract class PhotoActionsEvent with _$PhotoActionsEvent {
  const factory PhotoActionsEvent.deleted({
    @required JWT accessToken,
    @required PhotoEntity photo,
  }) = Deleted;

  const factory PhotoActionsEvent.edited({
    @required JWT accessToken,
    @required PhotoEntity oldPhoto,
    @required String newName,
    @required String newPrice,
    @required String newComments,
    @required bool isFavourite,
  }) = Edited;

  const factory PhotoActionsEvent.saved({
    @required JWT accessToken, 
    @required File imageFile,
    @required String itemName,
    @required String price,
    @required String comments,
    @required RestaurantID placeID,
  }) = Saved;

  const factory PhotoActionsEvent.favouriteChanged({
    @required JWT accessToken,
    @required PhotoEntity photo,
    @required bool newFavourite,
  }) = FavouriteChanged;
}

part of 'photo_actions_bloc.dart';

@freezed
abstract class PhotoActionsState with _$PhotoActionsState {
  const factory PhotoActionsState.initial() = Initial;
  const factory PhotoActionsState.actionInProgress() = ActionInProgress;
  const factory PhotoActionsState.deleteFailure(PhotoFailure failure) =
      DeleteFailure;
  const factory PhotoActionsState.deleteSuccess() = DeleteSuccess;
  const factory PhotoActionsState.editFailure(PhotoFailure failure) =
      EditFailure;
  const factory PhotoActionsState.editSuccess(PhotoEntity newPhoto) =
      EditSuccess;
  const factory PhotoActionsState.saveFailure(PhotoFailure failure) =
      SaveFailure;
  const factory PhotoActionsState.saveSuccess(PhotoEntity newPhoto) =
      SaveSuccess;
  const factory PhotoActionsState.changeFavouriteFailure(PhotoFailure failure) =
      ChangeFavouriteFailure;
  const factory PhotoActionsState.changeFavouriteSuccess({bool isFavourite}) =
      ChangeFavouriteSuccess;
}

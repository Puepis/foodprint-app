part of 'account_bloc.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState.initial() = Initial;
  const factory AccountState.avatarChangeLoading() = AvatarChangeLoading;
  const factory AccountState.usernameChangeLoading() = UsernameChangeLoading;
  const factory AccountState.passwordChangeLoading() = PasswordChangeLoading;
  const factory AccountState.deleteAccountLoading() = DeleteAccountLoading;
  const factory AccountState.usernameChangeSuccess({@required JWT token}) =
      UsernameChangeSuccess;
  const factory AccountState.passwordChangeSuccess() = PasswordChangeSuccess;
  const factory AccountState.avatarChangeSuccess({@required JWT token}) =
      AvatarChangeSuccess;
  const factory AccountState.deleteAccountSuccess() = DeleteAccountSuccess;
  const factory AccountState.usernameChangeError(
      {@required AccountFailure failure}) = UsernameChangeError;
  const factory AccountState.passwordChangeError(
      {@required AccountFailure failure}) = PasswordChangeError;
  const factory AccountState.avatarChangeError(
      {@required AccountFailure failure}) = AvatarChangeError;
  const factory AccountState.deleteAccountError(
      {@required AccountFailure failure}) = DeleteAccountError;
}

part of 'account_bloc.dart';

@freezed
abstract class AccountEvent with _$AccountEvent {
  const factory AccountEvent.avatarChanged({
    @required JWT accessToken,
    @required File newAvatarFile,
  }) = AvatarChanged;
  const factory AccountEvent.usernameChanged({
    @required JWT accessToken,
    @required String newUsername,
  }) = AccountUsernameChanged;
const factory AccountEvent.passwordChanged({
    @required JWT accessToken,
    @required String oldPassword,
    @required String newPassword,
  }) = AccountPasswordChanged;
const factory AccountEvent.accountDeleted({
    @required JWT accessToken,
  }) = AccountDeleted;
}

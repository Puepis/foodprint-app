part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AvatarChanged extends AccountEvent {
  final JWT token;
  final File newAvatarFile;
  const AvatarChanged({@required this.token, @required this.newAvatarFile});

  @override
  List<Object> get props => [token, newAvatarFile];

  @override
  String toString() {
    return "Avatar Changed";
  }
}

class AccountUsernameChanged extends AccountEvent {
  final JWT token;
  final String newUsername;
  const AccountUsernameChanged(
      {@required this.token, @required this.newUsername});

  @override
  List<Object> get props => [token, newUsername];

  @override
  String toString() {
    return "Account username changed to: $newUsername";
  }
}

class AccountPasswordChanged extends AccountEvent {
  final JWT token;
  final String oldPassword;
  final String newPassword;
  const AccountPasswordChanged(
      {@required this.token,
      @required this.oldPassword,
      @required this.newPassword});

  @override
  List<Object> get props => [token, oldPassword, newPassword];

  @override
  String toString() {
    return "Account password changed to: $newPassword";
  }
}

class AccountDeleted extends AccountEvent {
  final JWT token;
  const AccountDeleted({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() {
    return "Account deleted";
  }
}

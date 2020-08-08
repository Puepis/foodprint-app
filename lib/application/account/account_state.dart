part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AvatarChangeLoading extends AccountState {}
class UsernameChangeLoading extends AccountState {}
class PasswordChangeLoading extends AccountState {}
class DeleteAccountLoading extends AccountState {}

/// Contains new JWT with the updated username
class UsernameChangeSuccess extends AccountState {
  final JWT token;
  const UsernameChangeSuccess({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() {
    return "Username successfully changed";
  }
}

class AvatarChangeSuccess extends AccountState {
  final JWT token;
  const AvatarChangeSuccess({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() {
    return "Avatar successfully changed";
  }
}

class PasswordChangeSuccess extends AccountState {}

class DeleteAccountSuccess extends AccountState {}

class UsernameChangeError extends AccountState {
  final AccountFailure failure;

  const UsernameChangeError({@required this.failure});

  @override
  List<Object> get props => [failure];

  @override
  String toString() => 'Username Change Error { error: ${failure.toString()} }';
}

class PasswordChangeError extends AccountState {
  final AccountFailure failure;

  const PasswordChangeError({@required this.failure});

  @override
  List<Object> get props => [failure];

  @override
  String toString() => 'Password Change Error { error: ${failure.toString()} }';
}

class AvatarChangeError extends AccountState {
  final AccountFailure failure;

  const AvatarChangeError({@required this.failure});

  @override
  List<Object> get props => [failure];

  @override
  String toString() => 'Avatar Change Error { error: ${failure.toString()} }';
}

class DeleteAccountError extends AccountState {
  final AccountFailure failure;

  const DeleteAccountError({@required this.failure});

  @override
  List<Object> get props => [failure];

  @override
  String toString() =>
      'Error Deleting Account { error: ${failure.toString()} }';
}

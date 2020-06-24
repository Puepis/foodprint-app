// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {@required UserID id,
      @required Username username,
      @required JWT token,
      @required LatLng location,
      @required FoodprintEntity foodprint}) {
    return _User(
      id: id,
      username: username,
      token: token,
      location: location,
      foodprint: foodprint,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  UserID get id;
  Username get username;
  JWT get token;
  LatLng get location;
  FoodprintEntity get foodprint;

  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {UserID id,
      Username username,
      JWT token,
      LatLng location,
      FoodprintEntity foodprint});

  $FoodprintEntityCopyWith<$Res> get foodprint;
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object id = freezed,
    Object username = freezed,
    Object token = freezed,
    Object location = freezed,
    Object foodprint = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UserID,
      username: username == freezed ? _value.username : username as Username,
      token: token == freezed ? _value.token : token as JWT,
      location: location == freezed ? _value.location : location as LatLng,
      foodprint: foodprint == freezed
          ? _value.foodprint
          : foodprint as FoodprintEntity,
    ));
  }

  @override
  $FoodprintEntityCopyWith<$Res> get foodprint {
    if (_value.foodprint == null) {
      return null;
    }
    return $FoodprintEntityCopyWith<$Res>(_value.foodprint, (value) {
      return _then(_value.copyWith(foodprint: value));
    });
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserID id,
      Username username,
      JWT token,
      LatLng location,
      FoodprintEntity foodprint});

  @override
  $FoodprintEntityCopyWith<$Res> get foodprint;
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object id = freezed,
    Object username = freezed,
    Object token = freezed,
    Object location = freezed,
    Object foodprint = freezed,
  }) {
    return _then(_User(
      id: id == freezed ? _value.id : id as UserID,
      username: username == freezed ? _value.username : username as Username,
      token: token == freezed ? _value.token : token as JWT,
      location: location == freezed ? _value.location : location as LatLng,
      foodprint: foodprint == freezed
          ? _value.foodprint
          : foodprint as FoodprintEntity,
    ));
  }
}

class _$_User implements _User {
  const _$_User(
      {@required this.id,
      @required this.username,
      @required this.token,
      @required this.location,
      @required this.foodprint})
      : assert(id != null),
        assert(username != null),
        assert(token != null),
        assert(location != null),
        assert(foodprint != null);

  @override
  final UserID id;
  @override
  final Username username;
  @override
  final JWT token;
  @override
  final LatLng location;
  @override
  final FoodprintEntity foodprint;

  @override
  String toString() {
    return 'User(id: $id, username: $username, token: $token, location: $location, foodprint: $foodprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.foodprint, foodprint) ||
                const DeepCollectionEquality()
                    .equals(other.foodprint, foodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(foodprint);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {@required UserID id,
      @required Username username,
      @required JWT token,
      @required LatLng location,
      @required FoodprintEntity foodprint}) = _$_User;

  @override
  UserID get id;
  @override
  Username get username;
  @override
  JWT get token;
  @override
  LatLng get location;
  @override
  FoodprintEntity get foodprint;
  @override
  _$UserCopyWith<_User> get copyWith;
}

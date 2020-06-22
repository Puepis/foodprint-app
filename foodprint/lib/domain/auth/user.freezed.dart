// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$User {
  UniqueId get id;

  User copyWith({UniqueId id});
}

class _$UserTearOff {
  const _$UserTearOff();

  _User call({@required UniqueId id}) {
    return _User(
      id: id,
    );
  }
}

const $User = _$UserTearOff();

class _$_User implements _User {
  const _$_User({@required this.id}) : assert(id != null);

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'User(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @override
  _$_User copyWith({
    Object id = freezed,
  }) {
    return _$_User(
      id: id == freezed ? this.id : id as UniqueId,
    );
  }
}

abstract class _User implements User {
  const factory _User({@required UniqueId id}) = _$_User;

  @override
  UniqueId get id;

  @override
  _User copyWith({UniqueId id});
}

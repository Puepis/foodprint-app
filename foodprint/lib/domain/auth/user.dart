import 'package:foodprint/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

// The user entity is comprised of one or more value objects which are validated themselves
// i.e. the user itself is not validated, its parts are
@freezed
abstract class User with _$User {
  const factory User({
    @required UniqueId id,
  }) = _User;
}
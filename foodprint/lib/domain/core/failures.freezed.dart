// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  ExceedingLength<T> exceedingLength<T>(
      {@required T failedValue, @required int max}) {
    return ExceedingLength<T>(
      failedValue: failedValue,
      max: max,
    );
  }

  Empty<T> empty<T>({@required T failedValue}) {
    return Empty<T>(
      failedValue: failedValue,
    );
  }

  InvalidEmail<T> invalidEmail<T>({@required T failedValue}) {
    return InvalidEmail<T>(
      failedValue: failedValue,
    );
  }

  PasswordTooShort<T> passwordTooShort<T>({@required T failedValue}) {
    return PasswordTooShort<T>(
      failedValue: failedValue,
    );
  }

  PasswordTooLong<T> passwordTooLong<T>({@required T failedValue}) {
    return PasswordTooLong<T>(
      failedValue: failedValue,
    );
  }

  OutOfBounds<T> outofBounds<T>({@required T failedValue}) {
    return OutOfBounds<T>(
      failedValue: failedValue,
    );
  }

  InvalidToken<T> invalidToken<T>({@required T failedValue}) {
    return InvalidToken<T>(
      failedValue: failedValue,
    );
  }
}

// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

mixin _$ValueFailure<T> {
  T get failedValue;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result invalidEmail(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result passwordTooLong(T failedValue),
    @required Result outofBounds(T failedValue),
    @required Result invalidToken(T failedValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result invalidEmail(T failedValue),
    Result passwordTooShort(T failedValue),
    Result passwordTooLong(T failedValue),
    Result outofBounds(T failedValue),
    Result invalidToken(T failedValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result passwordTooShort(PasswordTooShort<T> value),
    @required Result passwordTooLong(PasswordTooLong<T> value),
    @required Result outofBounds(OutOfBounds<T> value),
    @required Result invalidToken(InvalidToken<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result passwordTooShort(PasswordTooShort<T> value),
    Result passwordTooLong(PasswordTooLong<T> value),
    Result outofBounds(OutOfBounds<T> value),
    Result invalidToken(InvalidToken<T> value),
    @required Result orElse(),
  });

  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith;
}

abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

abstract class $ExceedingLengthCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ExceedingLengthCopyWith(
          ExceedingLength<T> value, $Res Function(ExceedingLength<T>) then) =
      _$ExceedingLengthCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue, int max});
}

class _$ExceedingLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ExceedingLengthCopyWith<T, $Res> {
  _$ExceedingLengthCopyWithImpl(
      ExceedingLength<T> _value, $Res Function(ExceedingLength<T>) _then)
      : super(_value, (v) => _then(v as ExceedingLength<T>));

  @override
  ExceedingLength<T> get _value => super._value as ExceedingLength<T>;

  @override
  $Res call({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _then(ExceedingLength<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
      max: max == freezed ? _value.max : max as int,
    ));
  }
}

class _$ExceedingLength<T>
    with DiagnosticableTreeMixin
    implements ExceedingLength<T> {
  const _$ExceedingLength({@required this.failedValue, @required this.max})
      : assert(failedValue != null),
        assert(max != null);

  @override
  final T failedValue;
  @override
  final int max;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.exceedingLength(failedValue: $failedValue, max: $max)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.exceedingLength'))
      ..add(DiagnosticsProperty('failedValue', failedValue))
      ..add(DiagnosticsProperty('max', max));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExceedingLength<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(max);

  @override
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith =>
      _$ExceedingLengthCopyWithImpl<T, ExceedingLength<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result invalidEmail(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result passwordTooLong(T failedValue),
    @required Result outofBounds(T failedValue),
    @required Result invalidToken(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return exceedingLength(failedValue, max);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result invalidEmail(T failedValue),
    Result passwordTooShort(T failedValue),
    Result passwordTooLong(T failedValue),
    Result outofBounds(T failedValue),
    Result invalidToken(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exceedingLength != null) {
      return exceedingLength(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result passwordTooShort(PasswordTooShort<T> value),
    @required Result passwordTooLong(PasswordTooLong<T> value),
    @required Result outofBounds(OutOfBounds<T> value),
    @required Result invalidToken(InvalidToken<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result passwordTooShort(PasswordTooShort<T> value),
    Result passwordTooLong(PasswordTooLong<T> value),
    Result outofBounds(OutOfBounds<T> value),
    Result invalidToken(InvalidToken<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exceedingLength != null) {
      return exceedingLength(this);
    }
    return orElse();
  }
}

abstract class ExceedingLength<T> implements ValueFailure<T> {
  const factory ExceedingLength({@required T failedValue, @required int max}) =
      _$ExceedingLength<T>;

  @override
  T get failedValue;
  int get max;
  @override
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith;
}

abstract class $EmptyCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$EmptyCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(Empty<T> _value, $Res Function(Empty<T>) _then)
      : super(_value, (v) => _then(v as Empty<T>));

  @override
  Empty<T> get _value => super._value as Empty<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(Empty<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$Empty<T> with DiagnosticableTreeMixin implements Empty<T> {
  const _$Empty({@required this.failedValue}) : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.empty(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.empty'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Empty<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      _$EmptyCopyWithImpl<T, Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result invalidEmail(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result passwordTooLong(T failedValue),
    @required Result outofBounds(T failedValue),
    @required Result invalidToken(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result invalidEmail(T failedValue),
    Result passwordTooShort(T failedValue),
    Result passwordTooLong(T failedValue),
    Result outofBounds(T failedValue),
    Result invalidToken(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result passwordTooShort(PasswordTooShort<T> value),
    @required Result passwordTooLong(PasswordTooLong<T> value),
    @required Result outofBounds(OutOfBounds<T> value),
    @required Result invalidToken(InvalidToken<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result passwordTooShort(PasswordTooShort<T> value),
    Result passwordTooLong(PasswordTooLong<T> value),
    Result outofBounds(OutOfBounds<T> value),
    Result invalidToken(InvalidToken<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements ValueFailure<T> {
  const factory Empty({@required T failedValue}) = _$Empty<T>;

  @override
  T get failedValue;
  @override
  $EmptyCopyWith<T, Empty<T>> get copyWith;
}

abstract class $InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail<T> value, $Res Function(InvalidEmail<T>) then) =
      _$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail<T> _value, $Res Function(InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmail<T>));

  @override
  InvalidEmail<T> get _value => super._value as InvalidEmail<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidEmail<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$InvalidEmail<T>
    with DiagnosticableTreeMixin
    implements InvalidEmail<T> {
  const _$InvalidEmail({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.invalidEmail'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result invalidEmail(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result passwordTooLong(T failedValue),
    @required Result outofBounds(T failedValue),
    @required Result invalidToken(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result invalidEmail(T failedValue),
    Result passwordTooShort(T failedValue),
    Result passwordTooLong(T failedValue),
    Result outofBounds(T failedValue),
    Result invalidToken(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result passwordTooShort(PasswordTooShort<T> value),
    @required Result passwordTooLong(PasswordTooLong<T> value),
    @required Result outofBounds(OutOfBounds<T> value),
    @required Result invalidToken(InvalidToken<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result passwordTooShort(PasswordTooShort<T> value),
    Result passwordTooLong(PasswordTooLong<T> value),
    Result outofBounds(OutOfBounds<T> value),
    Result invalidToken(InvalidToken<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({@required T failedValue}) = _$InvalidEmail<T>;

  @override
  T get failedValue;
  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith;
}

abstract class $PasswordTooShortCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $PasswordTooShortCopyWith(
          PasswordTooShort<T> value, $Res Function(PasswordTooShort<T>) then) =
      _$PasswordTooShortCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$PasswordTooShortCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $PasswordTooShortCopyWith<T, $Res> {
  _$PasswordTooShortCopyWithImpl(
      PasswordTooShort<T> _value, $Res Function(PasswordTooShort<T>) _then)
      : super(_value, (v) => _then(v as PasswordTooShort<T>));

  @override
  PasswordTooShort<T> get _value => super._value as PasswordTooShort<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(PasswordTooShort<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$PasswordTooShort<T>
    with DiagnosticableTreeMixin
    implements PasswordTooShort<T> {
  const _$PasswordTooShort({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.passwordTooShort(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.passwordTooShort'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordTooShort<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $PasswordTooShortCopyWith<T, PasswordTooShort<T>> get copyWith =>
      _$PasswordTooShortCopyWithImpl<T, PasswordTooShort<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result invalidEmail(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result passwordTooLong(T failedValue),
    @required Result outofBounds(T failedValue),
    @required Result invalidToken(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return passwordTooShort(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result invalidEmail(T failedValue),
    Result passwordTooShort(T failedValue),
    Result passwordTooLong(T failedValue),
    Result outofBounds(T failedValue),
    Result invalidToken(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordTooShort != null) {
      return passwordTooShort(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result passwordTooShort(PasswordTooShort<T> value),
    @required Result passwordTooLong(PasswordTooLong<T> value),
    @required Result outofBounds(OutOfBounds<T> value),
    @required Result invalidToken(InvalidToken<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return passwordTooShort(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result passwordTooShort(PasswordTooShort<T> value),
    Result passwordTooLong(PasswordTooLong<T> value),
    Result outofBounds(OutOfBounds<T> value),
    Result invalidToken(InvalidToken<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordTooShort != null) {
      return passwordTooShort(this);
    }
    return orElse();
  }
}

abstract class PasswordTooShort<T> implements ValueFailure<T> {
  const factory PasswordTooShort({@required T failedValue}) =
      _$PasswordTooShort<T>;

  @override
  T get failedValue;
  @override
  $PasswordTooShortCopyWith<T, PasswordTooShort<T>> get copyWith;
}

abstract class $PasswordTooLongCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $PasswordTooLongCopyWith(
          PasswordTooLong<T> value, $Res Function(PasswordTooLong<T>) then) =
      _$PasswordTooLongCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$PasswordTooLongCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $PasswordTooLongCopyWith<T, $Res> {
  _$PasswordTooLongCopyWithImpl(
      PasswordTooLong<T> _value, $Res Function(PasswordTooLong<T>) _then)
      : super(_value, (v) => _then(v as PasswordTooLong<T>));

  @override
  PasswordTooLong<T> get _value => super._value as PasswordTooLong<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(PasswordTooLong<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$PasswordTooLong<T>
    with DiagnosticableTreeMixin
    implements PasswordTooLong<T> {
  const _$PasswordTooLong({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.passwordTooLong(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.passwordTooLong'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordTooLong<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $PasswordTooLongCopyWith<T, PasswordTooLong<T>> get copyWith =>
      _$PasswordTooLongCopyWithImpl<T, PasswordTooLong<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result invalidEmail(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result passwordTooLong(T failedValue),
    @required Result outofBounds(T failedValue),
    @required Result invalidToken(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return passwordTooLong(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result invalidEmail(T failedValue),
    Result passwordTooShort(T failedValue),
    Result passwordTooLong(T failedValue),
    Result outofBounds(T failedValue),
    Result invalidToken(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordTooLong != null) {
      return passwordTooLong(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result passwordTooShort(PasswordTooShort<T> value),
    @required Result passwordTooLong(PasswordTooLong<T> value),
    @required Result outofBounds(OutOfBounds<T> value),
    @required Result invalidToken(InvalidToken<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return passwordTooLong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result passwordTooShort(PasswordTooShort<T> value),
    Result passwordTooLong(PasswordTooLong<T> value),
    Result outofBounds(OutOfBounds<T> value),
    Result invalidToken(InvalidToken<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordTooLong != null) {
      return passwordTooLong(this);
    }
    return orElse();
  }
}

abstract class PasswordTooLong<T> implements ValueFailure<T> {
  const factory PasswordTooLong({@required T failedValue}) =
      _$PasswordTooLong<T>;

  @override
  T get failedValue;
  @override
  $PasswordTooLongCopyWith<T, PasswordTooLong<T>> get copyWith;
}

abstract class $OutOfBoundsCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $OutOfBoundsCopyWith(
          OutOfBounds<T> value, $Res Function(OutOfBounds<T>) then) =
      _$OutOfBoundsCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$OutOfBoundsCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $OutOfBoundsCopyWith<T, $Res> {
  _$OutOfBoundsCopyWithImpl(
      OutOfBounds<T> _value, $Res Function(OutOfBounds<T>) _then)
      : super(_value, (v) => _then(v as OutOfBounds<T>));

  @override
  OutOfBounds<T> get _value => super._value as OutOfBounds<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(OutOfBounds<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$OutOfBounds<T> with DiagnosticableTreeMixin implements OutOfBounds<T> {
  const _$OutOfBounds({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.outofBounds(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.outofBounds'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OutOfBounds<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $OutOfBoundsCopyWith<T, OutOfBounds<T>> get copyWith =>
      _$OutOfBoundsCopyWithImpl<T, OutOfBounds<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result invalidEmail(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result passwordTooLong(T failedValue),
    @required Result outofBounds(T failedValue),
    @required Result invalidToken(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return outofBounds(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result invalidEmail(T failedValue),
    Result passwordTooShort(T failedValue),
    Result passwordTooLong(T failedValue),
    Result outofBounds(T failedValue),
    Result invalidToken(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (outofBounds != null) {
      return outofBounds(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result passwordTooShort(PasswordTooShort<T> value),
    @required Result passwordTooLong(PasswordTooLong<T> value),
    @required Result outofBounds(OutOfBounds<T> value),
    @required Result invalidToken(InvalidToken<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return outofBounds(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result passwordTooShort(PasswordTooShort<T> value),
    Result passwordTooLong(PasswordTooLong<T> value),
    Result outofBounds(OutOfBounds<T> value),
    Result invalidToken(InvalidToken<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (outofBounds != null) {
      return outofBounds(this);
    }
    return orElse();
  }
}

abstract class OutOfBounds<T> implements ValueFailure<T> {
  const factory OutOfBounds({@required T failedValue}) = _$OutOfBounds<T>;

  @override
  T get failedValue;
  @override
  $OutOfBoundsCopyWith<T, OutOfBounds<T>> get copyWith;
}

abstract class $InvalidTokenCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidTokenCopyWith(
          InvalidToken<T> value, $Res Function(InvalidToken<T>) then) =
      _$InvalidTokenCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

class _$InvalidTokenCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidTokenCopyWith<T, $Res> {
  _$InvalidTokenCopyWithImpl(
      InvalidToken<T> _value, $Res Function(InvalidToken<T>) _then)
      : super(_value, (v) => _then(v as InvalidToken<T>));

  @override
  InvalidToken<T> get _value => super._value as InvalidToken<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidToken<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

class _$InvalidToken<T>
    with DiagnosticableTreeMixin
    implements InvalidToken<T> {
  const _$InvalidToken({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.invalidToken(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.invalidToken'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidToken<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidTokenCopyWith<T, InvalidToken<T>> get copyWith =>
      _$InvalidTokenCopyWithImpl<T, InvalidToken<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(T failedValue, int max),
    @required Result empty(T failedValue),
    @required Result invalidEmail(T failedValue),
    @required Result passwordTooShort(T failedValue),
    @required Result passwordTooLong(T failedValue),
    @required Result outofBounds(T failedValue),
    @required Result invalidToken(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return invalidToken(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(T failedValue, int max),
    Result empty(T failedValue),
    Result invalidEmail(T failedValue),
    Result passwordTooShort(T failedValue),
    Result passwordTooLong(T failedValue),
    Result outofBounds(T failedValue),
    Result invalidToken(T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidToken != null) {
      return invalidToken(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result passwordTooShort(PasswordTooShort<T> value),
    @required Result passwordTooLong(PasswordTooLong<T> value),
    @required Result outofBounds(OutOfBounds<T> value),
    @required Result invalidToken(InvalidToken<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(passwordTooShort != null);
    assert(passwordTooLong != null);
    assert(outofBounds != null);
    assert(invalidToken != null);
    return invalidToken(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result passwordTooShort(PasswordTooShort<T> value),
    Result passwordTooLong(PasswordTooLong<T> value),
    Result outofBounds(OutOfBounds<T> value),
    Result invalidToken(InvalidToken<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidToken != null) {
      return invalidToken(this);
    }
    return orElse();
  }
}

abstract class InvalidToken<T> implements ValueFailure<T> {
  const factory InvalidToken({@required T failedValue}) = _$InvalidToken<T>;

  @override
  T get failedValue;
  @override
  $InvalidTokenCopyWith<T, InvalidToken<T>> get copyWith;
}

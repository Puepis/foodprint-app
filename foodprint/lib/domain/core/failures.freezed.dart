// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$ValueFailure<T> {
  T get failedValue;

  ValueFailure<T> copyWith({T failedValue});

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result exceedingLength(@required T failedValue, @required int max),
    @required Result empty(@required T failedValue),
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(@required T failedValue, @required int max),
    Result empty(@required T failedValue),
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    @required Result orElse(),
  });
}

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

  ShortPassword<T> shortPassword<T>({@required T failedValue}) {
    return ShortPassword<T>(
      failedValue: failedValue,
    );
  }
}

const $ValueFailure = _$ValueFailureTearOff();

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
  _$ExceedingLength<T> copyWith({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _$ExceedingLength<T>(
      failedValue: failedValue == freezed ? this.failedValue : failedValue as T,
      max: max == freezed ? this.max : max as int,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result exceedingLength(@required T failedValue, @required int max),
    @required Result empty(@required T failedValue),
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return exceedingLength(failedValue, max);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(@required T failedValue, @required int max),
    Result empty(@required T failedValue),
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
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
    @required Result shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
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
  ExceedingLength<T> copyWith({T failedValue, int max});
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
  _$Empty<T> copyWith({
    Object failedValue = freezed,
  }) {
    return _$Empty<T>(
      failedValue: failedValue == freezed ? this.failedValue : failedValue as T,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result exceedingLength(@required T failedValue, @required int max),
    @required Result empty(@required T failedValue),
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(@required T failedValue, @required int max),
    Result empty(@required T failedValue),
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
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
    @required Result shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
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
  Empty<T> copyWith({T failedValue});
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
  _$InvalidEmail<T> copyWith({
    Object failedValue = freezed,
  }) {
    return _$InvalidEmail<T>(
      failedValue: failedValue == freezed ? this.failedValue : failedValue as T,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result exceedingLength(@required T failedValue, @required int max),
    @required Result empty(@required T failedValue),
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(@required T failedValue, @required int max),
    Result empty(@required T failedValue),
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
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
    @required Result shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
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
  InvalidEmail<T> copyWith({T failedValue});
}

class _$ShortPassword<T>
    with DiagnosticableTreeMixin
    implements ShortPassword<T> {
  const _$ShortPassword({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueFailure<$T>.shortPassword'))
      ..add(DiagnosticsProperty('failedValue', failedValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShortPassword<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$ShortPassword<T> copyWith({
    Object failedValue = freezed,
  }) {
    return _$ShortPassword<T>(
      failedValue: failedValue == freezed ? this.failedValue : failedValue as T,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result exceedingLength(@required T failedValue, @required int max),
    @required Result empty(@required T failedValue),
    @required Result invalidEmail(@required T failedValue),
    @required Result shortPassword(@required T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(@required T failedValue, @required int max),
    Result empty(@required T failedValue),
    Result invalidEmail(@required T failedValue),
    Result shortPassword(@required T failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength<T> value),
    @required Result empty(Empty<T> value),
    @required Result invalidEmail(InvalidEmail<T> value),
    @required Result shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength<T> value),
    Result empty(Empty<T> value),
    Result invalidEmail(InvalidEmail<T> value),
    Result shortPassword(ShortPassword<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({@required T failedValue}) = _$ShortPassword<T>;

  @override
  T get failedValue;

  @override
  ShortPassword<T> copyWith({T failedValue});
}

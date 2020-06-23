// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'foodprint_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FoodprintEntityTearOff {
  const _$FoodprintEntityTearOff();

  _FoodprintEntity call(
      {@required
          Map<RestaurantEntity, List<FoodprintPhotoEntity>> restaurantPhotos}) {
    return _FoodprintEntity(
      restaurantPhotos: restaurantPhotos,
    );
  }
}

// ignore: unused_element
const $FoodprintEntity = _$FoodprintEntityTearOff();

mixin _$FoodprintEntity {
  Map<RestaurantEntity, List<FoodprintPhotoEntity>> get restaurantPhotos;

  $FoodprintEntityCopyWith<FoodprintEntity> get copyWith;
}

abstract class $FoodprintEntityCopyWith<$Res> {
  factory $FoodprintEntityCopyWith(
          FoodprintEntity value, $Res Function(FoodprintEntity) then) =
      _$FoodprintEntityCopyWithImpl<$Res>;
  $Res call(
      {Map<RestaurantEntity, List<FoodprintPhotoEntity>> restaurantPhotos});
}

class _$FoodprintEntityCopyWithImpl<$Res>
    implements $FoodprintEntityCopyWith<$Res> {
  _$FoodprintEntityCopyWithImpl(this._value, this._then);

  final FoodprintEntity _value;
  // ignore: unused_field
  final $Res Function(FoodprintEntity) _then;

  @override
  $Res call({
    Object restaurantPhotos = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantPhotos: restaurantPhotos == freezed
          ? _value.restaurantPhotos
          : restaurantPhotos
              as Map<RestaurantEntity, List<FoodprintPhotoEntity>>,
    ));
  }
}

abstract class _$FoodprintEntityCopyWith<$Res>
    implements $FoodprintEntityCopyWith<$Res> {
  factory _$FoodprintEntityCopyWith(
          _FoodprintEntity value, $Res Function(_FoodprintEntity) then) =
      __$FoodprintEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<RestaurantEntity, List<FoodprintPhotoEntity>> restaurantPhotos});
}

class __$FoodprintEntityCopyWithImpl<$Res>
    extends _$FoodprintEntityCopyWithImpl<$Res>
    implements _$FoodprintEntityCopyWith<$Res> {
  __$FoodprintEntityCopyWithImpl(
      _FoodprintEntity _value, $Res Function(_FoodprintEntity) _then)
      : super(_value, (v) => _then(v as _FoodprintEntity));

  @override
  _FoodprintEntity get _value => super._value as _FoodprintEntity;

  @override
  $Res call({
    Object restaurantPhotos = freezed,
  }) {
    return _then(_FoodprintEntity(
      restaurantPhotos: restaurantPhotos == freezed
          ? _value.restaurantPhotos
          : restaurantPhotos
              as Map<RestaurantEntity, List<FoodprintPhotoEntity>>,
    ));
  }
}

class _$_FoodprintEntity extends _FoodprintEntity {
  const _$_FoodprintEntity({@required this.restaurantPhotos})
      : assert(restaurantPhotos != null),
        super._();

  @override
  final Map<RestaurantEntity, List<FoodprintPhotoEntity>> restaurantPhotos;

  @override
  String toString() {
    return 'FoodprintEntity(restaurantPhotos: $restaurantPhotos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FoodprintEntity &&
            (identical(other.restaurantPhotos, restaurantPhotos) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantPhotos, restaurantPhotos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(restaurantPhotos);

  @override
  _$FoodprintEntityCopyWith<_FoodprintEntity> get copyWith =>
      __$FoodprintEntityCopyWithImpl<_FoodprintEntity>(this, _$identity);
}

abstract class _FoodprintEntity extends FoodprintEntity {
  const _FoodprintEntity._() : super._();
  const factory _FoodprintEntity(
      {@required
          Map<RestaurantEntity, List<FoodprintPhotoEntity>>
              restaurantPhotos}) = _$_FoodprintEntity;

  @override
  Map<RestaurantEntity, List<FoodprintPhotoEntity>> get restaurantPhotos;
  @override
  _$FoodprintEntityCopyWith<_FoodprintEntity> get copyWith;
}

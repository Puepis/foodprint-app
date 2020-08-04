// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'restaurant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RestaurantEntityTearOff {
  const _$RestaurantEntityTearOff();

  _RestaurantEntity call(
      {@required RestaurantID id,
      @required RestaurantName name,
      @required RestaurantRating rating,
      @required Latitude latitude,
      @required Longitude longitude,
      @required RestaurantTypes types}) {
    return _RestaurantEntity(
      id: id,
      name: name,
      rating: rating,
      latitude: latitude,
      longitude: longitude,
      types: types,
    );
  }
}

// ignore: unused_element
const $RestaurantEntity = _$RestaurantEntityTearOff();

mixin _$RestaurantEntity {
  RestaurantID get id;
  RestaurantName get name;
  RestaurantRating get rating;
  Latitude get latitude;
  Longitude get longitude;
  RestaurantTypes get types;

  $RestaurantEntityCopyWith<RestaurantEntity> get copyWith;
}

abstract class $RestaurantEntityCopyWith<$Res> {
  factory $RestaurantEntityCopyWith(
          RestaurantEntity value, $Res Function(RestaurantEntity) then) =
      _$RestaurantEntityCopyWithImpl<$Res>;
  $Res call(
      {RestaurantID id,
      RestaurantName name,
      RestaurantRating rating,
      Latitude latitude,
      Longitude longitude,
      RestaurantTypes types});
}

class _$RestaurantEntityCopyWithImpl<$Res>
    implements $RestaurantEntityCopyWith<$Res> {
  _$RestaurantEntityCopyWithImpl(this._value, this._then);

  final RestaurantEntity _value;
  // ignore: unused_field
  final $Res Function(RestaurantEntity) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object rating = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object types = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as RestaurantID,
      name: name == freezed ? _value.name : name as RestaurantName,
      rating: rating == freezed ? _value.rating : rating as RestaurantRating,
      latitude: latitude == freezed ? _value.latitude : latitude as Latitude,
      longitude:
          longitude == freezed ? _value.longitude : longitude as Longitude,
      types: types == freezed ? _value.types : types as RestaurantTypes,
    ));
  }
}

abstract class _$RestaurantEntityCopyWith<$Res>
    implements $RestaurantEntityCopyWith<$Res> {
  factory _$RestaurantEntityCopyWith(
          _RestaurantEntity value, $Res Function(_RestaurantEntity) then) =
      __$RestaurantEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {RestaurantID id,
      RestaurantName name,
      RestaurantRating rating,
      Latitude latitude,
      Longitude longitude,
      RestaurantTypes types});
}

class __$RestaurantEntityCopyWithImpl<$Res>
    extends _$RestaurantEntityCopyWithImpl<$Res>
    implements _$RestaurantEntityCopyWith<$Res> {
  __$RestaurantEntityCopyWithImpl(
      _RestaurantEntity _value, $Res Function(_RestaurantEntity) _then)
      : super(_value, (v) => _then(v as _RestaurantEntity));

  @override
  _RestaurantEntity get _value => super._value as _RestaurantEntity;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object rating = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object types = freezed,
  }) {
    return _then(_RestaurantEntity(
      id: id == freezed ? _value.id : id as RestaurantID,
      name: name == freezed ? _value.name : name as RestaurantName,
      rating: rating == freezed ? _value.rating : rating as RestaurantRating,
      latitude: latitude == freezed ? _value.latitude : latitude as Latitude,
      longitude:
          longitude == freezed ? _value.longitude : longitude as Longitude,
      types: types == freezed ? _value.types : types as RestaurantTypes,
    ));
  }
}

class _$_RestaurantEntity extends _RestaurantEntity {
  const _$_RestaurantEntity(
      {@required this.id,
      @required this.name,
      @required this.rating,
      @required this.latitude,
      @required this.longitude,
      @required this.types})
      : assert(id != null),
        assert(name != null),
        assert(rating != null),
        assert(latitude != null),
        assert(longitude != null),
        assert(types != null),
        super._();

  @override
  final RestaurantID id;
  @override
  final RestaurantName name;
  @override
  final RestaurantRating rating;
  @override
  final Latitude latitude;
  @override
  final Longitude longitude;
  @override
  final RestaurantTypes types;

  @override
  String toString() {
    return 'RestaurantEntity(id: $id, name: $name, rating: $rating, latitude: $latitude, longitude: $longitude, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestaurantEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.types, types) ||
                const DeepCollectionEquality().equals(other.types, types)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(types);

  @override
  _$RestaurantEntityCopyWith<_RestaurantEntity> get copyWith =>
      __$RestaurantEntityCopyWithImpl<_RestaurantEntity>(this, _$identity);
}

abstract class _RestaurantEntity extends RestaurantEntity {
  const _RestaurantEntity._() : super._();
  const factory _RestaurantEntity(
      {@required RestaurantID id,
      @required RestaurantName name,
      @required RestaurantRating rating,
      @required Latitude latitude,
      @required Longitude longitude,
      @required RestaurantTypes types}) = _$_RestaurantEntity;

  @override
  RestaurantID get id;
  @override
  RestaurantName get name;
  @override
  RestaurantRating get rating;
  @override
  Latitude get latitude;
  @override
  Longitude get longitude;
  @override
  RestaurantTypes get types;
  @override
  _$RestaurantEntityCopyWith<_RestaurantEntity> get copyWith;
}

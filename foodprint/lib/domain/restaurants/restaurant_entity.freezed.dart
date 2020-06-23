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
      {@required RestaurantID restaurantID,
      @required RestaurantAddress restaurantAddress,
      @required RestaurantName restaurantName,
      @required RestaurantRating restaurantRating,
      @required RestaurantPriceLevel restaurantPriceLevel,
      @required Latitude latitude,
      @required Longitude longitude}) {
    return _RestaurantEntity(
      restaurantID: restaurantID,
      restaurantAddress: restaurantAddress,
      restaurantName: restaurantName,
      restaurantRating: restaurantRating,
      restaurantPriceLevel: restaurantPriceLevel,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

// ignore: unused_element
const $RestaurantEntity = _$RestaurantEntityTearOff();

mixin _$RestaurantEntity {
  RestaurantID get restaurantID;
  RestaurantAddress get restaurantAddress;
  RestaurantName get restaurantName;
  RestaurantRating get restaurantRating;
  RestaurantPriceLevel get restaurantPriceLevel;
  Latitude get latitude;
  Longitude get longitude;

  $RestaurantEntityCopyWith<RestaurantEntity> get copyWith;
}

abstract class $RestaurantEntityCopyWith<$Res> {
  factory $RestaurantEntityCopyWith(
          RestaurantEntity value, $Res Function(RestaurantEntity) then) =
      _$RestaurantEntityCopyWithImpl<$Res>;
  $Res call(
      {RestaurantID restaurantID,
      RestaurantAddress restaurantAddress,
      RestaurantName restaurantName,
      RestaurantRating restaurantRating,
      RestaurantPriceLevel restaurantPriceLevel,
      Latitude latitude,
      Longitude longitude});
}

class _$RestaurantEntityCopyWithImpl<$Res>
    implements $RestaurantEntityCopyWith<$Res> {
  _$RestaurantEntityCopyWithImpl(this._value, this._then);

  final RestaurantEntity _value;
  // ignore: unused_field
  final $Res Function(RestaurantEntity) _then;

  @override
  $Res call({
    Object restaurantID = freezed,
    Object restaurantAddress = freezed,
    Object restaurantName = freezed,
    Object restaurantRating = freezed,
    Object restaurantPriceLevel = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantID: restaurantID == freezed
          ? _value.restaurantID
          : restaurantID as RestaurantID,
      restaurantAddress: restaurantAddress == freezed
          ? _value.restaurantAddress
          : restaurantAddress as RestaurantAddress,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName as RestaurantName,
      restaurantRating: restaurantRating == freezed
          ? _value.restaurantRating
          : restaurantRating as RestaurantRating,
      restaurantPriceLevel: restaurantPriceLevel == freezed
          ? _value.restaurantPriceLevel
          : restaurantPriceLevel as RestaurantPriceLevel,
      latitude: latitude == freezed ? _value.latitude : latitude as Latitude,
      longitude:
          longitude == freezed ? _value.longitude : longitude as Longitude,
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
      {RestaurantID restaurantID,
      RestaurantAddress restaurantAddress,
      RestaurantName restaurantName,
      RestaurantRating restaurantRating,
      RestaurantPriceLevel restaurantPriceLevel,
      Latitude latitude,
      Longitude longitude});
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
    Object restaurantID = freezed,
    Object restaurantAddress = freezed,
    Object restaurantName = freezed,
    Object restaurantRating = freezed,
    Object restaurantPriceLevel = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
  }) {
    return _then(_RestaurantEntity(
      restaurantID: restaurantID == freezed
          ? _value.restaurantID
          : restaurantID as RestaurantID,
      restaurantAddress: restaurantAddress == freezed
          ? _value.restaurantAddress
          : restaurantAddress as RestaurantAddress,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName as RestaurantName,
      restaurantRating: restaurantRating == freezed
          ? _value.restaurantRating
          : restaurantRating as RestaurantRating,
      restaurantPriceLevel: restaurantPriceLevel == freezed
          ? _value.restaurantPriceLevel
          : restaurantPriceLevel as RestaurantPriceLevel,
      latitude: latitude == freezed ? _value.latitude : latitude as Latitude,
      longitude:
          longitude == freezed ? _value.longitude : longitude as Longitude,
    ));
  }
}

class _$_RestaurantEntity extends _RestaurantEntity {
  const _$_RestaurantEntity(
      {@required this.restaurantID,
      @required this.restaurantAddress,
      @required this.restaurantName,
      @required this.restaurantRating,
      @required this.restaurantPriceLevel,
      @required this.latitude,
      @required this.longitude})
      : assert(restaurantID != null),
        assert(restaurantAddress != null),
        assert(restaurantName != null),
        assert(restaurantRating != null),
        assert(restaurantPriceLevel != null),
        assert(latitude != null),
        assert(longitude != null),
        super._();

  @override
  final RestaurantID restaurantID;
  @override
  final RestaurantAddress restaurantAddress;
  @override
  final RestaurantName restaurantName;
  @override
  final RestaurantRating restaurantRating;
  @override
  final RestaurantPriceLevel restaurantPriceLevel;
  @override
  final Latitude latitude;
  @override
  final Longitude longitude;

  @override
  String toString() {
    return 'RestaurantEntity(restaurantID: $restaurantID, restaurantAddress: $restaurantAddress, restaurantName: $restaurantName, restaurantRating: $restaurantRating, restaurantPriceLevel: $restaurantPriceLevel, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestaurantEntity &&
            (identical(other.restaurantID, restaurantID) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantID, restaurantID)) &&
            (identical(other.restaurantAddress, restaurantAddress) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantAddress, restaurantAddress)) &&
            (identical(other.restaurantName, restaurantName) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantName, restaurantName)) &&
            (identical(other.restaurantRating, restaurantRating) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantRating, restaurantRating)) &&
            (identical(other.restaurantPriceLevel, restaurantPriceLevel) ||
                const DeepCollectionEquality().equals(
                    other.restaurantPriceLevel, restaurantPriceLevel)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(restaurantID) ^
      const DeepCollectionEquality().hash(restaurantAddress) ^
      const DeepCollectionEquality().hash(restaurantName) ^
      const DeepCollectionEquality().hash(restaurantRating) ^
      const DeepCollectionEquality().hash(restaurantPriceLevel) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude);

  @override
  _$RestaurantEntityCopyWith<_RestaurantEntity> get copyWith =>
      __$RestaurantEntityCopyWithImpl<_RestaurantEntity>(this, _$identity);
}

abstract class _RestaurantEntity extends RestaurantEntity {
  const _RestaurantEntity._() : super._();
  const factory _RestaurantEntity(
      {@required RestaurantID restaurantID,
      @required RestaurantAddress restaurantAddress,
      @required RestaurantName restaurantName,
      @required RestaurantRating restaurantRating,
      @required RestaurantPriceLevel restaurantPriceLevel,
      @required Latitude latitude,
      @required Longitude longitude}) = _$_RestaurantEntity;

  @override
  RestaurantID get restaurantID;
  @override
  RestaurantAddress get restaurantAddress;
  @override
  RestaurantName get restaurantName;
  @override
  RestaurantRating get restaurantRating;
  @override
  RestaurantPriceLevel get restaurantPriceLevel;
  @override
  Latitude get latitude;
  @override
  Longitude get longitude;
  @override
  _$RestaurantEntityCopyWith<_RestaurantEntity> get copyWith;
}

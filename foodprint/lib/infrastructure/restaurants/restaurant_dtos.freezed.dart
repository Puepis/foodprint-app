// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'restaurant_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RestaurantDTO _$RestaurantDTOFromJson(Map<String, dynamic> json) {
  return _RestaurantDTO.fromJson(json);
}

class _$RestaurantDTOTearOff {
  const _$RestaurantDTOTearOff();

  _RestaurantDTO call(
      {@required String placeId,
      @required String address,
      @required String restaurantName,
      @required double rating,
      @required int priceLevel,
      @required double latitude,
      @required double longitude}) {
    return _RestaurantDTO(
      placeId: placeId,
      address: address,
      restaurantName: restaurantName,
      rating: rating,
      priceLevel: priceLevel,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

// ignore: unused_element
const $RestaurantDTO = _$RestaurantDTOTearOff();

mixin _$RestaurantDTO {
  String get placeId;
  String get address;
  String get restaurantName;
  double get rating;
  int get priceLevel;
  double get latitude;
  double get longitude;

  Map<String, dynamic> toJson();
  $RestaurantDTOCopyWith<RestaurantDTO> get copyWith;
}

abstract class $RestaurantDTOCopyWith<$Res> {
  factory $RestaurantDTOCopyWith(
          RestaurantDTO value, $Res Function(RestaurantDTO) then) =
      _$RestaurantDTOCopyWithImpl<$Res>;
  $Res call(
      {String placeId,
      String address,
      String restaurantName,
      double rating,
      int priceLevel,
      double latitude,
      double longitude});
}

class _$RestaurantDTOCopyWithImpl<$Res>
    implements $RestaurantDTOCopyWith<$Res> {
  _$RestaurantDTOCopyWithImpl(this._value, this._then);

  final RestaurantDTO _value;
  // ignore: unused_field
  final $Res Function(RestaurantDTO) _then;

  @override
  $Res call({
    Object placeId = freezed,
    Object address = freezed,
    Object restaurantName = freezed,
    Object rating = freezed,
    Object priceLevel = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: placeId == freezed ? _value.placeId : placeId as String,
      address: address == freezed ? _value.address : address as String,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName as String,
      rating: rating == freezed ? _value.rating : rating as double,
      priceLevel: priceLevel == freezed ? _value.priceLevel : priceLevel as int,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
    ));
  }
}

abstract class _$RestaurantDTOCopyWith<$Res>
    implements $RestaurantDTOCopyWith<$Res> {
  factory _$RestaurantDTOCopyWith(
          _RestaurantDTO value, $Res Function(_RestaurantDTO) then) =
      __$RestaurantDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String placeId,
      String address,
      String restaurantName,
      double rating,
      int priceLevel,
      double latitude,
      double longitude});
}

class __$RestaurantDTOCopyWithImpl<$Res>
    extends _$RestaurantDTOCopyWithImpl<$Res>
    implements _$RestaurantDTOCopyWith<$Res> {
  __$RestaurantDTOCopyWithImpl(
      _RestaurantDTO _value, $Res Function(_RestaurantDTO) _then)
      : super(_value, (v) => _then(v as _RestaurantDTO));

  @override
  _RestaurantDTO get _value => super._value as _RestaurantDTO;

  @override
  $Res call({
    Object placeId = freezed,
    Object address = freezed,
    Object restaurantName = freezed,
    Object rating = freezed,
    Object priceLevel = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
  }) {
    return _then(_RestaurantDTO(
      placeId: placeId == freezed ? _value.placeId : placeId as String,
      address: address == freezed ? _value.address : address as String,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName as String,
      rating: rating == freezed ? _value.rating : rating as double,
      priceLevel: priceLevel == freezed ? _value.priceLevel : priceLevel as int,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
    ));
  }
}

@JsonSerializable()
class _$_RestaurantDTO extends _RestaurantDTO {
  const _$_RestaurantDTO(
      {@required this.placeId,
      @required this.address,
      @required this.restaurantName,
      @required this.rating,
      @required this.priceLevel,
      @required this.latitude,
      @required this.longitude})
      : assert(placeId != null),
        assert(address != null),
        assert(restaurantName != null),
        assert(rating != null),
        assert(priceLevel != null),
        assert(latitude != null),
        assert(longitude != null),
        super._();

  factory _$_RestaurantDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_RestaurantDTOFromJson(json);

  @override
  final String placeId;
  @override
  final String address;
  @override
  final String restaurantName;
  @override
  final double rating;
  @override
  final int priceLevel;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'RestaurantDTO(placeId: $placeId, address: $address, restaurantName: $restaurantName, rating: $rating, priceLevel: $priceLevel, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestaurantDTO &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.restaurantName, restaurantName) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantName, restaurantName)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.priceLevel, priceLevel) ||
                const DeepCollectionEquality()
                    .equals(other.priceLevel, priceLevel)) &&
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
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(restaurantName) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(priceLevel) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude);

  @override
  _$RestaurantDTOCopyWith<_RestaurantDTO> get copyWith =>
      __$RestaurantDTOCopyWithImpl<_RestaurantDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RestaurantDTOToJson(this);
  }
}

abstract class _RestaurantDTO extends RestaurantDTO {
  const _RestaurantDTO._() : super._();
  const factory _RestaurantDTO(
      {@required String placeId,
      @required String address,
      @required String restaurantName,
      @required double rating,
      @required int priceLevel,
      @required double latitude,
      @required double longitude}) = _$_RestaurantDTO;

  factory _RestaurantDTO.fromJson(Map<String, dynamic> json) =
      _$_RestaurantDTO.fromJson;

  @override
  String get placeId;
  @override
  String get address;
  @override
  String get restaurantName;
  @override
  double get rating;
  @override
  int get priceLevel;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  _$RestaurantDTOCopyWith<_RestaurantDTO> get copyWith;
}

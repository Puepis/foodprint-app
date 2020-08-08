// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'restaurant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RestaurantDTOTearOff {
  const _$RestaurantDTOTearOff();

  _RestaurantDTO call(
      {@required String placeId,
      @required String name,
      @required double rating,
      @required double latitude,
      @required double longitude,
      @required List<String> types}) {
    return _RestaurantDTO(
      placeId: placeId,
      name: name,
      rating: rating,
      latitude: latitude,
      longitude: longitude,
      types: types,
    );
  }
}

// ignore: unused_element
const $RestaurantDTO = _$RestaurantDTOTearOff();

mixin _$RestaurantDTO {
  String get placeId;
  String get name;
  double get rating;
  double get latitude;
  double get longitude;
  List<String> get types;

  $RestaurantDTOCopyWith<RestaurantDTO> get copyWith;
}

abstract class $RestaurantDTOCopyWith<$Res> {
  factory $RestaurantDTOCopyWith(
          RestaurantDTO value, $Res Function(RestaurantDTO) then) =
      _$RestaurantDTOCopyWithImpl<$Res>;
  $Res call(
      {String placeId,
      String name,
      double rating,
      double latitude,
      double longitude,
      List<String> types});
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
    Object name = freezed,
    Object rating = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object types = freezed,
  }) {
    return _then(_value.copyWith(
      placeId: placeId == freezed ? _value.placeId : placeId as String,
      name: name == freezed ? _value.name : name as String,
      rating: rating == freezed ? _value.rating : rating as double,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      types: types == freezed ? _value.types : types as List<String>,
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
      String name,
      double rating,
      double latitude,
      double longitude,
      List<String> types});
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
    Object name = freezed,
    Object rating = freezed,
    Object latitude = freezed,
    Object longitude = freezed,
    Object types = freezed,
  }) {
    return _then(_RestaurantDTO(
      placeId: placeId == freezed ? _value.placeId : placeId as String,
      name: name == freezed ? _value.name : name as String,
      rating: rating == freezed ? _value.rating : rating as double,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      types: types == freezed ? _value.types : types as List<String>,
    ));
  }
}

class _$_RestaurantDTO extends _RestaurantDTO {
  const _$_RestaurantDTO(
      {@required this.placeId,
      @required this.name,
      @required this.rating,
      @required this.latitude,
      @required this.longitude,
      @required this.types})
      : assert(placeId != null),
        assert(name != null),
        assert(rating != null),
        assert(latitude != null),
        assert(longitude != null),
        assert(types != null),
        super._();

  @override
  final String placeId;
  @override
  final String name;
  @override
  final double rating;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final List<String> types;

  @override
  String toString() {
    return 'RestaurantDTO(placeId: $placeId, name: $name, rating: $rating, latitude: $latitude, longitude: $longitude, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RestaurantDTO &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
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
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(types);

  @override
  _$RestaurantDTOCopyWith<_RestaurantDTO> get copyWith =>
      __$RestaurantDTOCopyWithImpl<_RestaurantDTO>(this, _$identity);
}

abstract class _RestaurantDTO extends RestaurantDTO {
  const _RestaurantDTO._() : super._();
  const factory _RestaurantDTO(
      {@required String placeId,
      @required String name,
      @required double rating,
      @required double latitude,
      @required double longitude,
      @required List<String> types}) = _$_RestaurantDTO;

  @override
  String get placeId;
  @override
  String get name;
  @override
  double get rating;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  List<String> get types;
  @override
  _$RestaurantDTOCopyWith<_RestaurantDTO> get copyWith;
}

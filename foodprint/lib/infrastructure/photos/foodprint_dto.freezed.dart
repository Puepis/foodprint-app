// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'foodprint_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FoodprintDTOTearOff {
  const _$FoodprintDTOTearOff();

  _FoodprintDTO call(
      {@required Map<RestaurantDTO, List<PhotoDTO>> restaurantPhotos}) {
    return _FoodprintDTO(
      restaurantPhotos: restaurantPhotos,
    );
  }
}

// ignore: unused_element
const $FoodprintDTO = _$FoodprintDTOTearOff();

mixin _$FoodprintDTO {
  Map<RestaurantDTO, List<PhotoDTO>> get restaurantPhotos;

  $FoodprintDTOCopyWith<FoodprintDTO> get copyWith;
}

abstract class $FoodprintDTOCopyWith<$Res> {
  factory $FoodprintDTOCopyWith(
          FoodprintDTO value, $Res Function(FoodprintDTO) then) =
      _$FoodprintDTOCopyWithImpl<$Res>;
  $Res call({Map<RestaurantDTO, List<PhotoDTO>> restaurantPhotos});
}

class _$FoodprintDTOCopyWithImpl<$Res> implements $FoodprintDTOCopyWith<$Res> {
  _$FoodprintDTOCopyWithImpl(this._value, this._then);

  final FoodprintDTO _value;
  // ignore: unused_field
  final $Res Function(FoodprintDTO) _then;

  @override
  $Res call({
    Object restaurantPhotos = freezed,
  }) {
    return _then(_value.copyWith(
      restaurantPhotos: restaurantPhotos == freezed
          ? _value.restaurantPhotos
          : restaurantPhotos as Map<RestaurantDTO, List<PhotoDTO>>,
    ));
  }
}

abstract class _$FoodprintDTOCopyWith<$Res>
    implements $FoodprintDTOCopyWith<$Res> {
  factory _$FoodprintDTOCopyWith(
          _FoodprintDTO value, $Res Function(_FoodprintDTO) then) =
      __$FoodprintDTOCopyWithImpl<$Res>;
  @override
  $Res call({Map<RestaurantDTO, List<PhotoDTO>> restaurantPhotos});
}

class __$FoodprintDTOCopyWithImpl<$Res> extends _$FoodprintDTOCopyWithImpl<$Res>
    implements _$FoodprintDTOCopyWith<$Res> {
  __$FoodprintDTOCopyWithImpl(
      _FoodprintDTO _value, $Res Function(_FoodprintDTO) _then)
      : super(_value, (v) => _then(v as _FoodprintDTO));

  @override
  _FoodprintDTO get _value => super._value as _FoodprintDTO;

  @override
  $Res call({
    Object restaurantPhotos = freezed,
  }) {
    return _then(_FoodprintDTO(
      restaurantPhotos: restaurantPhotos == freezed
          ? _value.restaurantPhotos
          : restaurantPhotos as Map<RestaurantDTO, List<PhotoDTO>>,
    ));
  }
}

class _$_FoodprintDTO extends _FoodprintDTO with DiagnosticableTreeMixin {
  const _$_FoodprintDTO({@required this.restaurantPhotos})
      : assert(restaurantPhotos != null),
        super._();

  @override
  final Map<RestaurantDTO, List<PhotoDTO>> restaurantPhotos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FoodprintDTO(restaurantPhotos: $restaurantPhotos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FoodprintDTO'))
      ..add(DiagnosticsProperty('restaurantPhotos', restaurantPhotos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FoodprintDTO &&
            (identical(other.restaurantPhotos, restaurantPhotos) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantPhotos, restaurantPhotos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(restaurantPhotos);

  @override
  _$FoodprintDTOCopyWith<_FoodprintDTO> get copyWith =>
      __$FoodprintDTOCopyWithImpl<_FoodprintDTO>(this, _$identity);
}

abstract class _FoodprintDTO extends FoodprintDTO {
  const _FoodprintDTO._() : super._();
  const factory _FoodprintDTO(
          {@required Map<RestaurantDTO, List<PhotoDTO>> restaurantPhotos}) =
      _$_FoodprintDTO;

  @override
  Map<RestaurantDTO, List<PhotoDTO>> get restaurantPhotos;
  @override
  _$FoodprintDTOCopyWith<_FoodprintDTO> get copyWith;
}

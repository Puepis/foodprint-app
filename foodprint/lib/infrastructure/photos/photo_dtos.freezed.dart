// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'photo_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PhotoDTO _$PhotoDTOFromJson(Map<String, dynamic> json) {
  return _PhotoDTO.fromJson(json);
}

class _$PhotoDTOTearOff {
  const _$PhotoDTOTearOff();

  _PhotoDTO call(
      {@required String storagePath,
      @required List<int> bytes,
      @required PhotoDetailDTO photoDetail,
      @required String timestamp}) {
    return _PhotoDTO(
      storagePath: storagePath,
      bytes: bytes,
      photoDetail: photoDetail,
      timestamp: timestamp,
    );
  }
}

// ignore: unused_element
const $PhotoDTO = _$PhotoDTOTearOff();

mixin _$PhotoDTO {
  String get storagePath;
  List<int> get bytes;
  PhotoDetailDTO get photoDetail;
  String get timestamp;

  Map<String, dynamic> toJson();
  $PhotoDTOCopyWith<PhotoDTO> get copyWith;
}

abstract class $PhotoDTOCopyWith<$Res> {
  factory $PhotoDTOCopyWith(PhotoDTO value, $Res Function(PhotoDTO) then) =
      _$PhotoDTOCopyWithImpl<$Res>;
  $Res call(
      {String storagePath,
      List<int> bytes,
      PhotoDetailDTO photoDetail,
      String timestamp});

  $PhotoDetailDTOCopyWith<$Res> get photoDetail;
}

class _$PhotoDTOCopyWithImpl<$Res> implements $PhotoDTOCopyWith<$Res> {
  _$PhotoDTOCopyWithImpl(this._value, this._then);

  final PhotoDTO _value;
  // ignore: unused_field
  final $Res Function(PhotoDTO) _then;

  @override
  $Res call({
    Object storagePath = freezed,
    Object bytes = freezed,
    Object photoDetail = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      storagePath:
          storagePath == freezed ? _value.storagePath : storagePath as String,
      bytes: bytes == freezed ? _value.bytes : bytes as List<int>,
      photoDetail: photoDetail == freezed
          ? _value.photoDetail
          : photoDetail as PhotoDetailDTO,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as String,
    ));
  }

  @override
  $PhotoDetailDTOCopyWith<$Res> get photoDetail {
    if (_value.photoDetail == null) {
      return null;
    }
    return $PhotoDetailDTOCopyWith<$Res>(_value.photoDetail, (value) {
      return _then(_value.copyWith(photoDetail: value));
    });
  }
}

abstract class _$PhotoDTOCopyWith<$Res> implements $PhotoDTOCopyWith<$Res> {
  factory _$PhotoDTOCopyWith(_PhotoDTO value, $Res Function(_PhotoDTO) then) =
      __$PhotoDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String storagePath,
      List<int> bytes,
      PhotoDetailDTO photoDetail,
      String timestamp});

  @override
  $PhotoDetailDTOCopyWith<$Res> get photoDetail;
}

class __$PhotoDTOCopyWithImpl<$Res> extends _$PhotoDTOCopyWithImpl<$Res>
    implements _$PhotoDTOCopyWith<$Res> {
  __$PhotoDTOCopyWithImpl(_PhotoDTO _value, $Res Function(_PhotoDTO) _then)
      : super(_value, (v) => _then(v as _PhotoDTO));

  @override
  _PhotoDTO get _value => super._value as _PhotoDTO;

  @override
  $Res call({
    Object storagePath = freezed,
    Object bytes = freezed,
    Object photoDetail = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_PhotoDTO(
      storagePath:
          storagePath == freezed ? _value.storagePath : storagePath as String,
      bytes: bytes == freezed ? _value.bytes : bytes as List<int>,
      photoDetail: photoDetail == freezed
          ? _value.photoDetail
          : photoDetail as PhotoDetailDTO,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as String,
    ));
  }
}

@JsonSerializable()
class _$_PhotoDTO extends _PhotoDTO with DiagnosticableTreeMixin {
  const _$_PhotoDTO(
      {@required this.storagePath,
      @required this.bytes,
      @required this.photoDetail,
      @required this.timestamp})
      : assert(storagePath != null),
        assert(bytes != null),
        assert(photoDetail != null),
        assert(timestamp != null),
        super._();

  factory _$_PhotoDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_PhotoDTOFromJson(json);

  @override
  final String storagePath;
  @override
  final List<int> bytes;
  @override
  final PhotoDetailDTO photoDetail;
  @override
  final String timestamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoDTO(storagePath: $storagePath, bytes: $bytes, photoDetail: $photoDetail, timestamp: $timestamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoDTO'))
      ..add(DiagnosticsProperty('storagePath', storagePath))
      ..add(DiagnosticsProperty('bytes', bytes))
      ..add(DiagnosticsProperty('photoDetail', photoDetail))
      ..add(DiagnosticsProperty('timestamp', timestamp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhotoDTO &&
            (identical(other.storagePath, storagePath) ||
                const DeepCollectionEquality()
                    .equals(other.storagePath, storagePath)) &&
            (identical(other.bytes, bytes) ||
                const DeepCollectionEquality().equals(other.bytes, bytes)) &&
            (identical(other.photoDetail, photoDetail) ||
                const DeepCollectionEquality()
                    .equals(other.photoDetail, photoDetail)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(storagePath) ^
      const DeepCollectionEquality().hash(bytes) ^
      const DeepCollectionEquality().hash(photoDetail) ^
      const DeepCollectionEquality().hash(timestamp);

  @override
  _$PhotoDTOCopyWith<_PhotoDTO> get copyWith =>
      __$PhotoDTOCopyWithImpl<_PhotoDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhotoDTOToJson(this);
  }
}

abstract class _PhotoDTO extends PhotoDTO {
  const _PhotoDTO._() : super._();
  const factory _PhotoDTO(
      {@required String storagePath,
      @required List<int> bytes,
      @required PhotoDetailDTO photoDetail,
      @required String timestamp}) = _$_PhotoDTO;

  factory _PhotoDTO.fromJson(Map<String, dynamic> json) = _$_PhotoDTO.fromJson;

  @override
  String get storagePath;
  @override
  List<int> get bytes;
  @override
  PhotoDetailDTO get photoDetail;
  @override
  String get timestamp;
  @override
  _$PhotoDTOCopyWith<_PhotoDTO> get copyWith;
}

PhotoDetailDTO _$PhotoDetailDTOFromJson(Map<String, dynamic> json) {
  return _PhotoDetailDTO.fromJson(json);
}

class _$PhotoDetailDTOTearOff {
  const _$PhotoDetailDTOTearOff();

  _PhotoDetailDTO call(
      {@required String name,
      @required double price,
      @required String comments}) {
    return _PhotoDetailDTO(
      name: name,
      price: price,
      comments: comments,
    );
  }
}

// ignore: unused_element
const $PhotoDetailDTO = _$PhotoDetailDTOTearOff();

mixin _$PhotoDetailDTO {
  String get name;
  double get price;
  String get comments;

  Map<String, dynamic> toJson();
  $PhotoDetailDTOCopyWith<PhotoDetailDTO> get copyWith;
}

abstract class $PhotoDetailDTOCopyWith<$Res> {
  factory $PhotoDetailDTOCopyWith(
          PhotoDetailDTO value, $Res Function(PhotoDetailDTO) then) =
      _$PhotoDetailDTOCopyWithImpl<$Res>;
  $Res call({String name, double price, String comments});
}

class _$PhotoDetailDTOCopyWithImpl<$Res>
    implements $PhotoDetailDTOCopyWith<$Res> {
  _$PhotoDetailDTOCopyWithImpl(this._value, this._then);

  final PhotoDetailDTO _value;
  // ignore: unused_field
  final $Res Function(PhotoDetailDTO) _then;

  @override
  $Res call({
    Object name = freezed,
    Object price = freezed,
    Object comments = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
      comments: comments == freezed ? _value.comments : comments as String,
    ));
  }
}

abstract class _$PhotoDetailDTOCopyWith<$Res>
    implements $PhotoDetailDTOCopyWith<$Res> {
  factory _$PhotoDetailDTOCopyWith(
          _PhotoDetailDTO value, $Res Function(_PhotoDetailDTO) then) =
      __$PhotoDetailDTOCopyWithImpl<$Res>;
  @override
  $Res call({String name, double price, String comments});
}

class __$PhotoDetailDTOCopyWithImpl<$Res>
    extends _$PhotoDetailDTOCopyWithImpl<$Res>
    implements _$PhotoDetailDTOCopyWith<$Res> {
  __$PhotoDetailDTOCopyWithImpl(
      _PhotoDetailDTO _value, $Res Function(_PhotoDetailDTO) _then)
      : super(_value, (v) => _then(v as _PhotoDetailDTO));

  @override
  _PhotoDetailDTO get _value => super._value as _PhotoDetailDTO;

  @override
  $Res call({
    Object name = freezed,
    Object price = freezed,
    Object comments = freezed,
  }) {
    return _then(_PhotoDetailDTO(
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as double,
      comments: comments == freezed ? _value.comments : comments as String,
    ));
  }
}

@JsonSerializable()
class _$_PhotoDetailDTO extends _PhotoDetailDTO with DiagnosticableTreeMixin {
  const _$_PhotoDetailDTO(
      {@required this.name, @required this.price, @required this.comments})
      : assert(name != null),
        assert(price != null),
        assert(comments != null),
        super._();

  factory _$_PhotoDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_PhotoDetailDTOFromJson(json);

  @override
  final String name;
  @override
  final double price;
  @override
  final String comments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoDetailDTO(name: $name, price: $price, comments: $comments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoDetailDTO'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('comments', comments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhotoDetailDTO &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(comments);

  @override
  _$PhotoDetailDTOCopyWith<_PhotoDetailDTO> get copyWith =>
      __$PhotoDetailDTOCopyWithImpl<_PhotoDetailDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhotoDetailDTOToJson(this);
  }
}

abstract class _PhotoDetailDTO extends PhotoDetailDTO {
  const _PhotoDetailDTO._() : super._();
  const factory _PhotoDetailDTO(
      {@required String name,
      @required double price,
      @required String comments}) = _$_PhotoDetailDTO;

  factory _PhotoDetailDTO.fromJson(Map<String, dynamic> json) =
      _$_PhotoDetailDTO.fromJson;

  @override
  String get name;
  @override
  double get price;
  @override
  String get comments;
  @override
  _$PhotoDetailDTOCopyWith<_PhotoDetailDTO> get copyWith;
}

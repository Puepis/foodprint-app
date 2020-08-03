// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'photo_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PhotoDTOTearOff {
  const _$PhotoDTOTearOff();

  _PhotoDTO call(
      {@required String storagePath,
      @required String url,
      @required PhotoDetailDTO details,
      @required String timestamp,
      @required bool isFavourite}) {
    return _PhotoDTO(
      storagePath: storagePath,
      url: url,
      details: details,
      timestamp: timestamp,
      isFavourite: isFavourite,
    );
  }
}

// ignore: unused_element
const $PhotoDTO = _$PhotoDTOTearOff();

mixin _$PhotoDTO {
  String get storagePath;
  String get url;
  PhotoDetailDTO get details;
  String get timestamp;
  bool get isFavourite;

  $PhotoDTOCopyWith<PhotoDTO> get copyWith;
}

abstract class $PhotoDTOCopyWith<$Res> {
  factory $PhotoDTOCopyWith(PhotoDTO value, $Res Function(PhotoDTO) then) =
      _$PhotoDTOCopyWithImpl<$Res>;
  $Res call(
      {String storagePath,
      String url,
      PhotoDetailDTO details,
      String timestamp,
      bool isFavourite});

  $PhotoDetailDTOCopyWith<$Res> get details;
}

class _$PhotoDTOCopyWithImpl<$Res> implements $PhotoDTOCopyWith<$Res> {
  _$PhotoDTOCopyWithImpl(this._value, this._then);

  final PhotoDTO _value;
  // ignore: unused_field
  final $Res Function(PhotoDTO) _then;

  @override
  $Res call({
    Object storagePath = freezed,
    Object url = freezed,
    Object details = freezed,
    Object timestamp = freezed,
    Object isFavourite = freezed,
  }) {
    return _then(_value.copyWith(
      storagePath:
          storagePath == freezed ? _value.storagePath : storagePath as String,
      url: url == freezed ? _value.url : url as String,
      details: details == freezed ? _value.details : details as PhotoDetailDTO,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as String,
      isFavourite:
          isFavourite == freezed ? _value.isFavourite : isFavourite as bool,
    ));
  }

  @override
  $PhotoDetailDTOCopyWith<$Res> get details {
    if (_value.details == null) {
      return null;
    }
    return $PhotoDetailDTOCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value));
    });
  }
}

abstract class _$PhotoDTOCopyWith<$Res> implements $PhotoDTOCopyWith<$Res> {
  factory _$PhotoDTOCopyWith(_PhotoDTO value, $Res Function(_PhotoDTO) then) =
      __$PhotoDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String storagePath,
      String url,
      PhotoDetailDTO details,
      String timestamp,
      bool isFavourite});

  @override
  $PhotoDetailDTOCopyWith<$Res> get details;
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
    Object url = freezed,
    Object details = freezed,
    Object timestamp = freezed,
    Object isFavourite = freezed,
  }) {
    return _then(_PhotoDTO(
      storagePath:
          storagePath == freezed ? _value.storagePath : storagePath as String,
      url: url == freezed ? _value.url : url as String,
      details: details == freezed ? _value.details : details as PhotoDetailDTO,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as String,
      isFavourite:
          isFavourite == freezed ? _value.isFavourite : isFavourite as bool,
    ));
  }
}

class _$_PhotoDTO extends _PhotoDTO with DiagnosticableTreeMixin {
  const _$_PhotoDTO(
      {@required this.storagePath,
      @required this.url,
      @required this.details,
      @required this.timestamp,
      @required this.isFavourite})
      : assert(storagePath != null),
        assert(url != null),
        assert(details != null),
        assert(timestamp != null),
        assert(isFavourite != null),
        super._();

  @override
  final String storagePath;
  @override
  final String url;
  @override
  final PhotoDetailDTO details;
  @override
  final String timestamp;
  @override
  final bool isFavourite;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoDTO(storagePath: $storagePath, url: $url, details: $details, timestamp: $timestamp, isFavourite: $isFavourite)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoDTO'))
      ..add(DiagnosticsProperty('storagePath', storagePath))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('details', details))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('isFavourite', isFavourite));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhotoDTO &&
            (identical(other.storagePath, storagePath) ||
                const DeepCollectionEquality()
                    .equals(other.storagePath, storagePath)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.isFavourite, isFavourite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavourite, isFavourite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(storagePath) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(isFavourite);

  @override
  _$PhotoDTOCopyWith<_PhotoDTO> get copyWith =>
      __$PhotoDTOCopyWithImpl<_PhotoDTO>(this, _$identity);
}

abstract class _PhotoDTO extends PhotoDTO {
  const _PhotoDTO._() : super._();
  const factory _PhotoDTO(
      {@required String storagePath,
      @required String url,
      @required PhotoDetailDTO details,
      @required String timestamp,
      @required bool isFavourite}) = _$_PhotoDTO;

  @override
  String get storagePath;
  @override
  String get url;
  @override
  PhotoDetailDTO get details;
  @override
  String get timestamp;
  @override
  bool get isFavourite;
  @override
  _$PhotoDTOCopyWith<_PhotoDTO> get copyWith;
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

class _$_PhotoDetailDTO extends _PhotoDetailDTO with DiagnosticableTreeMixin {
  const _$_PhotoDetailDTO(
      {@required this.name, @required this.price, @required this.comments})
      : assert(name != null),
        assert(price != null),
        assert(comments != null),
        super._();

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
}

abstract class _PhotoDetailDTO extends PhotoDetailDTO {
  const _PhotoDetailDTO._() : super._();
  const factory _PhotoDetailDTO(
      {@required String name,
      @required double price,
      @required String comments}) = _$_PhotoDetailDTO;

  @override
  String get name;
  @override
  double get price;
  @override
  String get comments;
  @override
  _$PhotoDetailDTOCopyWith<_PhotoDetailDTO> get copyWith;
}

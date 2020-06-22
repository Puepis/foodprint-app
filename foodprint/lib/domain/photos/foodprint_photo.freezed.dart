// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'foodprint_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FoodprintPhotoTearOff {
  const _$FoodprintPhotoTearOff();

  _FoodprintPhoto call(
      {@required StoragePath storagePath,
      @required PhotoData imageData,
      @required PhotoDetail photoDetail,
      @required Timestamp timestamp}) {
    return _FoodprintPhoto(
      storagePath: storagePath,
      imageData: imageData,
      photoDetail: photoDetail,
      timestamp: timestamp,
    );
  }
}

// ignore: unused_element
const $FoodprintPhoto = _$FoodprintPhotoTearOff();

mixin _$FoodprintPhoto {
  StoragePath get storagePath;
  PhotoData get imageData;
  PhotoDetail get photoDetail;
  Timestamp get timestamp;

  $FoodprintPhotoCopyWith<FoodprintPhoto> get copyWith;
}

abstract class $FoodprintPhotoCopyWith<$Res> {
  factory $FoodprintPhotoCopyWith(
          FoodprintPhoto value, $Res Function(FoodprintPhoto) then) =
      _$FoodprintPhotoCopyWithImpl<$Res>;
  $Res call(
      {StoragePath storagePath,
      PhotoData imageData,
      PhotoDetail photoDetail,
      Timestamp timestamp});

  $PhotoDetailCopyWith<$Res> get photoDetail;
}

class _$FoodprintPhotoCopyWithImpl<$Res>
    implements $FoodprintPhotoCopyWith<$Res> {
  _$FoodprintPhotoCopyWithImpl(this._value, this._then);

  final FoodprintPhoto _value;
  // ignore: unused_field
  final $Res Function(FoodprintPhoto) _then;

  @override
  $Res call({
    Object storagePath = freezed,
    Object imageData = freezed,
    Object photoDetail = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      storagePath: storagePath == freezed
          ? _value.storagePath
          : storagePath as StoragePath,
      imageData:
          imageData == freezed ? _value.imageData : imageData as PhotoData,
      photoDetail: photoDetail == freezed
          ? _value.photoDetail
          : photoDetail as PhotoDetail,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }

  @override
  $PhotoDetailCopyWith<$Res> get photoDetail {
    if (_value.photoDetail == null) {
      return null;
    }
    return $PhotoDetailCopyWith<$Res>(_value.photoDetail, (value) {
      return _then(_value.copyWith(photoDetail: value));
    });
  }
}

abstract class _$FoodprintPhotoCopyWith<$Res>
    implements $FoodprintPhotoCopyWith<$Res> {
  factory _$FoodprintPhotoCopyWith(
          _FoodprintPhoto value, $Res Function(_FoodprintPhoto) then) =
      __$FoodprintPhotoCopyWithImpl<$Res>;
  @override
  $Res call(
      {StoragePath storagePath,
      PhotoData imageData,
      PhotoDetail photoDetail,
      Timestamp timestamp});

  @override
  $PhotoDetailCopyWith<$Res> get photoDetail;
}

class __$FoodprintPhotoCopyWithImpl<$Res>
    extends _$FoodprintPhotoCopyWithImpl<$Res>
    implements _$FoodprintPhotoCopyWith<$Res> {
  __$FoodprintPhotoCopyWithImpl(
      _FoodprintPhoto _value, $Res Function(_FoodprintPhoto) _then)
      : super(_value, (v) => _then(v as _FoodprintPhoto));

  @override
  _FoodprintPhoto get _value => super._value as _FoodprintPhoto;

  @override
  $Res call({
    Object storagePath = freezed,
    Object imageData = freezed,
    Object photoDetail = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_FoodprintPhoto(
      storagePath: storagePath == freezed
          ? _value.storagePath
          : storagePath as StoragePath,
      imageData:
          imageData == freezed ? _value.imageData : imageData as PhotoData,
      photoDetail: photoDetail == freezed
          ? _value.photoDetail
          : photoDetail as PhotoDetail,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }
}

class _$_FoodprintPhoto extends _FoodprintPhoto {
  const _$_FoodprintPhoto(
      {@required this.storagePath,
      @required this.imageData,
      @required this.photoDetail,
      @required this.timestamp})
      : assert(storagePath != null),
        assert(imageData != null),
        assert(photoDetail != null),
        assert(timestamp != null),
        super._();

  @override
  final StoragePath storagePath;
  @override
  final PhotoData imageData;
  @override
  final PhotoDetail photoDetail;
  @override
  final Timestamp timestamp;

  @override
  String toString() {
    return 'FoodprintPhoto(storagePath: $storagePath, imageData: $imageData, photoDetail: $photoDetail, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FoodprintPhoto &&
            (identical(other.storagePath, storagePath) ||
                const DeepCollectionEquality()
                    .equals(other.storagePath, storagePath)) &&
            (identical(other.imageData, imageData) ||
                const DeepCollectionEquality()
                    .equals(other.imageData, imageData)) &&
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
      const DeepCollectionEquality().hash(imageData) ^
      const DeepCollectionEquality().hash(photoDetail) ^
      const DeepCollectionEquality().hash(timestamp);

  @override
  _$FoodprintPhotoCopyWith<_FoodprintPhoto> get copyWith =>
      __$FoodprintPhotoCopyWithImpl<_FoodprintPhoto>(this, _$identity);
}

abstract class _FoodprintPhoto extends FoodprintPhoto {
  const _FoodprintPhoto._() : super._();
  const factory _FoodprintPhoto(
      {@required StoragePath storagePath,
      @required PhotoData imageData,
      @required PhotoDetail photoDetail,
      @required Timestamp timestamp}) = _$_FoodprintPhoto;

  @override
  StoragePath get storagePath;
  @override
  PhotoData get imageData;
  @override
  PhotoDetail get photoDetail;
  @override
  Timestamp get timestamp;
  @override
  _$FoodprintPhotoCopyWith<_FoodprintPhoto> get copyWith;
}

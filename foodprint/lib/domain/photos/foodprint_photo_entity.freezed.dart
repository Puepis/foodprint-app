// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'foodprint_photo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FoodprintPhotoEntityTearOff {
  const _$FoodprintPhotoEntityTearOff();

  _FoodprintPhoto call(
      {@required StoragePath storagePath,
      @required PhotoData imageData,
      @required PhotoDetailEntity photoDetail,
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
const $FoodprintPhotoEntity = _$FoodprintPhotoEntityTearOff();

mixin _$FoodprintPhotoEntity {
  StoragePath get storagePath;
  PhotoData get imageData;
  PhotoDetailEntity get photoDetail;
  Timestamp get timestamp;

  $FoodprintPhotoEntityCopyWith<FoodprintPhotoEntity> get copyWith;
}

abstract class $FoodprintPhotoEntityCopyWith<$Res> {
  factory $FoodprintPhotoEntityCopyWith(FoodprintPhotoEntity value,
          $Res Function(FoodprintPhotoEntity) then) =
      _$FoodprintPhotoEntityCopyWithImpl<$Res>;
  $Res call(
      {StoragePath storagePath,
      PhotoData imageData,
      PhotoDetailEntity photoDetail,
      Timestamp timestamp});

  $PhotoDetailEntityCopyWith<$Res> get photoDetail;
}

class _$FoodprintPhotoEntityCopyWithImpl<$Res>
    implements $FoodprintPhotoEntityCopyWith<$Res> {
  _$FoodprintPhotoEntityCopyWithImpl(this._value, this._then);

  final FoodprintPhotoEntity _value;
  // ignore: unused_field
  final $Res Function(FoodprintPhotoEntity) _then;

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
          : photoDetail as PhotoDetailEntity,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }

  @override
  $PhotoDetailEntityCopyWith<$Res> get photoDetail {
    if (_value.photoDetail == null) {
      return null;
    }
    return $PhotoDetailEntityCopyWith<$Res>(_value.photoDetail, (value) {
      return _then(_value.copyWith(photoDetail: value));
    });
  }
}

abstract class _$FoodprintPhotoCopyWith<$Res>
    implements $FoodprintPhotoEntityCopyWith<$Res> {
  factory _$FoodprintPhotoCopyWith(
          _FoodprintPhoto value, $Res Function(_FoodprintPhoto) then) =
      __$FoodprintPhotoCopyWithImpl<$Res>;
  @override
  $Res call(
      {StoragePath storagePath,
      PhotoData imageData,
      PhotoDetailEntity photoDetail,
      Timestamp timestamp});

  @override
  $PhotoDetailEntityCopyWith<$Res> get photoDetail;
}

class __$FoodprintPhotoCopyWithImpl<$Res>
    extends _$FoodprintPhotoEntityCopyWithImpl<$Res>
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
          : photoDetail as PhotoDetailEntity,
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
  final PhotoDetailEntity photoDetail;
  @override
  final Timestamp timestamp;

  @override
  String toString() {
    return 'FoodprintPhotoEntity(storagePath: $storagePath, imageData: $imageData, photoDetail: $photoDetail, timestamp: $timestamp)';
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

abstract class _FoodprintPhoto extends FoodprintPhotoEntity {
  const _FoodprintPhoto._() : super._();
  const factory _FoodprintPhoto(
      {@required StoragePath storagePath,
      @required PhotoData imageData,
      @required PhotoDetailEntity photoDetail,
      @required Timestamp timestamp}) = _$_FoodprintPhoto;

  @override
  StoragePath get storagePath;
  @override
  PhotoData get imageData;
  @override
  PhotoDetailEntity get photoDetail;
  @override
  Timestamp get timestamp;
  @override
  _$FoodprintPhotoCopyWith<_FoodprintPhoto> get copyWith;
}

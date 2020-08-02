// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'photo_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PhotoDetailEntityTearOff {
  const _$PhotoDetailEntityTearOff();

  _PhotoDetailEntity call(
      {@required PhotoName name,
      @required PhotoPrice price,
      @required PhotoComments comments}) {
    return _PhotoDetailEntity(
      name: name,
      price: price,
      comments: comments,
    );
  }
}

// ignore: unused_element
const $PhotoDetailEntity = _$PhotoDetailEntityTearOff();

mixin _$PhotoDetailEntity {
  PhotoName get name;
  PhotoPrice get price;
  PhotoComments get comments;

  $PhotoDetailEntityCopyWith<PhotoDetailEntity> get copyWith;
}

abstract class $PhotoDetailEntityCopyWith<$Res> {
  factory $PhotoDetailEntityCopyWith(
          PhotoDetailEntity value, $Res Function(PhotoDetailEntity) then) =
      _$PhotoDetailEntityCopyWithImpl<$Res>;
  $Res call({PhotoName name, PhotoPrice price, PhotoComments comments});
}

class _$PhotoDetailEntityCopyWithImpl<$Res>
    implements $PhotoDetailEntityCopyWith<$Res> {
  _$PhotoDetailEntityCopyWithImpl(this._value, this._then);

  final PhotoDetailEntity _value;
  // ignore: unused_field
  final $Res Function(PhotoDetailEntity) _then;

  @override
  $Res call({
    Object name = freezed,
    Object price = freezed,
    Object comments = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as PhotoName,
      price: price == freezed ? _value.price : price as PhotoPrice,
      comments:
          comments == freezed ? _value.comments : comments as PhotoComments,
    ));
  }
}

abstract class _$PhotoDetailEntityCopyWith<$Res>
    implements $PhotoDetailEntityCopyWith<$Res> {
  factory _$PhotoDetailEntityCopyWith(
          _PhotoDetailEntity value, $Res Function(_PhotoDetailEntity) then) =
      __$PhotoDetailEntityCopyWithImpl<$Res>;
  @override
  $Res call({PhotoName name, PhotoPrice price, PhotoComments comments});
}

class __$PhotoDetailEntityCopyWithImpl<$Res>
    extends _$PhotoDetailEntityCopyWithImpl<$Res>
    implements _$PhotoDetailEntityCopyWith<$Res> {
  __$PhotoDetailEntityCopyWithImpl(
      _PhotoDetailEntity _value, $Res Function(_PhotoDetailEntity) _then)
      : super(_value, (v) => _then(v as _PhotoDetailEntity));

  @override
  _PhotoDetailEntity get _value => super._value as _PhotoDetailEntity;

  @override
  $Res call({
    Object name = freezed,
    Object price = freezed,
    Object comments = freezed,
  }) {
    return _then(_PhotoDetailEntity(
      name: name == freezed ? _value.name : name as PhotoName,
      price: price == freezed ? _value.price : price as PhotoPrice,
      comments:
          comments == freezed ? _value.comments : comments as PhotoComments,
    ));
  }
}

class _$_PhotoDetailEntity extends _PhotoDetailEntity {
  const _$_PhotoDetailEntity(
      {@required this.name, @required this.price, @required this.comments})
      : assert(name != null),
        assert(price != null),
        assert(comments != null),
        super._();

  @override
  final PhotoName name;
  @override
  final PhotoPrice price;
  @override
  final PhotoComments comments;

  @override
  String toString() {
    return 'PhotoDetailEntity(name: $name, price: $price, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhotoDetailEntity &&
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
  _$PhotoDetailEntityCopyWith<_PhotoDetailEntity> get copyWith =>
      __$PhotoDetailEntityCopyWithImpl<_PhotoDetailEntity>(this, _$identity);
}

abstract class _PhotoDetailEntity extends PhotoDetailEntity {
  const _PhotoDetailEntity._() : super._();
  const factory _PhotoDetailEntity(
      {@required PhotoName name,
      @required PhotoPrice price,
      @required PhotoComments comments}) = _$_PhotoDetailEntity;

  @override
  PhotoName get name;
  @override
  PhotoPrice get price;
  @override
  PhotoComments get comments;
  @override
  _$PhotoDetailEntityCopyWith<_PhotoDetailEntity> get copyWith;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'photo_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PhotoDetailTearOff {
  const _$PhotoDetailTearOff();

  _PhotoDetail call(
      {@required PhotoName name,
      @required PhotoPrice price,
      @required PhotoComments comments}) {
    return _PhotoDetail(
      name: name,
      price: price,
      comments: comments,
    );
  }
}

// ignore: unused_element
const $PhotoDetail = _$PhotoDetailTearOff();

mixin _$PhotoDetail {
  PhotoName get name;
  PhotoPrice get price;
  PhotoComments get comments;

  $PhotoDetailCopyWith<PhotoDetail> get copyWith;
}

abstract class $PhotoDetailCopyWith<$Res> {
  factory $PhotoDetailCopyWith(
          PhotoDetail value, $Res Function(PhotoDetail) then) =
      _$PhotoDetailCopyWithImpl<$Res>;
  $Res call({PhotoName name, PhotoPrice price, PhotoComments comments});
}

class _$PhotoDetailCopyWithImpl<$Res> implements $PhotoDetailCopyWith<$Res> {
  _$PhotoDetailCopyWithImpl(this._value, this._then);

  final PhotoDetail _value;
  // ignore: unused_field
  final $Res Function(PhotoDetail) _then;

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

abstract class _$PhotoDetailCopyWith<$Res>
    implements $PhotoDetailCopyWith<$Res> {
  factory _$PhotoDetailCopyWith(
          _PhotoDetail value, $Res Function(_PhotoDetail) then) =
      __$PhotoDetailCopyWithImpl<$Res>;
  @override
  $Res call({PhotoName name, PhotoPrice price, PhotoComments comments});
}

class __$PhotoDetailCopyWithImpl<$Res> extends _$PhotoDetailCopyWithImpl<$Res>
    implements _$PhotoDetailCopyWith<$Res> {
  __$PhotoDetailCopyWithImpl(
      _PhotoDetail _value, $Res Function(_PhotoDetail) _then)
      : super(_value, (v) => _then(v as _PhotoDetail));

  @override
  _PhotoDetail get _value => super._value as _PhotoDetail;

  @override
  $Res call({
    Object name = freezed,
    Object price = freezed,
    Object comments = freezed,
  }) {
    return _then(_PhotoDetail(
      name: name == freezed ? _value.name : name as PhotoName,
      price: price == freezed ? _value.price : price as PhotoPrice,
      comments:
          comments == freezed ? _value.comments : comments as PhotoComments,
    ));
  }
}

class _$_PhotoDetail extends _PhotoDetail {
  const _$_PhotoDetail(
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
    return 'PhotoDetail(name: $name, price: $price, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhotoDetail &&
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
  _$PhotoDetailCopyWith<_PhotoDetail> get copyWith =>
      __$PhotoDetailCopyWithImpl<_PhotoDetail>(this, _$identity);
}

abstract class _PhotoDetail extends PhotoDetail {
  const _PhotoDetail._() : super._();
  const factory _PhotoDetail(
      {@required PhotoName name,
      @required PhotoPrice price,
      @required PhotoComments comments}) = _$_PhotoDetail;

  @override
  PhotoName get name;
  @override
  PhotoPrice get price;
  @override
  PhotoComments get comments;
  @override
  _$PhotoDetailCopyWith<_PhotoDetail> get copyWith;
}

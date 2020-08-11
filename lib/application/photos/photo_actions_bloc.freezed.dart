// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'photo_actions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PhotoActionsEventTearOff {
  const _$PhotoActionsEventTearOff();

  Deleted deleted({@required PhotoEntity photo}) {
    return Deleted(
      photo: photo,
    );
  }

  Edited edited(
      {@required PhotoEntity oldPhoto,
      @required String newName,
      @required String newPrice,
      @required String newComments,
      @required bool isFavourite}) {
    return Edited(
      oldPhoto: oldPhoto,
      newName: newName,
      newPrice: newPrice,
      newComments: newComments,
      isFavourite: isFavourite,
    );
  }

  Saved saved(
      {@required UserID userID,
      @required File imageFile,
      @required String itemName,
      @required String price,
      @required String comments,
      @required RestaurantID placeID}) {
    return Saved(
      userID: userID,
      imageFile: imageFile,
      itemName: itemName,
      price: price,
      comments: comments,
      placeID: placeID,
    );
  }

  FavouriteChanged favouriteChanged(
      {@required PhotoEntity photo, @required bool newFavourite}) {
    return FavouriteChanged(
      photo: photo,
      newFavourite: newFavourite,
    );
  }
}

// ignore: unused_element
const $PhotoActionsEvent = _$PhotoActionsEventTearOff();

mixin _$PhotoActionsEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result deleted(PhotoEntity photo),
    @required
        Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
            String newComments, bool isFavourite),
    @required
        Result saved(UserID userID, File imageFile, String itemName,
            String price, String comments, RestaurantID placeID),
    @required Result favouriteChanged(PhotoEntity photo, bool newFavourite),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleted(PhotoEntity photo),
    Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
        String newComments, bool isFavourite),
    Result saved(UserID userID, File imageFile, String itemName, String price,
        String comments, RestaurantID placeID),
    Result favouriteChanged(PhotoEntity photo, bool newFavourite),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleted(Deleted value),
    @required Result edited(Edited value),
    @required Result saved(Saved value),
    @required Result favouriteChanged(FavouriteChanged value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleted(Deleted value),
    Result edited(Edited value),
    Result saved(Saved value),
    Result favouriteChanged(FavouriteChanged value),
    @required Result orElse(),
  });
}

abstract class $PhotoActionsEventCopyWith<$Res> {
  factory $PhotoActionsEventCopyWith(
          PhotoActionsEvent value, $Res Function(PhotoActionsEvent) then) =
      _$PhotoActionsEventCopyWithImpl<$Res>;
}

class _$PhotoActionsEventCopyWithImpl<$Res>
    implements $PhotoActionsEventCopyWith<$Res> {
  _$PhotoActionsEventCopyWithImpl(this._value, this._then);

  final PhotoActionsEvent _value;
  // ignore: unused_field
  final $Res Function(PhotoActionsEvent) _then;
}

abstract class $DeletedCopyWith<$Res> {
  factory $DeletedCopyWith(Deleted value, $Res Function(Deleted) then) =
      _$DeletedCopyWithImpl<$Res>;
  $Res call({PhotoEntity photo});

  $PhotoEntityCopyWith<$Res> get photo;
}

class _$DeletedCopyWithImpl<$Res> extends _$PhotoActionsEventCopyWithImpl<$Res>
    implements $DeletedCopyWith<$Res> {
  _$DeletedCopyWithImpl(Deleted _value, $Res Function(Deleted) _then)
      : super(_value, (v) => _then(v as Deleted));

  @override
  Deleted get _value => super._value as Deleted;

  @override
  $Res call({
    Object photo = freezed,
  }) {
    return _then(Deleted(
      photo: photo == freezed ? _value.photo : photo as PhotoEntity,
    ));
  }

  @override
  $PhotoEntityCopyWith<$Res> get photo {
    if (_value.photo == null) {
      return null;
    }
    return $PhotoEntityCopyWith<$Res>(_value.photo, (value) {
      return _then(_value.copyWith(photo: value));
    });
  }
}

class _$Deleted implements Deleted {
  const _$Deleted({@required this.photo}) : assert(photo != null);

  @override
  final PhotoEntity photo;

  @override
  String toString() {
    return 'PhotoActionsEvent.deleted(photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Deleted &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(photo);

  @override
  $DeletedCopyWith<Deleted> get copyWith =>
      _$DeletedCopyWithImpl<Deleted>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result deleted(PhotoEntity photo),
    @required
        Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
            String newComments, bool isFavourite),
    @required
        Result saved(UserID userID, File imageFile, String itemName,
            String price, String comments, RestaurantID placeID),
    @required Result favouriteChanged(PhotoEntity photo, bool newFavourite),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    assert(favouriteChanged != null);
    return deleted(photo);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleted(PhotoEntity photo),
    Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
        String newComments, bool isFavourite),
    Result saved(UserID userID, File imageFile, String itemName, String price,
        String comments, RestaurantID placeID),
    Result favouriteChanged(PhotoEntity photo, bool newFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleted != null) {
      return deleted(photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleted(Deleted value),
    @required Result edited(Edited value),
    @required Result saved(Saved value),
    @required Result favouriteChanged(FavouriteChanged value),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    assert(favouriteChanged != null);
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleted(Deleted value),
    Result edited(Edited value),
    Result saved(Saved value),
    Result favouriteChanged(FavouriteChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class Deleted implements PhotoActionsEvent {
  const factory Deleted({@required PhotoEntity photo}) = _$Deleted;

  PhotoEntity get photo;
  $DeletedCopyWith<Deleted> get copyWith;
}

abstract class $EditedCopyWith<$Res> {
  factory $EditedCopyWith(Edited value, $Res Function(Edited) then) =
      _$EditedCopyWithImpl<$Res>;
  $Res call(
      {PhotoEntity oldPhoto,
      String newName,
      String newPrice,
      String newComments,
      bool isFavourite});

  $PhotoEntityCopyWith<$Res> get oldPhoto;
}

class _$EditedCopyWithImpl<$Res> extends _$PhotoActionsEventCopyWithImpl<$Res>
    implements $EditedCopyWith<$Res> {
  _$EditedCopyWithImpl(Edited _value, $Res Function(Edited) _then)
      : super(_value, (v) => _then(v as Edited));

  @override
  Edited get _value => super._value as Edited;

  @override
  $Res call({
    Object oldPhoto = freezed,
    Object newName = freezed,
    Object newPrice = freezed,
    Object newComments = freezed,
    Object isFavourite = freezed,
  }) {
    return _then(Edited(
      oldPhoto: oldPhoto == freezed ? _value.oldPhoto : oldPhoto as PhotoEntity,
      newName: newName == freezed ? _value.newName : newName as String,
      newPrice: newPrice == freezed ? _value.newPrice : newPrice as String,
      newComments:
          newComments == freezed ? _value.newComments : newComments as String,
      isFavourite:
          isFavourite == freezed ? _value.isFavourite : isFavourite as bool,
    ));
  }

  @override
  $PhotoEntityCopyWith<$Res> get oldPhoto {
    if (_value.oldPhoto == null) {
      return null;
    }
    return $PhotoEntityCopyWith<$Res>(_value.oldPhoto, (value) {
      return _then(_value.copyWith(oldPhoto: value));
    });
  }
}

class _$Edited implements Edited {
  const _$Edited(
      {@required this.oldPhoto,
      @required this.newName,
      @required this.newPrice,
      @required this.newComments,
      @required this.isFavourite})
      : assert(oldPhoto != null),
        assert(newName != null),
        assert(newPrice != null),
        assert(newComments != null),
        assert(isFavourite != null);

  @override
  final PhotoEntity oldPhoto;
  @override
  final String newName;
  @override
  final String newPrice;
  @override
  final String newComments;
  @override
  final bool isFavourite;

  @override
  String toString() {
    return 'PhotoActionsEvent.edited(oldPhoto: $oldPhoto, newName: $newName, newPrice: $newPrice, newComments: $newComments, isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Edited &&
            (identical(other.oldPhoto, oldPhoto) ||
                const DeepCollectionEquality()
                    .equals(other.oldPhoto, oldPhoto)) &&
            (identical(other.newName, newName) ||
                const DeepCollectionEquality()
                    .equals(other.newName, newName)) &&
            (identical(other.newPrice, newPrice) ||
                const DeepCollectionEquality()
                    .equals(other.newPrice, newPrice)) &&
            (identical(other.newComments, newComments) ||
                const DeepCollectionEquality()
                    .equals(other.newComments, newComments)) &&
            (identical(other.isFavourite, isFavourite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavourite, isFavourite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(oldPhoto) ^
      const DeepCollectionEquality().hash(newName) ^
      const DeepCollectionEquality().hash(newPrice) ^
      const DeepCollectionEquality().hash(newComments) ^
      const DeepCollectionEquality().hash(isFavourite);

  @override
  $EditedCopyWith<Edited> get copyWith =>
      _$EditedCopyWithImpl<Edited>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result deleted(PhotoEntity photo),
    @required
        Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
            String newComments, bool isFavourite),
    @required
        Result saved(UserID userID, File imageFile, String itemName,
            String price, String comments, RestaurantID placeID),
    @required Result favouriteChanged(PhotoEntity photo, bool newFavourite),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    assert(favouriteChanged != null);
    return edited(oldPhoto, newName, newPrice, newComments, isFavourite);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleted(PhotoEntity photo),
    Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
        String newComments, bool isFavourite),
    Result saved(UserID userID, File imageFile, String itemName, String price,
        String comments, RestaurantID placeID),
    Result favouriteChanged(PhotoEntity photo, bool newFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (edited != null) {
      return edited(oldPhoto, newName, newPrice, newComments, isFavourite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleted(Deleted value),
    @required Result edited(Edited value),
    @required Result saved(Saved value),
    @required Result favouriteChanged(FavouriteChanged value),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    assert(favouriteChanged != null);
    return edited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleted(Deleted value),
    Result edited(Edited value),
    Result saved(Saved value),
    Result favouriteChanged(FavouriteChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (edited != null) {
      return edited(this);
    }
    return orElse();
  }
}

abstract class Edited implements PhotoActionsEvent {
  const factory Edited(
      {@required PhotoEntity oldPhoto,
      @required String newName,
      @required String newPrice,
      @required String newComments,
      @required bool isFavourite}) = _$Edited;

  PhotoEntity get oldPhoto;
  String get newName;
  String get newPrice;
  String get newComments;
  bool get isFavourite;
  $EditedCopyWith<Edited> get copyWith;
}

abstract class $SavedCopyWith<$Res> {
  factory $SavedCopyWith(Saved value, $Res Function(Saved) then) =
      _$SavedCopyWithImpl<$Res>;
  $Res call(
      {UserID userID,
      File imageFile,
      String itemName,
      String price,
      String comments,
      RestaurantID placeID});
}

class _$SavedCopyWithImpl<$Res> extends _$PhotoActionsEventCopyWithImpl<$Res>
    implements $SavedCopyWith<$Res> {
  _$SavedCopyWithImpl(Saved _value, $Res Function(Saved) _then)
      : super(_value, (v) => _then(v as Saved));

  @override
  Saved get _value => super._value as Saved;

  @override
  $Res call({
    Object userID = freezed,
    Object imageFile = freezed,
    Object itemName = freezed,
    Object price = freezed,
    Object comments = freezed,
    Object placeID = freezed,
  }) {
    return _then(Saved(
      userID: userID == freezed ? _value.userID : userID as UserID,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      itemName: itemName == freezed ? _value.itemName : itemName as String,
      price: price == freezed ? _value.price : price as String,
      comments: comments == freezed ? _value.comments : comments as String,
      placeID: placeID == freezed ? _value.placeID : placeID as RestaurantID,
    ));
  }
}

class _$Saved implements Saved {
  const _$Saved(
      {@required this.userID,
      @required this.imageFile,
      @required this.itemName,
      @required this.price,
      @required this.comments,
      @required this.placeID})
      : assert(userID != null),
        assert(imageFile != null),
        assert(itemName != null),
        assert(price != null),
        assert(comments != null),
        assert(placeID != null);

  @override
  final UserID userID;
  @override
  final File imageFile;
  @override
  final String itemName;
  @override
  final String price;
  @override
  final String comments;
  @override
  final RestaurantID placeID;

  @override
  String toString() {
    return 'PhotoActionsEvent.saved(userID: $userID, imageFile: $imageFile, itemName: $itemName, price: $price, comments: $comments, placeID: $placeID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Saved &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.itemName, itemName) ||
                const DeepCollectionEquality()
                    .equals(other.itemName, itemName)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.placeID, placeID) ||
                const DeepCollectionEquality().equals(other.placeID, placeID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(itemName) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(placeID);

  @override
  $SavedCopyWith<Saved> get copyWith =>
      _$SavedCopyWithImpl<Saved>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result deleted(PhotoEntity photo),
    @required
        Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
            String newComments, bool isFavourite),
    @required
        Result saved(UserID userID, File imageFile, String itemName,
            String price, String comments, RestaurantID placeID),
    @required Result favouriteChanged(PhotoEntity photo, bool newFavourite),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    assert(favouriteChanged != null);
    return saved(userID, imageFile, itemName, price, comments, placeID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleted(PhotoEntity photo),
    Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
        String newComments, bool isFavourite),
    Result saved(UserID userID, File imageFile, String itemName, String price,
        String comments, RestaurantID placeID),
    Result favouriteChanged(PhotoEntity photo, bool newFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(userID, imageFile, itemName, price, comments, placeID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleted(Deleted value),
    @required Result edited(Edited value),
    @required Result saved(Saved value),
    @required Result favouriteChanged(FavouriteChanged value),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    assert(favouriteChanged != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleted(Deleted value),
    Result edited(Edited value),
    Result saved(Saved value),
    Result favouriteChanged(FavouriteChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class Saved implements PhotoActionsEvent {
  const factory Saved(
      {@required UserID userID,
      @required File imageFile,
      @required String itemName,
      @required String price,
      @required String comments,
      @required RestaurantID placeID}) = _$Saved;

  UserID get userID;
  File get imageFile;
  String get itemName;
  String get price;
  String get comments;
  RestaurantID get placeID;
  $SavedCopyWith<Saved> get copyWith;
}

abstract class $FavouriteChangedCopyWith<$Res> {
  factory $FavouriteChangedCopyWith(
          FavouriteChanged value, $Res Function(FavouriteChanged) then) =
      _$FavouriteChangedCopyWithImpl<$Res>;
  $Res call({PhotoEntity photo, bool newFavourite});

  $PhotoEntityCopyWith<$Res> get photo;
}

class _$FavouriteChangedCopyWithImpl<$Res>
    extends _$PhotoActionsEventCopyWithImpl<$Res>
    implements $FavouriteChangedCopyWith<$Res> {
  _$FavouriteChangedCopyWithImpl(
      FavouriteChanged _value, $Res Function(FavouriteChanged) _then)
      : super(_value, (v) => _then(v as FavouriteChanged));

  @override
  FavouriteChanged get _value => super._value as FavouriteChanged;

  @override
  $Res call({
    Object photo = freezed,
    Object newFavourite = freezed,
  }) {
    return _then(FavouriteChanged(
      photo: photo == freezed ? _value.photo : photo as PhotoEntity,
      newFavourite:
          newFavourite == freezed ? _value.newFavourite : newFavourite as bool,
    ));
  }

  @override
  $PhotoEntityCopyWith<$Res> get photo {
    if (_value.photo == null) {
      return null;
    }
    return $PhotoEntityCopyWith<$Res>(_value.photo, (value) {
      return _then(_value.copyWith(photo: value));
    });
  }
}

class _$FavouriteChanged implements FavouriteChanged {
  const _$FavouriteChanged({@required this.photo, @required this.newFavourite})
      : assert(photo != null),
        assert(newFavourite != null);

  @override
  final PhotoEntity photo;
  @override
  final bool newFavourite;

  @override
  String toString() {
    return 'PhotoActionsEvent.favouriteChanged(photo: $photo, newFavourite: $newFavourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FavouriteChanged &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.newFavourite, newFavourite) ||
                const DeepCollectionEquality()
                    .equals(other.newFavourite, newFavourite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(newFavourite);

  @override
  $FavouriteChangedCopyWith<FavouriteChanged> get copyWith =>
      _$FavouriteChangedCopyWithImpl<FavouriteChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result deleted(PhotoEntity photo),
    @required
        Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
            String newComments, bool isFavourite),
    @required
        Result saved(UserID userID, File imageFile, String itemName,
            String price, String comments, RestaurantID placeID),
    @required Result favouriteChanged(PhotoEntity photo, bool newFavourite),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    assert(favouriteChanged != null);
    return favouriteChanged(photo, newFavourite);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleted(PhotoEntity photo),
    Result edited(PhotoEntity oldPhoto, String newName, String newPrice,
        String newComments, bool isFavourite),
    Result saved(UserID userID, File imageFile, String itemName, String price,
        String comments, RestaurantID placeID),
    Result favouriteChanged(PhotoEntity photo, bool newFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (favouriteChanged != null) {
      return favouriteChanged(photo, newFavourite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleted(Deleted value),
    @required Result edited(Edited value),
    @required Result saved(Saved value),
    @required Result favouriteChanged(FavouriteChanged value),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    assert(favouriteChanged != null);
    return favouriteChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleted(Deleted value),
    Result edited(Edited value),
    Result saved(Saved value),
    Result favouriteChanged(FavouriteChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (favouriteChanged != null) {
      return favouriteChanged(this);
    }
    return orElse();
  }
}

abstract class FavouriteChanged implements PhotoActionsEvent {
  const factory FavouriteChanged(
      {@required PhotoEntity photo,
      @required bool newFavourite}) = _$FavouriteChanged;

  PhotoEntity get photo;
  bool get newFavourite;
  $FavouriteChangedCopyWith<FavouriteChanged> get copyWith;
}

class _$PhotoActionsStateTearOff {
  const _$PhotoActionsStateTearOff();

  Initial initial() {
    return const Initial();
  }

  ActionInProgress actionInProgress() {
    return const ActionInProgress();
  }

  DeleteFailure deleteFailure(PhotoFailure failure) {
    return DeleteFailure(
      failure,
    );
  }

  DeleteSuccess deleteSuccess() {
    return const DeleteSuccess();
  }

  EditFailure editFailure(PhotoFailure failure) {
    return EditFailure(
      failure,
    );
  }

  EditSuccess editSuccess(PhotoEntity newPhoto) {
    return EditSuccess(
      newPhoto,
    );
  }

  SaveFailure saveFailure(PhotoFailure failure) {
    return SaveFailure(
      failure,
    );
  }

  SaveSuccess saveSuccess(PhotoEntity newPhoto) {
    return SaveSuccess(
      newPhoto,
    );
  }

  ChangeFavouriteFailure changeFavouriteFailure(PhotoFailure failure) {
    return ChangeFavouriteFailure(
      failure,
    );
  }

  ChangeFavouriteSuccess changeFavouriteSuccess({bool isFavourite}) {
    return ChangeFavouriteSuccess(
      isFavourite: isFavourite,
    );
  }
}

// ignore: unused_element
const $PhotoActionsState = _$PhotoActionsStateTearOff();

mixin _$PhotoActionsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  });
}

abstract class $PhotoActionsStateCopyWith<$Res> {
  factory $PhotoActionsStateCopyWith(
          PhotoActionsState value, $Res Function(PhotoActionsState) then) =
      _$PhotoActionsStateCopyWithImpl<$Res>;
}

class _$PhotoActionsStateCopyWithImpl<$Res>
    implements $PhotoActionsStateCopyWith<$Res> {
  _$PhotoActionsStateCopyWithImpl(this._value, this._then);

  final PhotoActionsState _value;
  // ignore: unused_field
  final $Res Function(PhotoActionsState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'PhotoActionsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements PhotoActionsState {
  const factory Initial() = _$Initial;
}

abstract class $ActionInProgressCopyWith<$Res> {
  factory $ActionInProgressCopyWith(
          ActionInProgress value, $Res Function(ActionInProgress) then) =
      _$ActionInProgressCopyWithImpl<$Res>;
}

class _$ActionInProgressCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $ActionInProgressCopyWith<$Res> {
  _$ActionInProgressCopyWithImpl(
      ActionInProgress _value, $Res Function(ActionInProgress) _then)
      : super(_value, (v) => _then(v as ActionInProgress));

  @override
  ActionInProgress get _value => super._value as ActionInProgress;
}

class _$ActionInProgress implements ActionInProgress {
  const _$ActionInProgress();

  @override
  String toString() {
    return 'PhotoActionsState.actionInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ActionInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (actionInProgress != null) {
      return actionInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (actionInProgress != null) {
      return actionInProgress(this);
    }
    return orElse();
  }
}

abstract class ActionInProgress implements PhotoActionsState {
  const factory ActionInProgress() = _$ActionInProgress;
}

abstract class $DeleteFailureCopyWith<$Res> {
  factory $DeleteFailureCopyWith(
          DeleteFailure value, $Res Function(DeleteFailure) then) =
      _$DeleteFailureCopyWithImpl<$Res>;
  $Res call({PhotoFailure failure});

  $PhotoFailureCopyWith<$Res> get failure;
}

class _$DeleteFailureCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $DeleteFailureCopyWith<$Res> {
  _$DeleteFailureCopyWithImpl(
      DeleteFailure _value, $Res Function(DeleteFailure) _then)
      : super(_value, (v) => _then(v as DeleteFailure));

  @override
  DeleteFailure get _value => super._value as DeleteFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(DeleteFailure(
      failure == freezed ? _value.failure : failure as PhotoFailure,
    ));
  }

  @override
  $PhotoFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $PhotoFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$DeleteFailure implements DeleteFailure {
  const _$DeleteFailure(this.failure) : assert(failure != null);

  @override
  final PhotoFailure failure;

  @override
  String toString() {
    return 'PhotoActionsState.deleteFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $DeleteFailureCopyWith<DeleteFailure> get copyWith =>
      _$DeleteFailureCopyWithImpl<DeleteFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return deleteFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteFailure != null) {
      return deleteFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return deleteFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteFailure != null) {
      return deleteFailure(this);
    }
    return orElse();
  }
}

abstract class DeleteFailure implements PhotoActionsState {
  const factory DeleteFailure(PhotoFailure failure) = _$DeleteFailure;

  PhotoFailure get failure;
  $DeleteFailureCopyWith<DeleteFailure> get copyWith;
}

abstract class $DeleteSuccessCopyWith<$Res> {
  factory $DeleteSuccessCopyWith(
          DeleteSuccess value, $Res Function(DeleteSuccess) then) =
      _$DeleteSuccessCopyWithImpl<$Res>;
}

class _$DeleteSuccessCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $DeleteSuccessCopyWith<$Res> {
  _$DeleteSuccessCopyWithImpl(
      DeleteSuccess _value, $Res Function(DeleteSuccess) _then)
      : super(_value, (v) => _then(v as DeleteSuccess));

  @override
  DeleteSuccess get _value => super._value as DeleteSuccess;
}

class _$DeleteSuccess implements DeleteSuccess {
  const _$DeleteSuccess();

  @override
  String toString() {
    return 'PhotoActionsState.deleteSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeleteSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return deleteSuccess();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return deleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess(this);
    }
    return orElse();
  }
}

abstract class DeleteSuccess implements PhotoActionsState {
  const factory DeleteSuccess() = _$DeleteSuccess;
}

abstract class $EditFailureCopyWith<$Res> {
  factory $EditFailureCopyWith(
          EditFailure value, $Res Function(EditFailure) then) =
      _$EditFailureCopyWithImpl<$Res>;
  $Res call({PhotoFailure failure});

  $PhotoFailureCopyWith<$Res> get failure;
}

class _$EditFailureCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $EditFailureCopyWith<$Res> {
  _$EditFailureCopyWithImpl(
      EditFailure _value, $Res Function(EditFailure) _then)
      : super(_value, (v) => _then(v as EditFailure));

  @override
  EditFailure get _value => super._value as EditFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(EditFailure(
      failure == freezed ? _value.failure : failure as PhotoFailure,
    ));
  }

  @override
  $PhotoFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $PhotoFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$EditFailure implements EditFailure {
  const _$EditFailure(this.failure) : assert(failure != null);

  @override
  final PhotoFailure failure;

  @override
  String toString() {
    return 'PhotoActionsState.editFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $EditFailureCopyWith<EditFailure> get copyWith =>
      _$EditFailureCopyWithImpl<EditFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return editFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editFailure != null) {
      return editFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return editFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editFailure != null) {
      return editFailure(this);
    }
    return orElse();
  }
}

abstract class EditFailure implements PhotoActionsState {
  const factory EditFailure(PhotoFailure failure) = _$EditFailure;

  PhotoFailure get failure;
  $EditFailureCopyWith<EditFailure> get copyWith;
}

abstract class $EditSuccessCopyWith<$Res> {
  factory $EditSuccessCopyWith(
          EditSuccess value, $Res Function(EditSuccess) then) =
      _$EditSuccessCopyWithImpl<$Res>;
  $Res call({PhotoEntity newPhoto});

  $PhotoEntityCopyWith<$Res> get newPhoto;
}

class _$EditSuccessCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $EditSuccessCopyWith<$Res> {
  _$EditSuccessCopyWithImpl(
      EditSuccess _value, $Res Function(EditSuccess) _then)
      : super(_value, (v) => _then(v as EditSuccess));

  @override
  EditSuccess get _value => super._value as EditSuccess;

  @override
  $Res call({
    Object newPhoto = freezed,
  }) {
    return _then(EditSuccess(
      newPhoto == freezed ? _value.newPhoto : newPhoto as PhotoEntity,
    ));
  }

  @override
  $PhotoEntityCopyWith<$Res> get newPhoto {
    if (_value.newPhoto == null) {
      return null;
    }
    return $PhotoEntityCopyWith<$Res>(_value.newPhoto, (value) {
      return _then(_value.copyWith(newPhoto: value));
    });
  }
}

class _$EditSuccess implements EditSuccess {
  const _$EditSuccess(this.newPhoto) : assert(newPhoto != null);

  @override
  final PhotoEntity newPhoto;

  @override
  String toString() {
    return 'PhotoActionsState.editSuccess(newPhoto: $newPhoto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditSuccess &&
            (identical(other.newPhoto, newPhoto) ||
                const DeepCollectionEquality()
                    .equals(other.newPhoto, newPhoto)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newPhoto);

  @override
  $EditSuccessCopyWith<EditSuccess> get copyWith =>
      _$EditSuccessCopyWithImpl<EditSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return editSuccess(newPhoto);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editSuccess != null) {
      return editSuccess(newPhoto);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return editSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editSuccess != null) {
      return editSuccess(this);
    }
    return orElse();
  }
}

abstract class EditSuccess implements PhotoActionsState {
  const factory EditSuccess(PhotoEntity newPhoto) = _$EditSuccess;

  PhotoEntity get newPhoto;
  $EditSuccessCopyWith<EditSuccess> get copyWith;
}

abstract class $SaveFailureCopyWith<$Res> {
  factory $SaveFailureCopyWith(
          SaveFailure value, $Res Function(SaveFailure) then) =
      _$SaveFailureCopyWithImpl<$Res>;
  $Res call({PhotoFailure failure});

  $PhotoFailureCopyWith<$Res> get failure;
}

class _$SaveFailureCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $SaveFailureCopyWith<$Res> {
  _$SaveFailureCopyWithImpl(
      SaveFailure _value, $Res Function(SaveFailure) _then)
      : super(_value, (v) => _then(v as SaveFailure));

  @override
  SaveFailure get _value => super._value as SaveFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(SaveFailure(
      failure == freezed ? _value.failure : failure as PhotoFailure,
    ));
  }

  @override
  $PhotoFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $PhotoFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$SaveFailure implements SaveFailure {
  const _$SaveFailure(this.failure) : assert(failure != null);

  @override
  final PhotoFailure failure;

  @override
  String toString() {
    return 'PhotoActionsState.saveFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $SaveFailureCopyWith<SaveFailure> get copyWith =>
      _$SaveFailureCopyWithImpl<SaveFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return saveFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveFailure != null) {
      return saveFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return saveFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveFailure != null) {
      return saveFailure(this);
    }
    return orElse();
  }
}

abstract class SaveFailure implements PhotoActionsState {
  const factory SaveFailure(PhotoFailure failure) = _$SaveFailure;

  PhotoFailure get failure;
  $SaveFailureCopyWith<SaveFailure> get copyWith;
}

abstract class $SaveSuccessCopyWith<$Res> {
  factory $SaveSuccessCopyWith(
          SaveSuccess value, $Res Function(SaveSuccess) then) =
      _$SaveSuccessCopyWithImpl<$Res>;
  $Res call({PhotoEntity newPhoto});

  $PhotoEntityCopyWith<$Res> get newPhoto;
}

class _$SaveSuccessCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $SaveSuccessCopyWith<$Res> {
  _$SaveSuccessCopyWithImpl(
      SaveSuccess _value, $Res Function(SaveSuccess) _then)
      : super(_value, (v) => _then(v as SaveSuccess));

  @override
  SaveSuccess get _value => super._value as SaveSuccess;

  @override
  $Res call({
    Object newPhoto = freezed,
  }) {
    return _then(SaveSuccess(
      newPhoto == freezed ? _value.newPhoto : newPhoto as PhotoEntity,
    ));
  }

  @override
  $PhotoEntityCopyWith<$Res> get newPhoto {
    if (_value.newPhoto == null) {
      return null;
    }
    return $PhotoEntityCopyWith<$Res>(_value.newPhoto, (value) {
      return _then(_value.copyWith(newPhoto: value));
    });
  }
}

class _$SaveSuccess implements SaveSuccess {
  const _$SaveSuccess(this.newPhoto) : assert(newPhoto != null);

  @override
  final PhotoEntity newPhoto;

  @override
  String toString() {
    return 'PhotoActionsState.saveSuccess(newPhoto: $newPhoto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveSuccess &&
            (identical(other.newPhoto, newPhoto) ||
                const DeepCollectionEquality()
                    .equals(other.newPhoto, newPhoto)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newPhoto);

  @override
  $SaveSuccessCopyWith<SaveSuccess> get copyWith =>
      _$SaveSuccessCopyWithImpl<SaveSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return saveSuccess(newPhoto);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveSuccess != null) {
      return saveSuccess(newPhoto);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return saveSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveSuccess != null) {
      return saveSuccess(this);
    }
    return orElse();
  }
}

abstract class SaveSuccess implements PhotoActionsState {
  const factory SaveSuccess(PhotoEntity newPhoto) = _$SaveSuccess;

  PhotoEntity get newPhoto;
  $SaveSuccessCopyWith<SaveSuccess> get copyWith;
}

abstract class $ChangeFavouriteFailureCopyWith<$Res> {
  factory $ChangeFavouriteFailureCopyWith(ChangeFavouriteFailure value,
          $Res Function(ChangeFavouriteFailure) then) =
      _$ChangeFavouriteFailureCopyWithImpl<$Res>;
  $Res call({PhotoFailure failure});

  $PhotoFailureCopyWith<$Res> get failure;
}

class _$ChangeFavouriteFailureCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $ChangeFavouriteFailureCopyWith<$Res> {
  _$ChangeFavouriteFailureCopyWithImpl(ChangeFavouriteFailure _value,
      $Res Function(ChangeFavouriteFailure) _then)
      : super(_value, (v) => _then(v as ChangeFavouriteFailure));

  @override
  ChangeFavouriteFailure get _value => super._value as ChangeFavouriteFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(ChangeFavouriteFailure(
      failure == freezed ? _value.failure : failure as PhotoFailure,
    ));
  }

  @override
  $PhotoFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $PhotoFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$ChangeFavouriteFailure implements ChangeFavouriteFailure {
  const _$ChangeFavouriteFailure(this.failure) : assert(failure != null);

  @override
  final PhotoFailure failure;

  @override
  String toString() {
    return 'PhotoActionsState.changeFavouriteFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeFavouriteFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $ChangeFavouriteFailureCopyWith<ChangeFavouriteFailure> get copyWith =>
      _$ChangeFavouriteFailureCopyWithImpl<ChangeFavouriteFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return changeFavouriteFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeFavouriteFailure != null) {
      return changeFavouriteFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return changeFavouriteFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeFavouriteFailure != null) {
      return changeFavouriteFailure(this);
    }
    return orElse();
  }
}

abstract class ChangeFavouriteFailure implements PhotoActionsState {
  const factory ChangeFavouriteFailure(PhotoFailure failure) =
      _$ChangeFavouriteFailure;

  PhotoFailure get failure;
  $ChangeFavouriteFailureCopyWith<ChangeFavouriteFailure> get copyWith;
}

abstract class $ChangeFavouriteSuccessCopyWith<$Res> {
  factory $ChangeFavouriteSuccessCopyWith(ChangeFavouriteSuccess value,
          $Res Function(ChangeFavouriteSuccess) then) =
      _$ChangeFavouriteSuccessCopyWithImpl<$Res>;
  $Res call({bool isFavourite});
}

class _$ChangeFavouriteSuccessCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $ChangeFavouriteSuccessCopyWith<$Res> {
  _$ChangeFavouriteSuccessCopyWithImpl(ChangeFavouriteSuccess _value,
      $Res Function(ChangeFavouriteSuccess) _then)
      : super(_value, (v) => _then(v as ChangeFavouriteSuccess));

  @override
  ChangeFavouriteSuccess get _value => super._value as ChangeFavouriteSuccess;

  @override
  $Res call({
    Object isFavourite = freezed,
  }) {
    return _then(ChangeFavouriteSuccess(
      isFavourite:
          isFavourite == freezed ? _value.isFavourite : isFavourite as bool,
    ));
  }
}

class _$ChangeFavouriteSuccess implements ChangeFavouriteSuccess {
  const _$ChangeFavouriteSuccess({this.isFavourite});

  @override
  final bool isFavourite;

  @override
  String toString() {
    return 'PhotoActionsState.changeFavouriteSuccess(isFavourite: $isFavourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeFavouriteSuccess &&
            (identical(other.isFavourite, isFavourite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavourite, isFavourite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isFavourite);

  @override
  $ChangeFavouriteSuccessCopyWith<ChangeFavouriteSuccess> get copyWith =>
      _$ChangeFavouriteSuccessCopyWithImpl<ChangeFavouriteSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(PhotoEntity newPhoto),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(PhotoEntity newPhoto),
    @required Result changeFavouriteFailure(PhotoFailure failure),
    @required Result changeFavouriteSuccess(bool isFavourite),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return changeFavouriteSuccess(isFavourite);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(PhotoEntity newPhoto),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(PhotoEntity newPhoto),
    Result changeFavouriteFailure(PhotoFailure failure),
    Result changeFavouriteSuccess(bool isFavourite),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeFavouriteSuccess != null) {
      return changeFavouriteSuccess(isFavourite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
    @required Result changeFavouriteFailure(ChangeFavouriteFailure value),
    @required Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
  }) {
    assert(initial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    assert(changeFavouriteFailure != null);
    assert(changeFavouriteSuccess != null);
    return changeFavouriteSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    Result changeFavouriteFailure(ChangeFavouriteFailure value),
    Result changeFavouriteSuccess(ChangeFavouriteSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (changeFavouriteSuccess != null) {
      return changeFavouriteSuccess(this);
    }
    return orElse();
  }
}

abstract class ChangeFavouriteSuccess implements PhotoActionsState {
  const factory ChangeFavouriteSuccess({bool isFavourite}) =
      _$ChangeFavouriteSuccess;

  bool get isFavourite;
  $ChangeFavouriteSuccessCopyWith<ChangeFavouriteSuccess> get copyWith;
}

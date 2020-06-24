// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'photo_actions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PhotoActionsEventTearOff {
  const _$PhotoActionsEventTearOff();

  Deleted deleted(
      {@required PhotoEntity photo,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity foodprint}) {
    return Deleted(
      photo: photo,
      restaurant: restaurant,
      foodprint: foodprint,
    );
  }

  Edited edited(
      {@required PhotoEntity oldPhoto,
      @required String newName,
      @required String newPrice,
      @required String newComments,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity foodprint}) {
    return Edited(
      oldPhoto: oldPhoto,
      newName: newName,
      newPrice: newPrice,
      newComments: newComments,
      restaurant: restaurant,
      foodprint: foodprint,
    );
  }

  Saved saved(
      {@required User user,
      @required File imageFile,
      @required String itemName,
      @required String price,
      @required String comments,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity foodprint}) {
    return Saved(
      user: user,
      imageFile: imageFile,
      itemName: itemName,
      price: price,
      comments: comments,
      restaurant: restaurant,
      foodprint: foodprint,
    );
  }
}

// ignore: unused_element
const $PhotoActionsEvent = _$PhotoActionsEventTearOff();

mixin _$PhotoActionsEvent {
  RestaurantEntity get restaurant;
  FoodprintEntity get foodprint;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result deleted(PhotoEntity photo, RestaurantEntity restaurant,
            FoodprintEntity foodprint),
    @required
        Result edited(
            PhotoEntity oldPhoto,
            String newName,
            String newPrice,
            String newComments,
            RestaurantEntity restaurant,
            FoodprintEntity foodprint),
    @required
        Result saved(
            User user,
            File imageFile,
            String itemName,
            String price,
            String comments,
            RestaurantEntity restaurant,
            FoodprintEntity foodprint),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleted(PhotoEntity photo, RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    Result edited(
        PhotoEntity oldPhoto,
        String newName,
        String newPrice,
        String newComments,
        RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    Result saved(
        User user,
        File imageFile,
        String itemName,
        String price,
        String comments,
        RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleted(Deleted value),
    @required Result edited(Edited value),
    @required Result saved(Saved value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleted(Deleted value),
    Result edited(Edited value),
    Result saved(Saved value),
    @required Result orElse(),
  });

  $PhotoActionsEventCopyWith<PhotoActionsEvent> get copyWith;
}

abstract class $PhotoActionsEventCopyWith<$Res> {
  factory $PhotoActionsEventCopyWith(
          PhotoActionsEvent value, $Res Function(PhotoActionsEvent) then) =
      _$PhotoActionsEventCopyWithImpl<$Res>;
  $Res call({RestaurantEntity restaurant, FoodprintEntity foodprint});

  $RestaurantEntityCopyWith<$Res> get restaurant;
  $FoodprintEntityCopyWith<$Res> get foodprint;
}

class _$PhotoActionsEventCopyWithImpl<$Res>
    implements $PhotoActionsEventCopyWith<$Res> {
  _$PhotoActionsEventCopyWithImpl(this._value, this._then);

  final PhotoActionsEvent _value;
  // ignore: unused_field
  final $Res Function(PhotoActionsEvent) _then;

  @override
  $Res call({
    Object restaurant = freezed,
    Object foodprint = freezed,
  }) {
    return _then(_value.copyWith(
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant as RestaurantEntity,
      foodprint: foodprint == freezed
          ? _value.foodprint
          : foodprint as FoodprintEntity,
    ));
  }

  @override
  $RestaurantEntityCopyWith<$Res> get restaurant {
    if (_value.restaurant == null) {
      return null;
    }
    return $RestaurantEntityCopyWith<$Res>(_value.restaurant, (value) {
      return _then(_value.copyWith(restaurant: value));
    });
  }

  @override
  $FoodprintEntityCopyWith<$Res> get foodprint {
    if (_value.foodprint == null) {
      return null;
    }
    return $FoodprintEntityCopyWith<$Res>(_value.foodprint, (value) {
      return _then(_value.copyWith(foodprint: value));
    });
  }
}

abstract class $DeletedCopyWith<$Res>
    implements $PhotoActionsEventCopyWith<$Res> {
  factory $DeletedCopyWith(Deleted value, $Res Function(Deleted) then) =
      _$DeletedCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhotoEntity photo,
      RestaurantEntity restaurant,
      FoodprintEntity foodprint});

  $PhotoEntityCopyWith<$Res> get photo;
  @override
  $RestaurantEntityCopyWith<$Res> get restaurant;
  @override
  $FoodprintEntityCopyWith<$Res> get foodprint;
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
    Object restaurant = freezed,
    Object foodprint = freezed,
  }) {
    return _then(Deleted(
      photo: photo == freezed ? _value.photo : photo as PhotoEntity,
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant as RestaurantEntity,
      foodprint: foodprint == freezed
          ? _value.foodprint
          : foodprint as FoodprintEntity,
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
  const _$Deleted(
      {@required this.photo,
      @required this.restaurant,
      @required this.foodprint})
      : assert(photo != null),
        assert(restaurant != null),
        assert(foodprint != null);

  @override
  final PhotoEntity photo;
  @override
  final RestaurantEntity restaurant;
  @override
  final FoodprintEntity foodprint;

  @override
  String toString() {
    return 'PhotoActionsEvent.deleted(photo: $photo, restaurant: $restaurant, foodprint: $foodprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Deleted &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)) &&
            (identical(other.restaurant, restaurant) ||
                const DeepCollectionEquality()
                    .equals(other.restaurant, restaurant)) &&
            (identical(other.foodprint, foodprint) ||
                const DeepCollectionEquality()
                    .equals(other.foodprint, foodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(photo) ^
      const DeepCollectionEquality().hash(restaurant) ^
      const DeepCollectionEquality().hash(foodprint);

  @override
  $DeletedCopyWith<Deleted> get copyWith =>
      _$DeletedCopyWithImpl<Deleted>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result deleted(PhotoEntity photo, RestaurantEntity restaurant,
            FoodprintEntity foodprint),
    @required
        Result edited(
            PhotoEntity oldPhoto,
            String newName,
            String newPrice,
            String newComments,
            RestaurantEntity restaurant,
            FoodprintEntity foodprint),
    @required
        Result saved(
            User user,
            File imageFile,
            String itemName,
            String price,
            String comments,
            RestaurantEntity restaurant,
            FoodprintEntity foodprint),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    return deleted(photo, restaurant, foodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleted(PhotoEntity photo, RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    Result edited(
        PhotoEntity oldPhoto,
        String newName,
        String newPrice,
        String newComments,
        RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    Result saved(
        User user,
        File imageFile,
        String itemName,
        String price,
        String comments,
        RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleted != null) {
      return deleted(photo, restaurant, foodprint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleted(Deleted value),
    @required Result edited(Edited value),
    @required Result saved(Saved value),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleted(Deleted value),
    Result edited(Edited value),
    Result saved(Saved value),
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
  const factory Deleted(
      {@required PhotoEntity photo,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity foodprint}) = _$Deleted;

  PhotoEntity get photo;
  @override
  RestaurantEntity get restaurant;
  @override
  FoodprintEntity get foodprint;
  @override
  $DeletedCopyWith<Deleted> get copyWith;
}

abstract class $EditedCopyWith<$Res>
    implements $PhotoActionsEventCopyWith<$Res> {
  factory $EditedCopyWith(Edited value, $Res Function(Edited) then) =
      _$EditedCopyWithImpl<$Res>;
  @override
  $Res call(
      {PhotoEntity oldPhoto,
      String newName,
      String newPrice,
      String newComments,
      RestaurantEntity restaurant,
      FoodprintEntity foodprint});

  $PhotoEntityCopyWith<$Res> get oldPhoto;
  @override
  $RestaurantEntityCopyWith<$Res> get restaurant;
  @override
  $FoodprintEntityCopyWith<$Res> get foodprint;
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
    Object restaurant = freezed,
    Object foodprint = freezed,
  }) {
    return _then(Edited(
      oldPhoto: oldPhoto == freezed ? _value.oldPhoto : oldPhoto as PhotoEntity,
      newName: newName == freezed ? _value.newName : newName as String,
      newPrice: newPrice == freezed ? _value.newPrice : newPrice as String,
      newComments:
          newComments == freezed ? _value.newComments : newComments as String,
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant as RestaurantEntity,
      foodprint: foodprint == freezed
          ? _value.foodprint
          : foodprint as FoodprintEntity,
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
      @required this.restaurant,
      @required this.foodprint})
      : assert(oldPhoto != null),
        assert(newName != null),
        assert(newPrice != null),
        assert(newComments != null),
        assert(restaurant != null),
        assert(foodprint != null);

  @override
  final PhotoEntity oldPhoto;
  @override
  final String newName;
  @override
  final String newPrice;
  @override
  final String newComments;
  @override
  final RestaurantEntity restaurant;
  @override
  final FoodprintEntity foodprint;

  @override
  String toString() {
    return 'PhotoActionsEvent.edited(oldPhoto: $oldPhoto, newName: $newName, newPrice: $newPrice, newComments: $newComments, restaurant: $restaurant, foodprint: $foodprint)';
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
            (identical(other.restaurant, restaurant) ||
                const DeepCollectionEquality()
                    .equals(other.restaurant, restaurant)) &&
            (identical(other.foodprint, foodprint) ||
                const DeepCollectionEquality()
                    .equals(other.foodprint, foodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(oldPhoto) ^
      const DeepCollectionEquality().hash(newName) ^
      const DeepCollectionEquality().hash(newPrice) ^
      const DeepCollectionEquality().hash(newComments) ^
      const DeepCollectionEquality().hash(restaurant) ^
      const DeepCollectionEquality().hash(foodprint);

  @override
  $EditedCopyWith<Edited> get copyWith =>
      _$EditedCopyWithImpl<Edited>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result deleted(PhotoEntity photo, RestaurantEntity restaurant,
            FoodprintEntity foodprint),
    @required
        Result edited(
            PhotoEntity oldPhoto,
            String newName,
            String newPrice,
            String newComments,
            RestaurantEntity restaurant,
            FoodprintEntity foodprint),
    @required
        Result saved(
            User user,
            File imageFile,
            String itemName,
            String price,
            String comments,
            RestaurantEntity restaurant,
            FoodprintEntity foodprint),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    return edited(
        oldPhoto, newName, newPrice, newComments, restaurant, foodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleted(PhotoEntity photo, RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    Result edited(
        PhotoEntity oldPhoto,
        String newName,
        String newPrice,
        String newComments,
        RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    Result saved(
        User user,
        File imageFile,
        String itemName,
        String price,
        String comments,
        RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (edited != null) {
      return edited(
          oldPhoto, newName, newPrice, newComments, restaurant, foodprint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleted(Deleted value),
    @required Result edited(Edited value),
    @required Result saved(Saved value),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    return edited(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleted(Deleted value),
    Result edited(Edited value),
    Result saved(Saved value),
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
      @required RestaurantEntity restaurant,
      @required FoodprintEntity foodprint}) = _$Edited;

  PhotoEntity get oldPhoto;
  String get newName;
  String get newPrice;
  String get newComments;
  @override
  RestaurantEntity get restaurant;
  @override
  FoodprintEntity get foodprint;
  @override
  $EditedCopyWith<Edited> get copyWith;
}

abstract class $SavedCopyWith<$Res>
    implements $PhotoActionsEventCopyWith<$Res> {
  factory $SavedCopyWith(Saved value, $Res Function(Saved) then) =
      _$SavedCopyWithImpl<$Res>;
  @override
  $Res call(
      {User user,
      File imageFile,
      String itemName,
      String price,
      String comments,
      RestaurantEntity restaurant,
      FoodprintEntity foodprint});

  $UserCopyWith<$Res> get user;
  @override
  $RestaurantEntityCopyWith<$Res> get restaurant;
  @override
  $FoodprintEntityCopyWith<$Res> get foodprint;
}

class _$SavedCopyWithImpl<$Res> extends _$PhotoActionsEventCopyWithImpl<$Res>
    implements $SavedCopyWith<$Res> {
  _$SavedCopyWithImpl(Saved _value, $Res Function(Saved) _then)
      : super(_value, (v) => _then(v as Saved));

  @override
  Saved get _value => super._value as Saved;

  @override
  $Res call({
    Object user = freezed,
    Object imageFile = freezed,
    Object itemName = freezed,
    Object price = freezed,
    Object comments = freezed,
    Object restaurant = freezed,
    Object foodprint = freezed,
  }) {
    return _then(Saved(
      user: user == freezed ? _value.user : user as User,
      imageFile: imageFile == freezed ? _value.imageFile : imageFile as File,
      itemName: itemName == freezed ? _value.itemName : itemName as String,
      price: price == freezed ? _value.price : price as String,
      comments: comments == freezed ? _value.comments : comments as String,
      restaurant: restaurant == freezed
          ? _value.restaurant
          : restaurant as RestaurantEntity,
      foodprint: foodprint == freezed
          ? _value.foodprint
          : foodprint as FoodprintEntity,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

class _$Saved implements Saved {
  const _$Saved(
      {@required this.user,
      @required this.imageFile,
      @required this.itemName,
      @required this.price,
      @required this.comments,
      @required this.restaurant,
      @required this.foodprint})
      : assert(user != null),
        assert(imageFile != null),
        assert(itemName != null),
        assert(price != null),
        assert(comments != null),
        assert(restaurant != null),
        assert(foodprint != null);

  @override
  final User user;
  @override
  final File imageFile;
  @override
  final String itemName;
  @override
  final String price;
  @override
  final String comments;
  @override
  final RestaurantEntity restaurant;
  @override
  final FoodprintEntity foodprint;

  @override
  String toString() {
    return 'PhotoActionsEvent.saved(user: $user, imageFile: $imageFile, itemName: $itemName, price: $price, comments: $comments, restaurant: $restaurant, foodprint: $foodprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Saved &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
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
            (identical(other.restaurant, restaurant) ||
                const DeepCollectionEquality()
                    .equals(other.restaurant, restaurant)) &&
            (identical(other.foodprint, foodprint) ||
                const DeepCollectionEquality()
                    .equals(other.foodprint, foodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(itemName) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(restaurant) ^
      const DeepCollectionEquality().hash(foodprint);

  @override
  $SavedCopyWith<Saved> get copyWith =>
      _$SavedCopyWithImpl<Saved>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result deleted(PhotoEntity photo, RestaurantEntity restaurant,
            FoodprintEntity foodprint),
    @required
        Result edited(
            PhotoEntity oldPhoto,
            String newName,
            String newPrice,
            String newComments,
            RestaurantEntity restaurant,
            FoodprintEntity foodprint),
    @required
        Result saved(
            User user,
            File imageFile,
            String itemName,
            String price,
            String comments,
            RestaurantEntity restaurant,
            FoodprintEntity foodprint),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    return saved(
        user, imageFile, itemName, price, comments, restaurant, foodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result deleted(PhotoEntity photo, RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    Result edited(
        PhotoEntity oldPhoto,
        String newName,
        String newPrice,
        String newComments,
        RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    Result saved(
        User user,
        File imageFile,
        String itemName,
        String price,
        String comments,
        RestaurantEntity restaurant,
        FoodprintEntity foodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(
          user, imageFile, itemName, price, comments, restaurant, foodprint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result deleted(Deleted value),
    @required Result edited(Edited value),
    @required Result saved(Saved value),
  }) {
    assert(deleted != null);
    assert(edited != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result deleted(Deleted value),
    Result edited(Edited value),
    Result saved(Saved value),
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
      {@required User user,
      @required File imageFile,
      @required String itemName,
      @required String price,
      @required String comments,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity foodprint}) = _$Saved;

  User get user;
  File get imageFile;
  String get itemName;
  String get price;
  String get comments;
  @override
  RestaurantEntity get restaurant;
  @override
  FoodprintEntity get foodprint;
  @override
  $SavedCopyWith<Saved> get copyWith;
}

class _$PhotoActionsStateTearOff {
  const _$PhotoActionsStateTearOff();

  Initial intial() {
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

  DeleteSuccess deleteSuccess(FoodprintEntity foodprint) {
    return DeleteSuccess(
      foodprint,
    );
  }

  EditFailure editFailure(PhotoFailure failure) {
    return EditFailure(
      failure,
    );
  }

  EditSuccess editSuccess(FoodprintEntity foodprint) {
    return EditSuccess(
      foodprint,
    );
  }

  SaveFailure saveFailure(PhotoFailure failure) {
    return SaveFailure(
      failure,
    );
  }

  SaveSuccess saveSuccess(FoodprintEntity foodprint) {
    return SaveSuccess(
      foodprint,
    );
  }
}

// ignore: unused_element
const $PhotoActionsState = _$PhotoActionsStateTearOff();

mixin _$PhotoActionsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result intial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(FoodprintEntity foodprint),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(FoodprintEntity foodprint),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(FoodprintEntity foodprint),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result intial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(FoodprintEntity foodprint),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(FoodprintEntity foodprint),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(FoodprintEntity foodprint),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result intial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result intial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
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
    return 'PhotoActionsState.intial()';
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
    @required Result intial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(FoodprintEntity foodprint),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(FoodprintEntity foodprint),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(FoodprintEntity foodprint),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return intial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result intial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(FoodprintEntity foodprint),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(FoodprintEntity foodprint),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(FoodprintEntity foodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (intial != null) {
      return intial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result intial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return intial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result intial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (intial != null) {
      return intial(this);
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
    @required Result intial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(FoodprintEntity foodprint),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(FoodprintEntity foodprint),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(FoodprintEntity foodprint),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return actionInProgress();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result intial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(FoodprintEntity foodprint),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(FoodprintEntity foodprint),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(FoodprintEntity foodprint),
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
    @required Result intial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return actionInProgress(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result intial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
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
    @required Result intial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(FoodprintEntity foodprint),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(FoodprintEntity foodprint),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(FoodprintEntity foodprint),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return deleteFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result intial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(FoodprintEntity foodprint),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(FoodprintEntity foodprint),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(FoodprintEntity foodprint),
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
    @required Result intial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return deleteFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result intial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
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
  $Res call({FoodprintEntity foodprint});

  $FoodprintEntityCopyWith<$Res> get foodprint;
}

class _$DeleteSuccessCopyWithImpl<$Res>
    extends _$PhotoActionsStateCopyWithImpl<$Res>
    implements $DeleteSuccessCopyWith<$Res> {
  _$DeleteSuccessCopyWithImpl(
      DeleteSuccess _value, $Res Function(DeleteSuccess) _then)
      : super(_value, (v) => _then(v as DeleteSuccess));

  @override
  DeleteSuccess get _value => super._value as DeleteSuccess;

  @override
  $Res call({
    Object foodprint = freezed,
  }) {
    return _then(DeleteSuccess(
      foodprint == freezed ? _value.foodprint : foodprint as FoodprintEntity,
    ));
  }

  @override
  $FoodprintEntityCopyWith<$Res> get foodprint {
    if (_value.foodprint == null) {
      return null;
    }
    return $FoodprintEntityCopyWith<$Res>(_value.foodprint, (value) {
      return _then(_value.copyWith(foodprint: value));
    });
  }
}

class _$DeleteSuccess implements DeleteSuccess {
  const _$DeleteSuccess(this.foodprint) : assert(foodprint != null);

  @override
  final FoodprintEntity foodprint;

  @override
  String toString() {
    return 'PhotoActionsState.deleteSuccess(foodprint: $foodprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteSuccess &&
            (identical(other.foodprint, foodprint) ||
                const DeepCollectionEquality()
                    .equals(other.foodprint, foodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(foodprint);

  @override
  $DeleteSuccessCopyWith<DeleteSuccess> get copyWith =>
      _$DeleteSuccessCopyWithImpl<DeleteSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result intial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(FoodprintEntity foodprint),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(FoodprintEntity foodprint),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(FoodprintEntity foodprint),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return deleteSuccess(foodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result intial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(FoodprintEntity foodprint),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(FoodprintEntity foodprint),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(FoodprintEntity foodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteSuccess != null) {
      return deleteSuccess(foodprint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result intial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return deleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result intial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
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
  const factory DeleteSuccess(FoodprintEntity foodprint) = _$DeleteSuccess;

  FoodprintEntity get foodprint;
  $DeleteSuccessCopyWith<DeleteSuccess> get copyWith;
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
    @required Result intial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(FoodprintEntity foodprint),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(FoodprintEntity foodprint),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(FoodprintEntity foodprint),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return editFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result intial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(FoodprintEntity foodprint),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(FoodprintEntity foodprint),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(FoodprintEntity foodprint),
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
    @required Result intial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return editFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result intial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
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
  $Res call({FoodprintEntity foodprint});

  $FoodprintEntityCopyWith<$Res> get foodprint;
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
    Object foodprint = freezed,
  }) {
    return _then(EditSuccess(
      foodprint == freezed ? _value.foodprint : foodprint as FoodprintEntity,
    ));
  }

  @override
  $FoodprintEntityCopyWith<$Res> get foodprint {
    if (_value.foodprint == null) {
      return null;
    }
    return $FoodprintEntityCopyWith<$Res>(_value.foodprint, (value) {
      return _then(_value.copyWith(foodprint: value));
    });
  }
}

class _$EditSuccess implements EditSuccess {
  const _$EditSuccess(this.foodprint) : assert(foodprint != null);

  @override
  final FoodprintEntity foodprint;

  @override
  String toString() {
    return 'PhotoActionsState.editSuccess(foodprint: $foodprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditSuccess &&
            (identical(other.foodprint, foodprint) ||
                const DeepCollectionEquality()
                    .equals(other.foodprint, foodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(foodprint);

  @override
  $EditSuccessCopyWith<EditSuccess> get copyWith =>
      _$EditSuccessCopyWithImpl<EditSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result intial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(FoodprintEntity foodprint),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(FoodprintEntity foodprint),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(FoodprintEntity foodprint),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return editSuccess(foodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result intial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(FoodprintEntity foodprint),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(FoodprintEntity foodprint),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(FoodprintEntity foodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (editSuccess != null) {
      return editSuccess(foodprint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result intial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return editSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result intial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
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
  const factory EditSuccess(FoodprintEntity foodprint) = _$EditSuccess;

  FoodprintEntity get foodprint;
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
    @required Result intial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(FoodprintEntity foodprint),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(FoodprintEntity foodprint),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(FoodprintEntity foodprint),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return saveFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result intial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(FoodprintEntity foodprint),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(FoodprintEntity foodprint),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(FoodprintEntity foodprint),
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
    @required Result intial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return saveFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result intial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
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
  $Res call({FoodprintEntity foodprint});

  $FoodprintEntityCopyWith<$Res> get foodprint;
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
    Object foodprint = freezed,
  }) {
    return _then(SaveSuccess(
      foodprint == freezed ? _value.foodprint : foodprint as FoodprintEntity,
    ));
  }

  @override
  $FoodprintEntityCopyWith<$Res> get foodprint {
    if (_value.foodprint == null) {
      return null;
    }
    return $FoodprintEntityCopyWith<$Res>(_value.foodprint, (value) {
      return _then(_value.copyWith(foodprint: value));
    });
  }
}

class _$SaveSuccess implements SaveSuccess {
  const _$SaveSuccess(this.foodprint) : assert(foodprint != null);

  @override
  final FoodprintEntity foodprint;

  @override
  String toString() {
    return 'PhotoActionsState.saveSuccess(foodprint: $foodprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SaveSuccess &&
            (identical(other.foodprint, foodprint) ||
                const DeepCollectionEquality()
                    .equals(other.foodprint, foodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(foodprint);

  @override
  $SaveSuccessCopyWith<SaveSuccess> get copyWith =>
      _$SaveSuccessCopyWithImpl<SaveSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result intial(),
    @required Result actionInProgress(),
    @required Result deleteFailure(PhotoFailure failure),
    @required Result deleteSuccess(FoodprintEntity foodprint),
    @required Result editFailure(PhotoFailure failure),
    @required Result editSuccess(FoodprintEntity foodprint),
    @required Result saveFailure(PhotoFailure failure),
    @required Result saveSuccess(FoodprintEntity foodprint),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return saveSuccess(foodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result intial(),
    Result actionInProgress(),
    Result deleteFailure(PhotoFailure failure),
    Result deleteSuccess(FoodprintEntity foodprint),
    Result editFailure(PhotoFailure failure),
    Result editSuccess(FoodprintEntity foodprint),
    Result saveFailure(PhotoFailure failure),
    Result saveSuccess(FoodprintEntity foodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saveSuccess != null) {
      return saveSuccess(foodprint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result intial(Initial value),
    @required Result actionInProgress(ActionInProgress value),
    @required Result deleteFailure(DeleteFailure value),
    @required Result deleteSuccess(DeleteSuccess value),
    @required Result editFailure(EditFailure value),
    @required Result editSuccess(EditSuccess value),
    @required Result saveFailure(SaveFailure value),
    @required Result saveSuccess(SaveSuccess value),
  }) {
    assert(intial != null);
    assert(actionInProgress != null);
    assert(deleteFailure != null);
    assert(deleteSuccess != null);
    assert(editFailure != null);
    assert(editSuccess != null);
    assert(saveFailure != null);
    assert(saveSuccess != null);
    return saveSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result intial(Initial value),
    Result actionInProgress(ActionInProgress value),
    Result deleteFailure(DeleteFailure value),
    Result deleteSuccess(DeleteSuccess value),
    Result editFailure(EditFailure value),
    Result editSuccess(EditSuccess value),
    Result saveFailure(SaveFailure value),
    Result saveSuccess(SaveSuccess value),
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
  const factory SaveSuccess(FoodprintEntity foodprint) = _$SaveSuccess;

  FoodprintEntity get foodprint;
  $SaveSuccessCopyWith<SaveSuccess> get copyWith;
}

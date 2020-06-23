

import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';

class RestaurantID extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RestaurantID(String id) {
    assert(id != null);
    return RestaurantID._(right(id)); 
  }

  const RestaurantID._(this.value);
}

class RestaurantAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RestaurantAddress(String address) {
    assert(address != null);
    return RestaurantAddress._(right(address));
  }

  const RestaurantAddress._(this.value);
}

class RestaurantName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RestaurantName(String name) {
    assert(name != null);
    return RestaurantName._(right(name)); 
  }

  const RestaurantName._(this.value);
}

class RestaurantRating extends ValueObject<double> {
  static const double min = 0;
  static const double max = 5;
  @override
  final Either<ValueFailure<double>, double> value;

  factory RestaurantRating(double rating) {

    assert(rating != null);
    return RestaurantRating._(right(rating)); // TODO: validate 
  }

  const RestaurantRating._(this.value);
}

class RestaurantPriceLevel extends ValueObject<int> {
  static const int minLevel = 0;
  static const int maxLevel = 4;
  @override
  final Either<ValueFailure<int>, int> value;

  factory RestaurantPriceLevel(int priceLevel) {
    assert(priceLevel != null);
    return RestaurantPriceLevel._(right(priceLevel)); // TODO: validate price level 
  }

  const RestaurantPriceLevel._(this.value);
}
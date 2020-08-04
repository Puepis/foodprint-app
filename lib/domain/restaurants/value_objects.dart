import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/core/value_validators.dart';

class RestaurantID extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RestaurantID(String id) {
    assert(id != null);
    return RestaurantID._(
      validateStringNotEmpty(id),
    );
  }

  const RestaurantID._(this.value);
}

class RestaurantName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RestaurantName(String name) {
    assert(name != null);
    return RestaurantName._(validateStringNotEmpty(name));
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
    return RestaurantRating._(
      validateDoubleInRange(rating, min, max),
    );
  }

  const RestaurantRating._(this.value);
}

class RestaurantTypes extends ValueObject<List<String>> {
  @override
  final Either<ValueFailure<List<String>>, List<String>> value;

  factory RestaurantTypes(List<String> types) {
    assert(types != null);
    return RestaurantTypes._(right(types));
  }

  const RestaurantTypes._(this.value);
}

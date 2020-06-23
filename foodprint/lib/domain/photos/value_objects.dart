

import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/core/value_validators.dart';

class StoragePath extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StoragePath(String path) {
    assert(path != null);
    return StoragePath._(
      validateStringNotEmpty(path),
    ); 
  }

  const StoragePath._(this.value);
}

class PhotoData extends ValueObject<List<int>> {
  @override
  final Either<ValueFailure<List<int>>, List<int>> value;

  factory PhotoData(List<int> bytes) {
    assert(bytes != null);
    return PhotoData._(
      right(bytes)
    ); 
  }

  const PhotoData._(this.value);
}


class PhotoName extends ValueObject<String> {
  static const int maxLength = 50;
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhotoName(String title) {
    assert(title != null);
    return PhotoName._(
      validateMaxStringLength(title, maxLength),
    ); 
  }

  const PhotoName._(this.value);
}

class PhotoPrice extends ValueObject<double> {
  static const double minPrice = 0.0;
  static const double maxPrice = 99999.99;
  @override
  final Either<ValueFailure<double>, double> value;

  factory PhotoPrice(double price) {
    assert(price != null);
    return PhotoPrice._(
      validateDoubleInRange(price, minPrice, maxPrice)
    ); 
  }

  const PhotoPrice._(this.value);
}

class PhotoComments extends ValueObject<String> {
  static const int maxLength = 200;
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhotoComments(String comments) {
    assert(comments != null);
    return PhotoComments._(
      validateMaxStringLength(comments, maxLength),
    ); 
  }

  const PhotoComments._(this.value);
}



import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';

class StoragePath extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StoragePath(String input) {
    assert(input != null);
    return StoragePath._(right(input)); // TODO: validate storage path
  }

  const StoragePath._(this.value);
}

class PhotoData extends ValueObject<List<int>> {
  @override
  final Either<ValueFailure<List<int>>, List<int>> value;

  factory PhotoData(List<int> input) {
    assert(input != null);
    return PhotoData._(right(input)); // TODO: validate img bytes 
  }

  const PhotoData._(this.value);
}

class PhotoName extends ValueObject<String> {
  static const int maxLength = 50;
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhotoName(String input) {
    assert(input != null);
    return PhotoName._(right(input)); // TODO: validate length 
  }

  const PhotoName._(this.value);
}

class PhotoPrice extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory PhotoPrice(double input) {
    assert(input != null);
    return PhotoPrice._(right(input)); // TODO: validate price 
  }

  const PhotoPrice._(this.value);
}

class PhotoComments extends ValueObject<String> {
  static const int maxLength = 50;
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhotoComments(String input) {
    assert(input != null);
    return PhotoComments._(right(input)); 
  }

  const PhotoComments._(this.value);
}

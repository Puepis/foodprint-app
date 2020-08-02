import 'package:freezed_annotation/freezed_annotation.dart';

part 'foodprint_failure.freezed.dart';

@freezed
abstract class FoodprintFailure with _$FoodprintFailure {
  const factory FoodprintFailure.unauthorizedToken() = _UnauthorizedToken;
  const factory FoodprintFailure.serverError() = _ServerError;
}
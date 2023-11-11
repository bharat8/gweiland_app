import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gweiland_app/utils/domain/models/api_error/api_error.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure implements Exception {
  const factory Failure.value(
    String? message,
  ) = _Value;

  const factory Failure.connection() = _Connection;

  const factory Failure.serverError({
    int? code,
    String? message,
    ApiError? apiError,
  }) = ServerError;

  const factory Failure.localError({
    String? message,
  }) = _LocalError;

  const factory Failure.unexpected(
    String? message,
  ) = _Unexpected;
}

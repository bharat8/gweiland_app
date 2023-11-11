import 'package:equatable/equatable.dart';
import 'package:gweiland_app/utils/domain/core/helpers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

class ApiErrorFields {
  const ApiErrorFields._();

  static const errorMessage = 'error_message';
  static const errorCode = 'error_code';
  static const creditCount = 'credit_count';
}

@JsonSerializable()
class ApiError extends Equatable {
  const ApiError({
    this.timestamp = '',
    this.errorCode = 0,
    this.errorMessage = '',
    this.elapsed = 0,
    this.creditCount = 0,
    this.notice = '',
  });

  factory ApiError.fromJson(JsonMap json) => _$ApiErrorFromJson(json);
  JsonMap toJson() => _$ApiErrorToJson(this);

  final String timestamp;

  @JsonKey(name: ApiErrorFields.errorCode)
  final int errorCode;

  @JsonKey(name: ApiErrorFields.errorMessage)
  final String errorMessage;
  final int elapsed;

  @JsonKey(name: ApiErrorFields.creditCount)
  final int creditCount;
  final String notice;

  static const empty = ApiError();

  ApiError copyWith({
    String? timestamp,
    int? errorCode,
    String? errorMessage,
    int? elapsed,
    int? creditCount,
    String? notice,
  }) {
    return ApiError(
      timestamp: timestamp ?? this.timestamp,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      elapsed: elapsed ?? this.elapsed,
      creditCount: creditCount ?? this.creditCount,
      notice: notice ?? this.notice,
    );
  }

  @override
  List<Object> get props {
    return [
      timestamp,
      errorCode,
      errorMessage,
      elapsed,
      creditCount,
      notice,
    ];
  }
}

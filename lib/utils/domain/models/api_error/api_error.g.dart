// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      timestamp: json['timestamp'] as String? ?? '',
      errorCode: json['error_code'] as int? ?? 0,
      errorMessage: json['error_message'] as String? ?? '',
      elapsed: json['elapsed'] as int? ?? 0,
      creditCount: json['credit_count'] as int? ?? 0,
      notice: json['notice'] as String? ?? '',
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'error_code': instance.errorCode,
      'error_message': instance.errorMessage,
      'elapsed': instance.elapsed,
      'credit_count': instance.creditCount,
      'notice': instance.notice,
    };

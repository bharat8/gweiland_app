import 'dart:convert';

import 'package:gweiland_app/utils/domain/models/api_error/api_error.dart';
import 'package:gweiland_app/utils/domain/models/coin/coin.dart';
import 'package:gweiland_app/utils/infrastructure/core/failures/failures.dart';

class Decoders {
  static ApiError decodeApiError(String errorResp) {
    try {
      final map = jsonDecode(errorResp) as Map<String, dynamic>;
      return ApiError.fromJson(map['status'] as Map<String, dynamic>);
    } catch (_) {
      return ApiError.empty;
    }
  }

  static List<Coin> decodeCoinsList(String coins) {
    try {
      final map = jsonDecode(coins) as Map<String, dynamic>;
      return (map['data'] as List)
          .map(
            (e) => Coin.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Failure.value(e.toString());
    }
  }
}

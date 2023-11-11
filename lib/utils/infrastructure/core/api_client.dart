import 'dart:io';

import 'package:gweiland_app/utils/env/env.dart';
import 'package:gweiland_app/utils/infrastructure/core/failures/failures.dart';
import 'package:gweiland_app/utils/infrastructure/decoders/decoder.dart';
import 'package:http/http.dart' as http;

/// Custom Client for API calls with prefix Headers, URI
/// and Failures
class ApiClient {
  ///* GET Request
  static Future<http.Response> get(
    String url, {
    Map<String, String> headers = const {},
  }) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {...headers, ...getHeaders()},
      ).timeout(timeLimit);

      if (response.statusCode == 200) {
        return response;
      } else {
        final apiError = Decoders.decodeApiError(response.body);

        throw Failure.serverError(
          code: response.statusCode,
          message: response.reasonPhrase,
          apiError: apiError,
        );
      }
    } on SocketException catch (_) {
      throw const Failure.connection();
    } on ServerError catch (e) {
      throw Failure.serverError(
        code: e.code,
        message: e.message,
        apiError: e.apiError,
      );
    } catch (e) {
      throw Failure.unexpected(
        e.toString(),
      );
    }
  }

  ///* POST Request
  static Future<http.Response> post(
    String url, {
    Object? body,
    Map<String, String> headers = const {},
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {...headers, ...getHeaders()},
            body: body,
          )
          .timeout(timeLimit);

      if (response.statusCode == 200) {
        return response;
      } else {
        final apiError = Decoders.decodeApiError(response.body);

        throw Failure.serverError(
          code: response.statusCode,
          message: response.reasonPhrase,
          apiError: apiError,
        );
      }
    } on SocketException catch (_) {
      throw const Failure.connection();
    } on ServerError catch (e) {
      throw Failure.serverError(
        code: e.code,
        message: e.message,
        apiError: e.apiError,
      );
    } catch (e) {
      throw Failure.unexpected(
        e.toString(),
      );
    }
  }

  ///* DELETE Request
  static Future<http.Response> delete(
    String url, {
    Object? body,
    Map<String, String> headers = const {},
  }) async {
    try {
      final response = await http
          .delete(
            Uri.parse(url),
            headers: {...headers, ...getHeaders()},
            body: body,
          )
          .timeout(timeLimit);

      if (response.statusCode == 200) {
        return response;
      } else {
        final apiError = Decoders.decodeApiError(response.body);

        throw Failure.serverError(
          code: response.statusCode,
          message: response.reasonPhrase,
          apiError: apiError,
        );
      }
    } on SocketException catch (_) {
      throw const Failure.connection();
    } on ServerError catch (e) {
      throw Failure.serverError(
        code: e.code,
        message: e.message,
        apiError: e.apiError,
      );
    } catch (e) {
      throw Failure.unexpected(
        e.toString(),
      );
    }
  }

  static Map<String, String> getHeaders() {
    return {
      'X-CMC_PRO_API_KEY': Env.coinKey,
    };
  }
}

/// API request timeout duration
const timeLimit = Duration(milliseconds: 30000);

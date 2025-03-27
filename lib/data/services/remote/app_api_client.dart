import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/logging_interceptor.dart';

class AppApiClient {
  late Dio _dio;

  AppApiClient() {
    _dio = _createDio();
  }

  Future<Response> post({
    required String endpoint,
    required String payload,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.post(endpoint, data: payload, queryParameters: queryParameters);
  }

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async => _dio.get(endpoint, queryParameters: queryParameters);

  Future<Response> patch({
    required String endpoint,
    required String payload,
  }) async => _dio.patch(endpoint, data: payload);

  String get baseUrl => const String.fromEnvironment('BASE_URL');

  Map<String, String> get headers => {};

  String? get token => null;

  final Duration timeOutDuration = const Duration(seconds: 60);

  Dio _createDio() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: timeOutDuration,
        sendTimeout: timeOutDuration,
        receiveTimeout: timeOutDuration,
        baseUrl: baseUrl,
        followRedirects: false,
        validateStatus: (status) {
          if (status != null && status < 300) {
            return true;
          }
          return false;
        },
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          ...headers,
        },
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptor());
    }
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio _dio;
  String? token;

  AppInterceptors(this._dio, this.token);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}

class BadRequestException extends AskloraApiClientException {
  BadRequestException(super.r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class ConflictException extends AskloraApiClientException {
  ConflictException(super.r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends AskloraApiClientException {
  UnauthorizedException(super.r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends AskloraApiClientException {
  NotFoundException(super.r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class ForbiddenException extends AskloraApiClientException {
  ForbiddenException(super.r);

  @override
  String toString() {
    return "You don't have permission to access this resource";
  }
}

class LegalReasonException extends AskloraApiClientException {
  LegalReasonException(super.r);

  @override
  String toString() {
    return 'The account is suspended, cannot continue';
  }
}

class InternalServerErrorException extends AskloraApiClientException {
  InternalServerErrorException(super.r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class NotAcceptableException extends AskloraApiClientException {
  NotAcceptableException(super.r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends AskloraApiClientException {
  NoInternetConnectionException(super.r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends AskloraApiClientException {
  DeadlineExceededException(super.r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class AskloraApiClientException extends DioException {
  AskloraApiClientException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Something went wrong while fetching the api.';
  }
}

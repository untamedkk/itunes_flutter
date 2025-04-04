import 'package:equatable/equatable.dart';

enum ResponseState { success, error, unknown, loading, suspended }

class BaseResponse<T> extends Equatable {
  static const String errorMessage = 'Something went wrong! Please try again.';

  final ResponseState state;
  final T? data;
  final int statusCode;
  final String message;

  const BaseResponse({
    this.state = ResponseState.unknown,
    this.data,
    this.message = '',
    this.statusCode = 0,
  });

  static BaseResponse<T> unknown<T>() {
    return const BaseResponse(state: ResponseState.unknown);
  }

  static BaseResponse<T> loading<T>({T? previousData}) {
    return BaseResponse(state: ResponseState.loading, data: previousData);
  }

  static BaseResponse<T> complete<T>(
    T data, {
    String message = '',
    int statusCode = 200,
  }) {
    return BaseResponse(
      state: ResponseState.success,
      data: data,
      message: message,
      statusCode: statusCode,
    );
  }

  static BaseResponse<T> error<T>({
    String message = BaseResponse.errorMessage,
    int statusCode = 500,
  }) {
    return BaseResponse(
      state: ResponseState.error,
      message: message,
      statusCode: statusCode,
    );
  }

  static BaseResponse<T> suspended<T>({
    String message = BaseResponse.errorMessage,
  }) {
    return BaseResponse(state: ResponseState.suspended, message: message);
  }

  BaseResponse<T> copyWith({
    ResponseState? state,
    T? data,
    String? message,
    int? statusCode,
  }) {
    return BaseResponse<T>(
      state: state ?? this.state,
      data: data ?? this.data,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  @override
  List<Object?> get props {
    return [state, data, message, statusCode];
  }
}

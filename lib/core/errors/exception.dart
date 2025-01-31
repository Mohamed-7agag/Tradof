import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure(String errMessage) : super(errMessage: errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection to the server timed out');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Sending data to the server timed out');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receiving data from the server timed out');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to the server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error, please try again');
      case DioExceptionType.badCertificate:
        return ServerFailure('Certificate error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response.toString());
    } else if (statusCode == 404) {
      return ServerFailure(response.toString());
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try again later!');
    } else {
      return ServerFailure('Sorry, an error occurred, please try again');
    }
  }
}

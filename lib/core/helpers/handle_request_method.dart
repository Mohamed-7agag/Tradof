import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../errors/exception.dart';
import '../errors/failure.dart';

Future<Either<Failure, T>> handleRequest<T>(
    Future<T> Function() request) async {
  try {
    final response = await request();
    return Right(response);
  } catch (e) {
    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(e.toString()));
  }
}

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../cache/cache_helper.dart';
import '../errors/exception.dart';
import '../helpers/navigation_handler.dart';
import '../utils/app_constants.dart';
import 'end_points.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static final _tokenService = TokenService();

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 60);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.baseUrl = EndPoint.baseUrl
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    final userToken = await CacheHelper.getSecuredString(AppConstants.token);
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static void addDioInterceptor() {
    dio?.interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
      _createAuthInterceptor(),
    ]);
  }
 static int retryCount = 0;
  static Interceptor _createAuthInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await _tokenService.getAccessToken();
        options.headers['Authorization'] = 'Bearer $accessToken';
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401 && retryCount < 1) {
          retryCount++;
          try {
            await _tokenService.refreshToken();
            final accessToken = await _tokenService.getAccessToken();
            error.requestOptions.headers['Authorization'] =
                'Bearer $accessToken';
            final clonedRequest = await dio!.fetch(error.requestOptions);
            return handler.resolve(clonedRequest);
          } catch (e) {
            await _tokenService.clearTokens();
            NavigationHandler.instance.goToLoginView();
            return handler.next(error);
          }
        } else {
          return handler.next(error);
        }
      },
    );
  }
}

class TokenService {
  Future<String> getAccessToken() async {
    return await CacheHelper.getSecuredString(AppConstants.token);
  }

  Future<String> getRefreshToken() async {
    return await CacheHelper.getSecuredString(AppConstants.refreshToken);
  }

  Future<void> setTokens(String accessToken, String refreshToken) async {
    await CacheHelper.setSecuredString(AppConstants.token, accessToken);
    await CacheHelper.setSecuredString(AppConstants.refreshToken, refreshToken);
  }

  Future<void> clearTokens() async {
    await CacheHelper.clearAllSecuredData();
    await CacheHelper.removeData(key: AppConstants.userId);
    await CacheHelper.removeData(key: AppConstants.role);
  }

  Future<void> refreshToken() async {
    try {
      final refreshToken = await getRefreshToken();
      final response = await DioFactory.getDio().post(
        EndPoint.refreshToken,
        data: {'refreshToken': refreshToken},
      );
      await setTokens(
        response.data['accessToken'],
        response.data['refreshToken'],
      );
      DioFactory.setTokenIntoHeaderAfterLogin(response.data['accessToken']);
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioError(e);
      } else {
        throw ServerFailure(e.toString());
      }
    }
  }
}

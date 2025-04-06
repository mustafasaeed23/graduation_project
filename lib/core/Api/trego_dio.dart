import 'dart:async';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Api/end_points.dart';
import 'package:graduation_project/core/cache_helper/cache_values.dart';
import 'package:graduation_project/core/constant.dart';
import 'package:graduation_project/core/utilies/easy_loading.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../cache_helper/cache_helper.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
const String authorization = 'Authorization';
const String defaultLanguage = 'language';

class TimeoutInterceptor extends Interceptor {
  final Duration timeoutDuration;

  TimeoutInterceptor({this.timeoutDuration = const Duration(seconds: 7)});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Start a timer to monitor the request duration
    Timer timer;
    timer = Timer(timeoutDuration, () {
      if (options.extra['completed'] != true) {
        showCustomLoading(
          message: "Poor Internet Connection".tr(),
          indicator: Icon(Icons.wifi_off, color: Colors.black, size: 25.r),
        );
      }
    });

    // Mark the start of the request
    options.extra['startTime'] = DateTime.now();
    options.extra['completed'] = false;
    options.extra['timer'] = timer;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Mark the request as completed
    response.requestOptions.extra['completed'] = true;
    // Cancel the timer if the request completes before the timeout
    Timer? timer = response.requestOptions.extra['timer'];
    if (timer != null && timer.isActive) {
      timer.cancel();
    }
    hideLoading();
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Mark the request as completed
    err.requestOptions.extra['completed'] = true;
    // Cancel the timer if the request fails before the timeout
    Timer? timer = err.requestOptions.extra['timer'];
    if (timer != null && timer.isActive) {
      timer.cancel();
    }
    hideLoading();
    super.onError(err, handler);
  }
}

class TokenInterceptor extends Interceptor {
  Dio dio;
  String? accessToken;
  String? refreshToken;

  TokenInterceptor({
    required this.dio,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 401 &&
        response.data["errorCode"] == "10001" &&
        await CacheHelper.getSecuredData(key: CacheKeys.refreshToken) != null) {
      printDebug(
        "Refresh token Test : ${await CacheHelper.getSecuredData(key: CacheKeys.refreshToken)}",
      );
      // Check if the status code is 401 in the response
      try {
        final newTokens = await _refreshToken();
        if (newTokens != null) {
          accessToken = newTokens['accessToken'];
          // Retry the failed request with the new token
          final options = response.requestOptions;
          options.headers['Authorization'] = 'Bearer $accessToken';
          final retryResponse = await dio.request(
            options.path,
            options: Options(method: options.method, headers: options.headers),
            data: options.data,
            queryParameters: options.queryParameters,
          );
          if (retryResponse.statusCode == 200) {
            return handler.resolve(retryResponse);
          } else {
            removingRefreshToken();
          }
        }
      } catch (e) {
        removingRefreshToken();
        return handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: 'Token refresh failed',
            type: DioExceptionType.badResponse,
          ),
        );
      }
    }
    super.onResponse(response, handler);
  }

  Future<Map<String, String>?> _refreshToken() async {
    try {
      final response = await dio.post(
        EndPoints.refreshAccessToken, // Your refresh token endpoint
        data: {'refreshToken': refreshToken},
      );
      if (response.statusCode == 200) {
        CacheHelper.saveAccessToken(accessToken: response.data['accessToken']);
        return {'accessToken': response.data['accessToken']};
      } else {
        return null;
      }
    } catch (e) {
      printDebug('Token refresh failed: $e');
    }
    return null;
  }

  void removingRefreshToken() {
    CacheHelper.clearAllSecuredData();
    CacheHelper.removeData(key: CacheKeys.profileData);
  }
}

class WamdahDio {
  static late Dio dio;

  void init() async {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (status) => true,
    );
    dio = Dio(baseOptions);
    dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      TokenInterceptor(
        dio: dio,
        accessToken: await CacheHelper.getSecuredData(
          key: CacheKeys.accessToken,
        ),
        refreshToken: await CacheHelper.getSecuredData(
          key: CacheKeys.refreshToken,
        ),
      ),
      TimeoutInterceptor(),
    ]);
  }

  Future<Response> get({
    required String endPoint,
    data,
    Map<String, dynamic>? additionalHeaders,
  }) async {
    dio.options.headers = {
      authorization:
          "Bearer ${await CacheHelper.getSecuredData(key: CacheKeys.accessToken)}",
      ...?additionalHeaders,
    };
    return await dio.get(endPoint, data: data);
  }

  Future<Response> post({
    required String endPoint,
    data,
    Map<String, dynamic>? additionalHeaders,
  }) async {
    dio.options.headers = {
      authorization:
          "Bearer ${await CacheHelper.getSecuredData(key: CacheKeys.accessToken)}",
      ...?additionalHeaders,
    };
    return await dio.post(endPoint, data: data);
  }

  Future<Response> put({
    required String endPoint,
    data,
    Map<String, dynamic>? additionalHeaders,
  }) async {
    dio.options.headers = {
      authorization:
          "Bearer ${await CacheHelper.getSecuredData(key: CacheKeys.accessToken)}",
      ...?additionalHeaders,
    };
    return await dio.put(endPoint, data: data);
  }

  Future<Response> delete({
    required String endPoint,
    data,
    Map<String, dynamic>? additionalHeaders,
  }) async {
    dio.options.headers = {
      authorization:
          "Bearer ${await CacheHelper.getSecuredData(key: CacheKeys.accessToken)}",
      ...?additionalHeaders,
    };
    return await dio.delete(endPoint, data: data);
  }

  Future<Response> patch({
    required String endPoint,
    data,
    Map<String, dynamic>? additionalHeaders,
  }) async {
    dio.options.headers = {
      authorization:
          "Bearer ${await CacheHelper.getSecuredData(key: CacheKeys.accessToken)}",
      ...?additionalHeaders,
    };
    return await dio.patch(endPoint, data: data);
  }
}

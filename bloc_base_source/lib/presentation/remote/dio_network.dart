import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../data/remote/service/service_constants.dart';
import '../../di/locator.dart';

class DioNetwork {
  Dio getDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: ServiceConstants.baseUrl,
      contentType: NetworkRequestValues.contentType,
      sendTimeout: ServiceConstants.timeOut,
      connectTimeout: ServiceConstants.timeOut,
      receiveTimeout: ServiceConstants.timeOut,
    );
    dio.interceptors.add(_addInterceptor());
    return dio;
  }

  InterceptorsWrapper _addInterceptor() {
    return InterceptorsWrapper(onRequest: (_option, _handler) {
      _option.headers = {
        RequestHeader.tokenKey: token,
        RequestHeader.language: langApp
      };
      Fimber.d("Request:");
      Fimber.d("Log Url request: ${_option.baseUrl}");
      Fimber.d("Log header request: ${_option.headers.toString()}");
      _handler.next(_option);
    }, onResponse: (_response, _handler) {
      Fimber.d(
          "Response: ${_response.data?.toString() ?? _response.statusCode ?? "logResponseInterceptor empty"}");
      _handler.next(_response);
    }, onError: (_error, _handler) {
      Fimber.d("Error: ${_error.error?.toString()}");
      _handler.next(_error);
    });
  }
}

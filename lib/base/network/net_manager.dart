
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'base_entity.dart';
import 'error_handle.dart';
import 'intercept.dart';
import '../config/app_config.dart';
import '../config/net_config.dart';
import '../util/log_util.dart';

class NetManager {
  static final NetManager _singleton = NetManager._();

  static NetManager get instance => NetManager();

  factory NetManager() => _singleton;

  static Dio _dio;

  Dio get dio => _dio;

  NetManager._() {
    var options = BaseOptions(
      baseUrl: NetConfig.baseUrl,
      connectTimeout: NetConfig.connectTimeout,
      receiveTimeout: NetConfig.receiveTimeout,
      responseType: ResponseType.plain,
      // contentType: ContentType('application', 'x-www-form-urlencoded', charset: 'utf-8'),
      validateStatus: (status) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
    );
    _dio = Dio(options);

    // 打印Log(非生产模式)
    if (!AppConfig.inProduction) {
      _dio.interceptors.add(LoggingInterceptor());
    }
    /// 统一添加身份验证请求头【可选】
    // _dio.interceptors.add(AuthInterceptor());
    /// 刷新Token【可选】
    // _dio.interceptors.add(TokenInterceptor());
    /// 适配数据(根据自己的数据结构，可自行选择添加)【可选】
    // _dio.interceptors.add(AdapterInterceptor());
  }

  Future request<T>(Method method, String url, {
        Function(T t) onSuccess, 
        Function(List<T> list) onSuccessList, 
        Function(int code, String msg) onError,
        dynamic params, Map<String, dynamic> queryParameters, 
        CancelToken cancelToken, Options options, bool isList : false
  }) {
    return _request<T>(method.value, url,
        data: params,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken).then((BaseEntity<T> result) {
      if (result.code == 0) {
        if (isList) {
          onSuccessList?.call(result.listData);
        } else {
          onSuccess?.call(result.data);
        }
      } else {
        _onError(result.code, result.message, onError);
      }
    }, onError: (e, _) {
      _cancelLogPrint(e, url);
      NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError);
    });
  }

  /// 数据返回格式统一，统一处理异常
  /// data：用于post参数，queryParameters：用于get请求参数
  Future<BaseEntity<T>> _request<T>(String method, String url, {
    dynamic data, Map<String, dynamic> queryParameters,
    CancelToken cancelToken, Options options
  }) async {
    var response = await _dio.request(url, data: data, queryParameters: queryParameters, options: _checkOptions(method, options), cancelToken: cancelToken);
    try {
      /// 集成测试无法使用 isolate https://github.com/flutter/flutter/issues/24703
      Map<String, dynamic> _map = AppConfig.isDriverTest ? parseData(response.data.toString()) : await compute(parseData, response.data.toString());
      return BaseEntity.fromJson(_map);
    } catch(e, s) {
      return BaseEntity(ExceptionHandle.parse_error, '数据解析错误', null);
    }
  }

  Options _checkOptions(method, options) {
    if (options == null) {
      options = Options();
    }
    options.method = method;

    return options;
  }

  _cancelLogPrint(dynamic e, String url) {
    if (e is DioError && CancelToken.isCancel(e)) {
      Log.e('取消请求接口： $url');
    }
  }

  _onError(int code, String msg, Function(int code, String mag) onError) {
    if (code == null) {
      code = ExceptionHandle.unknown_error;
      msg = '未知异常';
    }
    Log.e('接口请求异常： code: $code, mag: $msg');
    onError?.call(code, msg);
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data);
}

/// 网络请求方式
enum Method {
  get,
  post,
  put,
  patch,
  delete,
  head
}

/// Method私有extension
/// 返回它的String value
extension on Method {
  String get value {
    switch(this) {
      case Method.get:
        return 'GET';
      case Method.post:
        return 'POST';
      case Method.put:
        return 'PUT';
      case Method.patch:
        return 'PATCH';
      case Method.delete:
        return 'DELETE';
      case Method.head:
        return 'HEAD';
      default: 
        return 'GET';
    }
  }
}
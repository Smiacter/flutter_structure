import 'package:dio/dio.dart';
import 'package:esite/base/util/log_util.dart';

import 'view_state.dart';
import 'package:flutter/material.dart';

/// 基类ViewModel，使用Provider实现
class BaseModel with ChangeNotifier {
  /// 当前页面状态，默认为loading
  ViewState _viewState;

  /// 防止页面销毁后，异步任务才完成，导致报错
  /// 具体代码表现在，重写disposed和notifyListeners，确保未销毁才通知更新UI
  bool _disposed = false;

  /// 页面错误信息
  ViewStateError _viewStateError;

  BaseModel({ViewState viewState = ViewState.loading}) {
    _viewState = viewState;
  }

  // ViewState 
  ViewState get viewState => _viewState;
  set viewState(ViewState state) {
    _viewStateError = null;
    _viewState = state;
    notifyListeners();
  }
  // 便捷get方法，为了更方便的获取当前页面状态
  bool get isIdle => viewState == ViewState.idle;
  bool get isLoading => viewState == ViewState.loading;
  bool get isEmpty => viewState == ViewState.empty;
  bool get isError => viewState == ViewState.error;

  void setIdle() {
    viewState = ViewState.idle;
  }
  void setLoading() {
    viewState = ViewState.loading;
  }
  void setEmpty() {
    viewState = ViewState.empty;
  }
  /// [e]分类Error和Exception两种
  void setError(e, statckTrace, {String message}) {
    ViewStateErrorType errorType = ViewStateErrorType.unknown;
    // 见https://github.com/flutterchina/dio/blob/master/README-ZH.md#dioerrortype
    if ( e is DioError) { // 处理DioError
      errorType = ViewStateErrorType.network;
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.SEND_TIMEOUT || 
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        message = e.error;
      } else if (e.type == DioErrorType.RESPONSE) {
        // When the server response, but with a incorrect status, such as 404, 503...
        message = e.error;
      } else if (e.type == DioErrorType.CANCEL) {
        // When the request is cancelled, dio will throw a error with this type.
        message = e.error;
      }
    } else {
      Log.d('errorType: ${e.toString()}');
    }
    viewState = ViewState.error;
    _viewStateError = ViewStateError(  
      errorType: errorType,
      message: message,
      errorMessage: e.toString(),
    );
    printErrorStack(e, statckTrace);
  }

  // ViewStateError
  ViewStateError get viewStateError => _viewStateError;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  /// [e]为错误类型 :可能为 Error , Exception ,String
  /// [s]为堆栈信息
  printErrorStack(e, s) {
    debugPrint('''
  <-----↓↓↓↓↓↓↓↓↓↓-----error-----↓↓↓↓↓↓↓↓↓↓----->
  $e
  <-----↑↑↑↑↑↑↑↑↑↑-----error-----↑↑↑↑↑↑↑↑↑↑----->''');
    if (s != null) debugPrint('''
  <-----↓↓↓↓↓↓↓↓↓↓-----trace-----↓↓↓↓↓↓↓↓↓↓----->
  $s
  <-----↑↑↑↑↑↑↑↑↑↑-----trace-----↑↑↑↑↑↑↑↑↑↑----->
      ''');
  }
}
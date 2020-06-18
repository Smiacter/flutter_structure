/// 页面状态
enum ViewState {
  /// 闲置，即默认状态，正常状态无其他操作，纯展示
  idle,
  /// 加载中
  loading,
  /// 无数据
  empty,
  /// 加载失败
  error,
}

/// 页面状态错误类型
enum ViewStateErrorType {
  /// 网络错误
  network,
  /// 未授权（未登录）
  unAuthorized,
  /// 其他未知错误
  unknown,
}

/// 页面错误类
class ViewStateError {
  ViewStateErrorType errorType;
  String message;
  String errorMessage;

  ViewStateError({
    this.errorType: ViewStateErrorType.unknown,
    this.message,
    this.errorMessage,
  });

  // 方便获取状态类型的get方法
  bool get isNetwork => errorType == ViewStateErrorType.network;
  bool get isUnAuthorized => errorType == ViewStateErrorType.unAuthorized;
  bool get isUnknown => errorType == ViewStateErrorType.unknown;

  @override
  String toString() {
    return "ViewStateError{errorType: $errorType, message: $message, errorMessage: $errorMessage}";
  }
}



import 'package:flustars/flustars.dart';

/// 屏幕适配[基于flustars中的ScreenUtil]
extension DoubleAdaptive on double {
  /// 获取适配后的像素
  /// 根据ScreenUtil的源码，getAdapterSize的参数即this为设计图上的dp，即iOS中的point[点]
  /// ScreenUtil默认对宽度、高度、字体做了适配[flutter_screenutil https://github.com/OpenFlutter/flutter_screenutil]
  double get ypx {
    return ScreenUtil.getInstance().getAdapterSize(this);
  }
}

/// 同时作用于int，避免很多时候不写小数点也能正常调用
extension IntAdaptive on int {
  double get ypx {
    return ScreenUtil.getInstance().getAdapterSize(this.toDouble());
  }
}
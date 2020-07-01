import 'package:oktoast/oktoast.dart' as okToast;
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../appearance/styles.dart';

/// Toast显示位置
/// 统一传该参数，若更换了toast插件，需要做对应的转换
enum YToastPosition {
  top, center, bottom,
}
extension on YToastPosition {
  okToast.ToastPosition get value {
    if (this == YToastPosition.top) {
      return okToast.ToastPosition.top;
    } else if (this == YToastPosition.center) {
      return okToast.ToastPosition.center;
    } else {
      return okToast.ToastPosition.bottom;
    }
  }
}

/// Alert types
/// 对应使用插件rflutter_alert中的AlertType
enum YAlertType { error, success, info, warning, none }
extension on YAlertType {
  AlertType get value {
    switch (this) {
      case YAlertType.error:
        return AlertType.error;
      case YAlertType.success:
        return AlertType.success;
      case YAlertType.info:
        return AlertType.info;
      case YAlertType.warning:
        return AlertType.warning;
      default:
        return AlertType.none;
    }
  }
}

/// 包含Toast和Alert弹框的封装
class Hud {
  /// 显示普通的Alert弹框
  /// type：成功、错误、警告等，非none会在顶部显示对应图标，具体可参照rflutter_alert说明
  /// cancelText：默认为nil即不显示取消按钮，设置了才会显示
  /// confirmCallback：点击确认按钮的回调
  static void showAlert({
    @required BuildContext context,
    @required String msg,
    YAlertType type = YAlertType.none,
    String title = '提示',
    String cancelText,
    String confirmText = '确定',
    Function confirmCallback,
  }) {
    Alert(  
      context: context,
      title: title,
      desc: msg,
      type: type.value,
      style: AlertStyle(  
        isCloseButton: false,
        animationType: AnimationType.grow,
        isOverlayTapDismiss: false,
        overlayColor: Color.fromRGBO(0, 0, 0, 0.6),
      ),
      buttons: cancelText == null ?  [
        DialogButton( 
          child: Text(confirmText, style: TextStyles.textWhite14),
          onPressed: () {
            Navigator.pop(context);
            confirmCallback?.call();
          },
        )
      ] : [
        DialogButton( 
          color: Colors.grey[400],
          child: Text(cancelText, style: TextStyles.textWhite14,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        DialogButton( 
          child: Text(confirmText, style: TextStyles.textWhite14),
          onPressed: () {
            Navigator.pop(context);
            confirmCallback?.call();
          },
        )
      ],
    ).show();
  }

  /// 显示带自定义Alert
  /// 有title，取消和确定按钮，中间内容content为自定义
  static showCustomAlert({@required BuildContext context, String title, Widget content, Function confirmCallback}) {
    Alert( 
      context: context,
      title: title,
      style: AlertStyle(  
        isCloseButton: false,
        animationType: AnimationType.grow,
        isOverlayTapDismiss: false,
        overlayColor: Color.fromRGBO(0, 0, 0, 0.6),
      ),
      content: content,
      buttons: [
        DialogButton( 
          color: Colors.grey[400],
          child: Text("取消", style: TextStyles.textWhite14,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        DialogButton( 
          child: Text("确定", style: TextStyles.textWhite14),
          onPressed: () {
            Navigator.pop(context);
            confirmCallback?.call();
          },
        )
      ]
    ).show();
  }

  /// 显示Toast提示
  static showToast({
    @required String text, 
    YToastPosition position, 
    Color bgColor = const Color(0xFF616161), 
    Color txtColor = Colors.white, 
    int duration = 2000
  }) {
    okToast.showToast(
      text,
      position: position.value,
      backgroundColor: bgColor,
      textStyle: TextStyle(color: txtColor, fontSize: 14),
      duration: Duration(milliseconds: duration),
      dismissOtherToast: true
    );
  }

  /// 取消Toast显示
  static void cancelToast() {
    okToast.dismissAllToast();
  }
}

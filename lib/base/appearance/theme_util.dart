import 'dart:io';
import 'package:flutter/services.dart';
import 'app_color.dart';
import 'package:flutter/material.dart';

class ThemeUtil {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color getDarkColor(BuildContext context, Color darkColor) {
    return isDark(context) ? darkColor : null;
  }

  static Color getIconColor(BuildContext context) {
    return isDark(context) ? AppColor.dark_text : null;
  }

  /// 获取theme_provider中配置的导航栏颜色，值为主色调AppColor.dark_app_main : AppColor.app_main
  static Color getAppBarColor(BuildContext context) {
    return Theme.of(context).appBarTheme.color;
  }
  
  /// 获取当前页面背景色，值为isDarkMode ? AppColor.dark_bg_color : Colors.white 可在theme_provider中查看
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  static Color getDialogBackgroundColor(BuildContext context) {
    return Theme.of(context).canvasColor;
  }
  
  static Color getStickyHeaderColor(BuildContext context) {
    return isDark(context) ? AppColor.dark_bg_gray_ : AppColor.bg_gray_;
  }

  static Color getDialogTextFieldColor(BuildContext context) {
    return isDark(context) ? AppColor.dark_bg_gray_ : AppColor.bg_gray;
  }

  static Color getKeyboardActionsColor(BuildContext context) {
    return isDark(context) ? AppColor.dark_bg_color : Colors.grey[200];
  }
  
  /// 设置NavigationBar样式
  static void setSystemNavigationBarStyle(BuildContext context, ThemeMode mode) {
    /// 仅针对安卓
    if (Platform.isAndroid) {
      bool _isDark = false;
      final Brightness platformBrightness = MediaQuery.platformBrightnessOf(context);
      print(platformBrightness);
      if (mode == ThemeMode.dark || (mode == ThemeMode.system && platformBrightness == Brightness.dark)) {
        _isDark = true;
      }
      print(_isDark);
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: _isDark ? AppColor.dark_bg_color : Colors.white,
        systemNavigationBarIconBrightness: _isDark ? Brightness.light : Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
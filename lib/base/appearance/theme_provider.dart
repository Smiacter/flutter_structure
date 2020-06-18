import 'dart:ui';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';
import 'styles.dart';
import '../config/app_config.dart';

/// 主题配置，主题更改
class ThemeProvider extends ChangeNotifier {

  static const Map<ThemeMode, String> themes = {
    ThemeMode.dark: AppConfig.darkTheme, ThemeMode.light : AppConfig.lightTheme, ThemeMode.system : AppConfig.systemTheme
  };
  
  void syncTheme() {
    String theme = SpUtil.getString(AppConfig.keyTheme);
    if (theme.isNotEmpty && theme != themes[ThemeMode.system]) {
      notifyListeners();
    }
  }

  void setTheme(ThemeMode themeMode) {
    SpUtil.putString(AppConfig.keyTheme, themes[themeMode]);
    notifyListeners();
  }

  ThemeMode getThemeMode(){
    String theme = SpUtil.getString(AppConfig.keyTheme);
    switch(theme) {
      case AppConfig.darkTheme:
        return ThemeMode.dark;
      case AppConfig.lightTheme:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  getTheme({bool isDarkMode: false}) {
    return ThemeData(
      errorColor: isDarkMode ? AppColor.dark_red : AppColor.red,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: isDarkMode ? AppColor.dark_app_main : AppColor.app_main,
      accentColor: isDarkMode ? AppColor.dark_app_main : AppColor.app_main,
      // Tab指示器颜色
      indicatorColor: isDarkMode ? AppColor.dark_app_main : AppColor.app_main,
      // 页面背景色
      scaffoldBackgroundColor: isDarkMode ? AppColor.dark_bg_color : Colors.white,
      // 主要用于Material背景色
      canvasColor: isDarkMode ? AppColor.dark_material_bg : Colors.white,
      // 文字选择色（输入框复制粘贴菜单）
      textSelectionColor: AppColor.app_main.withAlpha(70),
      textSelectionHandleColor: AppColor.app_main,
      textTheme: TextTheme(
        // TextField输入文字颜色
        subtitle1: isDarkMode ? TextStyles.textDark : TextStyles.text,
        // Text文字样式
        bodyText2: isDarkMode ? TextStyles.textDark : TextStyles.text,
        subtitle2: isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: isDarkMode ? AppColor.dark_app_main : AppColor.app_main,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      dividerTheme: DividerThemeData(
        color: isDarkMode ? AppColor.dark_line : AppColor.line,
        space: 0.6,
        thickness: 0.6
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      )
    );
  }
}

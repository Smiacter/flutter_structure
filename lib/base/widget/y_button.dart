// export,避免在业务使用传参时再次引入该三方插件
export 'package:fbutton/fbutton.dart';

import 'package:esite/base/appearance/theme_util.dart';
import 'package:fbutton/fbutton.dart';
import 'package:flutter/material.dart';

///基于[FButton https://github.com/Fliggy-Mobile/fbutton]封装常用的Button类型
///若无法满足条件或者需要组合的，可手动使用FButton进行设置
class YButton extends StatelessWidget {
  /// 文字内容
  final String text;
  /// Button宽度
  final double width;
  /// Button高度
  final double height;
  /// 文字样式设置
  final TextStyle textStyle;
  /// 内间距
  final EdgeInsetsGeometry padding;
  /// 背景色
  final Color bgColor;
  /// 阴影颜色
  final Color shadowColor;
  /// 阴影程度
  final double shadowBlur;    
  /// 禁用状态下文字颜色，如果有值，则Button点击无效
  final Color disableTextColor;
  /// 禁用状态下背景颜色，如果有值，则Button点击无效
  final Color disableBgColor;
  /// 圆角设置，全部设置使用FButtonCorner.all(xx)，局部设置使用FButtonCorner(leftTopCorner: 10)[cornerStyle未开放，根据需求可增加]
  final FButtonCorner corner;
  /// 描边宽度
  final double borderWidth;
  /// 描边颜色
  final Color borderColor;
  /// 渐变色设置，例LinearGradient(colors: [Color(0xff00B0FF), Color(0xffFFc900),])
  final Gradient gradient;
  /// Button图标
  final Widget image;
  /// 图标显示的位置
  final ImageAlignment imageAlignment;
  /// 图标与文字的间距
  final double imageSpacing;
  /// 是否是Loading状态[更多Loading的设置如文字、大小等未开放，根据需求可增加]
  final bool isLoading;
  /// 点击事件[在Disable颜色设置后无点击效果]
  final VoidCallback onPressed;

  YButton({
    this.text,
    this.width, 
    this.height,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 14),
    this.padding = const EdgeInsets.all(10),
    this.bgColor,
    this.shadowColor,
    this.shadowBlur = 1.0,
    this.disableTextColor,
    this.disableBgColor,
    this.corner,
    this.borderWidth,
    this.borderColor,
    this.gradient,
    this.image,
    this.imageAlignment,
    this.imageSpacing,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FButton( 
      text: text,
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: padding,
      style: textStyle,
      color: bgColor == null ? ThemeUtil.getAppBarColor(context) : bgColor,
      shadowColor: shadowColor,
      shadowBlur: shadowBlur,
      disabledColor: disableBgColor,
      disabledTextColor: disableTextColor,
      corner: corner,
      strokeWidth: borderWidth,
      strokeColor: borderColor,
      gradient: gradient,
      image: image,
      imageAlignment: imageAlignment,
      imageMargin: imageSpacing,
      clickEffect: true,
      loading: isLoading,
      onPressed: (disableBgColor != null || disableTextColor != null) ? null : onPressed,
    );
  }
}

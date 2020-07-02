import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

/// 图片加载（支持本地与网络图片）
/// 
/// 支持圆角设置
/// 支持网络图片的Placeholder、加载错误的默认样式
class YImage extends StatelessWidget {
  /// 图片资源，可以是网络url或本地资源路径
  final String image;
  /// placeholder样式，在NetworkImage中有效
  final Widget placeholder;
  /// 宽度
  final double width;
  /// 高度
  final double height;
  /// 圆角
  final double cornerRadius;
  /// contentMode，默认为BoxFit.cover
  final BoxFit fit;
  /// 加载错误显示样式
  final Widget errorWidget;
  final Color color;
  /// 图片点击事件
  final VoidCallback onPressed;
  
  const YImage({
    Key key,
    @required this.image,
    this.placeholder,
    this.width, 
    this.height,
    this.cornerRadius = 0,
    this.fit = BoxFit.cover, 
    this.errorWidget,
    this.color,
    this.onPressed,

  }): super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    if (TextUtil.isEmpty(image) || image == 'null') {
      return _ErrorWidget(width, height, errorWidget);
    } else {
      return InkWell(  
        child: ClipRRect(  
          borderRadius: BorderRadius.circular(cornerRadius),
          child: _image(),
        ),
        onTap: onPressed,
      );
    }
  }

  Widget _image() {
    if (image.startsWith('http')) {
        return YNetworkImage( 
          key: key,
          imgUrl: image,
          placeholder: placeholder,
          width: width,
          height: height,
          fit: fit,
          errorWidget: errorWidget,
          color: color,
        );
      } else {
        return YAssetImage( 
          key: key,
          name: image,
          width: width,
          height: height,
          fit: fit,
          errorWidget: errorWidget,
          color: color,
        );
      }
  }
}

/// 加载本地资源图片
class YAssetImage extends StatelessWidget {
  /// 资源路径名，一般为['assets/images/category/xxx.png']
  final String name;
  final double width;
  final double height;
  final BoxFit fit;
  final Color color;
  final Widget errorWidget;
  
  const YAssetImage({
    Key key,
    @required this.name,
    this.width,
    this.height, 
    this.fit = BoxFit.cover,
    this.color,
    this.errorWidget,
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Image.asset(
      name,
      height: height,
      width: width,
      fit: fit,
      color: color,
      /// 忽略图片语义
      excludeFromSemantics: true,
      errorBuilder: (context, error, stackTrace) => _ErrorWidget(width, height, errorWidget),
    );
  }
}

/// 加载网络图片
/// 
/// 
class YNetworkImage extends StatelessWidget {
  /// 图片网络地址
  final String imgUrl;
  final Widget placeholder;
  final double width;
  final double height;
  final BoxFit fit;
  final Widget errorWidget;
  final Color color;

  YNetworkImage({
    Key key,
    @required this.imgUrl,
    this.placeholder,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.color,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage( 
      imageUrl: imgUrl,
      placeholder: (context, url) => _PlaceholderWidget(width, height, placeholder),
      width: width,
      height: height,
      fit: fit,
      errorWidget: (context, url, error) => _ErrorWidget(width, height, errorWidget),
      color: color,
    );
  }
}

/// 图片加载默认错误Widget
/// 
/// 用于AssetImage和NetworkImage中的errorWidget
class _ErrorWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget widget;
  
  _ErrorWidget(this.width, this.height, this.widget);

  @override
  Widget build(BuildContext context) {
    return widget == null ? Container( 
      width: width,
      height: height,
      color: Colors.grey[200],
      child: Center( 
        child: Text("图片走丢了", style: TextStyle(color: Colors.grey[700], fontSize: 14),),
      ),
    ) : Container( 
      width: width,
      height: height,
      child: widget,
    );
  }
}

/// 图片加载Placeholder Widget
/// 
/// 用于NetworkImage中的placeholder
class _PlaceholderWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget widget;

  _PlaceholderWidget(this.width, this.height, this.widget);

  @override
  Widget build(BuildContext context) {
    return widget == null ? Container( 
      width: width,
      height: height,
      color: Colors.grey[200],
      child: Center( 
        child: Text("努力加载中...", style: TextStyle(color: Colors.grey[700], fontSize: 14),),
      ),
    ) : Container( 
      width: width,
      height: height,
      child: widget,
    );
  }
}

class ImageUtils {
  
  static ImageProvider getAssetImage(String name, {String format: 'png'}) {
    return AssetImage(getImgPath(name, format: format));
  }

  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static ImageProvider getImageProvider(String imageUrl, {String holderImg: 'none'}) {
    if (TextUtil.isEmpty(imageUrl)) {
      return AssetImage(getImgPath(holderImg));
    }
    return CachedNetworkImageProvider(imageUrl);
  }
}
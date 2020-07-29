
import 'package:esite/base/appearance/styles.dart';
import 'package:esite/base/widget/y_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:esite/base/extension/double_ex.dart';

enum HomeSectionType {
  menu,                         // 菜单 - 本地模板规则：一行平分四个，宽高相等，后台配置图标和文字（路由是否需要配置？）
  image,                        // 纯图片 - 后台配置图片和高度
  common,                       // 默认样式 - 由逛商场和热门商品两个分组构成。
                                // 逛商场固定规则为前面两个项一行显示两个，宽高比例相等，其余的一行平分四个宽高相等
                                // 热门商品，一行显示两个
  sichuan,                      // 四川样式 - 文字标题（陪文字和高度） + 商品
  chongqing,                    // 重庆样式 - 分组显示，标题 + 图片，若Items为基数，则第一行撑满显示，否则一行显示两个
  category,                     // 分类（上文字+下图片）
  categoryWithImageTitle,       // 带图片标题的分类
  scoreGoodWithImageTitle,      // 带图片标题的积分商品
  priceGoodWithTextTitle,       // 带文字标题的价格商品
  imageWithIndicatorTextTitle,  // 带红标文字标题的图片
  newsWithImageTitle,           // 带图片标题的新闻图片
}

/// 如果title也是用配置更好，不用再去组织
enum HomeItemType {
  menu,       // 上图标+下文字
  category,   // 上文字（左对齐）+下图片
  image,      // 图片
  scoreGood,  // 图片+文字+文字+文字
  priceGood,  // 图片+文字+文字+文字+文字（可与scoreGood公用控件，单类型需分开）
  news,       // 文字+文字+图片（Tile可实现）
  text,
  indicatorText,
}

enum HomeTitleType {
  text,           // 纯文字
  indicatorText,  // 带分割线的文字
  image,          // 纯图片
}

/// 纯图片 - 可与Item样式纯图片公用
class HomeItemImage extends StatelessWidget {
  /// 网络图片地址
  final String image;
  final double height;
  /// 点击事件
  final VoidCallback onPressed;

  HomeItemImage({@required this.image, this.height = 50, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return YImage(  
      src: image,
      width: double.infinity,
      height: height,
      onPressed: onPressed,
    );
  }
}

/// 文字类型
/// withIndicator： 标识前面有一个红色的标识竖线（重庆样式）
class HomeItemText extends StatelessWidget {
  final String text;
  final bool withIndicator;
  final double height;
  HomeItemText({@required this.text, this.withIndicator = false, this.height = 30});

  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(  
        children: withIndicator ? [
          Container(width: 3, padding: const EdgeInsets.symmetric(vertical: 8), color: Colors.red,),
          SizedBox(width: 5,),
          Text(text, style: TextStyles.textBold16)
        ] : [
          Text(text, style: TextStyles.textGray14)
        ],
      ),
    );
  }
}

/// 菜单样式
class HomeItemMenu extends StatelessWidget {
  final String image;
  final String text;
  
  HomeItemMenu({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: YImage(src: image)),
          Text(text, style: TextStyle(fontSize: 14.ypx, color: Colors.black),)
        ],
      ),
    );
  }
}

/// 分类样式（上文字（左对齐）+下图片）
class HomeItemCategory extends StatelessWidget {
  final String image;
  final String text;
  
  HomeItemCategory({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 3),
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(text, style: TextStyles.textBold16, textAlign: TextAlign.left,),
          SizedBox(height: 15.ypx,),
          Expanded(child: YImage(src: image, width: double.infinity,)),
        ],
      ),
    );
  }
}

/// 商品样式
class HomeItemGood extends StatelessWidget {
  final HomeItemType type;
  final String image;
  final String describe;
  final String discountPrice;
  final String soldNum;
  final String originalPrice;

  HomeItemGood({
    this.type,
    this.image,
    this.describe,
    this.discountPrice,
    this.soldNum,
    this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 3),
      child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: YImage(src: image, width: double.infinity,),),
          SizedBox(height: 20.ypx,),
          Text(describe, style: type == HomeItemType.scoreGood ? TextStyles.textGray12 : TextStyles.textBold18, maxLines: 2,),
          SizedBox(height: 20.ypx,),
          Text(discountPrice, style: TextStyle(color: Colors.red, fontSize: 16.ypx),),
          SizedBox(height: 3.ypx,),
          Row(  
            mainAxisAlignment: type == HomeItemType.scoreGood ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
            children: type == HomeItemType.scoreGood ? [
              Text("销售：$soldNum笔", style: TextStyles.textGray12,)
            ] : [
              Text("$originalPrice", style: TextStyles.textGray14,),
              Text("已售：$soldNum", style: TextStyles.textGray12,),
            ],
          )
        ],
      ),
    );
  }
}

/// 分类样式（上文字（左对齐）+下图片）
class HomeItemNews extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  
  HomeItemNews({this.image, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Row(  
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(  
          children: <Widget>[
            Text(title, style: TextStyles.textSize16,),
            SizedBox(height: 5,),
            Text(title, style: TextStyles.textGray14,),
          ],
        ),
        Spacer(),
        YImage(src: image,),
      ],
    );
  }
}

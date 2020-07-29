import 'dart:convert';
import 'package:esite/base/appearance/app_bar.dart';
import 'package:esite/base/appearance/gaps.dart';
import 'package:esite/base/extension/double_ex.dart';
import 'package:esite/base/structure/mvvm/view_state_widget.dart';
import 'package:esite/base/widget/y_image.dart';
import 'package:esite/generated/json/base/json_convert_content.dart';
import 'package:esite/module/gas/home_data_entity.dart';
import 'package:esite/module/gas/home_item_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

enum AreaType {
  def, // 默认
  sichuan,
  chongqing,
  heilongjiang,
  xinjiang, // TODO: 再细分，区分是否有图片配置
}

const String typeJson = '{"unitName":"Container","child":{"unitName":"FlatButton","align":{"type":"Column", "crossAxisAlignment":"start"},"onPressed":{"actionType":"custom","action":"custom-handler","args":["button pressed"]},"children":[{"unitName":"Text","text":"分类描述","textAlign":"left","textStyle":{"color":"0xFF000000","fontSize":14,"fontWeight":"bold"}},{"unitName":"Image","fit":"fill","flex":"Expanded","imageProvider":{"type":"network","url":"https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png"}}]}}';

const String goodJson = '{"unitName":"Container","align":{"type":"Center"},"child":{"unitName":"Container","align":{"type":"Column"},"children":[{"unitName":"Text","text":"商品描述","textStyle":{"color":"0xFF000000","fontSize":14,"fontWeight":"bold"}},{"unitName":"Image","fit":"fill","flex":"Expanded","imageProvider":{"type":"network","url":"https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png"}}]}}';
 
class GasPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GasPageState();
}

/// tab - 加油
class GasPageState extends State<GasPage> with AutomaticKeepAliveClientMixin {
  final AreaType areaType = AreaType.def;
  HomeDataEntity _homeData;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadData() async {
    rootBundle.loadString('assets/data/home_data.json').then((value) {
      Map map = json.decode(value);
      var entity = JsonConvert.fromJsonAsT<HomeDataEntity>(map);
      setState(() {
        _homeData = entity;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(  
      appBar: MyAppBar(isBack: false, centerTitle: "好客e站"),
      body: _homeData == null ? ViewStateLoadingWidget() : ListView.builder(
        itemCount: listItem().length,
        itemBuilder: (context, index) => listItem()[index],
      ),
    );
  }

  List<Widget> listItem() {
    var items = [bannerSection(), menuSection()];
    switch (_homeData.type) {
      case "sichuan_type":
        items.addAll([sichuanSection()]);
        break;
      case "chongqing_type":
        items.addAll([chongqingSection()]);
        break;
      case "xinjiang_type":
        items.addAll([xinjiangSection()]);
        break;
      case "heilongjiang_type":
        items.addAll([heilongjiangSection()]);
        break;
      default: // common默认样式
        items.addAll([defaultType(), defaultGoods()]);
        break;
    }
    return items;
  }

  /// 模拟的轮播图
  Widget bannerSection() {
    return Container( 
      width: double.infinity,
      height: 150,
      color: Colors.lightBlueAccent,
      child: Swiper( 
        itemCount: _homeData.banners.length,
        itemBuilder: (context, index) => Image.network(
          _homeData.banners[index].imageUrl,
          fit: BoxFit.cover,
        ),
        autoplay: true,
        pagination: SwiperPagination(),
        onTap: (index) => print("点击了$index，url：${_homeData.banners[index].redirectUrl}"),
      )
    );
  }

  /// 功能菜单Grid
  Widget menuSection() {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _homeData.menus.length,
      crossAxisCount: 4,
      staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
      itemBuilder: (context, index) => HomeItemMenu(image: _homeData.menus[index].image, text: _homeData.menus[index].describe,),
      mainAxisSpacing: 0.8,
      crossAxisSpacing: 0.8,
    );
  }

  /// 默认样式Grid
  Widget defaultType() {
    return Column(  
      children: <Widget>[
        _homeData.defaultType.type.title.isNotEmpty ? HomeItemImage(
          image: _homeData.defaultType.type.title,
        ) : Gaps.empty, 
        StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _homeData.defaultType.type.items.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (index) {
            return 2 > index ? StaggeredTile.count(2, 2) : StaggeredTile.count(1, 1.2);
          },
          itemBuilder: (context, index) => HomeItemCategory(
            text: _homeData.defaultType.type.items[index].describe,
            image: _homeData.defaultType.type.items[index].image,
          ),
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 0.5,
        ),
      ],
    );
  }
  /// 默认样式商品Grid
  Widget defaultGoods() {
    return Column(  
      children: <Widget>[
        _homeData.defaultType.goods.title.isNotEmpty ? HomeItemImage(
          image: _homeData.defaultType.type.title,
        ) : Gaps.empty, 
        StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _homeData.defaultType.goods.items.length,
          crossAxisCount: 8,
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(4, 5);
          },
          itemBuilder: (context, index) => HomeItemGood(  
            type: HomeItemType.scoreGood,
            image: _homeData.defaultType.goods.items[index].image,
            describe: _homeData.defaultType.goods.items[index].describe,
            discountPrice: _homeData.defaultType.goods.items[index].price,
            soldNum: _homeData.defaultType.goods.items[index].soldNum,
          ),
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 0.5,
        )
      ],
    );
  }

  /// 四川样式商品Grid
  Widget sichuanSection() {
    return Column(  
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _homeData.sichuanType.ad.image.isNotEmpty ? HomeItemImage( 
          image: _homeData.sichuanType.ad.image,
          height: _homeData.sichuanType.ad.height,
        ): Gaps.empty,
        HomeItemText(text: _homeData.sichuanType.title,), 
        StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _homeData.sichuanType.items.length,
          crossAxisCount: 8,
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(4, 7);
          },
          itemBuilder: (context, index) => HomeItemGood(  
            type: HomeItemType.priceGood,
            image: _homeData.sichuanType.items[index].image,
            describe: _homeData.sichuanType.items[index].describe,
            discountPrice: _homeData.sichuanType.items[index].price,
            originalPrice: _homeData.sichuanType.items[index].originalPrice,
            soldNum: _homeData.sichuanType.items[index].soldNum,
          ),
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 0.5,
        )
      ],
    );
  }

  /// 重庆样式Grid
  Widget chongqingSection() {
    List<Widget> widgets = [];
    if (_homeData.chongqingType.ad.image.isNotEmpty) {
      widgets.add(HomeItemImage( 
        image: _homeData.chongqingType.ad.image,
        height: _homeData.chongqingType.ad.height,
      ));
    }
    for (var section in _homeData.chongqingType.sections) {
      widgets.add(Container(height: 10.ypx, color: Colors.grey[200],));
      widgets.add(
        Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomeItemText(text: section.title, withIndicator: true,),
            StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: section.items.length,
              crossAxisCount: 4,
              staggeredTileBuilder: (index) => section.items.length.isEven ? StaggeredTile.count(2, 1) : 
              0 == index ? StaggeredTile.count(4, 1) : StaggeredTile.count(2, 1),
              itemBuilder: (context, index) => YImage(src: section.items[index].image,),
              mainAxisSpacing: 0.6,
              crossAxisSpacing: 0.6,
            )
          ],
        )
      );
    }
    return Column(  
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    ); 
  }

  /// 黑龙江样式Grid
  Widget heilongjiangSection() {
    List<Widget>  widgets = [];
    for (var section in _homeData.heilongjiangType) {
      widgets.add(
        Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            section.ad.image.isNotEmpty ? HomeItemImage(
              image: section.ad.image,
              height: section.ad.height,
            ) : Gaps.empty,
            StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: section.items.length,
              crossAxisCount: 4,
              staggeredTileBuilder: (index) => section.items.length > 4 ? (index < 4 ? StaggeredTile.count(1, 1.2) : StaggeredTile.count(2, 1.5)) : StaggeredTile.count(2, 1.5),
              itemBuilder: (context, index) => HomeItemCategory( 
                text: section.items[index].text,
                image: section.items[index].image,
              ),
              mainAxisSpacing: 0.6,
              crossAxisSpacing: 0.6,
            )
          ],
        )
      );
    }
    return Column(  
      children: widgets
    ); 
  }

  /// 新疆样式
  Widget xinjiangSection() {
    return Column(  
      children: <Widget>[
        _homeData.xinjiangType.ad.image.isNotEmpty ? HomeItemImage(
          image: _homeData.xinjiangType.ad.image,
          height: _homeData.xinjiangType.ad.height,
        ) : Gaps.empty,
        HomeItemImage(image: _homeData.xinjiangType.title),
        StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _homeData.xinjiangType.items.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (index) => StaggeredTile.count(2, 1),
          itemBuilder: (context, index) => YImage(src: _homeData.xinjiangType.items[index].image,),
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        )
      ],
    ); 
  }

  @override
  bool get wantKeepAlive => true;

  /// 动态配置框架比例实现方式
  /// 
  // List<Widget> _contents() {
  //   List<Widget> items = [];
  //   if (_homeData.banners.length > 0) {
  //     items.add(bannerSection());
  //   } 
  //   for (var section in _homeData.sections) {
  //     items.add(StaggeredGridView.countBuilder(
  //       shrinkWrap: true,
  //       physics: NeverScrollableScrollPhysics(),
  //       itemCount: section.items.length,
  //       crossAxisCount: section.crossAxisCount,
  //       mainAxisSpacing: section.mainAxisSpacing,
  //       crossAxisSpacing: section.crossAxisSpacing,
  //       staggeredTileBuilder: (index) => StaggeredTile.count(section.items[index].width, section.items[index].height),
  //       itemBuilder: (context, index) {
  //         if (section.type == "menu") {
  //           return HomeItemMenu(image: section.items[index].image, text: section.items[index].describe,);
  //         } else if (section.type == "category") {
  //           return HomeItemCategory(image: section.items[index].image, text: section.items[index].describe,);
  //         } else if (section.type == "image") {
  //           return HomeItemImage(image: section.items[index].image, onPressed: () => Hud.showToast(text: "点击图片"),);
  //         } else if (section.type == "scoreGood") {
  //           return HomeItemGood(
  //             type: HomeItemType.scoreGood, 
  //             image: section.items[index].image,
  //             describe: section.items[index].describe,
  //             discountPrice: section.items[index].discountPrice,
  //             soldNum: section.items[index].soldNum,
  //             originalPrice: section.items[index].originalPrice,);
  //         } else if (section.type == "priceGood") {
  //           return HomeItemGood(
  //             type: HomeItemType.priceGood, 
  //             image: section.items[index].image,
  //             describe: section.items[index].describe,
  //             discountPrice: section.items[index].discountPrice,
  //             soldNum: section.items[index].soldNum,
  //             originalPrice: section.items[index].originalPrice,);
  //         } else if (section.type == "news") {
  //           return HomeItemNews(image: section.items[index].image, title: section.items[index].describe, subTitle: section.items[index].originalPrice,);
  //         } else if (section.type == "text") {
  //           return HomeItemText(text: section.items[index].describe,);
  //         } else { // "indicatorText"
  //           return HomeItemText(text: section.items[index].describe, withIndicator: true,);
  //         }
  //       },
  //     )); 
  //   }

  //   return items;
  // }
}

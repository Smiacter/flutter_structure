import 'package:esite/base/config/net_api.dart';
import 'package:esite/base/network/net.dart';
import 'package:esite/base/structure/mvvm/base_widget.dart';
import 'package:esite/base/structure/mvvm/view_state.dart';
import 'package:esite/base/structure/mvvm/view_state_widget.dart';
import 'package:esite/base/widget/load_image.dart';
import 'package:esite/common/select_province.dart';
import 'package:esite/module/home/home_banner_model.dart';
import 'package:esite/module/home/model/home_banner_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// tab - 首页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(  
      appBar: AppBar(  
        leading: InkWell( 
          child: Center(child: Text("成都")),
          onTap: () => '',
        ),
        actions: <Widget>[
          FlatButton(  
            child: Text("消息"),
            onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => SelectProvince(),)),
          )
        ],
      ),
      body: Center(  
        child: BaseWidget<HomeBannerModel>( 
          model: HomeBannerModel(),
          onModelReady: (model) => model.getBanners(),
          builder: (context, model, child) {
            if (model.isLoading) {
              return ViewStateLoadingWidget();
            } else if (model.isError) {
              return ViewStateErrorWidget(error: model.viewStateError, onPressed: () {
                model.getBanners();
              },);
            } else if (model.isEmpty) {
              return ViewStateEmptyWidget(
                onPressed: () {
                  model.getBanners();
                },
              );
            }
            return _bannerView(model);
          },
        ),
      ),
    );
  }

  Widget _bannerView(HomeBannerModel model) {
    return ListView.builder(
      itemCount: model.banners.length,
      itemBuilder: (context, index) {
        return Container( 
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          height: 200,
          child: LoadImage(model.banners[index].imagePath),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
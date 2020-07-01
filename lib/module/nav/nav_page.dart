import 'package:esite/base/appearance/app_bar.dart';
import 'package:esite/base/structure/mvvm/base_widget.dart';
import 'package:esite/base/structure/mvvm/view_state_widget.dart';
import 'package:esite/base/widget/skeleton.dart';
import 'package:esite/module/nav/model/article_entity.dart';
import 'package:esite/module/nav/nav_list_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// tab - 导航
class NavPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavPageState();
}
class _NavPageState extends State<NavPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold( 
      appBar: MyAppBar(
        isBack: false,
        centerTitle: "列表测试",
      ),
      body: BaseWidget<NavListModel>( 
        model: NavListModel(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) {
          if (model.isLoading) {
            return SkeletonList( 
              builder: (context, index) {
                return DefaultSkeletonItem();
              },
            );
          } else if (model.isError) {
            return ViewStateErrorWidget(error: model.viewStateError, onPressed: () => model.initData(),);
          } else if (model.isEmpty) {
            return ViewStateEmptyWidget(onPressed: () => model.initData(),);
          } else {
            return _listView(model);
          }
        },
      ),
    );
  }

  Widget _listView(NavListModel model) {
    return SmartRefresher( 
      controller: model.refreshController,
      header: WaterDropHeader(),
      footer: ClassicFooter(),
      onRefresh: model.refresh,
      onLoading: model.loadMore,
      enablePullUp: true,
      child: ListView.builder(
        itemCount: model.list.length,
        itemBuilder: (context, index) {
          ArticleData article = model.list[index];
          return ListTile( 
            title: Text(article.title),
            subtitle: Text(article.author),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
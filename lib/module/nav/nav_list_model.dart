import 'package:esite/base/config/net_api.dart';
import 'package:esite/base/network/net.dart';
import 'package:esite/base/structure/mvvm/base_refresh_list_model.dart';
import 'package:esite/module/nav/model/article_entity.dart';

class NavListModel extends BaseRefreshListModel {
  List<ArticleData> _articles = [];

  @override
  Future<List> loadData({pageNum}) async {
    await NetManager().request<ArticleEntity>(Method.get, "${NetApi.list}$pageNum/json",
      onSuccess: (result) {
        _articles = result.datas;
      },
      onError: (code, msg) {
        throw Exception("network error");
      },
    );
    return _articles;
  }
   
}
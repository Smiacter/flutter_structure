import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_list_model.dart';
import '../../config/app_config.dart';
import '../../widget/hud.dart';

/// 带下拉刷新&上拉加载更多的列表ViewModel基类
/// 
abstract class BaseRefreshListModel<T> extends BaseListModel<T> {
  /// 刷新控制器
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  /// 当前页
  int _curPage = AppConfig.pageZero;

  /// 下拉刷新
  /// [init]是否是第一次加载
  ///   true：出错时会跳转显示错误Widget
  ///   false：直接给出错误提示
  Future<List<T>> refresh({bool init = false}) async {
    try {
      // 重置当前页
      _curPage = AppConfig.pageZero;
      // 清空列表数据
      list.clear();
      List<T> data = await loadData(pageNum: AppConfig.pageZero);
      if (data.isEmpty) {
        refreshController.refreshCompleted(resetFooterState: true);
        setEmpty();
      } else {
        onComplete(data);
        list.addAll(data);
        refreshController.refreshCompleted();
        // 如果小于分页数，则禁止上拉加载更多
        if (data.length < AppConfig.pageSize) {
          refreshController.loadNoData();
        } else {
          // 防止上次上拉加载更多有过失败，重置下状态
          refreshController.loadComplete();
        }
        // 更新页面显示正常数据
        setIdle();
      }
      return data;
    } catch (e, s) {
      // 如果页面已经加载了数据，刷新报错，不应该直接显示错误Widget
      // 而是显示之前的页面数据，给出错误提示
      refreshController.refreshFailed();
      if (init) {
        list.clear();
        setError(e, s);
      } else {
        Hud.showToast(text: e.toString());
      }
      return null;
    }
  }

  /// 上拉加载更多
  Future<List<T>> loadMore() async {
    try {
      List<T> data = await loadData(pageNum: ++_curPage);
      if (data.isEmpty) {
        _curPage--;
        refreshController.loadNoData();
      } else {
        onComplete(data);
        list.addAll(data);
        if (data.length < AppConfig.pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        notifyListeners();
      }
      return data;
    } catch (e, s) {
      _curPage--;
      refreshController.refreshFailed();
      return null;
    }
  }

  Future<List<T>> loadData({@required pageNum});

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
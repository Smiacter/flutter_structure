import 'base_model.dart';

/// 列表ViewModel抽象类
/// 
abstract class BaseListModel<T> extends BaseModel {
  /// 页面列表数据
  List<T> list = [];
  
  /// 列表数据请求完成的回调
  onComplete(List<T> data) {}

  /// 第一次进入界面，加载转圈或者骨架屏
  initData() async {
    setLoading();
    await refresh(init: true);
  }

  /// 刷新页面
  /// [init]是否是第一次加载
  ///   true：出错时会跳转显示错误Widget
  ///   false：直接给出错误提示
  Future<void> refresh({bool init = false}) async {
    try {
      List<T> data = await loadData();
      // 清空列表
      list.clear();
      if (data.isEmpty) {
        // 设置页面状态为空，UI可更新对应空界面显示
        setEmpty();
      } else {
        // 回传界面当前请求数据
        onComplete(data);
        // 更新整个list数据
        list.addAll(data);
        // 设置页面状态为正常闲置状态，正常显示页面数据
        setIdle();
      }
    } catch (e, s) {
      if (init) {
        list.clear();
      }
      setError(e, s);
    }
  }

  /// 请求网络数据
  Future<List<T>> loadData();
}
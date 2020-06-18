import '../config/net_config.dart';
import '../../generated/json/base/json_convert_content.dart';

/// 基础模型定义与解析
/// 需配合Android Studio插件FlutterJsonBeanFactory
class BaseEntity<T> {
  //! 一般情况下服务器返回的code都是int类型，也有遇到过是String的，需根据实际情况定义
  int code;
  String message;
  T data;
  List<T> listData = [];

  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[NetConfig.code];
    message = json[NetConfig.message];
    if (json.containsKey(NetConfig.data)) {
      if (json[NetConfig.data] is List) {
        (json[NetConfig.data] as List).forEach((item) {
          listData.add(_generateOBJ<T>(item));
        });
      } else {
        data = _generateOBJ(json[NetConfig.data]);
      }
    }
  }

  S _generateOBJ<S>(json) {
    if (S.toString() == 'String') {
      return json.toString() as S;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as S;
    } else {
      return JsonConvert.fromJsonAsT<S>(json);
    }
  }
}
import 'package:dio/dio.dart';
import 'package:esite/base/config/net_api.dart';
import 'package:esite/base/network/net.dart';
import 'package:esite/base/structure/mvvm/base_model.dart';
import 'package:esite/module/home/model/home_banner_entity.dart';

class HomeBannerModel extends BaseModel {
  List<HomeBannerEntity> _banners;
  List<HomeBannerEntity> get banners => _banners;

  getBanners() {
    setLoading();
    NetManager().request<HomeBannerEntity>(Method.get, NetApi.banner, isList: true, onSuccessList: (result) {
      _banners = result;
      setIdle();
    }, onError: (code, msg) {
      print("errCode: $code, errMsg: $msg");
      setError(DioError(), null);
    });
  }
}
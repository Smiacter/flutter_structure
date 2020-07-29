import 'package:esite/generated/json/base/json_convert_content.dart';
import 'package:esite/generated/json/base/json_filed.dart';

class HomeDataEntity with JsonConvert<HomeDataEntity> {
	List<HomeDataBanner> banners;
	List<HomeDatamanus> menus;
	String type;
	@JSONField(name: "default_type")
	HomeDataDefaultType defaultType;
	@JSONField(name: "sichuan_type")
	HomeDataSichuanType sichuanType;
	@JSONField(name: "chongqing_type")
	HomeDataChongqingType chongqingType;
	@JSONField(name: "xinjiang_type")
	HomeDataXinjiangType xinjiangType;
	@JSONField(name: "heilongjiang_type")
	List<HomeDataHeilongjiangType> heilongjiangType;
}

class HomeDataBanner with JsonConvert<HomeDataBanner> {
	String redirectUrl;
	String imageUrl;
}

class HomeDatamanus with JsonConvert<HomeDatamanus> {
	String image;
	String describe;
}

class HomeDataDefaultType with JsonConvert<HomeDataDefaultType> {
	HomeDataDefaultTypeType type;
	HomeDataDefaultTypeGoods goods;
}

class HomeDataDefaultTypeType with JsonConvert<HomeDataDefaultTypeType> {
	String title;
	List<HomeDataDefaultTypeTypeItem> items;
}

class HomeDataDefaultTypeTypeItem with JsonConvert<HomeDataDefaultTypeTypeItem> {
	String image;
	String describe;
}

class HomeDataDefaultTypeGoods with JsonConvert<HomeDataDefaultTypeGoods> {
	String title;
	List<HomeDataDefaultTypeGoodsItem> items;
}

class HomeDataDefaultTypeGoodsItem with JsonConvert<HomeDataDefaultTypeGoodsItem> {
	String image;
	String describe;
	String price;
	String soldNum;
	String redirectUrl;
}

class HomeDataSichuanType with JsonConvert<HomeDataSichuanType> {
	HomeDataSichuanTypeAd ad;
	String title;
	List<HomeDataSichuanTypeItem> items;
}

class HomeDataSichuanTypeAd with JsonConvert<HomeDataSichuanTypeAd> {
	String image;
	double height;
}

class HomeDataSichuanTypeItem with JsonConvert<HomeDataSichuanTypeItem> {
	String image;
	String describe;
	String price;
	String soldNum;
	String redirectUrl;
	String originalPrice;
}

class HomeDataChongqingType with JsonConvert<HomeDataChongqingType> {
	HomeDataChongqingTypeAd ad;
	List<HomeDataChongqingTypeSection> sections;
}

class HomeDataChongqingTypeAd with JsonConvert<HomeDataChongqingTypeAd> {
	String image;
	double height;
}

class HomeDataChongqingTypeSection with JsonConvert<HomeDataChongqingTypeSection> {
	String title;
	List<HomeDataChongqingTypeSectionsItem> items;
}

class HomeDataChongqingTypeSectionsItem with JsonConvert<HomeDataChongqingTypeSectionsItem> {
	String image;
	String redirectUrl;
}

class HomeDataXinjiangType with JsonConvert<HomeDataXinjiangType> {
	HomeDataXinjiangTypeAd ad;
	String title;
	List<HomeDataXinjiangTypeItem> items;
}

class HomeDataXinjiangTypeAd with JsonConvert<HomeDataXinjiangTypeAd> {
	String image;
	double height;
}

class HomeDataXinjiangTypeItem with JsonConvert<HomeDataXinjiangTypeItem> {
	String image;
	String redirectUrl;
}

class HomeDataHeilongjiangType with JsonConvert<HomeDataHeilongjiangType> {
	HomeDataHeilongjiangTypeAd ad;
	List<HomeDataHeilongjiangTypeItem> items;
}

class HomeDataHeilongjiangTypeAd with JsonConvert<HomeDataHeilongjiangTypeAd> {
	String image;
	double height;
}

class HomeDataHeilongjiangTypeItem with JsonConvert<HomeDataHeilongjiangTypeItem> {
	String text;
	String image;
}

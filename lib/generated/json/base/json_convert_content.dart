// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:esite/module/gas/home_data_entity.dart';
import 'package:esite/generated/json/home_data_entity_helper.dart';
import 'package:esite/module/home/model/home_banner_entity.dart';
import 'package:esite/generated/json/home_banner_entity_helper.dart';
import 'package:esite/module/nav/model/article_entity.dart';
import 'package:esite/generated/json/article_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {			case HomeDataEntity:
			return homeDataEntityFromJson(data as HomeDataEntity, json) as T;			case HomeDataBanner:
			return homeDataBannerFromJson(data as HomeDataBanner, json) as T;			case HomeDatamanus:
			return homeDatamanusFromJson(data as HomeDatamanus, json) as T;			case HomeDataDefaultType:
			return homeDataDefaultTypeFromJson(data as HomeDataDefaultType, json) as T;			case HomeDataDefaultTypeType:
			return homeDataDefaultTypeTypeFromJson(data as HomeDataDefaultTypeType, json) as T;			case HomeDataDefaultTypeTypeItem:
			return homeDataDefaultTypeTypeItemFromJson(data as HomeDataDefaultTypeTypeItem, json) as T;			case HomeDataDefaultTypeGoods:
			return homeDataDefaultTypeGoodsFromJson(data as HomeDataDefaultTypeGoods, json) as T;			case HomeDataDefaultTypeGoodsItem:
			return homeDataDefaultTypeGoodsItemFromJson(data as HomeDataDefaultTypeGoodsItem, json) as T;			case HomeDataSichuanType:
			return homeDataSichuanTypeFromJson(data as HomeDataSichuanType, json) as T;			case HomeDataSichuanTypeAd:
			return homeDataSichuanTypeAdFromJson(data as HomeDataSichuanTypeAd, json) as T;			case HomeDataSichuanTypeItem:
			return homeDataSichuanTypeItemFromJson(data as HomeDataSichuanTypeItem, json) as T;			case HomeDataChongqingType:
			return homeDataChongqingTypeFromJson(data as HomeDataChongqingType, json) as T;			case HomeDataChongqingTypeAd:
			return homeDataChongqingTypeAdFromJson(data as HomeDataChongqingTypeAd, json) as T;			case HomeDataChongqingTypeSection:
			return homeDataChongqingTypeSectionFromJson(data as HomeDataChongqingTypeSection, json) as T;			case HomeDataChongqingTypeSectionsItem:
			return homeDataChongqingTypeSectionsItemFromJson(data as HomeDataChongqingTypeSectionsItem, json) as T;			case HomeDataXinjiangType:
			return homeDataXinjiangTypeFromJson(data as HomeDataXinjiangType, json) as T;			case HomeDataXinjiangTypeAd:
			return homeDataXinjiangTypeAdFromJson(data as HomeDataXinjiangTypeAd, json) as T;			case HomeDataXinjiangTypeItem:
			return homeDataXinjiangTypeItemFromJson(data as HomeDataXinjiangTypeItem, json) as T;			case HomeDataHeilongjiangType:
			return homeDataHeilongjiangTypeFromJson(data as HomeDataHeilongjiangType, json) as T;			case HomeDataHeilongjiangTypeAd:
			return homeDataHeilongjiangTypeAdFromJson(data as HomeDataHeilongjiangTypeAd, json) as T;			case HomeDataHeilongjiangTypeItem:
			return homeDataHeilongjiangTypeItemFromJson(data as HomeDataHeilongjiangTypeItem, json) as T;			case HomeBannerEntity:
			return homeBannerEntityFromJson(data as HomeBannerEntity, json) as T;			case ArticleEntity:
			return articleEntityFromJson(data as ArticleEntity, json) as T;			case ArticleData:
			return articleDataFromJson(data as ArticleData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {			case HomeDataEntity:
			return homeDataEntityToJson(data as HomeDataEntity);			case HomeDataBanner:
			return homeDataBannerToJson(data as HomeDataBanner);			case HomeDatamanus:
			return homeDatamanusToJson(data as HomeDatamanus);			case HomeDataDefaultType:
			return homeDataDefaultTypeToJson(data as HomeDataDefaultType);			case HomeDataDefaultTypeType:
			return homeDataDefaultTypeTypeToJson(data as HomeDataDefaultTypeType);			case HomeDataDefaultTypeTypeItem:
			return homeDataDefaultTypeTypeItemToJson(data as HomeDataDefaultTypeTypeItem);			case HomeDataDefaultTypeGoods:
			return homeDataDefaultTypeGoodsToJson(data as HomeDataDefaultTypeGoods);			case HomeDataDefaultTypeGoodsItem:
			return homeDataDefaultTypeGoodsItemToJson(data as HomeDataDefaultTypeGoodsItem);			case HomeDataSichuanType:
			return homeDataSichuanTypeToJson(data as HomeDataSichuanType);			case HomeDataSichuanTypeAd:
			return homeDataSichuanTypeAdToJson(data as HomeDataSichuanTypeAd);			case HomeDataSichuanTypeItem:
			return homeDataSichuanTypeItemToJson(data as HomeDataSichuanTypeItem);			case HomeDataChongqingType:
			return homeDataChongqingTypeToJson(data as HomeDataChongqingType);			case HomeDataChongqingTypeAd:
			return homeDataChongqingTypeAdToJson(data as HomeDataChongqingTypeAd);			case HomeDataChongqingTypeSection:
			return homeDataChongqingTypeSectionToJson(data as HomeDataChongqingTypeSection);			case HomeDataChongqingTypeSectionsItem:
			return homeDataChongqingTypeSectionsItemToJson(data as HomeDataChongqingTypeSectionsItem);			case HomeDataXinjiangType:
			return homeDataXinjiangTypeToJson(data as HomeDataXinjiangType);			case HomeDataXinjiangTypeAd:
			return homeDataXinjiangTypeAdToJson(data as HomeDataXinjiangTypeAd);			case HomeDataXinjiangTypeItem:
			return homeDataXinjiangTypeItemToJson(data as HomeDataXinjiangTypeItem);			case HomeDataHeilongjiangType:
			return homeDataHeilongjiangTypeToJson(data as HomeDataHeilongjiangType);			case HomeDataHeilongjiangTypeAd:
			return homeDataHeilongjiangTypeAdToJson(data as HomeDataHeilongjiangTypeAd);			case HomeDataHeilongjiangTypeItem:
			return homeDataHeilongjiangTypeItemToJson(data as HomeDataHeilongjiangTypeItem);			case HomeBannerEntity:
			return homeBannerEntityToJson(data as HomeBannerEntity);			case ArticleEntity:
			return articleEntityToJson(data as ArticleEntity);			case ArticleData:
			return articleDataToJson(data as ArticleData);    }
    return data as T;
  }
  //Go back to a single instance by type
  static _fromJsonSingle(String type, json) {
    switch (type) {			case 'HomeDataEntity':
			return HomeDataEntity().fromJson(json);			case 'HomeDataBanner':
			return HomeDataBanner().fromJson(json);			case 'HomeDatamanus':
			return HomeDatamanus().fromJson(json);			case 'HomeDataDefaultType':
			return HomeDataDefaultType().fromJson(json);			case 'HomeDataDefaultTypeType':
			return HomeDataDefaultTypeType().fromJson(json);			case 'HomeDataDefaultTypeTypeItem':
			return HomeDataDefaultTypeTypeItem().fromJson(json);			case 'HomeDataDefaultTypeGoods':
			return HomeDataDefaultTypeGoods().fromJson(json);			case 'HomeDataDefaultTypeGoodsItem':
			return HomeDataDefaultTypeGoodsItem().fromJson(json);			case 'HomeDataSichuanType':
			return HomeDataSichuanType().fromJson(json);			case 'HomeDataSichuanTypeAd':
			return HomeDataSichuanTypeAd().fromJson(json);			case 'HomeDataSichuanTypeItem':
			return HomeDataSichuanTypeItem().fromJson(json);			case 'HomeDataChongqingType':
			return HomeDataChongqingType().fromJson(json);			case 'HomeDataChongqingTypeAd':
			return HomeDataChongqingTypeAd().fromJson(json);			case 'HomeDataChongqingTypeSection':
			return HomeDataChongqingTypeSection().fromJson(json);			case 'HomeDataChongqingTypeSectionsItem':
			return HomeDataChongqingTypeSectionsItem().fromJson(json);			case 'HomeDataXinjiangType':
			return HomeDataXinjiangType().fromJson(json);			case 'HomeDataXinjiangTypeAd':
			return HomeDataXinjiangTypeAd().fromJson(json);			case 'HomeDataXinjiangTypeItem':
			return HomeDataXinjiangTypeItem().fromJson(json);			case 'HomeDataHeilongjiangType':
			return HomeDataHeilongjiangType().fromJson(json);			case 'HomeDataHeilongjiangTypeAd':
			return HomeDataHeilongjiangTypeAd().fromJson(json);			case 'HomeDataHeilongjiangTypeItem':
			return HomeDataHeilongjiangTypeItem().fromJson(json);			case 'HomeBannerEntity':
			return HomeBannerEntity().fromJson(json);			case 'ArticleEntity':
			return ArticleEntity().fromJson(json);			case 'ArticleData':
			return ArticleData().fromJson(json);    }
    return null;
  }

  //empty list is returned by type
  static _getListFromType(String type) {
    switch (type) {			case 'HomeDataEntity':
			return List<HomeDataEntity>();			case 'HomeDataBanner':
			return List<HomeDataBanner>();			case 'HomeDatamanus':
			return List<HomeDatamanus>();			case 'HomeDataDefaultType':
			return List<HomeDataDefaultType>();			case 'HomeDataDefaultTypeType':
			return List<HomeDataDefaultTypeType>();			case 'HomeDataDefaultTypeTypeItem':
			return List<HomeDataDefaultTypeTypeItem>();			case 'HomeDataDefaultTypeGoods':
			return List<HomeDataDefaultTypeGoods>();			case 'HomeDataDefaultTypeGoodsItem':
			return List<HomeDataDefaultTypeGoodsItem>();			case 'HomeDataSichuanType':
			return List<HomeDataSichuanType>();			case 'HomeDataSichuanTypeAd':
			return List<HomeDataSichuanTypeAd>();			case 'HomeDataSichuanTypeItem':
			return List<HomeDataSichuanTypeItem>();			case 'HomeDataChongqingType':
			return List<HomeDataChongqingType>();			case 'HomeDataChongqingTypeAd':
			return List<HomeDataChongqingTypeAd>();			case 'HomeDataChongqingTypeSection':
			return List<HomeDataChongqingTypeSection>();			case 'HomeDataChongqingTypeSectionsItem':
			return List<HomeDataChongqingTypeSectionsItem>();			case 'HomeDataXinjiangType':
			return List<HomeDataXinjiangType>();			case 'HomeDataXinjiangTypeAd':
			return List<HomeDataXinjiangTypeAd>();			case 'HomeDataXinjiangTypeItem':
			return List<HomeDataXinjiangTypeItem>();			case 'HomeDataHeilongjiangType':
			return List<HomeDataHeilongjiangType>();			case 'HomeDataHeilongjiangTypeAd':
			return List<HomeDataHeilongjiangTypeAd>();			case 'HomeDataHeilongjiangTypeItem':
			return List<HomeDataHeilongjiangTypeItem>();			case 'HomeBannerEntity':
			return List<HomeBannerEntity>();			case 'ArticleEntity':
			return List<ArticleEntity>();			case 'ArticleData':
			return List<ArticleData>();    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    String type = M.toString();
    if (json is List && type.contains("List<")) {
      String itemType = type.substring(5, type.length - 1);
      List tempList = _getListFromType(itemType);
      json.forEach((itemJson) {
        tempList
            .add(_fromJsonSingle(type.substring(5, type.length - 1), itemJson));
      });
      return tempList as M;
    } else {
      return _fromJsonSingle(M.toString(), json) as M;
    }
  }
}
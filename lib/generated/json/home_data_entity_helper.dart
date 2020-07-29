import 'package:esite/module/gas/home_data_entity.dart';

homeDataEntityFromJson(HomeDataEntity data, Map<String, dynamic> json) {
	if (json['banners'] != null) {
		data.banners = new List<HomeDataBanner>();
		(json['banners'] as List).forEach((v) {
			data.banners.add(new HomeDataBanner().fromJson(v));
		});
	}
	if (json['menus'] != null) {
		data.menus = new List<HomeDatamanus>();
		(json['menus'] as List).forEach((v) {
			data.menus.add(new HomeDatamanus().fromJson(v));
		});
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['default_type'] != null) {
		data.defaultType = new HomeDataDefaultType().fromJson(json['default_type']);
	}
	if (json['sichuan_type'] != null) {
		data.sichuanType = new HomeDataSichuanType().fromJson(json['sichuan_type']);
	}
	if (json['chongqing_type'] != null) {
		data.chongqingType = new HomeDataChongqingType().fromJson(json['chongqing_type']);
	}
	if (json['xinjiang_type'] != null) {
		data.xinjiangType = new HomeDataXinjiangType().fromJson(json['xinjiang_type']);
	}
	if (json['heilongjiang_type'] != null) {
		data.heilongjiangType = new List<HomeDataHeilongjiangType>();
		(json['heilongjiang_type'] as List).forEach((v) {
			data.heilongjiangType.add(new HomeDataHeilongjiangType().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeDataEntityToJson(HomeDataEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.banners != null) {
		data['banners'] =  entity.banners.map((v) => v.toJson()).toList();
	}
	if (entity.menus != null) {
		data['menus'] =  entity.menus.map((v) => v.toJson()).toList();
	}
	data['type'] = entity.type;
	if (entity.defaultType != null) {
		data['default_type'] = entity.defaultType.toJson();
	}
	if (entity.sichuanType != null) {
		data['sichuan_type'] = entity.sichuanType.toJson();
	}
	if (entity.chongqingType != null) {
		data['chongqing_type'] = entity.chongqingType.toJson();
	}
	if (entity.xinjiangType != null) {
		data['xinjiang_type'] = entity.xinjiangType.toJson();
	}
	if (entity.heilongjiangType != null) {
		data['heilongjiang_type'] =  entity.heilongjiangType.map((v) => v.toJson()).toList();
	}
	return data;
}

homeDataBannerFromJson(HomeDataBanner data, Map<String, dynamic> json) {
	if (json['redirectUrl'] != null) {
		data.redirectUrl = json['redirectUrl']?.toString();
	}
	if (json['imageUrl'] != null) {
		data.imageUrl = json['imageUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDataBannerToJson(HomeDataBanner entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['redirectUrl'] = entity.redirectUrl;
	data['imageUrl'] = entity.imageUrl;
	return data;
}

homeDatamanusFromJson(HomeDatamanus data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['describe'] != null) {
		data.describe = json['describe']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDatamanusToJson(HomeDatamanus entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['describe'] = entity.describe;
	return data;
}

homeDataDefaultTypeFromJson(HomeDataDefaultType data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = new HomeDataDefaultTypeType().fromJson(json['type']);
	}
	if (json['goods'] != null) {
		data.goods = new HomeDataDefaultTypeGoods().fromJson(json['goods']);
	}
	return data;
}

Map<String, dynamic> homeDataDefaultTypeToJson(HomeDataDefaultType entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.type != null) {
		data['type'] = entity.type.toJson();
	}
	if (entity.goods != null) {
		data['goods'] = entity.goods.toJson();
	}
	return data;
}

homeDataDefaultTypeTypeFromJson(HomeDataDefaultTypeType data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['items'] != null) {
		data.items = new List<HomeDataDefaultTypeTypeItem>();
		(json['items'] as List).forEach((v) {
			data.items.add(new HomeDataDefaultTypeTypeItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeDataDefaultTypeTypeToJson(HomeDataDefaultTypeType entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	if (entity.items != null) {
		data['items'] =  entity.items.map((v) => v.toJson()).toList();
	}
	return data;
}

homeDataDefaultTypeTypeItemFromJson(HomeDataDefaultTypeTypeItem data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['describe'] != null) {
		data.describe = json['describe']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDataDefaultTypeTypeItemToJson(HomeDataDefaultTypeTypeItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['describe'] = entity.describe;
	return data;
}

homeDataDefaultTypeGoodsFromJson(HomeDataDefaultTypeGoods data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['items'] != null) {
		data.items = new List<HomeDataDefaultTypeGoodsItem>();
		(json['items'] as List).forEach((v) {
			data.items.add(new HomeDataDefaultTypeGoodsItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeDataDefaultTypeGoodsToJson(HomeDataDefaultTypeGoods entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	if (entity.items != null) {
		data['items'] =  entity.items.map((v) => v.toJson()).toList();
	}
	return data;
}

homeDataDefaultTypeGoodsItemFromJson(HomeDataDefaultTypeGoodsItem data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['describe'] != null) {
		data.describe = json['describe']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toString();
	}
	if (json['soldNum'] != null) {
		data.soldNum = json['soldNum']?.toString();
	}
	if (json['redirectUrl'] != null) {
		data.redirectUrl = json['redirectUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDataDefaultTypeGoodsItemToJson(HomeDataDefaultTypeGoodsItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['describe'] = entity.describe;
	data['price'] = entity.price;
	data['soldNum'] = entity.soldNum;
	data['redirectUrl'] = entity.redirectUrl;
	return data;
}

homeDataSichuanTypeFromJson(HomeDataSichuanType data, Map<String, dynamic> json) {
	if (json['ad'] != null) {
		data.ad = new HomeDataSichuanTypeAd().fromJson(json['ad']);
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['items'] != null) {
		data.items = new List<HomeDataSichuanTypeItem>();
		(json['items'] as List).forEach((v) {
			data.items.add(new HomeDataSichuanTypeItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeDataSichuanTypeToJson(HomeDataSichuanType entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.ad != null) {
		data['ad'] = entity.ad.toJson();
	}
	data['title'] = entity.title;
	if (entity.items != null) {
		data['items'] =  entity.items.map((v) => v.toJson()).toList();
	}
	return data;
}

homeDataSichuanTypeAdFromJson(HomeDataSichuanTypeAd data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toDouble();
	}
	return data;
}

Map<String, dynamic> homeDataSichuanTypeAdToJson(HomeDataSichuanTypeAd entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['height'] = entity.height;
	return data;
}

homeDataSichuanTypeItemFromJson(HomeDataSichuanTypeItem data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['describe'] != null) {
		data.describe = json['describe']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toString();
	}
	if (json['soldNum'] != null) {
		data.soldNum = json['soldNum']?.toString();
	}
	if (json['redirectUrl'] != null) {
		data.redirectUrl = json['redirectUrl']?.toString();
	}
	if (json['originalPrice'] != null) {
		data.originalPrice = json['originalPrice']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDataSichuanTypeItemToJson(HomeDataSichuanTypeItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['describe'] = entity.describe;
	data['price'] = entity.price;
	data['soldNum'] = entity.soldNum;
	data['redirectUrl'] = entity.redirectUrl;
	data['originalPrice'] = entity.originalPrice;
	return data;
}

homeDataChongqingTypeFromJson(HomeDataChongqingType data, Map<String, dynamic> json) {
	if (json['ad'] != null) {
		data.ad = new HomeDataChongqingTypeAd().fromJson(json['ad']);
	}
	if (json['sections'] != null) {
		data.sections = new List<HomeDataChongqingTypeSection>();
		(json['sections'] as List).forEach((v) {
			data.sections.add(new HomeDataChongqingTypeSection().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeDataChongqingTypeToJson(HomeDataChongqingType entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.ad != null) {
		data['ad'] = entity.ad.toJson();
	}
	if (entity.sections != null) {
		data['sections'] =  entity.sections.map((v) => v.toJson()).toList();
	}
	return data;
}

homeDataChongqingTypeAdFromJson(HomeDataChongqingTypeAd data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toDouble();
	}
	return data;
}

Map<String, dynamic> homeDataChongqingTypeAdToJson(HomeDataChongqingTypeAd entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['height'] = entity.height;
	return data;
}

homeDataChongqingTypeSectionFromJson(HomeDataChongqingTypeSection data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['items'] != null) {
		data.items = new List<HomeDataChongqingTypeSectionsItem>();
		(json['items'] as List).forEach((v) {
			data.items.add(new HomeDataChongqingTypeSectionsItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeDataChongqingTypeSectionToJson(HomeDataChongqingTypeSection entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	if (entity.items != null) {
		data['items'] =  entity.items.map((v) => v.toJson()).toList();
	}
	return data;
}

homeDataChongqingTypeSectionsItemFromJson(HomeDataChongqingTypeSectionsItem data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['redirectUrl'] != null) {
		data.redirectUrl = json['redirectUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDataChongqingTypeSectionsItemToJson(HomeDataChongqingTypeSectionsItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['redirectUrl'] = entity.redirectUrl;
	return data;
}

homeDataXinjiangTypeFromJson(HomeDataXinjiangType data, Map<String, dynamic> json) {
	if (json['ad'] != null) {
		data.ad = new HomeDataXinjiangTypeAd().fromJson(json['ad']);
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['items'] != null) {
		data.items = new List<HomeDataXinjiangTypeItem>();
		(json['items'] as List).forEach((v) {
			data.items.add(new HomeDataXinjiangTypeItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeDataXinjiangTypeToJson(HomeDataXinjiangType entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.ad != null) {
		data['ad'] = entity.ad.toJson();
	}
	data['title'] = entity.title;
	if (entity.items != null) {
		data['items'] =  entity.items.map((v) => v.toJson()).toList();
	}
	return data;
}

homeDataXinjiangTypeAdFromJson(HomeDataXinjiangTypeAd data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toDouble();
	}
	return data;
}

Map<String, dynamic> homeDataXinjiangTypeAdToJson(HomeDataXinjiangTypeAd entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['height'] = entity.height;
	return data;
}

homeDataXinjiangTypeItemFromJson(HomeDataXinjiangTypeItem data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['redirectUrl'] != null) {
		data.redirectUrl = json['redirectUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDataXinjiangTypeItemToJson(HomeDataXinjiangTypeItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['redirectUrl'] = entity.redirectUrl;
	return data;
}

homeDataHeilongjiangTypeFromJson(HomeDataHeilongjiangType data, Map<String, dynamic> json) {
	if (json['ad'] != null) {
		data.ad = new HomeDataHeilongjiangTypeAd().fromJson(json['ad']);
	}
	if (json['items'] != null) {
		data.items = new List<HomeDataHeilongjiangTypeItem>();
		(json['items'] as List).forEach((v) {
			data.items.add(new HomeDataHeilongjiangTypeItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> homeDataHeilongjiangTypeToJson(HomeDataHeilongjiangType entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.ad != null) {
		data['ad'] = entity.ad.toJson();
	}
	if (entity.items != null) {
		data['items'] =  entity.items.map((v) => v.toJson()).toList();
	}
	return data;
}

homeDataHeilongjiangTypeAdFromJson(HomeDataHeilongjiangTypeAd data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toDouble();
	}
	return data;
}

Map<String, dynamic> homeDataHeilongjiangTypeAdToJson(HomeDataHeilongjiangTypeAd entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['height'] = entity.height;
	return data;
}

homeDataHeilongjiangTypeItemFromJson(HomeDataHeilongjiangTypeItem data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	return data;
}

Map<String, dynamic> homeDataHeilongjiangTypeItemToJson(HomeDataHeilongjiangTypeItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['image'] = entity.image;
	return data;
}
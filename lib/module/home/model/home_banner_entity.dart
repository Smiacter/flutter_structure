import 'package:esite/generated/json/base/json_convert_content.dart';

class HomeBannerEntity with JsonConvert<HomeBannerEntity> {
	String desc;
	int id;
	String imagePath;
	int isVisible;
	int order;
	String title;
	int type;
	String url;
}

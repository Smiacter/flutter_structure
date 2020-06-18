import 'package:esite/generated/json/base/json_convert_content.dart';

class ArticleEntity with JsonConvert<ArticleEntity> {
	int curPage;
	List<ArticleData> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class ArticleData with JsonConvert<ArticleData> {
	String author;
	String title;
}

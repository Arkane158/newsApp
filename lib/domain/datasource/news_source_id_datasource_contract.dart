import 'package:news/domain/models/article/article_response.dart';

abstract class GetNewsWithSourcesIdDatasourceContract {
  Future<ArticleResponse?> getNews(String sourceId);
}

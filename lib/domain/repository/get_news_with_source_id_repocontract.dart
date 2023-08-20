import 'package:news/domain/models/article/article_response.dart';

abstract class GetNewsWithSourceIdRepositoryContract {
  Future<ArticleResponse?> getNews(String sourceId);
}

import 'package:news/domain/models/article/article_response.dart';

abstract class NewsSearchRepositoryContract {
  Future<ArticleResponse> searchNews(String keyWord);
}

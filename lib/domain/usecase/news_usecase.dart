import 'package:news/domain/models/article/article_response.dart';
import 'package:news/domain/repository/get_news_with_source_id_repocontract.dart';

class NewsUseCase {
  GetNewsWithSourceIdRepositoryContract repository;
  NewsUseCase(this.repository);
  Future<ArticleResponse?> invoke(sourceId) async {
    return repository.getNews(sourceId);
  }
}

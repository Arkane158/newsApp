import 'package:news/domain/models/article/article_response.dart';
import 'package:news/domain/repository/news_search_repo_contract.dart';

class SearchUseCase {
  NewsSearchRepositoryContract repository;
  SearchUseCase(this.repository);
  Future<ArticleResponse> searchNews(String keyWord) async {
    try {
      return await repository.searchNews(keyWord);
    } catch (e) {
      throw 'something went wrong ${e.toString()}';
    }
  }
}

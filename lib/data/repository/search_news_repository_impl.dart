import 'package:news/data/datasource/search_news_datasource_impl.dart';
import 'package:news/domain/models/article/article_response.dart';

import '../../domain/repository/news_search_repo_contract.dart';

class SearchNewsRepositoryImplementation
    implements NewsSearchRepositoryContract {
  SearchNewsDataSourceImplementation datasource;
  SearchNewsRepositoryImplementation(this.datasource);
  @override
  Future<ArticleResponse> searchNews(String keyWord) async {
    try {
      return await datasource.searchNews(keyWord);
    } catch (e) {
      rethrow;
    }
  }
}

NewsSearchRepositoryContract injectSearchNewsRepo() {
  return SearchNewsRepositoryImplementation(injectSearchNewsDataSource());
}

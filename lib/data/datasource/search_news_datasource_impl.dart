import 'package:news/data/api/api_manager.dart';
import 'package:news/domain/datasource/news_search_datasource_contract.dart';
import 'package:news/domain/models/article/article_response.dart';

class SearchNewsDataSourceImplementation
    implements SearchNewsDataSourceContract {
  ApiManager apiManager;
  SearchNewsDataSourceImplementation(this.apiManager);
  @override
  Future<ArticleResponse> searchNews(String keyWord) async {
    var response = await apiManager.searchNews(keyWord);
    return response.toDomainNews();
  }
}

SearchNewsDataSourceImplementation injectSearchNewsDataSource() {
  return SearchNewsDataSourceImplementation(ApiManager.getInstance());
}

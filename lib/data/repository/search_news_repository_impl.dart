import 'package:news/data/datasource/search_news_datasource_impl.dart';
import 'package:news/domain/models/article/article_response.dart';

import '../../domain/repository/news_search_repo_contract.dart';

class SearchNewsRepositoryImplementation
    implements NewsSearchRepositoryContract {
  SearchNewsDataSourceImplementation datasource;
  SearchNewsRepositoryImplementation(this.datasource);
  @override
  Future<ArticleResponse> searchNews(String keyWord) async {
    return await datasource.searchNews(keyWord);
  }
}

NewsSearchRepositoryContract injectSearchNewsRepo() {
  return SearchNewsRepositoryImplementation(injectSearchNewsDataSource() );
}

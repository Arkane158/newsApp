import 'package:news/data/datasource/news_bysource_id_datasource_impl.dart';
import 'package:news/domain/models/article/article_response.dart';
import 'package:news/domain/repository/get_news_with_source_id_repocontract.dart';

class GetNewsWithSourceIdRepositoryImplementation
    implements GetNewsWithSourceIdRepositoryContract {
  GetNewsBySourceIdDataSourceImplementation datasource;
  GetNewsWithSourceIdRepositoryImplementation(this.datasource);

  @override
  Future<ArticleResponse?> getNews(String sourceId) async {
    return await datasource.getNews(sourceId);
  }
}

GetNewsWithSourceIdRepositoryContract injectNewsRepo() {
  return GetNewsWithSourceIdRepositoryImplementation(
      injectGetNewsBySourceIdDataSourceImplementation());
}

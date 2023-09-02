import 'package:news/data/api/api_manager.dart';
import 'package:news/domain/datasource/news_source_id_datasource_contract.dart';
import 'package:news/domain/models/article/article_response.dart';

class GetNewsBySourceIdDataSourceImplementation
    implements GetNewsWithSourcesIdDatasourceContract {
  ApiManager apiManager;
  GetNewsBySourceIdDataSourceImplementation(this.apiManager);
  @override
  Future<ArticleResponse?> getNews(String sourceId) async {
    try {
      var response = await apiManager.getNews(sourceId);
      return response.toDomainNews();
    } catch (e) {
      rethrow;
    }
  }
}

GetNewsBySourceIdDataSourceImplementation
    injectGetNewsBySourceIdDataSourceImplementation() {
  return GetNewsBySourceIdDataSourceImplementation(ApiManager.getInstance());
}

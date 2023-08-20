import 'package:news/data/api/api_manager.dart';
import 'package:news/domain/datasource/source_catigory_id_datasource_contract.dart';
import 'package:news/domain/models/sources_response/sources_response.dart';

class GetSourceWithCategoryIdDataSource
    implements GetSourceWithCategoryIdDatasourceContract {
  ApiManager apiManager;
  GetSourceWithCategoryIdDataSource(this.apiManager);

  @override
  Future<SourcesResponse?> getSourceWithCatigoryId(String id) async {
    var response = await apiManager.getSource(id);
    return response.toDomainResponse();
  }
}

GetSourceWithCategoryIdDataSource injectGetSourceWithCategoryIdDataSource() {
  return GetSourceWithCategoryIdDataSource(ApiManager.getInstance());
}

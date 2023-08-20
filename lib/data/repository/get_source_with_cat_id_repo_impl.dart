import 'package:news/data/datasource/source_catigory_id_datasource_impl.dart';
import 'package:news/domain/models/sources_response/sources_response.dart';
import 'package:news/domain/repository/get_source_with_catigory_id_repocontract.dart';

class GetSourceWithCategoryIdRepositoryImplementation
    implements GetSourceWithCatigoryIdRepositoryContract {
  GetSourceWithCategoryIdDataSource dataSource;
  GetSourceWithCategoryIdRepositoryImplementation(this.dataSource);

  @override
  Future<SourcesResponse?> getSourceWithCatigoryId(String id) async {
    return await dataSource.getSourceWithCatigoryId(id);
  }
}

GetSourceWithCatigoryIdRepositoryContract injectSourceRepository() {
  return GetSourceWithCategoryIdRepositoryImplementation(
      injectGetSourceWithCategoryIdDataSource());
}

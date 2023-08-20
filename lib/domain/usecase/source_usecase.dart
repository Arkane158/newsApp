import 'package:news/domain/models/sources_response/sources_response.dart';
import 'package:news/domain/repository/get_source_with_catigory_id_repocontract.dart';

class SourceUseCase {
  GetSourceWithCatigoryIdRepositoryContract repository;
  SourceUseCase(this.repository);
  Future<SourcesResponse?> invoke(String id) {
    return repository.getSourceWithCatigoryId(id);
  }
}

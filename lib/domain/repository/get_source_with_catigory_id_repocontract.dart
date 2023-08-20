import 'package:news/domain/models/sources_response/sources_response.dart';

abstract class GetSourceWithCatigoryIdRepositoryContract {
  Future<SourcesResponse?> getSourceWithCatigoryId(String id);
}

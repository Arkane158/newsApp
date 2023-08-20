import 'package:news/domain/models/sources_response/sources_response.dart';

abstract class GetSourceWithCategoryIdDatasourceContract{
    Future<SourcesResponse?> getSourceWithCatigoryId(String id);

}
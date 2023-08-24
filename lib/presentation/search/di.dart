import 'package:news/data/repository/search_news_repository_impl.dart';
import 'package:news/domain/usecase/search_usecase.dart';

SearchUseCase injectSearchUseCase() {
  return SearchUseCase(injectSearchNewsRepo());
}

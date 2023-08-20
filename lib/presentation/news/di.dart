import 'package:news/data/repository/get_news_with_sourceid_repo_impl.dart';
import 'package:news/domain/usecase/news_usecase.dart';

injectNewsUsecase() {
 return NewsUseCase(injectNewsRepo());
}

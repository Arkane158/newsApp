import 'package:news/data/repository/get_source_with_cat_id_repo_impl.dart';
import 'package:news/domain/usecase/source_usecase.dart';

injectSourceUsecase() {
  return SourceUseCase(injectSourceRepository());
}

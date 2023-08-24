import 'package:news/domain/models/article/article_response.dart';

abstract class SearchNewsDataSourceContract{
    Future<ArticleResponse> searchNews(String keyWord);

}
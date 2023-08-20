import 'article.dart';

class ArticleResponse {
  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<Article>? articles;

  ArticleResponse(
      {this.status, this.totalResults, this.articles, this.code, this.message});
}

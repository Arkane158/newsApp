import 'package:collection/collection.dart';

import 'article.dart';

class News {
  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<Article>? articles;

  News({this.status, this.totalResults, this.articles,this.code,this.message});

  factory News.fromJson(Map<String, dynamic> json) => News(
        status: json['status'] as String?,
        code: json['code'] as String?,
        message: json['message'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! News) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode;
}

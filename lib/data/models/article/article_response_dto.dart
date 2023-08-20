import 'package:collection/collection.dart';
import 'package:news/domain/models/article/article_response.dart';

import 'article_dto.dart';

class ArticleResponseDTO {
  String? status;
  String? code;
  String? message;
  int? totalResults;
  List<ArticleDTO>? articles;

  ArticleResponseDTO(
      {this.status, this.totalResults, this.articles, this.code, this.message});

  factory ArticleResponseDTO.fromJson(Map<String, dynamic> json) =>
      ArticleResponseDTO(
        status: json['status'] as String?,
        code: json['code'] as String?,
        message: json['message'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => ArticleDTO.fromJson(e as Map<String, dynamic>))
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
    if (other is! ArticleResponseDTO) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  ArticleResponse toDomainNews() {
    return ArticleResponse(
      status: status,
      totalResults: totalResults,
      articles:
          articles?.map((articleDTO) => articleDTO.toDomainArticle()).toList(),
    );
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode;
}

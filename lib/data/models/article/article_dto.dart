import 'package:collection/collection.dart';
import 'package:news/domain/models/article/article.dart';

import '../sources_response/source_dto.dart';

class ArticleDTO {
  SourceDTO? source;
  String? author;
  String? message;
  String? code;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleDTO({
    this.source,
    this.message,
    this.code,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleDTO.fromJson(Map<String, dynamic> json) => ArticleDTO(
        source: json['source'] == null
            ? null
            : SourceDTO.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        code: json['code'] as String?,
        message: json['message'] as String?,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'source': source?.toJson(),
        'author': author,
        'title': title,
        'code': code,
        'message': message,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt,
        'content': content,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ArticleDTO) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  Article toDomainArticle() {
    return Article(
        author: author,
        message: message,
        code: code,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
        source: source?.toDoaminSource());
  }

  @override
  int get hashCode =>
      source.hashCode ^
      author.hashCode ^
      title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      urlToImage.hashCode ^
      publishedAt.hashCode ^
      content.hashCode;
}

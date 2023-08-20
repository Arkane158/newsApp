
import '../sources_response/source.dart';

class Article {
  Source? source;
  String? author;
  String? message;
  String? code;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
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

 
}

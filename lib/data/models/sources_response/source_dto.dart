import 'package:collection/collection.dart';
import 'package:news/domain/models/sources_response/source.dart';

class SourceDTO {
  String? id;
  String? code;
  String? message;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  SourceDTO({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.code,
    this.message,
    this.country,
  });

  factory SourceDTO.fromJson(Map<String, dynamic> json) => SourceDTO(
        id: json['id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        category: json['category'] as String?,
        language: json['language'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'message': message,
        'code': code,
        'description': description,
        'url': url,
        'category': category,
        'language': language,
        'country': country,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SourceDTO) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  Source toDoaminSource() {
    return Source(
        id: id,
        name: name,
        description: description,
        url: url,
        category: category,
        language: language,
        code: code,
        message: message,
        country: category);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      url.hashCode ^
      category.hashCode ^
      language.hashCode ^
      country.hashCode;
}

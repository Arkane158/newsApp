import 'package:collection/collection.dart';
import 'package:news/domain/models/sources_response/sources_response.dart';

import 'source_dto.dart';

class SourcesResponseDTO {
  String? status;
  List<SourceDTO>? sources;
  String? message;
  String? code;

  SourcesResponseDTO({this.status, this.sources, this.message, this.code});

  factory SourcesResponseDTO.fromJson(Map<String, dynamic> json) {
    return SourcesResponseDTO(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => SourceDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SourcesResponseDTO) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  SourcesResponse toDomainResponse() {
    return SourcesResponse(
        status: status,
        message: message,
        code: code,
        sources:
            sources?.map((sourceDTO) => sourceDTO.toDoaminSource()).toList());
  }

  @override
  int get hashCode => status.hashCode ^ sources.hashCode;
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/data/models/sources_response/sources_response_dto.dart';

import '../models/article/article_response_dto.dart';

class ApiManager {
  ApiManager._();

  //https://newsapi.org/v2/top-headlines/sources?apiKe=3e92671b6e6547a29500314bb8cb14e5&category=sports

  final String baseUrl = 'newsapi.org';
  final String apiKey = '22419eb461934a9bb8a50be1659485cb';
  final String message = 'Server Error';
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<SourcesResponseDTO> getSource(String categoryTittle) async {
    var url = Uri.https(
      baseUrl,
      'v2/top-headlines/sources',
      {'apiKey': apiKey, 'category': categoryTittle},
    );

    var response = await http.get(url);
    return SourcesResponseDTO.fromJson(jsonDecode(response.body));
  }

  Future<ArticleResponseDTO> getNews(String sourceId) async {
    //https://newsapi.org/v2/everything?sources=bbc-sport&apiKey=3e92671b6e6547a29500314bb8cb14e5
    var url = Uri.https(
        baseUrl, 'v2/everything', {'apiKey': apiKey, 'sources': sourceId});
    var response1 = await http.get(url);
    return ArticleResponseDTO.fromJson(jsonDecode(response1.body));
  }
}

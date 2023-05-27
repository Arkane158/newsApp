import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/core/api/models/sources_response/sources_response.dart';

import 'models/news/news.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKe=3e92671b6e6547a29500314bb8cb14e5&category=sports

  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '22419eb461934a9bb8a50be1659485cb';
  static const String message = 'Server Error';

  static Future<SourcesResponse> getSource(String categoryTittle) async {
    var url = Uri.https(
      baseUrl,
      'v2/top-headlines/sources',
      {'apiKey': apiKey, 'category': categoryTittle},
    );

    var response = await http.get(url);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<News> getNews(String sourceId) async{
    //https://newsapi.org/v2/everything?sources=bbc-sport&apiKey=3e92671b6e6547a29500314bb8cb14e5
    var url = Uri.https(
        baseUrl, 'v2/everything', {'apiKey': apiKey, 'sources': sourceId});
    var response1 = await http.get(url);
    return News.fromJson(jsonDecode(response1.body));
  }
}

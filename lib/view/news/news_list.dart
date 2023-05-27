import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/view/news/news_body_item.dart';

import '../../core/api/models/news/news.dart';
import '../../core/api/models/sources_response/source.dart';

class NewsList extends StatelessWidget {
  final Source source;
  const NewsList({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
      future: ApiManager.getNews(source.id ?? ''),
      builder: (__, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          Center(
            child: Text('Error Loading data\n ${snapshot.error.toString()}'),
          );
        } else if (snapshot.data?.status == 'error') {
          Center(
            child: Text('Server Error \n${snapshot.data?.message}'),
          );
        }
        var newsList = snapshot.data?.articles;
        return ListView.separated(
          itemBuilder: (__, index) {
            return NewsBodyItem(article: newsList![index]);
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 10,
            );
          },
          itemCount: newsList?.length ?? 0,
        );
      },
    );
  }
}

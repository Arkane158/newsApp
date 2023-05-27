import 'package:flutter/material.dart';
import 'package:news/core/api/api_manager.dart';
import 'package:news/core/api/models/sources_response/sources_response.dart';
import 'package:news/view/category_grid_view.dart';
import 'package:news/view/news/news_tap.dart';

class CategoryListScreen extends StatelessWidget {
  final Category category;
  const CategoryListScreen(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSource(category.categoryId),
      builder: (context, snapshot) {
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
        var source = snapshot.data?.sources;
        return NewsTab(sources: source ?? []);
      },
    );
  }
}

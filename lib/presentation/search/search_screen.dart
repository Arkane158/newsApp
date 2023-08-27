import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/models/article/article.dart';
import 'package:news/presentation/news/news_body_item.dart';
import 'package:news/presentation/news/news_details.dart';
import 'package:news/presentation/search/di.dart';
import 'package:news/presentation/search/search_viewmodel.dart';

class SearchNews extends SearchDelegate {
  SearchViewModel viewModel = SearchViewModel(injectSearchUseCase());

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 4,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18))),
            titleTextStyle: const TextStyle(
                color: Colors.white) // Change this to your desired color
            ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(
          Icons.search,
          size: 24,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
        viewModel.close();
      },
      icon: const Icon(
        Icons.clear,
        size: 24,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Container(
        color: Colors.white,
        child: StreamBuilder<List<Article?>>(
          stream: viewModel.articleStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text("Couldn't Find Anything Related"));
            } else {
              var newsList = snapshot.data!;
              return newsList.isEmpty
                  ? const Center(child: Text("Couldn't Find Anything Related"))
                  : ListView.separated(
                      itemBuilder: (__, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetails(article: newsList[index]!),
                              ),
                            );
                          },
                          child: NewsBodyItem(article: newsList[index]!),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 10,
                        );
                      },
                      itemCount: newsList.length,
                    );
            }
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    viewModel.searchNews(query);

    return Container(
      color: Colors.white,
    );
  }
}

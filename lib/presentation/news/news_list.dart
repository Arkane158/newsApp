import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/models/sources_response/source.dart';
import 'package:news/presentation/news/di.dart';
import 'package:news/presentation/news/news_body_item.dart';
import 'package:news/presentation/news/news_details.dart';
import 'package:news/presentation/news/news_viewmodel.dart';

class NewsList extends StatefulWidget {
  final Source source;
  const NewsList({super.key, required this.source});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final NewsViewModel viewModel = NewsViewModel(injectNewsUsecase());
  @override
  void initState() {
    super.initState();
    viewModel.getAerticle(super.widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          Center(
            child: Text("${state.errorMessage}"),
          );
        } else if (state is SuccessState) {
          var newsList = state.response;
          return ListView.separated(
            itemBuilder: (__, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetails(article: newsList[index]),
                        ));
                  },
                  child: NewsBodyItem(article: newsList[index]));
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 10,
              );
            },
            itemCount: newsList.length,
          );
        } else {
          const Center(
            child: Text('Something Went Wrong \nTry Again Later'),
          );
        }
        return Container();
      }),
    );
  }
}
// FutureBuilder<ArticleResponse>(
//       future: ApiManager.getNews(source.id ?? ''),
//       builder: (__, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           Center(
//             child: Text('Error Loading data\n ${snapshot.error.toString()}'),
//           );
//         } else if (snapshot.data?.status == 'error') {
//           Center(
//             child: Text('Server Error \n${snapshot.data?.message}'),
//           );
//         }
//         var newsList = snapshot.data?.articles;
//         return ListView.separated(
//           itemBuilder: (__, index) {
//             return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             NewsDetails(article: newsList[index]),
//                       ));
//                 },
//                 child: NewsBodyItem(article: newsList![index]));
//           },
//           separatorBuilder: (context, index) {
//             return Container(
//               height: 10,
//             );
//           },
//           itemCount: newsList?.length ?? 0,
//         );
//       },
//     );
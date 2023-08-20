import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/home/category_grid_view.dart';
import 'package:news/presentation/category/di.dart';
import 'package:news/presentation/category/category_viewmodel.dart';

import '../news/news_tap.dart';

class CategoryListScreen extends StatefulWidget {
  final Category category;

  const CategoryListScreen(this.category, {super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryViewModel viewModel = CategoryViewModel(injectSourceUsecase());
  @override
  void initState() {
    super.initState();
    viewModel.getSources(super.widget.category.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryViewModel>(
      create: (context) => viewModel,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<CategoryViewModel, HomeState>(
            builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text('${state.errorMessage}'),
            );
          } else if (state is SuccessState) {
            var source = state.response;
            return NewsTab(sources: source ?? []);
          }
          return Container();
        }),
      ),
    );
  }
}
// FutureBuilder<SourcesResponseDTO>(
//       future: ApiManager.getSource(category.categoryId),
//       builder: (context, snapshot) {
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
//         var source = snapshot.data?.sources;
//         return NewsTab(sources: source ?? []);
//       },
//     );
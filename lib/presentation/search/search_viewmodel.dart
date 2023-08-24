import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/models/article/article.dart';
import 'package:news/domain/usecase/search_usecase.dart';

class SearchViewModel extends Cubit<SearchState> {
  SearchUseCase useCase;
  SearchViewModel(this.useCase) : super(LoadingState());
  searchNews(String keyWord) async {
    try {
      var response = await useCase.searchNews(keyWord);
      if (response.status == 'error') {
        emit(ErrorState('Something went wrong ,${response.message}'));
      } else if (response.status == 'ok') {
        emit(SuccessState(response.articles!));
      }
      //else {
      //   emit(LoadingState());
      // }
    } catch (e) {
      if (e is IOException || e is HttpException) {
        return "Check Your Internet connection";
      } else {
        return e.toString();
      }
    }
  }
}

abstract class SearchState {}

class LoadingState extends SearchState {}

class ErrorState extends SearchState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends SearchState {
  List<Article?> response;
  SuccessState(this.response);
}

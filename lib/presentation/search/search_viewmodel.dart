import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/models/article/article.dart';
import 'package:news/domain/usecase/search_usecase.dart';

class SearchViewModel extends Cubit<SearchState> {
  SearchUseCase useCase;
  List<Article> _articleList = [];
  StreamSubscription? _searchSubscription;
  final _articleStreamController = StreamController<List<Article?>>.broadcast();

  SearchViewModel(this.useCase) : super(LoadingState());

  Stream<List<Article?>> get articleStream => _articleStreamController.stream;

  void searchNews(String keyWord) {
    if (_articleList.isNotEmpty) {
      _articleList.clear();
    }
    if (keyWord.isEmpty) {
      return;
    }

    _searchSubscription?.cancel();

    emit(LoadingState());

    _searchSubscription =
        Stream.fromFuture(useCase.searchNews(keyWord)).listen((response) {
      if (response.status == 'error') {
        emit(ErrorState('Something went wrong, ${response.message}'));
      } else if (response.status == 'ok') {
        _articleList = response.articles!;
        _articleStreamController.add(_articleList);
        emit(SuccessState(_articleList));
      }
    }, onError: (e) {
      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check your Internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _searchSubscription?.cancel();
    _articleStreamController.close();
    return super.close();
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

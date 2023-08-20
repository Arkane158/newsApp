import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/models/article/article.dart';
import 'package:news/domain/usecase/news_usecase.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel(this.useCase) : super(LoadingState());
  NewsUseCase useCase;

  getAerticle(String sourceId) async {
    try {
      var response = await useCase.invoke(sourceId);
      
      if (response?.status == 'error') {
        emit(ErrorState(response?.message.toString()));
      } else if (response?.status == 'ok') {
        emit(SuccessState(response!.articles!));
      } else if (response?.articles == null) {
        emit(LoadingState());
      }
    } catch (e) {
      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet Connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }
}

abstract class NewsState {}

class LoadingState extends NewsState {}

class ErrorState extends NewsState {
  String? errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends NewsState {
  List<Article?> response;
  SuccessState(this.response);
}

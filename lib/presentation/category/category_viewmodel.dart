import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/models/sources_response/source.dart';
import 'package:news/domain/usecase/source_usecase.dart';

class CategoryViewModel extends Cubit<HomeState> {
  CategoryViewModel(this.useCase) : super(LoadingState());
  SourceUseCase useCase;

  getSources(String id) async {
    try {
      var response = await useCase.invoke(id);

      if (response?.status == 'error') {
        emit(ErrorState(response?.message.toString()));
      } else if (response?.status == 'ok') {
        emit(SuccessState(response?.sources));
      } else {
        emit(ErrorState('Something went wrong\nTry Again Later'));
      }
    } catch (e) {
      if (e is IOException || e is HttpException) {
        emit(ErrorState('Check Your Internet connection'));
      } else {
        emit(ErrorState(e.toString()));
      }
    }
  }
}

abstract class HomeState {}

class LoadingState extends HomeState {}

class ErrorState extends HomeState {
  String? errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends HomeState {
  List<Source>? response;
  SuccessState(this.response);
}

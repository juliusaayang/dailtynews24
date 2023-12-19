import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dailynews24/common/common.dart';
import 'package:dailynews24/cubit/new_state.dart';
import 'package:dailynews24/models/news_model.dart';
import 'package:dailynews24/services/Api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCubit extends Cubit<NewState> {
  NewCubit()
      : super(
          const NewState.initial(),
        ) {
    getNews();
  }

  List<News> news = [];
  int page = 1;

  Future<void> getNews({
    int? keyword,
  }) async {
    emit(const NewState.loading());
    page = 1;
    news.clear();
    if (await getInternetStatus()) {
      try {
        final response = await ApiService().getEverything(keyword, page);
        if (response.statusCode == HttpStatus.ok) {
          final decodedBody = jsonDecode(response.body);
          final news = (decodedBody as List<dynamic>)
              .map(
                (e) => News.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
          this.news.addAll(news);
          emit(NewState.news(data: news));
        } else {
          emit(
            NewState.error(
              message: response.body.toString(),
            ),
          );
        }
      } catch (e) {
        emit(
          NewState.error(message: e.toString()),
        );
      }
    } else {
      emit(const NewState.noInternet());
    }
  }

  Future<void> loadMore({
    int? keyword,
  }) async {
    emit(const NewState.loadMore());
    page += 1;
    if (await getInternetStatus()) {
      try {
        final response = await ApiService().getEverything(keyword, page);
        if (response.statusCode == HttpStatus.ok) {
          final decodedBody = jsonDecode(response.body);
          final news = (decodedBody as List<dynamic>)
              .map(
                (e) => News.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
          this.news.addAll(news);
          emit(NewState.news(data: news));
        } else {
          emit(
            NewState.error(
              message: response.body.toString(),
            ),
          );
        }
      } catch (e) {
        emit(
          NewState.error(message: e.toString()),
        );
      }
    } else {
      emit(const NewState.noInternet());
    }
  }
}

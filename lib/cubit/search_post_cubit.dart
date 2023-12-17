import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dailynews24/common/common.dart';
import 'package:dailynews24/cubit/search_post_state.dart';
import 'package:dailynews24/models/news_model.dart';
import 'package:dailynews24/services/Api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SearchPostCubit extends Cubit<SearchPostState> {
  SearchPostCubit()
      : super(
          const SearchPostState.news(data: []),
        );

  Future<void> searchNews(
    String text,
  ) async {
    emit(const SearchPostState.loading());
    if (await getInternetStatus()) {
      try {
        final response = await ApiService().searchNews(text);
        if (response.statusCode == HttpStatus.ok) {
          final decodedBody = jsonDecode(response.body);
          final news = (decodedBody as List<dynamic>)
              .map(
                (e) => News.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
          emit(SearchPostState.news(data: news));
        } else {
          emit(
            SearchPostState.error(
              message: response.body.toString(),
            ),
          );
        }
      } catch (e) {
        emit(
          SearchPostState.error(message: e.toString()),
        );
      }
    } else {
      emit(
        const SearchPostState.error(message: 'No Internet service'),
      );
    }
  }
}

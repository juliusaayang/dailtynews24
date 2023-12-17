import 'package:dailynews24/models/news_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_post_state.freezed.dart';

@freezed
class SearchPostState with _$SearchPostState {
  const factory SearchPostState.initial() = _Initial;

  const factory SearchPostState.loading() = _Loading;

  const factory SearchPostState.error({
    required String message,
}) = _Error;

  const factory SearchPostState.news({
    required List<News> data,
}) = _SearchPostState;
}

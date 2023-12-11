import 'package:dailynews24/models/news_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_state.freezed.dart';

@freezed
class NewState with _$NewState {
  const factory NewState.initial() = _Initial;

  const factory NewState.loading() = _Loading;

  const factory NewState.news({
    required List<News> data,
}) = _News;

  const factory NewState.error({
    required String message,
}) = _Error;

  const factory NewState.noInternet() = _NoInternet;
}

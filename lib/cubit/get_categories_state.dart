import 'package:dailynews24/models/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_categories_state.freezed.dart';

@freezed
class GetCategoriesState with _$GetCategoriesState {
  const factory GetCategoriesState.initial() = _Initial;

  const factory GetCategoriesState.loading() = _Loading;

  const factory GetCategoriesState.error({
    required String message,
  }) = _Error;

  const factory GetCategoriesState.loaded({
    required List<CategoryModel> categories,
  }) = _Loaded;
}

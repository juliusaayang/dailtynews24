import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dailynews24/common/common.dart';
import 'package:dailynews24/cubit/get_categories_state.dart';
import 'package:dailynews24/models/category_model.dart';
import 'package:dailynews24/services/Api.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit()
      : super(
          const GetCategoriesState.initial(),
        ) {
    getCategories();
  }

  Future<void> getCategories() async {
    emit(const GetCategoriesState.loading());
    if (await getInternetStatus()) {
      try {
        final response = await ApiService().getCategories();
        if (response.statusCode == HttpStatus.ok) {
          final decodedBody = jsonDecode(response.body);
          final category = (decodedBody as List<dynamic>)
              .map(
                (e) => CategoryModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
              .toList();
          emit(GetCategoriesState.loaded(categories: category));
        } else {
          emit(
            GetCategoriesState.error(
              message: response.body.toString(),
            ),
          );
        }
      } catch (e) {
        emit(
          GetCategoriesState.error(message: e.toString()),
        );
      }
    } else {
      emit(
        const GetCategoriesState.error(message: 'No Internet'),
      );
    }
  }
}

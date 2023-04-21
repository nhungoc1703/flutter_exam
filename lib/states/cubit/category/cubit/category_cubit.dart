import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/models/category/category.dart';
import '../../../../core/data/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepository) : super(CategoryLoading());

  final CategoryRepository _categoryRepository;

  Future<void> fetchCategory() async {
    try {
      final categories = await _categoryRepository.getCategory();
      emit(CategoryLoaded(categoryList: categories));
    } catch (e) {
      emit(CategoryError());
    }
  }
}

part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Categories> categoryList;
  const CategoryLoaded({required this.categoryList});

  @override
  List<Object> get props => [categoryList];
}

class CategoryError extends CategoryState {}

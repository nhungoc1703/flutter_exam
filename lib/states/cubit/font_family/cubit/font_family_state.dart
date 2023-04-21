part of 'font_family_cubit.dart';

abstract class FontFamilyState extends Equatable {
  const FontFamilyState();

  @override
  List<Object> get props => [];
}

class FontFamilyInitial extends FontFamilyState {}

class FontFamilyLoading extends FontFamilyState {}

class FontFamilyLoaded extends FontFamilyState {
  final List<String> fontList;
  const FontFamilyLoaded({required this.fontList});

  @override
  List<Object> get props => [fontList];
}

class FontFamilyError extends FontFamilyState {}

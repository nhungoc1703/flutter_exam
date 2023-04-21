part of 'chapter_cubit.dart';

abstract class ChapterState extends Equatable {
  const ChapterState();

  @override
  List<Object> get props => [];
}

class ChapterLoading extends ChapterState {}

class ChapterLoaded extends ChapterState {
  final List<Chapters> chapterList;
  const ChapterLoaded({required this.chapterList});

  @override
  List<Object> get props => [chapterList];
}

class ChapterEmpty extends ChapterState {}

class ChapterError extends ChapterState {}

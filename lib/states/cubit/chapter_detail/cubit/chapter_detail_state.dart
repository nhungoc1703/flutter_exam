part of 'chapter_detail_cubit.dart';

abstract class ChapterDetailState extends Equatable {
  const ChapterDetailState();

  @override
  List<Object> get props => [];
}

class ChapterDetailLoading extends ChapterDetailState {}

class ChapterDetailLoaded extends ChapterDetailState {
  final ChapterDetail detail;

  const ChapterDetailLoaded({required this.detail});

  @override
  List<Object> get props => [detail];
}

class ChapterDetailEmpty extends ChapterDetailState {}

class ChapterDetailError extends ChapterDetailState {}

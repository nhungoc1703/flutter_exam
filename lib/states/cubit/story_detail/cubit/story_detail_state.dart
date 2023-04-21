part of 'story_detail_cubit.dart';

abstract class StoryDetailState extends Equatable {
  const StoryDetailState();

  @override
  List<Object> get props => [];
}

class StoryDetailLoading extends StoryDetailState {}

class StoryDetailLoaded extends StoryDetailState {
  final StoryDetail detail;

  const StoryDetailLoaded({required this.detail});

  @override
  List<Object> get props => [detail];
}

class StoryDetailError extends StoryDetailState {}

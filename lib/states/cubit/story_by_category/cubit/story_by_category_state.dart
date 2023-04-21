part of 'story_by_category_cubit.dart';

abstract class StoryByCategoryState extends Equatable {
  const StoryByCategoryState();

  @override
  List<Object> get props => [];
}

class StoryByCategoryInitial extends StoryByCategoryState {}

class StoryByCategoryLoading extends StoryByCategoryState {
  // final List<StoriesByCategory> oldStories;
  // final bool isFirstFetch;
  // const StoryByCategoryLoading(this.oldStories, {this.isFirstFetch = false});
}

class StoryByCategoryLoaded extends StoryByCategoryState {
  final List<StoriesByCategory> storyByCategoryList;
  const StoryByCategoryLoaded({required this.storyByCategoryList});

  @override
  List<Object> get props => [storyByCategoryList];
}

class StoryByCategoryError extends StoryByCategoryState {}

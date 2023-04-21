import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../core/data/models/story/story_by_category.dart';
import '../../../../core/data/repositories/story_repository.dart';

part 'story_by_category_state.dart';

class StoryByCategoryCubit extends Cubit<StoryByCategoryState> {
  StoryByCategoryCubit(this._storyByCategoryRepository)
      : super(StoryByCategoryInitial());

  final StoryRepository _storyByCategoryRepository;
  int _page = 1;
  List<StoriesByCategory> listStory = [];

  Future<void> onLoading(int categoryid, {bool isLoadMore = true}) {
    return fetchStotyByCategory(categoryid, isLoadMore: isLoadMore);
  }

  Future<void> onRefresh(int categoryid, {bool isRefresh = true}) {
    Future.delayed(Duration(milliseconds: 1000));

    return fetchStory(categoryid, isRefresh: isRefresh);
  }

  Future<void> fetchStotyByCategory(int categoryid,
      {bool isLoadMore = false}) async {
    try {
      emit(StoryByCategoryLoading());

      final story = await _storyByCategoryRepository.getStoryByCategory(
        categoryid,
        isLoadMore ? ++_page : 1,
      );
      if (!isLoadMore) {
        listStory.clear();
        _page = 1;
      }
      listStory.addAll(story);
      emit(StoryByCategoryLoaded(storyByCategoryList: listStory));
    } catch (e) {
      emit(StoryByCategoryError());
    }
  }

  Future<void> fetchStory(int categoryid, {bool isRefresh = false}) async {
    RefreshController refreshController = RefreshController();
    refreshController.refreshCompleted();
    //   listStory.clear();
    try {
      emit(StoryByCategoryLoading());
      final story =
          await _storyByCategoryRepository.getStoryByCategory(categoryid, 1);

      listStory.clear();
      _page = 1;
      listStory = story;

      emit(StoryByCategoryLoaded(storyByCategoryList: listStory));
    } catch (e) {
      emit(StoryByCategoryError());
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/models/story/story_detail.dart';
import '../../../../core/data/repositories/story_repository.dart';

part 'story_detail_state.dart';

class StoryDetailCubit extends Cubit<StoryDetailState> {
  StoryDetailCubit(this._storyDetailRepository) : super(StoryDetailLoading());

  final StoryRepository _storyDetailRepository;

  Future<void> fetchStoryDetail(String slugStoryDetail) async {
    try {
      final result =
          await _storyDetailRepository.getStoryDetail(slugStoryDetail);
      emit(StoryDetailLoaded(detail: result!));
    } catch (e) {
      emit(StoryDetailError());
    }
  }
}

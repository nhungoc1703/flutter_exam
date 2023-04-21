import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam/core/data/models/chapter/chapter_detail.dart';

import '../../../../core/data/repositories/chapter_repository.dart';

part 'chapter_detail_state.dart';

class ChapterDetailCubit extends Cubit<ChapterDetailState> {
  ChapterDetailCubit(this._chapterDetailRepository)
      : super(ChapterDetailLoading());

  final ChapterRepository _chapterDetailRepository;

  Future<void> fetchStoryDetail(String chapterId) async {
    try {
      final result = await _chapterDetailRepository.getChapterDetail(chapterId);
      if (result != null) {
        emit(ChapterDetailLoaded(detail: result));
      } else {
        emit(ChapterDetailEmpty());
      }
    } catch (e) {
      emit(ChapterDetailError());
    }
  }
}

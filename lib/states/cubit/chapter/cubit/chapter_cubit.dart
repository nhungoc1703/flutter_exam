import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam/core/data/models/chapter/chapter.dart';

import '../../../../core/data/repositories/chapter_repository.dart';

part 'chapter_state.dart';

class ChapterCubit extends Cubit<ChapterState> {
  ChapterCubit(this._chapterepository) : super(ChapterLoading());

  final ChapterRepository _chapterepository;

  Future<void> fetchChapter(String slugChapter) async {
    try {
      final chapters = await _chapterepository.getChapter(slugChapter);
      if (chapters.isNotEmpty) {
        emit(ChapterLoaded(chapterList: chapters));
      } else {
        emit(ChapterEmpty());
      }
    } catch (e) {
      emit(ChapterError());
    }
  }
}

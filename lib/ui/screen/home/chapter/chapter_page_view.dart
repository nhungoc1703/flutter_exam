import 'package:flutter/material.dart';

import '../../../../core/data/models/chapter/chapter.dart';
import 'chapter_detail_screen.dart';

class ChapterPageView extends StatelessWidget {
  final List<Chapters> chapters;
  final int chapterId;
  const ChapterPageView({
    super.key,
    required this.chapters,
    required this.chapterId,
  });

  @override
  Widget build(BuildContext context) {
    final chapterIndex =
        chapters.indexWhere((element) => element.id == chapterId);
    final controller = PageController(initialPage: chapterIndex);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        height: double.infinity,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: PageView(
          controller: controller,
          children: listChapters(),
        ),
      ),
    );
  }

  List<Widget> listChapters() {
    final List<Widget> listWidget = [];
    for (int i = 0; i < chapters.length; i++) {
      listWidget.add(
        ChapterDetailScreen(
          id: chapters[i].id.toString(),
        ),
      );
    }
    return listWidget;
  }
}

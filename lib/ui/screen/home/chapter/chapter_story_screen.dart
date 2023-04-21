import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/core/data/models/chapter/chapter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../../core/data/repositories/chapter_repository.dart';
import '../../../../states/cubit/chapter/cubit/chapter_cubit.dart';

class StoryChapter extends StatelessWidget {
  final String slug;
  const StoryChapter({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterCubit, ChapterState>(
      bloc: ChapterCubit(
        RepositoryProvider.of<ChapterRepository>(context),
      )..fetchChapter(slug),
      builder: (context, state) {
        if (state is ChapterLoading) {
          return Container();
        }
        if (state is ChapterLoaded) {
          List<Chapters> chapters = state.chapterList;
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 12, 0, 8),
            padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Các chương mới nhất',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Xem tất cả',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blue,
                          fontFamily: AppFonts.charis,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor,
                  ),
                  child: ListView.builder(
                    itemCount: chapters.length,
                    itemBuilder: (_, index) {
                      Chapters chapter = chapters[index];
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            RouteName.chapterDetailScreen,
                            extra: chapters,
                            params: {
                              'id': chapters[index].id.toString(),
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          child: Text(
                            chapter.header ?? "",
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        if (state is ChapterEmpty) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0, 12, 0, 8),
            padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.cultured,
            ),
            child: Center(
              child: Text(
                'Chưa có chap mới',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.black,
                  fontFamily: AppFonts.charis,
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/core/data/models/story/story_detail.dart';
import 'package:flutter_exam/states/cubit/story_detail/cubit/story_detail_cubit.dart';
import 'package:flutter_exam/ui/widget/app_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../../core/data/models/chapter/chapter.dart';
import '../../../../core/data/models/story/story_by_category.dart';
import '../../../../core/data/repositories/chapter_repository.dart';
import '../../../../core/data/repositories/story_repository.dart';
import '../../../../states/cubit/chapter/cubit/chapter_cubit.dart';
import '../../../widget/app_circular_progress.dart';
import '../chapter/chapter_story_screen.dart';

class StoryDetailScreen extends StatefulWidget {
  final StoriesByCategory sbc;
  const StoryDetailScreen({super.key, required this.sbc});

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  bool more = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<StoryDetailCubit, StoryDetailState>(
          bloc: StoryDetailCubit(
            RepositoryProvider.of<StoryRepository>(context),
          )..fetchStoryDetail(widget.sbc.slug.toString()),
          builder: (context, state) {
            if (state is StoryDetailLoading) {
              return const Center(
                child: AppCicularProgress(),
              );
            }
            if (state is StoryDetailLoaded) {
              StoryDetail storyDetail = state.detail;

              var stringList = storyDetail.categoryList!.join(", ");

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              maxRadius: 60,
                              minRadius: 50,
                              backgroundImage:
                                  NetworkImage(storyDetail.poster ?? ""),
                              backgroundColor: AppColors.cultured,
                            ),
                            Text(
                              storyDetail.title ?? "",
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Tác giả: ',
                                style: Theme.of(context).textTheme.bodyLarge,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: storyDetail.author,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue,
                                      fontFamily: AppFonts.charis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Thể loại: ',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Expanded(
                                  child: Text(
                                    stringList,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue,
                                      fontFamily: AppFonts.charis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Trạng thái: ',
                                style: Theme.of(context).textTheme.bodyLarge,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: storyDetail.status,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.blue,
                                      fontFamily: AppFonts.charis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 230.w,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nhấn vào ngôi sao để chọn',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 30,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Theme.of(context)
                                          .appBarTheme
                                          .actionsIconTheme!
                                          .color,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: AppButton(
                                buttonHeight: 50.h,
                                horPadd: 16,
                                verPadd: 0,
                                borderRadius: 25,
                                activeBackColor: AppColors.blue,
                                textWidget: Text(
                                  'Gửi',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.white,
                                    fontFamily: AppFonts.charis,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<ChapterCubit, ChapterState>(
                        bloc: ChapterCubit(
                          RepositoryProvider.of<ChapterRepository>(context),
                        )..fetchChapter(
                            widget.sbc.slug.toString(),
                          ),
                        builder: (context, state) {
                          if (state is ChapterLoading) {
                            return Container();
                          }
                          if (state is ChapterLoaded) {
                            List<Chapters> chapters = state.chapterList;
                            return AppButton(
                              buttonHeight: 60.h,
                              horPadd: 60,
                              verPadd: 0,
                              borderRadius: 30,
                              activeBackColor: AppColors.blue,
                              textWidget: Text(
                                'Đọc truyện',
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.white,
                                  fontFamily: AppFonts.charis,
                                ),
                              ),
                              onPressed: () {
                                context.pushNamed(
                                  RouteName.chapterDetailScreen,
                                  extra: chapters,
                                  params: {
                                    'id': chapters.last.id.toString(),
                                  },
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.sms_outlined,
                                    size: 25,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  Text(
                                    'Chats(0)',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.vertical_align_bottom,
                                    size: 25,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  Text(
                                    'Tải về',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.bookmark_add,
                                    size: 25,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  Text(
                                    'Tải về',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.warning,
                                    size: 25,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  Text(
                                    'Báo cáo',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: ReadMoreText(
                          storyDetail.description!.join(" "),
                          trimLines: 2,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.justify,
                          colorClickableText: Theme.of(context)
                              .appBarTheme
                              .actionsIconTheme!
                              .color,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: ' Less',
                        ),
                      ),
                      StoryChapter(
                        slug: widget.sbc.slug.toString(),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                        padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Các bình luận mới nhất',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: AppButton(
                          buttonHeight: 60.h,
                          horPadd: 60,
                          verPadd: 0,
                          borderRadius: 15,
                          activeBackColor: Theme.of(context).cardColor,
                          textWidget: Text(
                            'Quay lại',
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blue,
                              fontFamily: AppFonts.charis,
                            ),
                          ),
                          onPressed: () {
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

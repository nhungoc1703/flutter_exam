import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/core/data/models/category/category.dart';
import 'package:flutter_exam/states/cubit/story_by_category/cubit/story_by_category_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../../core/data/models/story/story_by_category.dart';

import '../../../widget/app_appbar.dart';
import '../../../widget/app_circular_progress.dart';
import '../../../widget/list_loader.dart';

class StoryByCategoryScreen extends StatefulWidget {
  final Categories category;
  const StoryByCategoryScreen({super.key, required this.category});

  @override
  State<StoryByCategoryScreen> createState() => _StoryByCategoryScreenState();
}

class _StoryByCategoryScreenState extends State<StoryByCategoryScreen> {
  // final scrollController = ScrollController();
  RefreshController refreshController = RefreshController();

  List<StoriesByCategory> stories = [];
  @override
  void initState() {
    context
        .read<StoryByCategoryCubit>()
        .fetchStotyByCategory(widget.category.id ?? 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppAppBar(
          title: widget.category.name ?? '',
          leadingBack: true,
          leadingIcon: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 25,
                  color: Theme.of(context).canvasColor,
                ),
                onPressed: () {
                  context.pop();
                },
              );
            },
          ),
        ),
      ),
      body: BlocBuilder<StoryByCategoryCubit, StoryByCategoryState>(
        bloc: context.read<StoryByCategoryCubit>(),
        buildWhen: (_, state) => state is StoryByCategoryLoaded,
        builder: (context, state) {
          if (state is StoryByCategoryLoading) {
            return const Center(
              child: AppCicularProgress(),
            );
          }
          if (state is StoryByCategoryLoaded) {
            return ListLoader(
              controller: refreshController,
              hasNext: true,
              onRefresh: () => context
                  .read<StoryByCategoryCubit>()
                  .onRefresh(widget.category.id ?? 1),
              onLoadMore: () => context
                  .read<StoryByCategoryCubit>()
                  .onLoading(widget.category.id ?? 1),
              child: showStory(
                state.storyByCategoryList,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget showStory(List<StoriesByCategory> stories) {
  return ListView.separated(
    itemCount: stories.length,
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(
        height: 0.h,
      );
    },
    itemBuilder: (BuildContext context, int index) {
      StoriesByCategory story = stories[index];
      return GestureDetector(
        onTap: () {
          context.pushNamed(
            RouteName.storyDetailScreen,
            extra: story,
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    color: AppColors.cultured.withOpacity(0.1),
                    child: CircleAvatar(
                      maxRadius: 50,
                      minRadius: 40,
                      backgroundImage: NetworkImage(story.poster ?? ""),
                      backgroundColor: AppColors.cultured,
                    ),
                  ),
                  if (story.status == "Full") ...[
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 15.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Tag.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Full',
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.white,
                              fontFamily: AppFonts.charis,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]
                ],
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        story.title ?? "",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        story.author ?? "",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Tình trạng: ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.blue,
                            fontFamily: AppFonts.charis,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: story.status,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        DateFormat('kk:mm:ss - dd-MM-yyyy ')
                            .format(story.uploadDate ?? DateTime.now())
                            .toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

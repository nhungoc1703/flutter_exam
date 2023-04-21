import 'package:flutter/material.dart';
import 'package:flutter_exam/core/data/models/category/category.dart';
import 'package:flutter_exam/core/data/models/chapter/chapter.dart';
import 'package:go_router/go_router.dart';

import 'core/core.dart';
import 'core/data/models/story/story_by_category.dart';
import 'ui/screen/bottom_bar_screen.dart';
import 'ui/screen/home/chapter/chapter_page_view.dart';
import 'ui/screen/home/story/stories_category_screen.dart';
import 'ui/screen/home/story/story_detail_screen.dart';
import 'ui/screen/slash/splash_screen.dart';

class AppRouter {
  static GoRouter goRouter =
      GoRouter(initialLocation: RoutePath.splashScreen, routes: <GoRoute>[
    GoRoute(
      path: RoutePath.splashScreen,
      name: RouteName.splashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RoutePath.bottomScreen,
      name: RouteName.bottomScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const BottomBarScreen();
      },
    ),
    GoRoute(
      path: RoutePath.storyByCategoryScreen,
      name: RouteName.storyByCategoryScreen,
      builder: (BuildContext context, GoRouterState state) {
        return StoryByCategoryScreen(
          category: state.extra as Categories,
        );
      },
    ),
    GoRoute(
      path: RoutePath.storyDetailScreen,
      name: RouteName.storyDetailScreen,
      builder: (BuildContext context, GoRouterState state) {
        return StoryDetailScreen(
          sbc: state.extra as StoriesByCategory,
        );
      },
    ),
    GoRoute(
      path: RoutePath.chapterDetailScreen,
      name: RouteName.chapterDetailScreen,
      builder: (BuildContext context, GoRouterState state) {
        return ChapterPageView(
          // id: state.params['id'] ?? '',
          chapters: state.extra as List<Chapters>,
          chapterId: int.parse(state.params['id'] ?? ''),
        );
      },
    ),
  ]);
}

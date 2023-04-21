import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/core/data/repositories/chapter_repository.dart';
import 'package:flutter_exam/states/cubit/story_by_category/cubit/story_by_category_cubit.dart';
import 'package:provider/provider.dart';

import '../core/data/repositories/category_repository.dart';
import '../core/data/repositories/story_repository.dart';
import 'cubit/category/cubit/category_cubit.dart';
import 'cubit/change_font.dart';
import 'cubit/change_size.dart';
import 'cubit/chapter/cubit/chapter_cubit.dart';
import 'cubit/chapter_detail/cubit/chapter_detail_cubit.dart';

import 'cubit/font_family/cubit/font_family_cubit.dart';
import 'cubit/story_detail/cubit/story_detail_cubit.dart';
import 'cubit/theme/cubit/theme_cubit.dart';

class BlocWrapper extends StatelessWidget {
  final Widget child;
  const BlocWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CategoryRepository>(
          create: (context) => CategoryRepository(),
        ),
        RepositoryProvider<StoryRepository>(
          create: (context) => StoryRepository(),
        ),
        RepositoryProvider<ChapterRepository>(
          create: (context) => ChapterRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SliderValue()),
          // Provider(
          //   create: (context) => FontSizeController(),
          // ),
          ChangeNotifierProvider(create: (_) => SelectFonts()),
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<FontFamilyCubit>(
            create: (context) => FontFamilyCubit(),
          ),
          BlocProvider<CategoryCubit>(
            create: (BuildContext context) => CategoryCubit(
              RepositoryProvider.of<CategoryRepository>(context),
            ),
          ),
          BlocProvider<StoryByCategoryCubit>(
            create: (BuildContext context) => StoryByCategoryCubit(
              RepositoryProvider.of<StoryRepository>(context),
            ),
          ),
          BlocProvider<StoryDetailCubit>(
            create: (BuildContext context) => StoryDetailCubit(
              RepositoryProvider.of<StoryRepository>(context),
            ),
          ),
          BlocProvider<ChapterCubit>(
            create: (BuildContext context) => ChapterCubit(
              RepositoryProvider.of<ChapterRepository>(context),
            ),
          ),
          BlocProvider<ChapterDetailCubit>(
            create: (BuildContext context) => ChapterDetailCubit(
              RepositoryProvider.of<ChapterRepository>(context),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}

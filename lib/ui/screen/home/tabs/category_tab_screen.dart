import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/config/app_colors.dart';
import 'package:flutter_exam/core/data/models/category/category.dart';
import 'package:flutter_exam/core/data/repositories/category_repository.dart';

import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../states/cubit/category/cubit/category_cubit.dart';
import '../../../widget/app_circular_progress.dart';

class HomeCategoryScreen extends StatelessWidget {
  const HomeCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        bloc: CategoryCubit(
          RepositoryProvider.of<CategoryRepository>(context),
        )..fetchCategory(),
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: AppCicularProgress(),
            );
          }
          if (state is CategoryLoaded) {
            List<Categories> categories = state.categoryList;
            return RefreshIndicator(
              backgroundColor: AppColors.blue,
              color: AppColors.white,
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              child: Scrollbar(
                thickness: 2,
                radius: const Radius.circular(20),
                scrollbarOrientation: ScrollbarOrientation.right,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 8,
                    childAspectRatio: (1 / .4),
                  ),
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    Categories category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                          RouteName.storyByCategoryScreen,
                          extra: category,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            category.name ?? "",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

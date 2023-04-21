import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../states/cubit/change_font.dart';
import '../../../../../states/cubit/font_family/cubit/font_family_cubit.dart';
import '../../../../widget/app_circular_progress.dart';

class ModalFont extends StatelessWidget {
  const ModalFont({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontFamilyCubit, FontFamilyState>(
      bloc: FontFamilyCubit()..getFonts(),
      builder: (context, state) {
        if (state is FontFamilyLoading) {
          return const Center(
            child: AppCicularProgress(),
          );
        }
        if (state is FontFamilyLoaded) {
          List<String> listFont = state.fontList;
          return ListView.builder(
            itemCount: listFont.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  context.read<SelectFonts>().select(listFont[index]);
                  context.pop();
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Center(
                    child: Text(
                      'Google Fonts ${listFont[index]}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.blue,
                        fontFamily: listFont[index],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}

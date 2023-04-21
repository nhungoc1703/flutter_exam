import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/config/config.dart';

import 'package:flutter_exam/core/data/models/chapter/chapter_detail.dart';
import 'package:flutter_exam/states/cubit/chapter_detail/cubit/chapter_detail_cubit.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/repositories/chapter_repository.dart';
import '../../../../states/cubit/change_font.dart';
import '../../../../states/cubit/change_size.dart';
import '../../../widget/app_button.dart';
import '../../../widget/app_circular_progress.dart';
import 'modal/modal_font.dart';

class ChapterDetailScreen extends StatefulWidget {
  final String id;
  const ChapterDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterDetailCubit, ChapterDetailState>(
      bloc: ChapterDetailCubit(
        RepositoryProvider.of<ChapterRepository>(context),
      )..fetchStoryDetail(widget.id.toString()),
      builder: (context, state) {
        if (state is ChapterDetailLoading) {
          return const Center(
            child: AppCicularProgress(),
          );
        }
        if (state is ChapterDetailLoaded) {
          ChapterDetail chapter = state.detail;
          return Container(
            padding: const EdgeInsets.fromLTRB(12, 60, 12, 20),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    chapter.header ?? "",
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  Slider(
                    value: context.watch<SliderValue>().value,
                    activeColor:
                        Theme.of(context).appBarTheme.actionsIconTheme?.color,
                    inactiveColor:
                        Theme.of(context).appBarTheme.iconTheme?.color,
                    onChanged: (double s) {
                      context.read<SliderValue>().increment(s);
                    },
                    divisions: 10,
                    min: 0.0,
                    max: 10.0,
                  ),
                  AppButton(
                    buttonHeight: 60.h,
                    horPadd: 60,
                    verPadd: 0,
                    borderRadius: 30,
                    activeBackColor: AppColors.blue,
                    textWidget: Text(
                      'Đổi kiểu chữ',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.white,
                        fontFamily: AppFonts.charis,
                      ),
                    ),
                    onPressed: () {
                      showModal(context);
                    },
                  ),
                  Html(
                    data: chapter.body!.join('-'),
                    style: {
                      "div": Style(),
                      "br": Style(),
                      "p": Style(
                        fontFamily: context.watch<SelectFonts>().value,
                        fontSize:
                            FontSize(10 * context.watch<SliderValue>().value),
                      ),
                    },
                  ),
                  Text(
                    "Hết chương ấn nút quay lại đề trở về hoặc lướt qua phải, trái để xem tiếp",
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
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
    );
  }

  showModal(context) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isDismissible: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      builder: (BuildContext context) {
        return ModalFont();
      },
    );
  }
}

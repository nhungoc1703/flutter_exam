import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/config/app_colors.dart';
import 'package:flutter_exam/config/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../states/cubit/theme/cubit/theme_cubit.dart';
import '../../widget/app_button.dart';
import '../../widget/app_check_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool checkLicense = false;
  bool _isChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250.h,
              child: Image.asset(
                'assets/images/Logo.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 400.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.cultured,
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Scrollbar(
                thickness: 2,
                radius: const Radius.circular(20),
                scrollbarOrientation: ScrollbarOrientation.right,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Điều khoản sử dụng cho ứng dụng truyện',
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                                fontFamily: AppFonts.charis,
                              ),
                            ),
                            Text(
                              'Email liên lạc với quản trị viên',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: AppColors.black,
                                fontFamily: AppFonts.charis,
                              ),
                            ),
                            Text(
                              'studio@gmail.com',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                                fontFamily: AppFonts.charis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Về bản quyền nội dung',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                                fontFamily: AppFonts.charis,
                              ),
                            ),
                            Text(
                              '1.Ứng dụng truyện hoạt động dưới giấy phép',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                                color: AppColors.black,
                                fontFamily: AppFonts.charis,
                              ),
                            ),
                            Text(
                              'Tên giấy phép hoạt động',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.blue,
                                fontFamily: AppFonts.charis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '2.Ứng dụng truyện luôn ý thức rõ ràng về việc tôn trọng bản quyền của các tác giả, tác phẩm, các sản phẩm trí tuệ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.black,
                            fontFamily: AppFonts.charis,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '3.Ứng dụng truyện là một nền tảng mở, mọi thành viên có quyền đăng do minh sáng tác hoặc dịch từ các ngôn ngữ khác. Đồng thời ứng dụng khác thác các nội dung từ các trang khác',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.black,
                            fontFamily: AppFonts.charis,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '4.Ứng dụng truyện là một nền tảng mở, mọi thành viên có quyền đăng do minh sáng tác hoặc dịch từ các ngôn ngữ khác. Đồng thời ứng dụng khác thác các nội dung từ các trang khác',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.black,
                            fontFamily: AppFonts.charis,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppCheckButton(
                      isChecked: checkLicense,
                      toggleCheckboxState: (bool? value) {
                        setState(() {
                          checkLicense = value!;
                        });
                      },
                      title: Text(
                        'Tôi đồng ý với điều khoản sử dụng',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                          fontFamily: AppFonts.charis,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chọn giao diện tối:',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                            fontFamily: AppFonts.charis,
                          ),
                        ),
                        FlutterSwitch(
                          width: 70,
                          height: 35.0,
                          toggleSize: 25.0,
                          borderRadius: 30.0,
                          padding: 2.0,
                          activeToggleColor:
                              const Color.fromARGB(255, 71, 34, 145),
                          inactiveToggleColor:
                              const Color.fromARGB(255, 219, 225, 231),
                          activeSwitchBorder: Border.all(
                            color: const Color(0xFF3C1E70),
                            width: 5.0,
                          ),
                          inactiveSwitchBorder: Border.all(
                            color: const Color(0xFFD1D5DA),
                            width: 5.0,
                          ),
                          activeColor: const Color.fromARGB(255, 23, 10, 49),
                          inactiveColor: Colors.white,
                          activeIcon: const Icon(
                            Icons.nightlight_round,
                            color: Color(0xFFF8E3A1),
                          ),
                          inactiveIcon: const Icon(
                            Icons.sunny,
                            color: Color.fromARGB(255, 255, 174, 0),
                          ),
                          value: _isChanged,
                          onToggle: (status) {
                            setState(() {
                              _isChanged = status;
                            });
                            context.read<ThemeCubit>().switchTheme(status);
                          },
                        ),
                      ],
                    ),
                    Align(
                      child: AppButton(
                        buttonHeight: 50.h,
                        horPadd: 16,
                        verPadd: 0,
                        borderRadius: 25,
                        activeBackColor: AppColors.blue,
                        textWidget: Text(
                          'Hoàn thành',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.white,
                            fontFamily: AppFonts.charis,
                          ),
                        ),
                        onPressed: () {
                          context.pushNamed(
                            RouteName.bottomScreen,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

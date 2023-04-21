import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config.dart';

class Themings {
  static const TextStyle darkText = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.charis,
  );

  static const TextStyle lightText = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.charis,
  );

  static final ThemeData darkTheme = ThemeData(
    // primarySwatch: Colors.blue,
    // backgroundColor: AppColors.black,
    // brightness: Brightness.dark,
    // primaryColor: AppColors.paradisePink,
    canvasColor: AppColors.blue,
    cardColor: AppColors.blackChocolate,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      iconTheme: IconThemeData(
        size: 30.sp,
        color: AppColors.white,
      ),
      actionsIconTheme: IconThemeData(
        size: 30.sp,
        color: AppColors.blue,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.blue,
        fontFamily: AppFonts.charis,
      ),
      //name story
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.charis,
        color: AppColors.blue,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.charis,
        color: AppColors.blue,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.blue,
        fontFamily: AppFonts.charis,
      ),
      titleSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.charis,
        color: AppColors.blue,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: AppFonts.charis,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: AppFonts.charis,
        color: AppColors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: AppFonts.charis,
        color: AppColors.white,
      ),
    ),
    scaffoldBackgroundColor: AppColors.black,
  );

  static final ThemeData lightTheme = ThemeData(
    // primarySwatch: Colors.blue,
    // backgroundColor: AppColors.white,
    // brightness: Brightness.light,
    // primaryColor: AppColors.paradisePink,
    cardColor: AppColors.cultured,
    canvasColor: AppColors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.black,
        size: 30.sp,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.blue,
        size: 30.sp,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontFamily: AppFonts.charis,
      ),
      //name story
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.charis,
        color: AppColors.blue,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.charis,
        color: AppColors.blue,
      ),
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.blue,
        fontFamily: AppFonts.charis,
      ),
      titleSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        fontFamily: AppFonts.charis,
        color: AppColors.blue,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: AppFonts.charis,
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: AppFonts.charis,
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: AppFonts.charis,
        color: AppColors.black,
      ),
    ),
    scaffoldBackgroundColor: AppColors.white,
  );
}

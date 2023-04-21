import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class ApppTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String hintTitle;
  final TextInputType textInputTypeTitle;
  final bool obscure;
  final bool? readFormField;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const ApppTextFormField({
    super.key,
    required this.textController,
    required this.hintTitle,
    required this.textInputTypeTitle,
    required this.obscure,
    required this.readFormField,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              textAlign: TextAlign.start,
              cursorColor: AppColors.blue,
              readOnly: readFormField ?? false,
              keyboardType: textInputTypeTitle,
              controller: textController,
              obscureText: obscure,
              decoration: InputDecoration(
                hintText: hintTitle,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.black,
                  fontFamily: AppFonts.charis,
                ),
                contentPadding: const EdgeInsets.all(18),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: suffixIcon,
                suffixIconColor: AppColors.grey,
                prefixIcon: prefixIcon,
                prefixIconColor: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

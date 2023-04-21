import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class AppCheckButton extends StatelessWidget {
  final Widget title;
  final bool isChecked;
  final Function(bool?) toggleCheckboxState;
  const AppCheckButton({
    super.key,
    required this.isChecked,
    required this.toggleCheckboxState,
    required this.title,
  });
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.blue;
    }
    return AppColors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 28.h,
          width: 16.w,
          child: Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            splashRadius: null,
            checkColor: AppColors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked,
            onChanged: toggleCheckboxState,
          ),
        ),
        12.horizontalSpace,
        title,
      ],
    );
  }
}

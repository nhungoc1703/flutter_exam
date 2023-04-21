import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double buttonHeight;
  final double? borderRadius;
  final Color? activeBackColor;
  final Color? disabledBackColor;
  final double verPadd;
  final double horPadd;
  final Widget textWidget;
  final VoidCallback? onPressed;
  const AppButton({
    super.key,
    required this.buttonHeight,
    this.borderRadius,
    this.activeBackColor,
    this.disabledBackColor,
    required this.verPadd,
    required this.horPadd,
    required this.textWidget,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight, //35.h
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: disabledBackColor,
          backgroundColor: activeBackColor, //AppColors.lightMango
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(
              vertical: verPadd, horizontal: horPadd), //ver 12
        ),
        onPressed: onPressed,
        child: textWidget,
      ),
    );
  }
}

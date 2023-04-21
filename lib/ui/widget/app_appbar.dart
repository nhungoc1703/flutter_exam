import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';

class AppAppBar extends StatelessWidget {
  final String? title;
  final bool leadingBack;
  final Widget? leadingIcon;
  const AppAppBar(
      {super.key,
      required this.title,
      required this.leadingBack,
      required this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      automaticallyImplyLeading: leadingBack,
      leading: leadingIcon,
      title: Text(
        title ?? "",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

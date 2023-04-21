import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class AppTabBar extends StatelessWidget {
  final int tabLengh;
  final List<Tab> listTab;
  final List<Widget> listWidget;
  const AppTabBar(
      {super.key,
      required this.tabLengh,
      required this.listTab,
      required this.listWidget});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLengh,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                splashBorderRadius: BorderRadius.circular(25),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    return states.contains(MaterialState.focused)
                        ? null
                        : AppColors.blue.withOpacity(0.2);
                  },
                ),
                isScrollable: true,
                padding: EdgeInsets.zero,
                labelColor:
                    Theme.of(context).appBarTheme.actionsIconTheme?.color,
                labelStyle: Theme.of(context).textTheme.titleLarge,
                indicatorWeight: 2.0,
                indicatorColor:
                    Theme.of(context).appBarTheme.actionsIconTheme?.color,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context)
                              .appBarTheme
                              .actionsIconTheme
                              ?.color ??
                          AppColors.blue,
                      width: 2),
                ),
                unselectedLabelStyle: Theme.of(context).textTheme.titleLarge,
                tabs: listTab),
          ),
          Expanded(
            child: TabBarView(
              children: listWidget,
            ),
          )
        ],
      ),
    );
  }
}

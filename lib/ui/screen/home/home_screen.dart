import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';
import '../../widget/app_appbar.dart';
import '../../widget/app_tabbar.dart';
import 'tabs/category_tab_screen.dart';
import 'tabs/composed_tab_screen.dart';
import 'tabs/full_tab_screen.dart';
import 'tabs/my_tab_screen.dart';
import 'tabs/update_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Tab> tabs = [
    const Tab(
      child: Text('Cập nhập'),
    ),
    const Tab(
      child: Text(
        'Danh mục',
      ),
    ),
    const Tab(
      child: Text(
        'Đã full',
      ),
    ),
    const Tab(
      child: Text(
        'Sáng tác',
      ),
    ),
    const Tab(
      child: Text(
        'Của bạn',
      ),
    )
  ];

  List<Widget> tabsContent = [
    const HomeUpdateScreen(),
    const HomeCategoryScreen(),
    const HomeFullScreen(),
    const HomeComposedScreen(),
    const HomeMyScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppAppBar(
          title: 'Trang chủ',
          leadingBack: false,
          leadingIcon: null,
        ),
      ),
      body: AppTabBar(
        tabLengh: 5,
        listTab: tabs,
        listWidget: tabsContent,
      ),
    );
  }
}

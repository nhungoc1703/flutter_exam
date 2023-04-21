import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';
import '../../widget/app_tabbar.dart';
import 'tabs/account_tab_screen.dart';
import 'tabs/setting_tab_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<Tab> tabs = [
    const Tab(
      child: Text('Cài đặt'),
    ),
    const Tab(
      child: Text(
        'Tài khoản',
      ),
    ),
  ];

  List<Widget> tabsContent = [
    const SettingTabScreen(),
    const AccountTabScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: AppTabBar(
          tabLengh: 2,
          listTab: tabs,
          listWidget: tabsContent,
        ),
      ),
    );
  }
}

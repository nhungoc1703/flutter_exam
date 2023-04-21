import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';
import '../../widget/app_appbar.dart';
import '../../widget/app_tabbar.dart';
import 'tabs/chatting_tab_screen.dart';
import 'tabs/review_tab_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Tab> tabs = [
    const Tab(
      child: Text('Tán gẫu'),
    ),
    const Tab(
      child: Text(
        'Review',
      ),
    ),
  ];

  List<Widget> tabsContent = [
    const ChattingTabScreen(),
    const ReviewTabScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppAppBar(
          title: 'Cá nhân',
          leadingBack: false,
          leadingIcon: null,
        ),
      ),
      body: AppTabBar(
        tabLengh: 2,
        listTab: tabs,
        listWidget: tabsContent,
      ),
      floatingActionButton: SizedBox(
        height: 70.h,
        width: 70.w,
        child: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppColors.blue,
          child: const Icon(
            Icons.refresh,
            size: 35,
          ),
        ),
      ),
    );
  }
}

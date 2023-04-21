import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';
import '../../widget/app_appbar.dart';
import '../../widget/app_tabbar.dart';
import 'tabs/download_tab_screen.dart';
import 'tabs/history_tab_screen.dart';

class BookshelfScreen extends StatefulWidget {
  const BookshelfScreen({super.key});

  @override
  State<BookshelfScreen> createState() => _BookshelfScreenState();
}

class _BookshelfScreenState extends State<BookshelfScreen> {
  List<Tab> tabs = [
    const Tab(
      child: Text(
        'Lịch sử',
      ),
    ),
    const Tab(
      child: Text(
        'Tải vể',
      ),
    ),
  ];
  List<Widget> tabsContent = [
    const HistoryTabScreen(),
    const DownloadTabScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppAppBar(
          title: 'Kệ sách',
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

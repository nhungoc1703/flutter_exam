import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';
import 'bookshelf/bookshelf_screen.dart';
import 'community/community_screen.dart';
import 'home/home_screen.dart';
import 'search/search_screen.dart';
import 'setting/setting_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    BookshelfScreen(),
    CommunityScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              fontFamily: AppFonts.charis,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              fontFamily: AppFonts.charis,
            ),
            unselectedItemColor: Theme.of(context).appBarTheme.iconTheme?.color,
            selectedItemColor:
                Theme.of(context).appBarTheme.actionsIconTheme?.color,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 20,
                ),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                  size: 20,
                ),
                label: 'tìm kiếm',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shelves,
                  size: 20,
                ),
                label: 'kệ sách',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sms_outlined,
                  size: 20,
                ),
                label: 'Cộng đồng',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 20,
                ),
                label: 'Cài đặt',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

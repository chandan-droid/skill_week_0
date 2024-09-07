import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:skill_week_0/tabs/calender_page.dart';
import 'package:skill_week_0/tabs/home_page.dart';

class Layout extends StatefulWidget {
  const Layout({super.key, required this.title});

  final String title;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final List<Widget> _pages = [
    HomePage(),
    CalendarPage(date: '24'),
    CalendarPage(date: '24'),
    CalendarPage(date: '24')

  ];
   List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(icon: const ImageIcon(AssetImage("lib/assets/icons/Home.png")),activeColorPrimary: CupertinoColors.activeOrange,inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(icon: const ImageIcon(AssetImage("lib/assets/icons/Calender.png")),activeColorPrimary: CupertinoColors.activeOrange,inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(icon: const ImageIcon(AssetImage("lib/assets/icons/Comment.png")),activeColorPrimary: CupertinoColors.activeOrange,inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(icon: const ImageIcon(AssetImage("lib/assets/icons/Profile.png")),activeColorPrimary: CupertinoColors.activeOrange,inactiveColorPrimary: CupertinoColors.systemGrey)
    ];
}
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context ).size.width;
    //print(screenWidth);
    double screenHeight = MediaQuery.of(context).size.height;
    //print(screenHeight);

    return Scaffold(
      body: PersistentTabView(
                context,
                controller: _controller,
                items: _navBarItems(),
                screens: _pages,
                confineToSafeArea: true,
                handleAndroidBackButtonPress: true,
                resizeToAvoidBottomInset: true,
                hideNavigationBarWhenKeyboardAppears: true,
                stateManagement: true,
                navBarStyle: NavBarStyle.style5,
                backgroundColor: Colors.white,
              ),
    );
  }
}
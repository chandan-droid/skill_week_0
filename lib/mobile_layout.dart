import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_week_0/tabs/calender_page.dart';
import 'package:skill_week_0/tabs/home_page.dart';

import 'controllers/layout_controller.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});
  @override
  State<Layout> createState() => _LayoutState();
}

 class _LayoutState extends State<Layout> {

   final List<BottomNavigationBarItem> _navBarItems =
     [
      const BottomNavigationBarItem(label:"",icon: ImageIcon(AssetImage("lib/assets/icons/Home.png")),),
      const BottomNavigationBarItem(label:"",icon: ImageIcon(AssetImage("lib/assets/icons/Calender.png")),),
      const BottomNavigationBarItem(label:"",icon: ImageIcon(AssetImage("lib/assets/icons/Comment.png")),),
      const BottomNavigationBarItem(label:"",icon: ImageIcon(AssetImage("lib/assets/icons/Profile.png")),)
    ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
        builder: (controller){
          return Scaffold(
            body:IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                 CalendarPage(),
                 CalendarPage(),
                 CalendarPage()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: _navBarItems,
              currentIndex: controller.tabIndex,
              onTap: controller.changeTabIndex,
              selectedItemColor: CupertinoColors.activeOrange,
              unselectedItemColor: CupertinoColors.systemGrey ,
            ),
          );
        }
    );
  }
}



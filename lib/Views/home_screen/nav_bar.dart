import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:medics/Views/assistance/assistance_chat.dart';
import 'package:medics/Views/home_screen/home_screen.dart';
import 'package:medics/Views/pharmacy/ariticles.dart';
import 'package:medics/Views/schedule/schedule.dart';
import 'package:medics/constant/color_app.dart';

import '../../controller/navBar_controller.dart';
import '../message/message.dart';
import '../user/profile_screen.dart';
class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller= Get.put(NavbarController());

  @override

  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(builder: (context){
      return Scaffold(
        body:IndexedStack(
          index: controller.tabIndex,
          children:  [
             HomeScreen(),
             Schuduler(),
            Messages(),
            ArticleScreen(),
            ProfileScreen(),
            AssistanceChat(),

          ],

        ) ,
//navabar working
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: Colors.grey,

          items: [
            _bottombarItem(IconlyBold.home, "home"),
            _bottombarItem(IconlyBold.calendar, "schudule"),

            _bottombarItem(IconlyLight.message, "chat"),
            _bottombarItem(Icons.article, "articles"),
            _bottombarItem(IconlyBold.user2, "profile"),
            _bottombarItem(Icons.chat_bubble_outlined, "assistance"),


          ],
        ),
      );
    });
  }
}
_bottombarItem(IconData icon,String lable){
  return BottomNavigationBarItem(icon: Icon(icon),label: lable);
}
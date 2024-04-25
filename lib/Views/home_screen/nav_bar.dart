import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:medics/Views/home_screen/home_screen.dart';
import 'package:medics/constant/color_app.dart';

import '../../controller/navBar_controller.dart';
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
            _bottombarItem(IconlyBold.ticket, "trajet"),

            _bottombarItem(IconlyLight.user2, "users"),
            _bottombarItem(IconlyLight.message, "historique"),
            _bottombarItem(Icons.monetization_on, "tarif"),

          ],
        ),
      );
    });
  }
}
_bottombarItem(IconData icon,String lable){
  return BottomNavigationBarItem(icon: Icon(icon),label: lable);
}
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
import '../consultation/consultation.dart';
import '../doctors/Appointement.dart';
import '../doctors/find_Doctor.dart';
import '../maladie/DiseasePredictorScreen.dart';
import '../message/message.dart';
import '../pharmacy/Pharmacy.dart';
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
            DiseasePredictorScreen(),
            ConsultationView(),
            FindDoctor(),
            ProfileScreen(),
            AppointmentScreen()


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
            _bottombarItem(Icons.analytics, "prediction"),

            _bottombarItem(Icons.find_in_page, "chat"),
            _bottombarItem(Icons.article, "pharmacy"),
            _bottombarItem(IconlyBold.user2, "profile"),
            _bottombarItem(IconlyBold.user2, "schuduler"),



          ],
        ),
      );
    });
  }
}
_bottombarItem(IconData icon,String lable){
  return BottomNavigationBarItem(icon: Icon(icon),label: lable);
}
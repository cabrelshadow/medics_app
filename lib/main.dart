import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medics/Views/Onboading_screen/onboardingScreen.dart';
import 'package:medics/widgets/chips.dart';

import 'Views/doctors/find_Doctor.dart';
import 'Views/splashScreen/splash_screen.dart';
import 'map/ambulence_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      builder: (BuildContext context,child) => GetMaterialApp(
        title: 'Medics',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MapSample(),
        debugShowCheckedModeBanner: false,
      ),
      designSize:  Size(360, 690),
    );
  }
}


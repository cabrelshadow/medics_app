import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medics/Views/consultation/consultation.dart';
import 'package:medics/Views/home_screen/nav_bar.dart';
import 'package:medics/Views/splashScreen/splash_screen.dart';

import 'Views/consultation/symptomlist.dart';

import 'Views/maladie/DiseasePredictorScreen.dart';
import 'constant/gemini_api_key.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Gemini.init(apiKey: Gemini_ApiKey);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => GetMaterialApp(
        title: 'Medics',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: NavBar(),

        debugShowCheckedModeBanner: false,
      ),
      designSize: Size(360, 690),
    );
  }
}

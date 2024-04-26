import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/Views/Onboading_screen/onboardingScreen.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/constant/image_string.dart';

class SplashScreen extends StatefulWidget {


  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    goWelcomePage();

  }

  void goWelcomePage()async{
    await Future.delayed(Duration(seconds: 5));
    welcompage();
  }

  void welcompage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardinScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Container(
        padding: EdgeInsets.only(top: 250.h),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  Animate(

                    effects: [ FadeEffect(duration: 4.seconds),RotateEffect(alignment: Alignment.center,duration: 4.seconds,)],
                    child:     Image.asset(Applogo),
                  ),
              SizedBox(height: 10.h,),
              Text("Medics",style: GoogleFonts.montserrat(
                fontSize: 40,
                color:AppColor.white,
                fontWeight:FontWeight.bold,
              ),).animate().fade(duration: 2.seconds).scale(duration: 3.seconds)

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/Views/Login_signup/login_screen.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/constant/image_string.dart';
import 'package:medics/controller/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/OnboardinWidget.dart';
import '../Login_signup/welcome_screen.dart';

class OnboardinScreen extends StatefulWidget {
  const OnboardinScreen({super.key});

  @override
  State<OnboardinScreen> createState() => _OnboardinScreenState();
}

class _OnboardinScreenState extends State<OnboardinScreen> {
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());

    return SafeArea(
      child: Scaffold(
         body: Stack(
            children: [

              PageView(
                children: [
                  OnboardinWidget(title: 'Consult only with a doctor\n you trust', image: OnboardingImg1,),
                  OnboardinWidget(title: 'Find a lot of specialist \n doctors in one place', image: OnboardingImg2,),
                  OnboardinWidget(title: 'Get connect our Online \n Consultation', image: OnboardingImg3,),
                ],
              ),
              Positioned(
                  right: 20,
                  top: 20,
                  child: TextButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(builder:(context)=>WelcomeScreen()));}, child: Text('Skip' ,style: GoogleFonts.montserrat(
                     color:AppColor.secondaryText,

                    fontWeight:FontWeight.bold,
                  ),),)
              ),
              Positioned(
                bottom: 40,
                  left: 40,
                  child: SmoothPageIndicator(controller: PageController(), count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColor.primary,
                      dotHeight: 6,

                    ),
                  )
              ),

              Positioned(
                  bottom: 20,
                  right: 40,
                  child: InkWell(
                    onTap: (){ LoginScreen();},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.primary
                      ),
                      child: Center(child: Icon(Icons.arrow_forward_rounded,color: Colors.white,),)
                    ),
                  )),

            ],
         ),
      ),
    );
  }
}

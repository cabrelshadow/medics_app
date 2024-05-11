import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/Views/Login_signup/SignUp_Screen.dart';
import 'package:medics/Views/Login_signup/login_screen.dart';

import '../../constant/color_app.dart';
import '../../constant/image_string.dart';
import '../../widgets/RoundedButton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: SafeArea(
         child: SingleChildScrollView(
           child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 200,horizontal: 25),
               child: Column(

                 children: [
                  /* Animate(

                     effects: [
                         FlipEffect(alignment: Alignment.center,duration: 6.seconds,direction:Axis.vertical),

                     ],

                     child:      Image.asset(Applogo , width:96,height: 98.52,color: AppColor.primary,),
                   ),*/
                   Lottie.asset("assets/image/an2.json",width: 300,height: 300, backgroundLoading: false,repeat:true,reverse: false),

                   SizedBox(height: 5.h,),
                   Text("Medics",style: GoogleFonts.montserrat(
                     fontSize: 25.52,
                     color:AppColor.primary,
                     fontWeight:FontWeight.bold,
                   ),),
                   SizedBox(height: 10.h,),
                   Text("Let’s get started!",style: GoogleFonts.montserrat(
                     fontWeight:FontWeight.bold,
                     fontSize:22
                   ),
                   ),
                   SizedBox(height: 5.h,),
               Center(
                 child: Text("Login to enjoy the features we’ve\n provided, and stay healthy!",textAlign: TextAlign.center
                   ,style: GoogleFonts.montserrat(
                   color:AppColor.primaryText,
                     fontSize:16,
                 ),
                 ),
               ),

                         SizedBox(height: 50.h),
                   Animate(

                     effects: [
                       FlipEffect(alignment: Alignment.center,duration: 4.seconds,direction:Axis.vertical),

                     ],

                     child:     round_button(title: "Login", onPressed: () {   Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginScreen())); }, type:round_buttonType.bgPrimary),
                   ),

                         SizedBox(height: 20.h,),
                         round_button(title: "Sign Up", onPressed: () {   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));}, type:round_buttonType.textPrimary),

           ],
               ),
             ),
         ),

    ),
    );
  }
}

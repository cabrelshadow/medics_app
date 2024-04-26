
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardinWidget extends StatelessWidget {
  final String title;
  final String image;
  const OnboardinWidget({
    super.key, required this.title, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40.h),
      child: Column(
        children: [
          Image.asset(image ,fit: BoxFit.fill, width: 321.w,height: 465.h,),
          SizedBox(height: 10.h,),
          Animate(
            effects: [
                 ScaleEffect(duration: 2.seconds,),

             ],
            child:
            Text(title,style: GoogleFonts.montserrat(
              fontSize:20,
              fontWeight:FontWeight.bold,
            ),),
          )
        ],
      ),
    );
  }
}

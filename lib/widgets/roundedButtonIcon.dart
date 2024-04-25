import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';

enum round_buttonType{
  bgPrimary,textPrimary
}
class Rouded_buttonWitthIcon extends StatelessWidget {
  final String title;
  final String image;
  final round_buttonType type;
  final VoidCallback onPressed;

  const Rouded_buttonWitthIcon({
    super.key,
    required this.title,
    required this.image,
    this.type=round_buttonType.bgPrimary,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(

        height: 55.h,
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 28),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border:  Border.all(color: AppColor.secondaryText,width: 1),//manipulation des enumeration ici

          color: AppColor.white,//manipulation des enumeration ici
        ),
        child: Row(

          children: [
            Image.asset(image,),
            SizedBox(width: 50.w,),
            Align(
              alignment: Alignment.center,
                child: Text(title,style:GoogleFonts.montserrat(
                    fontSize: 16,color:Colors.black,
                  fontWeight:FontWeight.bold
                ),)),
            SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }
}
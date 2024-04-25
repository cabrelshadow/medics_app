import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color_app.dart';
class CustomDialog {
  static void showCustomDialog(BuildContext context,
      String title,
      String message,
      String BtnTitle,
      VoidCallback onPressed,
      IconData icon,
      ) {

    showDialog(

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          content: Container(
            width: 300.w,
            height: 310.h,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AppColor.textfield,
                    borderRadius: BorderRadius.circular(70.r),

                  ),
                  child: Center(
                    child: Icon(Icons.check,size:40 ,color: AppColor.primary,),
                  ),
                ),
                SizedBox(height: 20.h,),
                Text(title,style: GoogleFonts.montserrat(
                    fontSize:17,
                    fontWeight:FontWeight.bold
                ),),
                SizedBox(height: 5.h,),
                Text(message,textAlign:TextAlign.center,style: GoogleFonts.montserrat(
                    fontSize:12,
                    color:AppColor.primaryText
                ),),
                SizedBox(height: 20.h,),
                InkWell(
                  onTap:onPressed ,
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: AppColor.primary,//manipulation des enumeration ici
                      borderRadius: BorderRadius.circular(28.r),


                    ),
                    child: Center(
                      child:  Text(BtnTitle ,style:
                      GoogleFonts.montserrat(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      )
                        ,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

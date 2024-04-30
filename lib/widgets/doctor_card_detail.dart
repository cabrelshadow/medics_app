import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color_app.dart';
import '../constant/image_string.dart';

class DoctorDetailCard extends StatelessWidget {
  const DoctorDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 135.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: AppColor.primary,
              width: 0.1
          )
      ),
      child:Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Container(
              height:150.h,
              width: 140.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(d3,),
                      fit:BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(7)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [AutoSizeText("Dr. Marcus Horizon",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
               maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
                Text("Chardiologist",
                  style: GoogleFonts.montserrat(
                    color: AppColor.primaryText,
                    fontSize: 13,
                  ),),
                SizedBox(height: 16,),
                Container(

                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffE8F3F1),
                  ),
                  child: Row(
                    children: [
                      Icon(IconlyBold.star, color: AppColor.primary, size: 17,),
                      SizedBox(width: 2,),
                      Text("4.7", style: GoogleFonts.montserrat(
                          color: AppColor.primary
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 17,),
                Row(
                  children: [
                    Icon(IconlyBold.location, size: 25,
                      color: AppColor.secondaryText,),
                    SizedBox(width: 3,),
                    Text("800m away",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: AppColor.primaryText
                      ),)
                  ],
                ),

              ],

            ),
          ),
        ],
      ) ,
    );
  }
}

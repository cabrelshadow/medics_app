import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color_app.dart';

InkWell TopDoctorCard(Map<dynamic, dynamic> listViewItemDoctor) {
  return InkWell(
    onTap:(){},
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 175,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: AppColor.primary,
              width: 0.5
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 20,),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: Image.asset(
              listViewItemDoctor["image"].toString(), fit: BoxFit.cover,
              width: 100,
              height: 100,),),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(listViewItemDoctor["name"].toString(),
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),),
              Text(listViewItemDoctor["desc"].toString(),
                style: GoogleFonts.montserrat(
                  color: AppColor.primaryText,
                  fontSize: 13,
                ),),

            ],

          ),
          SizedBox(height: 25,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(

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

              ),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Row(
                  children: [
                    Icon(IconlyBold.location, size: 20,
                      color: AppColor.secondaryText,),
                    SizedBox(width: 3,),
                    Text(listViewItemDoctor["location"].toString(),
                      style: GoogleFonts.montserrat(
                          fontSize: 10,
                          color: AppColor.primaryText
                      ),)
                  ],
                ),
              ),
            ],
          )

        ],
      ),
    ),
  );
}
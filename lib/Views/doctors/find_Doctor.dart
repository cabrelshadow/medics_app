import 'package:auto_size_text/auto_size_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';

import '../../constant/image_string.dart';
import '../../widgets/DoctorSwiperCard.dart';
import '../../widgets/textfield_with_icon.dart';

class FindDoctor extends StatefulWidget {
  const FindDoctor({super.key});

  @override
  State<FindDoctor> createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  List dataCart=[
    {
      "image":doc,
      "description":"Deneral",
    },
    {
      "image":lung,
      "description":"Lungs Specialist",
    },
    {
      "image":dentist,
      "description":"Dentist",
    },
    {
      "image":phy,
      "description":"Psychiatrist",
    },
    {
      "image":covid,
      "description":"Covid-19",
    },
    {
      "image":Syringe,
      "description":"Surgeon",
    },
    {
      "image":cardiologist,
      "description":"Cardiologist",
    }
  ];
  TextEditingController TextFindDoctor=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            title: Text("Find Doctors",style: GoogleFonts.montserrat(
                 fontSize:20,
                 fontWeight:FontWeight.bold

            ),),
            centerTitle: true,
            leading: Icon(IconlyLight.arrowLeft,size: 20,),
          ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 22),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //***********************find doctor search**************************************************
                textFieldWith_icon(textEditingController:TextFindDoctor, title: 'find doctor', icon: IconlyLight.search),
                //*************************************************************************
                SizedBox(height: 20,),
                //***********************Categorie**************************************************
                //ici avatarglow me permet de fair l'inimation sur une icon specifique a laide de l'index de ma liste en passant par lexpression tainaire
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10),


                 child: AutoSizeText(
                   "Categorie",style: GoogleFonts.montserrat(
                   fontSize:20,
                   fontWeight:FontWeight.bold
                 ),
                   maxLines: 1,
                 ),
               ),
                SizedBox(height: 20,),
                        GridView.builder(

                             itemCount: dataCart.length,
                            shrinkWrap:true ,
                               physics: const NeverScrollableScrollPhysics(),
                               gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 4,
                                   crossAxisSpacing: 0.0,
                                   mainAxisSpacing: 0.0,
                                   childAspectRatio: 0.9),
                               itemBuilder:(context,index){
                               var CategorieListIcon=dataCart[index] as Map ? ?? {};
                                 return Column(
                                    children: [
                                       InkWell(
                                           onTap:(){},
                                           child: index==6?
                                           AvatarGlow(
                                             startDelay: const Duration(milliseconds: 1000),
                                             glowColor: AppColor.primary,
                                             glowShape: BoxShape.circle,

                                             curve: Curves.fastOutSlowIn,
                                             child: Image.asset(CategorieListIcon["image"].toString(),width: 50,height: 50,),
                                             ):Image.asset(CategorieListIcon["image"].toString(),width: 50,height: 50,),
                                           ),

                                         SizedBox(height: 10,),
                                        AutoSizeText(

                                          CategorieListIcon["description"].toString(),style: GoogleFonts.montserrat(
                                            fontSize:14,
                                            color:AppColor.secondaryText,

                                        ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                    ],
                                 );
                               }

                           ),
                        SizedBox(height: 20,),
                       Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "Recommended Doctors",style: GoogleFonts.montserrat(
                                fontSize:20,
                                fontWeight:FontWeight.bold
                            ),
                              maxLines: 1,
                            ),
                          ),

                //==============================================cart recommandation doctor with Swiper effect=========================//
                SizedBox(height: 25.h,),
                SwiperDoctorCartEffect(),
                SizedBox(height: 25.h,),
             Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "Your Recent Doctors",style: GoogleFonts.montserrat(
                        fontSize:20,
                        fontWeight:FontWeight.bold
                    ),
                      maxLines: 1,
                    ),
                  ),

                SizedBox(height: 25.h,),
                SizedBox(
                  height: 200,
                  child: ListView.builder(

                      scrollDirection: Axis.horizontal,

                      itemBuilder:(contex,index){
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 50,
                                  child: Image.asset(pro,width: 200,height: 200,fit: BoxFit.contain,),

                                ),
                                SizedBox(height: 14,),
                                AutoSizeText("Dr. Maria",style: GoogleFonts.montserrat(
                                   color:AppColor.secondaryText
                                ),)
                              ],
                           ),
                         );
                      }

                  ),
                )

                 ],

            ),
          ),
        ),
      ),
    );
  }
}


import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/widgets/RoundedButton.dart';

import '../../constant/image_string.dart';
import '../../widgets/doctorCard.dart';
import '../../widgets/textfield_with_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List dataCart=[
    {
      "image":c1,
      "description":"doctor",
    },
    {
      "image":c2,
      "description":"Pharmacy",
    },
    {
      "image":c3,
      "description":"hospital",
    },
    {
      "image":c4,
      "description":"Ambulance",
    }
  ];

  List DoctorCard=[
    {
      "name":"Dr. Marcus Horizon",
      "location":"800m away",
      "desc":"Psychologist",
      "image":"assets/image/Avatar.png",
    },
    {
      "name":"Dr. Maria Elena",
      "location":"1,5km away",
      "desc":"Chardiologist",
      "image":"assets/image/a2.png",
    },
    {
      "name":"Dr. Stevi Jessi",
      "location":"2km away",
      "image":"assets/image/a3.png",
      "desc":"Orthopedist",
    },
  ];

  TextEditingController TxtSearch=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body:SafeArea(
         child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Find your desire\nhealt solution",style: GoogleFonts.montserrat(
                             fontSize:19,
                           fontWeight:FontWeight.bold
                         ),),
                         Icon(IconlyLight.notification,size: 30,color: AppColor.primary,),
                       ],
                     ),
                    SizedBox(height: 20.h,),
                    textFieldWith_icon(textEditingController:TxtSearch, title: 'Search doctor,drug,articles..', icon: IconlyLight.search),
                    SizedBox(height: 20.h,),

                    SizedBox(height: 100,

                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:dataCart.length,
                            itemBuilder: (context,index){
                             var listViewItem=dataCart[index] as Map ? ?? {};
                              return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2),
                                  child: Column(

                                    children: [
                                      InkWell(
                                        onTap:(){},
                                        child: ClipRRect(

                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(listViewItem["image"].toString(),fit: BoxFit.cover,height: 60,width: 100,),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                       listViewItem["description"].toString(),
                                        style: GoogleFonts.montserrat(
                                          fontSize:13,
                                        ),),

                                    ],

                                  ),

                              );
                            }

                        )
                    ),
//============================ card doctor and button============================//
                    Container(
                      width:375,
                      height:160,
                      decoration: BoxDecoration(
                        color: Color(0xffE8F3F1),
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Early protection for \nyour family health",style: GoogleFonts.montserrat(
                                  fontSize:17,
                                  fontWeight:FontWeight.bold
                                ),),
                                SizedBox(height:10,),
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(child: Text("Learn more",style:GoogleFonts.montserrat(
                                    fontWeight:FontWeight.bold,
                                  color:AppColor.white
                                ),),),
                              ),

                              ],
                            ),
                          ),
                          Image.asset(imageContainer,height: 120,width: 100,fit: BoxFit.fill,),
                        ],

                      ),
                    ),
                    //========================================================//
                    //============================ title Top doctor============================//
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Top Doctor",style: GoogleFonts.montserrat(
                          fontWeight:FontWeight.bold,
                          fontSize:17,
                        ),),
                        TextButton(onPressed: (){}, child:Text("See all",style: GoogleFonts.montserrat(
                             color:AppColor.primary,
                            fontSize:17
                        ),))
                      ],
                    ),
                    //============================ title Top doctor============================//
                    //==================================doctor scrollView======================//
                    SizedBox(
                      height: 230,
                      child: ListView.builder(

                        itemCount: DoctorCard.length,
                        scrollDirection: Axis.horizontal,
                          shrinkWrap:true,
                          itemBuilder:(context,index){
                            var listViewItemDoctor=DoctorCard[index] as Map ? ?? {};
                            return   TopDoctorCard(listViewItemDoctor);
                          }

                      ),
                    ),
                    //========================================================//
                    //==================================health article======================//
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Health article",style: GoogleFonts.montserrat(
                          fontWeight:FontWeight.bold,
                          fontSize:17,
                        ),),
                        TextButton(onPressed: (){}, child:Text("See all",style: GoogleFonts.montserrat(
                            color:AppColor.primary,
                            fontSize:17
                        ),))
                      ],
                    ),
                 //=======================Health article================
                  Container(
                     height: 100,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [

                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3), // Couleur de l'ombre et opacité
                          spreadRadius: 2, // Distance de propagation de l'ombre
                          // Flou de l'ombre
                          blurRadius: 2,
                          offset: Offset(0, 1), // Décalage de l'ombre en x et y
                        ),
                      ],
                    ),
                    child: Row(
                       children: [
                         Padding(padding: EdgeInsets.symmetric(vertical: 9,horizontal: 5),
                         child:   Image.asset(rec,fit: BoxFit.fill,width: 100,height: 100,)
                          

                         ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 9,horizontal: 9),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("The 25 Healthiest Fruits You Can Eat,\n According to a Nutritionist",style: GoogleFonts.montserrat(
                                  fontSize:10,
                                  fontWeight:FontWeight.bold
                                ),),
                                SizedBox(height: 10,),
                                Text("Jun 10, 2021.5min read ",style: GoogleFonts.montserrat(
                                   fontSize:10,
                                   color:AppColor.primaryText
                                ),),

                              ],
                            ),
                          ),
                        
                        ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 15),
                           child: Align(
                             alignment: Alignment.topRight,

                               child: Icon(IconlyBold.bookmark,color: AppColor.primary,size: 20,)),
                         )
                        ],
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

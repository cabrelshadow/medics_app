
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/color_app.dart';
import '../../constant/image_string.dart';

class Topdoctor extends StatefulWidget {
  const Topdoctor({super.key});

  @override
  State<Topdoctor> createState() => _TopdoctorState();
}

class _TopdoctorState extends State<Topdoctor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
             title: Text("Top Doctor",style: GoogleFonts.montserrat(
                fontWeight:FontWeight.bold,
                fontSize:20
             ),),
             actions: [
               PopupMenuButton(

                 itemBuilder: (context){
                   return [

                   ];
                 },
               )
             ],

            ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
            child: Column(
               children: [

                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.vertical,

                        shrinkWrap: true,
                        itemBuilder:(context,index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Container(
                               width: 370,
                              height: 150,
                             decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                 border: Border.all(
                                     color: AppColor.primary,
                                     width: 0.5
                                 )
                             ),
                              child:Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: Container(
                                         height:150,
                                         width: 150,
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
                                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Dr. Marcus Horizon",
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),),
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

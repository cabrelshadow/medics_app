
import 'dart:ui';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/image_string.dart';

import '../../constant/color_app.dart';

class CallAudioScreen extends StatefulWidget {
  const CallAudioScreen({super.key});

  @override
  State<CallAudioScreen> createState() => _CallAudioScreenState();
}

class _CallAudioScreenState extends State<CallAudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body:Stack(
           children: [
             // Image principale
             Image.asset(
               callaudio, // Remplacez 'callaudio.jpg' par votre chemin d'image
               fit: BoxFit.cover,
               height: MediaQuery.of(context).size.height,
             ),
             // Opacité et flou
             Positioned.fill(
                 top:   250.h,
               child: BackdropFilter(
                 filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Ajustez le flou en modifiant les valeurs de sigmaX et sigmaY
                 child: Container(
                       child: Column(
                         children: [
                          AvatarGlow(
                            startDelay: const Duration(milliseconds: 1000),
                            glowColor: AppColor.primary,
                            glowShape: BoxShape.circle,
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(avatarglow),
                                  fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.circular(50)
                              ),
                            ),
                          ),
                           SizedBox(height: 150.h,),
                           Text("00:05:24",style: GoogleFonts.montserrat(
                             color:Colors.white,
                             fontSize:17
                           ),),
                           SizedBox(height: 20,),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 height: 70,
                                 width: 70,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(50),
                                   color:AppColor.iconColor
                                 ),
                                 child: Center(child: Icon( IconlyLight.video,color: Colors.white,)),
                               ),
                               SizedBox(width: 30,),
                               Container(
                                 height: 60,
                                 width: 60,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(50),
                                     color:Colors.red
                                 ),
                                 child: Center(child: InkWell( onTap:(){ Get.back;},child:  Icon( IconlyLight.call,color: Colors.white,))),
                               ),
                               SizedBox(width:30,),
                               Container(
                                 height: 60,
                                 width: 60,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(50),
                                     color:AppColor.iconColor
                                 ),
                                 child: Center(child: Icon( Icons.mic,color: Colors.white,)),
                               ),
                             ],
                           )
                         ],
                       ),
                 ),
               ),
             ),
           ],
         ),
    );
  }
}

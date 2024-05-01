import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/image_string.dart';

import '../../constant/color_app.dart';

class ViedeoScreen extends StatefulWidget {
  const ViedeoScreen({Key? key});

  @override
  State<ViedeoScreen> createState() => _ViedeoScreenState();
}

class _ViedeoScreenState extends State<ViedeoScreen> {
  double _xOffset = 0;
  double _yOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Image.asset(
            callaudio,
            fit: BoxFit.cover,
            height: double.infinity,

          ),
          // Widget draggable
          Positioned(
            top: _yOffset,
            left: _xOffset,
            child: Draggable(
              child: Container(
                height: 170,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              feedback: Container(
                height: 170,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(profile),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  _xOffset = offset.dx;
                  _yOffset = offset.dy;
                });
              },
            ),
          ),
          Positioned(
            bottom: 100,
            left: 30,
            right: 30,
            child: Column(
              children: [
                Text("Dr.Marcus Horizon",style: GoogleFonts.montserrat(
                    color:Colors.white,
                    fontSize:20,
                  fontWeight:FontWeight.bold
                ),),
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
                    AvatarGlow(
                      startDelay: const Duration(milliseconds: 1000),
                      glowColor: AppColor.primary,
                      glowShape: BoxShape.circle,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:AppColor.iconColor
                        ),
                        child: Center(child: Icon( Icons.mic,color: Colors.white,)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

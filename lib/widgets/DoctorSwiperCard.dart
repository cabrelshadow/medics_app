import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color_app.dart';
import '../constant/image_string.dart';

class SwiperDoctorCartEffect extends StatelessWidget {
  const SwiperDoctorCartEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:160,
        /*
      * swiper ici me pert de faire un scroll verticale grace a ses proprieté:
      * layout:SwiperLayout.STACK,
        itemCount:3,
        itemWidth:380,
        itemHeight:130,
        loop:true,
      *
      *
      *
      *
      * */
        child: Swiper(
            layout:SwiperLayout.STACK,
            itemCount:3,
            itemWidth:350.w,
            itemHeight:120.h,
            loop:true,
            duration:1200,
            scrollDirection:Axis.vertical,
            autoplay: true, // Activer le défilement automatique
            autoplayDelay: 3000, // Délai entre chaque diapositive en millisecondes
            itemBuilder:(contex,index){
              return Container(
                width: 340.w,
                height: 160.h,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(15),
                  border:Border.all(
                      color: AppColor.primary,
                      width: 0.3
                  ),
                  color: index==0 ?Colors.white:Color(0xffE8F3F1),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex:2,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50,

                          child: Image.asset(avatar,width: 200,height: 200,fit: BoxFit.contain,),
                        )
                    ),
                    Expanded(
                        flex: 3,
                        child:
                        Padding(
                          padding: EdgeInsets.only(top: 35,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText("Dr. Marcus Horizon",
                                style: GoogleFonts.montserrat(
                                    fontWeight:FontWeight.bold,
                                    fontSize:17
                                ),
                                maxLines: 1,
                              ),
                              AutoSizeText("Chardiologist",
                                style: GoogleFonts.montserrat(

                                    fontSize:14,
                                    color:AppColor.secondaryText
                                ),
                                maxLines: 1,
                              ),
                              Divider( color: AppColor.textfield,height: 15,thickness: 2,),
                              Row(
                                children: [
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Icon(IconlyBold.location, size: 20,
                                          color: AppColor.secondaryText,),
                                        SizedBox(width: 3,),
                                        Text("800m away",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 10,
                                              color: AppColor.primaryText
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ))
                  ],
                ),
              );

            }
        )
      //=======================================================================//

    );
  }
}

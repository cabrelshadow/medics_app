

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

import '../../constant/color_app.dart';
import '../../constant/image_string.dart';
import '../../widgets/doctor_card_detail.dart';
import '../Chat/chat_screen.dart';
import 'Appointement.dart';

class DoctorDetail extends StatefulWidget {
  const DoctorDetail({super.key});

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {



  int selectedHour = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
             title: Text("Doctor Detail",style: GoogleFonts.montserrat(
                fontSize:20,
                fontWeight:FontWeight.bold,

             ),
             ),
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
        child:Padding(
          padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorDetailCard(),
              SizedBox(height: 30.h,),
              Text("About",style: GoogleFonts.montserrat(
                 fontWeight:FontWeight.bold,
                  fontSize:20,

              ),),
              RichText(text: TextSpan(
                 children: [
                   TextSpan( text:  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...",
                     style:GoogleFonts.montserrat(
                         color:AppColor.secondaryText,
                         fontSize:15
                     ),
                   ),

                   TextSpan( text: "   Read more",style: GoogleFonts.montserrat(
                     color:AppColor.primary
                   ))
                 ]
              )),
              SizedBox(height: 30,),

              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  print('Date sélectionnée : $selectedDate');
                  toastification.show(
                    icon:Icon(Icons.check),
                    alignment: Alignment.bottomCenter,
                    context: context, // optional if you use ToastificationWrapper
                    title: Text('Date sélectionnée : $selectedDate'),
                    autoCloseDuration: const Duration(seconds: 2),
                  );
                  //
                },
                activeColor: AppColor.primary,
                dayProps: EasyDayProps(
                    dayStructure: DayStructure.dayStrDayNum
                ),
              ),



              SizedBox(height: 10,),
              Divider( height: 20,color: AppColor.secondaryText,thickness: 0.3,),
              SizedBox(
                height: 70,
                child:ListView.builder(
                  scrollDirection: Axis.horizontal,
                  semanticChildCount: 10, // Nombre d'heures entre 8h et 17h (inclus)
                  shrinkWrap: true,
                  itemCount: 10, // Nombre total d'heures affichées (de 8h à 17h inclus)
                  itemBuilder: (context, index) {
                    // Index de l'heure actuelle (de 8h à 17h)
                    final hour = index + 8;

                    // Vérifie si l'heure est comprise entre 8h et 17h
                    if (hour >= 8 && hour <= 17) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            final currentHour = DateTime.now().hour;
                            if(currentHour > hour){
                               print("cette heur est deja passé");
                            }else{
                              print('Heure sélectionnée : ${hour.toString().padLeft(2, '0')}:00');
                            }

                            setState(() {
                              selectedHour = hour; // Met à jour l'heure sélectionnée
                            });
                          },
                          child: Container(
                            width: 130,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color:  AppColor.secondaryText,    width: 1),
                              color: selectedHour == hour ? AppColor.primary : Colors.transparent, // Applique une couleur différente si l'heure est sélectionnée
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                '${hour.toString().padLeft(2, '0')}:00',
                                style: TextStyle(color: selectedHour==hour? Colors.white:Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      // Si l'heure n'est pas comprise entre 8h et 17h, retourne un conteneur vide
                      return Container();
                    }
                  },
                )
                ,
              ),



              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){ Get.to(()=>ChatScreen());},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                        color: Color(0xffE8F3F1),
                      ),
                      child: Image.asset(chat,width: 40, height: 40,),
                    ),
                  ),
                  InkWell(
                    onTap: (){ Get.to(()=>AppointmentScreen());},
                    child: Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: AppColor.primary,
                      ),
                      child: Center(
                        child: Text("Book Appointement",style: GoogleFonts.montserrat(
                          color:AppColor.white,
                          fontWeight:FontWeight.bold
                        ),),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  }



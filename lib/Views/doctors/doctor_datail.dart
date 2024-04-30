

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../constant/color_app.dart';
import '../../constant/image_string.dart';
import '../../widgets/doctor_card_detail.dart';
import '../Chat/chat_screen.dart';

class DoctorDetail extends StatefulWidget {
  const DoctorDetail({super.key});

  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  int selectedIndex = -1;
  int selectedHourIndex = -1;
  bool isLoading = false; // Ajouter un état pour le chargement

  late List<DateTime> dates; // Déclarer dates ici
  late List<String> hoursOfDay;
  void initState() {
    super.initState();

    final today = DateTime.now();
    final now = DateTime.now(); // Ajoutez cette ligne pour déclarer la variable now
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    dates = List<DateTime>.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    final formatter = DateFormat('MMM dd');

    hoursOfDay = List.generate(10, (index) => (index + 8).toString() + ":00");

  }
  void _selectChip(int index) {
    setState(() {
      selectedIndex = index;
      selectedHourIndex = -1;
      isLoading = true; // Activer le chargement
    });
    // Simuler un délai de chargement
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // Désactiver le chargement
      });
    });

    // Récupérer la date sélectionnée

    final selectedDate = dates[index];

    // Imprimer la date sélectionnée
    print('Date sélectionnée: $selectedDate');

    // Imprimer l'heure sélectionnée
    if (selectedHourIndex != -1) {
      final selectedHour = hoursOfDay[selectedHourIndex];
      print('Heure sélectionnée: $selectedHour');
    }
  }
  void _selectHour(int index) {
    setState(() {
      selectedHourIndex = index;
    });

    // Récupérer l'heure sélectionnée
    final selectedHour = hoursOfDay[index];

    // Imprimer l'heure sélectionnée
    print('Heure sélectionnée: $selectedHour');

    // Imprimer la date sélectionnée
    if (selectedIndex != -1) {
      final selectedDate = dates[selectedIndex];
      print('Date sélectionnée: $selectedDate');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    final today = DateTime.now();
    final now = DateTime.now(); // Ajoutez cette ligne pour déclarer la variable now
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final dates = List<DateTime>.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    final formatter = DateFormat('dd');

    final List<String> hoursOfDay = List.generate(10, (index) => (index + 8).toString() + ":00");
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
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7, // Nombre d'éléments dans votre liste
                  itemBuilder: (context, index) {
                    final date = dates[index];
                    final dayOfWeek = daysOfWeek[index];
                    //final label = '$dayOfWeek   ${formatter.format(date)}';
                    final isSelected = index == selectedIndex;
                    final isToday = date.year == today.year && date.month == today.month && date.day == today.day;

                    return GestureDetector(
                      onTap: () => _selectChip(index),
                      child: Container(
                        margin: EdgeInsets.all(8.0), // Ajoutez une marge entre les éléments si nécessaire
                        child: Chip(

                          side: BorderSide(color:Colors.white24),

                          labelPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                          label: Wrap(
                            direction: Axis.vertical,// Utilisation de Wrap pour permettre le passage à la ligne
                            children: <Widget>[
                              Text(
                                     '$dayOfWeek ',
                                style: TextStyle(color:  isSelected ? AppColor.white : AppColor.secondaryText),
                              ),
                              Text(
                                 formatter.format(date),
                                style: TextStyle(color:  isSelected ? AppColor.white : Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                            ],
                          ),
                          backgroundColor: (isToday)
                              ? (isToday ? AppColor.primary : Colors.transparent)
                              : (isSelected ? AppColor.primary : Colors.transparent),
                          labelStyle: TextStyle(color: isSelected ? AppColor.white : Colors.black),

                          elevation: 4.0,
                          shadowColor: Colors.grey[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
              Divider( height: 20,color: AppColor.secondaryText,thickness: 0.3,),
              SizedBox(
                height: 200,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Nombre de colonnes dans la grille

                  ),
                  itemCount: hoursOfDay.length,
                  itemBuilder: (context, index) {
                    final hour = hoursOfDay[index];
                    final isSelected = index == selectedHourIndex;

                    final startOfCurrentDay = DateTime(today.year, today.month, today.day, 8);
                    final isPassed = now.isAfter(startOfCurrentDay.add(Duration(hours: index)));

                    return GestureDetector(
                      onTap: startOfCurrentDay.add(Duration(hours: index)).isBefore(now) ? null : () => _selectHour(index),
                      child: Chip(
                        labelPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                        label: Text('$hour PM',style: TextStyle(fontSize: 20),),
                        backgroundColor: isSelected ? Colors.green : (isPassed ? Colors.transparent : AppColor.primary),
                        labelStyle: TextStyle(color: isSelected? Colors.white:Colors.black),
                        padding: EdgeInsets.all(9.0),
                        elevation: 4.0,
                        shadowColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){},
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
                    onTap: (){ Get.to(()=>ChatScreen());},
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


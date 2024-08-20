import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';

import '../../constant/image_string.dart';
import '../../widgets/doctor_card_detail.dart';
import '../../widgets/modal_show.dart';
import '../map/ambulence_map.dart';

class AppointmentScreen extends StatefulWidget {
   AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
late String _selected;
void initState() {
  super.initState();
  _selected = _myjson.isNotEmpty ? _myjson.first['id'].toString() : ''; // Initialisation de la variable avec la première valeur de la liste// Initialisation de la variable
}
List<Map> _myjson=[
  {
    'id':'1',
    'image':om,
     'name':"Orange Money"
  },
  {
    'id':'2',
    'image':momo,
    'name':"Mtn Momo"
  }

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           surfaceTintColor: Colors.transparent,
           centerTitle: true,
           title: Text("Appointement",style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold
           ),
           ),
         ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Column(
              children: [
                DoctorDetailCard(),
                SizedBox(height: 10,),
                //=============== date a, cha,ge option======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date",style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                    Text("Change ",style: GoogleFonts.montserrat(
                       color: AppColor.secondaryText,
                        fontSize: 17
                    ),),
                  ],
                ),
                //=============== date a, cha,ge option======================
                SizedBox(height: 7,),
                //-----------------------------------date and icon calender and text hour---------------------------
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.primary2,
                      ),
                      child: Center(child: Icon(Icons.calendar_month_outlined, color: AppColor.primary)),
                    ),
                    SizedBox(width: 10), // Ajout d'un espace entre le Container et le Text
                    Text("Wednesday, Jun 23, 2021 "),

                     Container(
                       width: 1,
                       height: 20,
                       color: Colors.black,
                     ),
                    Text(" 10:00 AM"),
                  ],
            ),
                //-----------------------------------date and icon calender and text hour---------------------------
                SizedBox(height: 10,),
               Divider(color: AppColor.textfield,),
                SizedBox(height: 20,),
            //----------------------------------Reason section-----------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Reason",style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                    Text("Change ",style: GoogleFonts.montserrat(
                        color: AppColor.secondaryText,
                        fontSize: 17
                    ),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.primary2,
                      ),
                      child: Center(child: Icon(Icons.edit_calendar_sharp, color: AppColor.primary)),
                    ),
                    SizedBox(width: 10),
                    Text(" Chest pain",style: TextStyle(fontWeight: FontWeight.bold),),


                   ],
                ),
                SizedBox(height: 10,),
                Divider(color: AppColor.textfield,),

                SizedBox(height: 10,),
                Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Payment Detail",textAlign: TextAlign.start ,style:GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("consultation",style: TextStyle(
                            color: AppColor.secondaryText,
                          fontSize: 16
                        ),),
                        Text("60.00 Fcfa",style: TextStyle(

                        ),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Admin Fee",style: TextStyle(
                            color: AppColor.secondaryText,
                            fontSize: 16
                        ),),
                        Text("600 Fcfa",style: TextStyle(

                        ),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("consultation",style: TextStyle(
                            color: AppColor.secondaryText,
                            fontSize: 16
                        ),),
                        Text("-",style: TextStyle(
                              fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),),
                        Text("100.000 fcfa",style: TextStyle(
                            fontSize: 13,

                          color: AppColor.primary
                        ),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(color: AppColor.textfield,),

                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Payment Methode",textAlign: TextAlign.start ,style:GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
                    ),

                    SizedBox(height: 20,),
                    //-------------------------- drop down list with image logo for paiement------------------
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:AppColor.textfield,width: 2)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Expanded(
                               child: DropdownButtonHideUnderline(
                                   child: ButtonTheme(
                                     alignedDropdown: true,
                                     child:DropdownButton(
                                       hint: Text("change"),
                                       value: _selected,
                                       onChanged:(newValue){
                                         setState(() {
                                          _selected=newValue!;

                                         });
                                       } ,
                                       items: _myjson.map<DropdownMenuItem<String>>((e) { // Spécifiez le type de données comme DropdownMenuItem<String>
                                         return DropdownMenuItem<String>(

                                           value: e["id"].toString(), // Assurez-vous que "value" contient la valeur attendue pour le DropdownMenuItem
                                           child: Row(
                                             children: [
                                               Image.asset(e["image"], width: 70, height: 70),
                                               Container(
                                                 margin: EdgeInsets.only(left: 10),
                                                 child: Text(e["name"]),
                                               )
                                             ],
                                           ),
                                         );
                                       }).toList(),
                                     ) ,
                                   )
                               ),
                             )
                          ],
                        ),
                      ),
                    //-------------------------- drop down list with image logo for paiement------------------
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Total",style: TextStyle(
                             color: AppColor.secondaryText
                           ),

                           ) ,
                           Text("100.000 fcfa",style: TextStyle(
                               fontWeight: FontWeight.bold
                           ),

                           ) ,

                         ],
                       ),
                        GestureDetector(
                          onTap: (){
                            CustomDialog.showCustomDialog(context, "Payement Success", "Your payment has been successful, you can have a consultation session with your trusted doctor",
                                "Chat Doctor", () { }, Icons.check);
                          },
                        child: InkWell(
                          onTap: (){
                            Get.to(MapSample());
                          },
                          child: Container(
                               height: 50,
                                 width:180,
                                 decoration: BoxDecoration(
                                   color:AppColor.primary,
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                             child: Center( child: Text("Booking",style: TextStyle(
                               color: Colors.white
                             ),),),
                           ),
                        ),
                      ),


                      ],
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/constant/image_string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: AppColor.primary,
      body:Column(

              children: [

             //  Image.asset(react,fit: BoxFit.fill, height: 400, width: 400,),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PopupMenuButton(

                                  iconColor: Colors.white,
                                iconSize: 30,
                                itemBuilder: (context){
                                  return [

                                  ];
                                },
                              ),
                          ],
                        ),
                      ) ,

                Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        image: DecorationImage(
                            image: AssetImage(profile),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Stack(
                      clipBehavior:Clip.none,
                      children: [
                        Positioned(
                          bottom: 10,
                            right: -3,
                            child:Container(
                              height: 40,
                              width:40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white
                              ),
                              child: Center( child: Icon(Icons.camera_alt_outlined,color: AppColor.primary,),),
                            ),

                        )
                      ],
                    ),
                    
                  ) ,
             SizedBox(height: 10,),
             Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Center(
                          child: Text("Amelia Renata",textAlign:TextAlign.center,style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            fontSize: 17
                          ),),
                        )
                      ],
                    ),
                  ),
             Padding(
               padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 15.w),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                    Row(

                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(c,height: 70,width: 70,),
                            Text("Heart rate",style: GoogleFonts.montserrat(
                              color: AppColor.placeholder,
                              fontSize: 10
                            ),),
                            Text("215bpm",style: GoogleFonts.montserrat(
                                color: AppColor.white,
                                fontSize: 18,

                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        SizedBox(width: 20,),
                        Padding(
                          padding: EdgeInsets.only(top: 20),

                          child: Container(

                            height: 70,
                            width:2,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 40,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(cal,height: 70,width: 70,),
                            Text("Calories",style: GoogleFonts.montserrat(
                                color: AppColor.placeholder,
                                fontSize: 13
                            ),),
                            Text("756cal",style: GoogleFonts.montserrat(
                                color: AppColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        SizedBox(width: 40,),
                        Padding(
                          padding: EdgeInsets.only(top: 20),

                          child: Container(

                            height: 70,
                            width:2,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(P,height: 70,width: 70,),
                            Text("Weight",style: GoogleFonts.montserrat(
                                color: AppColor.placeholder,
                                fontSize: 13
                            ),),
                            Text("103lbs",style: GoogleFonts.montserrat(
                                color: AppColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),

                      ],
                    )
                 ],
               ),
             ),

                Expanded(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                  borderRadius:     BorderRadius.only(
                          topRight:Radius.circular(25),
                           topLeft: Radius.circular(25)
                      ),
                    ),
                     child: ListView(

                       children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10),
                           child: ListTile(
                             leading: Container(
                               height: 50,
                               width: 50,
                               decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                 color: AppColor.primary2
                               ),
                               child: Center(child: Image.asset(heart),),
                             ),
                             title: Text("My Saved",style:TextStyle( fontWeight: FontWeight.bold),),
                             trailing: Icon(Icons.arrow_forward_ios,),
                           ),
                         ),
                         SizedBox(height: 5,),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20),
                           child: Divider(height: 2,color: AppColor.textfield,thickness: 2,),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10),
                           child: ListTile(
                             leading: Container(
                               height: 50,
                               width: 50,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(50),
                                   color: AppColor.primary2
                               ),
                               child: Center(child: Image.asset(document),),
                             ),
                             title: Text("Appointment",style:TextStyle( fontWeight: FontWeight.bold),),
                             trailing: Icon(Icons.arrow_forward_ios,),
                           ),
                         ),
                         SizedBox(height: 10,),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20),
                           child: Divider(height: 2,color: AppColor.textfield,thickness: 2,),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10),
                           child: ListTile(
                             leading: Container(
                               height: 50,
                               width: 50,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(50),
                                   color: AppColor.primary2
                               ),
                               child: Center(child: Image.asset(paiement),),
                             ),
                             title: Text("Payment Method",style:TextStyle( fontWeight: FontWeight.bold),),
                             trailing: Icon(Icons.arrow_forward_ios,),
                           ),
                         ),
                         SizedBox(height: 10,),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20),
                           child: Divider(height: 2,color: AppColor.textfield,thickness: 2,),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10),
                           child: ListTile(
                             leading: Container(
                               height: 50,
                               width: 50,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(50),
                                   color: AppColor.primary2
                               ),
                               child: Center(child: Image.asset(faq),),
                             ),
                             title: Text("FAQs",style:TextStyle( fontWeight: FontWeight.bold),),
                             trailing: Icon(Icons.arrow_forward_ios,),
                           ),
                         ),
                         SizedBox(height: 10,),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20),
                           child: Divider(height: 2,color: AppColor.textfield,thickness: 2,),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10),
                           child: ListTile(
                             leading: Container(
                               height: 50,
                               width: 50,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(50),
                                   color: AppColor.primary2
                               ),
                               child: Center(child: Image.asset(logout),),
                             ),
                             title: Text("Logout",style:TextStyle( fontWeight: FontWeight.bold,color: Colors.red),),
                             trailing: Icon(Icons.arrow_forward_ios,),
                           ),
                         ),
                       ],
                     ),
                  ),
                )
              ],
            ),

    );
  }
}

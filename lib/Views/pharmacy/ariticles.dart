import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/constant/image_string.dart';

import '../../widgets/searchTextField.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  TextEditingController searchPharmacyText=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text("Article",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
         ),
         leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back_ios_new),),
         actions: [
           PopupMenuButton(itemBuilder:(context){
             return [];

           })
         ],
       ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SearchTextFieldWidget(title: 'Search articles ,news',icon: IconlyLight.search,textEditingController: searchPharmacyText,),
                SizedBox(height: 5,),
                Text("Popular Articles",textAlign:TextAlign.left,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),),
                SizedBox(height: 5,),

                    SizedBox(
                       height: 50,
                        child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, indew){
                           return Padding(
                             padding: const EdgeInsets.symmetric(horizontal:2),
                             child: Container(
                               width: 110,
                                 height: 50,
                                 decoration: BoxDecoration(
                                    color: AppColor.primary,
                                   borderRadius: BorderRadius.circular(13),

                                 ),
                               child: Center(child: Text("Covid-19",style: TextStyle( color: Colors.white),),),
                             ),
                           );
                        }
                    )
                    ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trending Articles",textAlign:TextAlign.left,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    TextButton(onPressed: (){}, child: Text("See all",style: TextStyle(
                      color: AppColor.primary
                    ),))
                  ],
                ),
               SizedBox(height: 10,),
               SizedBox(
                 height: 210.h,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                     itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                               height: 170,
                              width: 190,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.secondaryText),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:5,horizontal: 5 ),
                                  child:Stack(
                                    children: [
                                      Container(

                                        height: 110,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image:DecorationImage(
                                                image:AssetImage(rec),
                                                fit: BoxFit.cover

                                            )
                                        ),

                                      ),
                                      Positioned(
                                        top: 3,
                                           right: 10,
                                          child: Icon(Icons.bookmark,color: Colors.white,))
                                    ]
                                  ),
                                ),
                             SizedBox(height: 5,),
                             Padding(
                               padding: const EdgeInsets.only(left: 10),
                               child: Container(
                                 width: 80,
                                 height: 20,
                                 decoration: BoxDecoration(
                                    color: AppColor.primary2
                                 ),
                                 child: Center(child:    Text("Covid-19",style: TextStyle(color: AppColor.primary,
                                   fontWeight: FontWeight.w500
                                 ),
                                 ),
                                 ),
                               ),
                             ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AutoSizeText(
                                    maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      "The Horror Of The Second Wave Of COVID-19",
                                          style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                            fontSize: 20
                                    ),

                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                  RichText(
                                    text:
                                  TextSpan(
                                    text: "Jun 10, 2021",
                                    style: TextStyle(color: AppColor.secondaryText),
                                    children: [
                                      TextSpan(
                                        text: ".",style: TextStyle(
                                        color: AppColor.secondaryText,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      )
                                      ),
                                      TextSpan(
                                          text: "5 min read",style: TextStyle(
                                          color: AppColor.primary,


                                      )
                                      ),
                                    ]

                                  ),

                                  ),
                                )
                              ],
                            ),
                          ),
                        );

                 }),
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Related Articles",textAlign:TextAlign.left,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    TextButton(onPressed: (){}, child: Text("See all",style: TextStyle(
                        color: AppColor.primary
                    ),))
                  ],
                ),
                SizedBox(
                    height: 250,

                    child: ListView.builder(



                        itemCount: 5,
                        itemBuilder: (context,index){

                          return    Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
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
                                      child:   Image.asset("assets/image/medoc2.png",fit: BoxFit.fill,width: 100,height: 100,)


                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 9,horizontal: 9),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                         AutoSizeText(
                                           maxLines: 2,
                                           overflow: TextOverflow.ellipsis,
                                           "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",style: GoogleFonts.montserrat(
                                             fontSize:10,
                                             fontWeight:FontWeight.bold
                                         ),
                                         ),
                                            SizedBox(height: 10,),
                                            Text("Jun 10, 2021.5min read ",style: GoogleFonts.montserrat(
                                                fontSize:10,
                                                color:AppColor.primaryText
                                            ),),

                                          ],
                                        ),
                                      ),

                                    ),
                                  ),
                              Expanded(
                                 flex: 1,
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                child: Align(
                                    alignment: Alignment.topRight,

                                    child: Icon(IconlyBold.bookmark,color: AppColor.primary,size: 20,)),
                              ))
                                ],
                              ),
                            ),
                          );

                        }))
              ],
            ),
          ),
        ),
      );

  }
}

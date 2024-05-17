import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medics/constant/color_app.dart';

import '../../constant/image_string.dart';
import '../../widgets/searchTextField.dart';

class Pharmacy extends StatefulWidget {
  Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  TextEditingController searchPhamacydrugs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
        title: Text(
          "Pharmacy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              //***************search bar***************************
              SearchTextFieldWidget(
                title: 'Seach drugs category',
                icon: Icons.search,
                textEditingController: searchPhamacydrugs,
              ),
              //***************search bar***************************

              Container(
                height: 150.h,
                width: 350.w,
                decoration: BoxDecoration(
                  color: AppColor.primary2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                "Order quickly with Prescription",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 35.h,
                                width: 150.w,
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "unload Prescription",
                                    style: TextStyle(
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Image.asset(
                            para,
                            fit: BoxFit.fill,
                          ),
                        ))
                  ],
                ),
              ),
              //================== upload consultation===============
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Product",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(color: AppColor.primary),
                      ))
                ],
              ),
              Container(
                // Définir une hauteur pour le Container qui contient le GridView
                height: 500, // Vous pouvez ajuster cette hauteur selon vos besoins
                child: GridView.builder(
                  itemCount: 20,
                  shrinkWrap: true,

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 160,
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColor.textfield, width: 1),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                              Center( child: Image.asset(ct,),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                 Text("Panadol",style: TextStyle(fontWeight: FontWeight.bold),),
                                 Text("20pcs",style: TextStyle(color: AppColor.secondaryText,),),
                                 SizedBox(height: 15,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     RichText(
                                         text: TextSpan(
                                       text: "Pharmacy",
                                       style: TextStyle(color:AppColor.secondaryText),
                                           children: [
                                             TextSpan(
                                                 text: ".",style: TextStyle( color: AppColor.primary,fontWeight: FontWeight.bold,fontSize: 10),

                                             ),
                                             TextSpan(
                                               text: "Rail",
                                               style: TextStyle(
                                                 color: AppColor.primary
                                               )
                                             ),

                                           ]

                                     ),

                                     ),
                                Container(
                                  width: 30,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Center(child: Text("find",style: TextStyle(color:Colors.white,fontSize: 10),),),
                                )
                                   ],
                                 )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

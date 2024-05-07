import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:medics/Views/schedule/tab_items.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/constant/image_string.dart';

class Schuduler extends StatefulWidget {
   Schuduler({super.key});

  @override
  State<Schuduler> createState() => _SchudulerState();
}

class _SchudulerState extends State<Schuduler> {
  @override
  void dispose() {
    // Dispose any resources here
    super.dispose();
  }
  Widget build(BuildContext context) {
    return   SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell( onTap: (){}, child: Icon(IconlyLight.notification,)),
              ),
            ],
            title: const Text(
              'Schudule',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),

            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 49,

                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: AppColor.primary2,
                  ),
                  child:  TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      TabItem(title: 'Upcomming', count: 2),
                      TabItem(title: 'Completed', count: 3),
                      TabItem(title: 'Canceled', count: 1),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body:  TabBarView(

            children: [

       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
         child: ListView.builder(
                      itemCount: 5,
                        shrinkWrap: true,

                        itemBuilder:(context,index){
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: 340,
                              height: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColor.textfield,width: 1.2),

                              ),
                              child:Column(

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal:15),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Dr. Marcus Horizon",style: TextStyle(fontWeight: FontWeight.bold ,fontSize:   19),),
                                              Text("Chardiologist",style: TextStyle(color: AppColor.secondaryText),)
                                            ],
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(right:20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                                child: Image.asset(avatar),
                                              )
                                          ],
                                        ),
                                      )
                                      ],
                                    ),

                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [
                                        Icon(Icons.calendar_month_outlined),
                                        SizedBox(width: 5,),
                                        Text("26/06/2022"),
                                        SizedBox(width: 5,),
                                        Icon(IconlyLight.timeCircle),
                                        SizedBox(width: 5,),
                                        Text("10:30 AM"),
                                        SizedBox(width: 9,),
                                        Container(
                                           height:7,
                                           width:7,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green
                                          ),
                                        ),
                                        SizedBox(width: 4,),
                                        Text("Confirmed"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 155,
                                          decoration: BoxDecoration(
                                            color: AppColor.primary2,
                                            borderRadius: BorderRadius.circular(10)

                                          ),
                                          child: Center(child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold),),),
                                        ),
                                        SizedBox(width: 8,),
                                        Container(
                                          height: 50,
                                          width: 155,
                                          decoration: BoxDecoration(
                                              color: AppColor.primary,
                                              borderRadius: BorderRadius.circular(10)

                                          ),
                                          child: Center(child: Text("Reschedule",style: TextStyle(fontWeight: FontWeight.bold,
                                          color: Colors.white),),),
                                        )
                                      ],
                                    ),
                                  )
                                ],

                              ),
                            ),
                          );
                        }

                    ),
       ),




              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Competed schedule",style: TextStyle(color: AppColor.secondaryText,fontSize: 20),),
                  SizedBox(height: 10,),
                  Center(child: Image.asset(data,width: 200,height: 200,)),
                ],
              ),



              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Canceled schedule",style: TextStyle(color: AppColor.secondaryText,fontSize: 20),),
                  SizedBox(height: 10,),
                  Center(child: Image.asset(data,width: 200,height: 200,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );


  }
}
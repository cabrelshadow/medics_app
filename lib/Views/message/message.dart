import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medics/Views/Chat/chat_screen.dart';

import '../../constant/color_app.dart';
import '../../constant/image_string.dart';
import '../schedule/tab_items.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  void dispose() {
    // Dispose any resources here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {},
                  child: Icon(IconlyLight.search),
                ),
              ),
            ],
            title: const Text(
              'Message',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      TabItem(title: 'All', count: 2),
                      TabItem(title: 'Group', count: 3),
                      TabItem(title: 'Private', count: 1),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric( vertical: 20),
                child: ListView(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>ChatScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),

                            child: Image.asset(avatar),
                          ),
                          title:Text("Dr. Marcus Horizon",style: TextStyle(fontWeight: FontWeight.bold),) ,
                          subtitle:Text("I don,t have any fever, but headchace...",style: TextStyle(color: AppColor.secondaryText)) ,
                          trailing: Column(
                            children: [
                              Text("13:24"),
                              SizedBox(height: 10,),
                            Container(
                              height: 17,
                              width: 17,
                              decoration: BoxDecoration(
                                color: AppColor.primary,
                                shape: BoxShape.circle,

                              ),
                              child: Center(child: Text("1",style: TextStyle(color: Colors.white),),),
                            )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),

                          child: Image.asset(avatar2),
                        ),
                        title:Text("Dr. Alysa Hana",style: TextStyle(fontWeight: FontWeight.bold),) ,
                        subtitle:Text("Hello, How can i help you?" ,style: TextStyle(color: AppColor.secondaryText),) ,
                        trailing: Column(
                          children: [
                            Text("10:24"),
                            SizedBox(height: 10,),
                            Image.asset(cool,)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),

                          child: Image.asset(avatar3),
                        ),
                        title:Text("Dr. Maria Elena",style: TextStyle(fontWeight: FontWeight.bold),) ,
                        subtitle:Text("Do you have fever?",style: TextStyle(color: AppColor.secondaryText)) ,
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Text("9:24"),
                            SizedBox(height: 10,),
                            Image.asset(cool,)
                          ],
                        ),
                      ),
                    )
                   ],


                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Message for group section ", style: TextStyle(color: AppColor.secondaryText, fontSize: 20)),
                  SizedBox(height: 10),
                  Center(child: Image.asset(chatdata, width: 200, height: 200)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No Message for private section", style: TextStyle(color: AppColor.secondaryText, fontSize: 20)),
                  SizedBox(height: 10),
                  Center(child: Image.asset(chatdata, width: 200, height: 200)),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            shape:CircleBorder(),
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton flottant
            },
            child: Image.asset(chat,color: Colors.white,),
            backgroundColor: AppColor.primary, // Couleur de fond du bouton flottant
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Position du bouton flottant
        ),
      ),
    );
  }
}

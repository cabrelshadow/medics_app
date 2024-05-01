import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';

import '../../Model/chat_model.dart';
import '../../widgets/message_widget.dart';
import '../call/Vidoe_call.dart';
import '../call/audio_call.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isVisible = true;
  void initState() {
    super.initState();
    // Déclenche la disparition du conteneur après 3 secondes
    Timer(Duration(seconds: 3), () {
      setState(() {
        _isVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _chatTextField(),
       appBar: AppBar(
         title: Text("Dr. Marcus Horizon",style: GoogleFonts.montserrat(
            fontWeight:FontWeight.bold,
            fontSize:20
         ),),
         actions: [
           InkWell( onTap: (){ Get.to(()=>ViedeoScreen());}, child: Icon(IconlyBold.video,)),
          SizedBox(width: 5,),
           InkWell(  onTap: (){ Get.to(()=>CallAudioScreen());} ,child: Icon(IconlyBold.call)),
           PopupMenuButton(

             itemBuilder: (context){
               return [

               ];
             },

           )
         ],
       ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          children: [
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                 height: 90,
                width:340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColor.secondaryText,width: 1),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Consultion Start",style: GoogleFonts.montserrat(
                      color:AppColor.primary,
                      fontWeight:FontWeight.bold,
                       fontSize:20
                    ),),
                    SizedBox(height:7,),
                    Text("You can consult your problem to the doctor",style:GoogleFonts.montserrat(
                        color:AppColor.secondaryText,

                        fontSize:13
                    )),
                    SizedBox(height: 20,),

                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          MessageBubble(message: messages[index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      itemCount: messages.length),
                ))
          ],
        ),
      ),
    );
  }
  Widget _chatTextField() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 14,
          bottom: MediaQuery.of(context).viewInsets.bottom + 30),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color:Colors.transparent,
           border: Border.all(color: AppColor.secondaryText)
        ),
        child: Row(
          children: [
             Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type message ......",
                      hintStyle: TextStyle(fontSize: 18,color: AppColor.secondaryText)),
                )),
            CircleAvatar(
              backgroundColor:AppColor.primary,
              child:  Center(
                child: Icon(
                  Icons.send,
                  color:AppColor.white,
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
}

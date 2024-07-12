import 'dart:ffi';
import 'dart:typed_data';
import 'dart:io';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'package:image_picker/image_picker.dart';
import 'package:medics/constant/color_app.dart';

import '../../constant/image_string.dart';

class AssistanceChat extends StatefulWidget {
  const AssistanceChat({super.key});

  @override
  State<AssistanceChat> createState() => _AssistanceChatState();
}

class _AssistanceChatState extends State<AssistanceChat> {
  final Gemini gemini=Gemini.instance;
  List<ChatMessage>messages=[];
  ChatUser currentUSer=ChatUser(id: "0",firstName: "User");
  ChatUser geminiUSer=ChatUser(id: "1",firstName: "Gemenu",profileImage: Applogo,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assistance iteligente",style: TextStyle(color: AppColor.primary),),
        centerTitle: true,
      ),
      body:_buildIU(),
    );
  }
  Widget _buildIU(){
     return DashChat(
       inputOptions: InputOptions(
         trailing:[ IconButton(
           onPressed:SendMediaMessage,icon: Icon(Icons.image,color: AppColor.primary,),
         )]
       ),
         currentUser: currentUSer,
         onSend:_SendMessage,
         messages: messages
     );
  }
  void _SendMessage(ChatMessage chatMessage){
   setState(() {
     messages=[chatMessage,...messages];
   });
   try{
   String question=chatMessage.text;
     //List<ByteData> images;
   /*if(chatMessage.medias?.isNotEmpty?? false){
      images=[
        File(chatMessage.medias!.first.url).readAsBytesSync(),
      ];
   }*/
   gemini.streamGenerateContent(question).listen((event){
     ChatMessage? lastMessage=messages.firstOrNull;
     if(lastMessage != null && lastMessage.user==geminiUSer){
       lastMessage=messages.removeAt(0);
       String response =event.content?.parts?.fold("", (previous,current)=>"$previous ${current.text}")??"";
      lastMessage.text +=response;
      setState(() {
        messages=[lastMessage!,...messages];
      });
     }else{
       String response =event.content?.parts?.fold("", (previous,current)=>"$previous ${current.text}")??"";

       ChatMessage message=ChatMessage(user: geminiUSer, createdAt: DateTime.now(),text:response );
       setState(() {
         messages=[message,...messages];
       });
     }
   });
   }catch(e){
     print(e);
   }
  }
  void SendMediaMessage()async{
    ImagePicker picker=ImagePicker();
    XFile? file =await picker.pickImage(source: ImageSource.gallery);
    if(file!=null){
      ChatMessage chatMessage=ChatMessage(user: currentUSer,createdAt:DateTime.now(),text: "decrit la photo",
          medias:[
            ChatMedia(
          url: file.path,
          fileName:"",
          type: MediaType.image
      )
          ]
    );
      _SendMessage(chatMessage);

    }
  }
}

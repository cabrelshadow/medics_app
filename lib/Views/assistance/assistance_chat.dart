import 'package:flutter/material.dart';
import 'package:medics/constant/color_app.dart';

class AssistanceChat extends StatefulWidget {
  const AssistanceChat({super.key});

  @override
  State<AssistanceChat> createState() => _AssistanceChatState();
}

class _AssistanceChatState extends State<AssistanceChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assistance iteligente",style: TextStyle(color: AppColor.primary),),
        centerTitle: true,
      ),
    );
  }
}

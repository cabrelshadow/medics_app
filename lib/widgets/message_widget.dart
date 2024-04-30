import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/constant/image_string.dart';

import '../Model/chat_model.dart';


class MessageBubble extends StatefulWidget {
  final Message message;
  const MessageBubble({super.key,required this.message});

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool showTimeS=false;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: widget.message.received ? Alignment.centerLeft : Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  showTimeS=!showTimeS;
                });
              },
              child: Column(
                children: [
                  Visibility(
                    visible: widget.message.received,
                    child: Container(
                      width: 300,
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset(avatar),
                          ),
                          SizedBox(width: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dr. Marcus Horizon", style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                              )),
                              Text("5 min ago", style: GoogleFonts.montserrat(
                                  color: AppColor.secondaryText
                              )),
                              SizedBox(height: 20,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),



                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular( widget.message.received?0: 15),
                          bottomRight: Radius.circular(15),


                        ),
                        color: widget.message.received ?Color(0xffE8F3F1)
                        : AppColor.primary
                    ),
                    child:  Text(widget.message.text,
                      style:  TextStyle(
                          fontSize: 18,
                          height: 1.4,
                          color:  widget.message.received ?Colors.black
                              : AppColor.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            if(showTimeS) ...[  Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(widget.message.timeStamp,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            ]
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:medics/constant/color_app.dart';

class textFieldWith_icon extends StatelessWidget {
  const textFieldWith_icon({
    super.key,
    required TextEditingController textEditingController,
    required this.title,
    required this.icon,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(

          hintText: title,
          filled: true,
          fillColor:  AppColor.placeholder,
          enabledBorder:OutlineInputBorder(

              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                width: 1,
                  color: AppColor.secondaryText,


              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
              borderSide: BorderSide(
                  width: 1,
                  color: AppColor.secondaryText
              )
          ),
          prefixIcon: Icon(icon , color: AppColor.primary, )
      ),

    );
  }
}

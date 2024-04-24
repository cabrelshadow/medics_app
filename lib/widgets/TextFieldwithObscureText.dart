import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:medics/constant/color_app.dart';

class textFieldWith_icon_ObscureText extends StatefulWidget {
  const textFieldWith_icon_ObscureText({
    super.key,
    required TextEditingController textEditingController,
    required this.title,

  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;
  final String title;


  @override
  State<textFieldWith_icon_ObscureText> createState() => _textFieldWith_icon_ObscureTextState();
}

class _textFieldWith_icon_ObscureTextState extends State<textFieldWith_icon_ObscureText> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._textEditingController,
      keyboardType: TextInputType.text,
      obscureText: _obscureText,
      decoration: InputDecoration(

          hintText: widget.title,
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
          prefixIcon: Icon(IconlyLight.lock, color: AppColor.primary, ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,color: AppColor.primary,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },

        ),

      ),

    );
  }
}

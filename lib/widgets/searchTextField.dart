import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/color_app.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextEditingController textEditingController;
  const SearchTextFieldWidget({
    super.key, required this.title, required this.icon, required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 50,
      width: 370,
      decoration: BoxDecoration(
          color: AppColor.placeholder,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColor.secondaryText,width: 0.3)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: title, // Texte d'indication
          hintStyle: TextStyle(color:AppColor.secondaryText), // Couleur du texte d'indication
          prefixIcon: Icon(icon,color: AppColor.secondaryText,), // Icône de recherche à gauche
          border: InputBorder.none, // Pas de bordure par défaut
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0), // Rembourrage du texte
        ),
      ),
    );
  }
}
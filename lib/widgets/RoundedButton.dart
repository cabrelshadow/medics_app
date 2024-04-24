import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';

//enumeration pour le choix de couleur sur les boutons
enum round_buttonType{
  bgPrimary,textPrimary
}

class round_button extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final round_buttonType type;

  const round_button({
    super.key,
    required this.title,
    required this.onPressed,
    this.type=round_buttonType.bgPrimary
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: type==round_buttonType.bgPrimary?AppColor.primary:AppColor.white,//manipulation des enumeration ici
          borderRadius: BorderRadius.circular(28),
          border:  type==round_buttonType.bgPrimary? null :Border.all(color: AppColor.primary,width: 1),//manipulation des enumeration ici

        ),
        child: Center(
          child:  Text(title ,style:
       GoogleFonts.montserrat(
           color: type==round_buttonType.bgPrimary?AppColor.white:AppColor.primary,//manipulation des enumeration ici
           fontSize: 16,
           fontWeight: FontWeight.w600
       )
            ,),
        ),
      ),
    );
  }
}

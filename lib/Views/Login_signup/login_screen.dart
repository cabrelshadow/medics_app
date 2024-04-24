import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/constant/image_string.dart';

import '../../widgets/RoundedButton.dart';
import '../../widgets/TextFieldwithObscureText.dart';
import '../../widgets/roundedButtonIcon.dart';
import '../../widgets/textfield_with_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController TextEmail=TextEditingController();
  TextEditingController Textpassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: GoogleFonts.montserrat(
          fontWeight:FontWeight.bold
        ),),
        centerTitle: true,
        leading:  Icon(IconlyLight.arrowLeft,color: Colors.black,size: 20,),
      ),
       body:SafeArea(
         child: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
             child: Column(
               children: [
                 textFieldWith_icon(textEditingController: TextEmail, title: 'email', icon: IconlyLight.message,),
                 SizedBox(height: 10,),
                 textFieldWith_icon_ObscureText(textEditingController: Textpassword, title: 'Password',),
                 Align(
                      alignment: Alignment.centerRight,
                     child: TextButton(onPressed: (){}, child: Text("Forget Password?",style: GoogleFonts.montserrat(
                        color:AppColor.primary,
                       fontWeight:FontWeight.w600

                     ),
                     )
                     )
                 ),
                 SizedBox(height: 20,),
                 round_button(title: 'Login', onPressed: () {  },),
                 SizedBox(height: 10,),
                 Align(
                   alignment: Alignment.center,
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Don’\ t have an account?",style: GoogleFonts.montserrat(
                             color:AppColor.secondaryText,
                             fontSize:15

                         ),
                         ),
                         SizedBox(height: 20,),

                         TextButton(onPressed: (){}, child: Text("Sign Up",style: GoogleFonts.montserrat(
                             color:AppColor.primary,
                             fontWeight:FontWeight.w500,
                             fontSize:15
                         ),
                         )

                         ),
                       ],
                     )
                 ),
                 Rouded_buttonWitthIcon(title: 'Sign in with Google', image: googleIcon, onPressed: () {  },)
               ],
             ),
           ),
         ),
       ),
    );
  }
}

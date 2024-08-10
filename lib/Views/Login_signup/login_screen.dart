import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/Views/Login_signup/SignUp_Screen.dart';
import 'package:medics/Views/home_screen/nav_bar.dart';
import 'package:medics/constant/color_app.dart';
import 'package:medics/constant/image_string.dart';

import '../../Model/users/users.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/TextFieldwithObscureText.dart';
import '../../widgets/modal_show.dart';
import '../../widgets/roundedButtonIcon.dart';
import '../../widgets/textfield_with_icon.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController TextEmail=TextEditingController();
  TextEditingController Textpassword=TextEditingController();
  void _login() async {

      String? result = await loginUser(TextEmail.text, Textpassword.text);
      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful')));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: GoogleFonts.montserrat(
          fontWeight:FontWeight.bold
        ),),
        centerTitle: true,
        leading:  const Icon(IconlyLight.arrowLeft,color: Colors.black,size: 20,),
      ),
       body:SafeArea(
         child: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
             child: Column(
               children: [
                 textFieldWith_icon(textEditingController: TextEmail, title: 'email', icon: IconlyLight.message,),
                const SizedBox(height: 10,),
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
                 const SizedBox(height: 20,),
                 round_button(title: 'Login', onPressed: _login
             /*   CustomDialog.showCustomDialog(
                    context, "Yeay! Welcome Back",
                    "Once again you login successfully \n into medidoc app",
                    "Go to home",
                        (){
          );*/

                 ,
                 ),
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

                         TextButton(onPressed: (){
                           Get.to(SignUpScreen());
                         }, child: Text("Sign Up",style: GoogleFonts.montserrat(
                             color:AppColor.primary,
                             fontWeight:FontWeight.w500,
                             fontSize:15
                         ),
                         )

                         ),
                       ],
                     )
                 ),
                 Rouded_buttonWitthIcon(title: 'Sign in with Google', image: googleIcon, onPressed: () {


                 },)
               ],
             ),
           ),
         ),
       ),
    );
  }
}

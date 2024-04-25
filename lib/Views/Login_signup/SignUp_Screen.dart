import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medics/Views/Login_signup/login_screen.dart';

import '../../constant/color_app.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/TextFieldwithObscureText.dart';
import '../../widgets/modal_show.dart';
import '../../widgets/textfield_with_icon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController textName=TextEditingController();
  TextEditingController textEmail=TextEditingController();
  TextEditingController textPassword=TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",style: GoogleFonts.montserrat(
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
                //==========================Text field input=======================================//
                textFieldWith_icon(textEditingController: textName, title: 'Enter your name', icon: IconlyLight.user2,),
                const SizedBox(height: 10,),
                textFieldWith_icon(textEditingController: textEmail, title: 'Enter your email', icon: IconlyLight.message,),
                const SizedBox(height: 10,),
                textFieldWith_icon_ObscureText(textEditingController: textPassword, title: 'Enter your password',),
                //=================================================================//
                Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Checkbox(
                          splashRadius:50 ,
                          focusColor: AppColor.primary,
                         activeColor: AppColor.primary,

                          value: _isChecked,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChecked = newValue ?? false;
                            });
                          },
                        ),
                        //==========================terme and privacy=======================================//
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to the medidoc ',
                                style: GoogleFonts.montserrat(
                                    color: AppColor.primaryText, fontSize:13
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service ',
                                style:GoogleFonts.montserrat(
                                    color: AppColor.primary, fontSize:13
                                ),
                              ),
                              TextSpan(
                                text: 'and',
                                style:GoogleFonts.montserrat(
                                    color: AppColor.secondaryText, fontSize:13
                                ),
                              ),
                              TextSpan(
                                text: '\n Privacy Policy',
                                style: GoogleFonts.montserrat(
                                    color: AppColor.primary, fontSize:13
                                ),
                              ),
                            ],
                          ),
                        ),
                        //==========================terme and privacy=======================================//
                      ],
                    )
                ),
                const SizedBox(height: 20,),
                round_button(title: 'Sign Up', onPressed: () {
                  CustomDialog.showCustomDialog(
                      context, "Success",
                      "You have successfully created your account.",
                      "Sign Up",
                          (){     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},Icons.check
                  );

                },
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}

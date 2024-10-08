import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/Views/consultation/test.dart';
import 'package:medics/Views/maladie/result.dart';
import 'package:medics/constant/color_app.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/image/consult1.json",width: 300,height: 300, backgroundLoading: false),
            Container(
              width: 150,
              child: LinearProgressIndicator(
                color: AppColor.primary,

              ),
            ),
            // Cercle de progression
            SizedBox(height: 20),
            Text("Veuillez patienter...", style: TextStyle(fontSize: 18,color: AppColor.primary)),
          ],
        ),
      ),
    );
  }
}

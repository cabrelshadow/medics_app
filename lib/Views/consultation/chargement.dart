import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/Views/consultation/test.dart';
import 'package:medics/constant/color_app.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Délai de 10 secondes avant de naviguer vers la page suivante
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ConsultationResultScreen()), // Remplacez cette ligne par la page suivante
      );
    });

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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medics/Views/consultation/test.dart';
import 'package:medics/constant/color_app.dart';

import '../../Model/symptomeModel.dart';
import '../../Model/symtomes.dart';
import '../../provider/consultation.dart';
import '../../widgets/RoundedButton.dart';
import '../Login_signup/SignUp_Screen.dart';

class ResultPage extends ConsumerWidget{
  final SymptomeDetails symptome;

  const ResultPage({Key? key, required this.symptome}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref ) {
    final consultationAsyncValue = ref.watch(apiConsultationsProviderList);
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Symptôme'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 400,
                width:350,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15)

                ),
                child: Column(

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: Text("vous etes sur d'avoir comme Symptômes ?",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: AppColor.primary),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Symptôme: ${symptome.label} ', style: TextStyle(fontSize: 17)),
                    ),

                    SizedBox(height: 20,),
                      Divider(color: AppColor.primary,height: 30,),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                      Expanded(child:   round_button(title: "Oui", onPressed: () {
                        List<String> symptoms = symptome.label.split(',').map((s) => s.trim()).toList();
                        ref.read(symptomeListProvider.notifier).state = Symptomes(symptomes: symptoms);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ConsultationResultScreen()),
                        );
                      },

                      ),
                      ),
                        SizedBox(width: 10,),
                        Expanded(child:   round_button(title: "Non", onPressed: () {  },type: round_buttonType.textPrimary,),
                      ),
                      ],
                    )
                  ],
                ),
              ),
            )
            // Ajoutez d'autres détails du symptôme si nécessaire
          ],
        ),
      ),
    );
  }
}

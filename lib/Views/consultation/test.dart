import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medics/constant/color_app.dart';
import '../../provider/consultation.dart';

class ConsultationResultScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultationAsyncValue = ref.watch(apiConsultationsProviderList);

    return Scaffold(
      appBar: AppBar(
        title: Text('Résultats de la Consultation',style: TextStyle(color: AppColor.primary),),
      ),
      body: consultationAsyncValue.when(
        data: (consultations) {
          // Vérifiez si la liste est vide
          if (consultations.isEmpty) {
            return Center(
              child: Text('Aucune consultation trouvée.'),
            );
          }

          // ListView.builder pour afficher les consultations
          return ListView.builder(
            itemCount: consultations.length,
            itemBuilder: (context, index) {
              // Assurez-vous que l'index est valide
              if (index < 0 || index >= consultations.length) {
                return Center(
                  child: Text('Index invalide: $index'),
                );
              }

              final consultation = consultations[index];

              // Ajoutez des valeurs par défaut pour éviter les erreurs si une valeur est null
              final maladie = consultation.maladie ?? 'Maladie inconnue';
              final traitement = consultation.traitement ?? 'Aucun traitement spécifié';
              final medecin = consultation.medecin ?? 'Médecin non spécifié';

              // Print des valeurs dans la console
              print('Consultation $index:');
              print('  Maladie ID: ${consultation.maladieId}');
              print('  Maladie: $maladie');
              print('  Médecin ID: ${consultation.medecinId}');
              print('  Médecin: $medecin');
              print('  Traitement: $traitement');
              print('---');

              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(

                      children: [
                        Text("Maladie :",style: TextStyle(color: AppColor.primary,fontWeight: FontWeight.bold,fontSize: 17),),
                        SizedBox(width: 10,),
                        Text(maladie,style: TextStyle(fontSize: 15),),

                      ],
                    ),
                    SizedBox(height: 10),
                    RichText(text:
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Potentiel Traitement:  ",
                            style: TextStyle( fontWeight: FontWeight.bold,color: AppColor.primary,fontSize: 17)
                        ),
                        TextSpan(
                          text: traitement,
                          style: TextStyle( color: Colors.black)
                        ),

                      ]
                    )
                    ),
                    SizedBox(height: 10,),

                 SizedBox(height: 10,),
                     RichText(text:
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Médecin Recomandé:  ",
                            style: TextStyle( fontWeight: FontWeight.bold,color: AppColor.primary,fontSize: 17)
                        ),
                        TextSpan(
                          text: medecin,
                          style: TextStyle( color: AppColor.primary)
                        ),

                      ],
                    )
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text("Contact :",style: TextStyle(color: AppColor.primary,fontWeight: FontWeight.bold,fontSize: 17),),
                        SizedBox(width: 10,),
                        Text("760097909",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text("Pour plus de precision, nous vous recommandons de vous  rapprocher d'un spécialiste"),

                  ],
                ),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          // Print des détails de l'erreur dans la console
          print('Erreur: $error');
          print('Stack trace: $stack');

          return Center(child: Text('Erreur: ${error.toString()}'));
        },
      ),
    );
  }
}

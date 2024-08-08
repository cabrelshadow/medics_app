import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/consultation.dart';

class ConsultationResultScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultationAsyncValue = ref.watch(apiConsultationsProviderList);

    return Scaffold(
      appBar: AppBar(
        title: Text('Résultats de la Consultation'),
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
                    Text(
                      'Maladie : $maladie',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Description: $traitement'),
                    SizedBox(height: 5),
                    Text('Médecin: $medecin'),
                  ],
                ),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erreur: ${error.toString()}')),
      ),
    );
  }
}

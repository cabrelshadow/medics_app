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
        data: (consultations) => ListView.builder(
          itemCount: consultations.length,
          itemBuilder: (context, index) {
            final consultation = consultations[index];
            return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                    ),
              child:Column(
                children: [
                  Text('maladie : ${consultation.maladie}'),
                Text('Description: ${consultation.traitement}'),
                Text('Medecin: ${consultation.medecin}'),
                ],
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erreur: ${error.toString()}')),
      ),
    );
  }
}

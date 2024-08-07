import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medics/Views/consultation/test.dart';
import '../../Model/symptome.dart';
import '../../provider/consultation.dart';

class SymptomInputScreen extends ConsumerWidget {
  final TextEditingController symptomController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrer les symptômes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: symptomController,
              decoration: InputDecoration(
                labelText: 'Symptôme',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Mettre à jour les symptômes
                List<String> symptoms = symptomController.text.split(',').map((s) => s.trim()).toList();
                ref.read(symptomeListProvider.notifier).state = Symptomes(symptomes: symptoms);

                // Naviguer vers l'écran des résultats
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConsultationResultScreen()),
                );
              },
              child: Text('Consulter'),
            ),
          ],
        ),
      ),
    );
  }
}

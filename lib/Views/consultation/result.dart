import 'package:flutter/material.dart';
import '../../Model/symptomeModel.dart';

class ResultPage extends StatelessWidget {
  final SymptomeDetails symptome;

  const ResultPage({Key? key, required this.symptome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Symptôme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Label: ${symptome.label}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('ID Maladie: ${symptome.maladie}', style: TextStyle(fontSize: 18)),
            // Ajoutez d'autres détails du symptôme si nécessaire
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medics/Model/ApiModel.dart';

Future<PredictionResponse?> predictDisease(List<double> patientData) async {
  final url = Uri.parse('http://192.168.8.182:7000/predict');  // Remplacez par l'URL de votre API
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: json.encode({'data': patientData}),
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final prediction = PredictionResponse.fromJson(jsonResponse);

    // Affichez les résultats dans la console
    print('Probabilité de malaria : ${prediction.malaria}');
    print('Probabilité de typhoïde : ${prediction.typhoid}');
    print('Conclusion : ${prediction.conclusion}');
    if (prediction.doctor != null) {
      print('Médecin recommandé : ${prediction.doctor!.name}, spécialité : ${prediction.doctor!.specialty}');
    }
    if (prediction.medication.isNotEmpty) {
      print('Médicaments recommandés : ${prediction.medication.join(', ')}');
    }

    return prediction;
  } else {
    print('Erreur lors de la prédiction : ${response.statusCode}');
    return null;
  }
}

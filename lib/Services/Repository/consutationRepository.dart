import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../../Model/consultationModel.dart';
import '../../Model/symtomes.dart';

class ConsultationRepository {
  String? urlApi = dotenv.env['API_URL'];
  Logger logger = Logger();

  Future<List<Maladie>> getConsultation(Symptomes symptome) async {
    logger.d("Inside the request");

    final response = await http.post(
      Uri.parse('http://192.168.8.198:3000/api/v1/diagnostic'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(symptome.toJson()),
    );

    if (response.statusCode == 200) {
      List<dynamic> data;
      try {
        data = jsonDecode(response.body);
      } catch (e) {
        logger.e("Erreur lors du parsing de la réponse: $e");
        throw Exception("Erreur lors du parsing de la réponse API");
      }

      if (data.isEmpty) {
        logger.d("La réponse est vide");
        return [];
      }

      List<Maladie> consultation = data.map((e) => Maladie.fromJson(e)).toList();
      logger.d("Nombre d'éléments dans la consultation: ${consultation.length}");

      if (consultation.isNotEmpty) {
        logger.d(consultation[0].toJson());
        if (consultation.length > 1) {
          logger.d(consultation[1].toJson());
        }
      }

      return consultation;
    } else {
      logger.d("Erreur lors de la requête API");
      throw Exception("Une erreur s'est produite lors de la récupération des consultations.");
    }
  }
}

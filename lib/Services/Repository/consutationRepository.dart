import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../../Model/consultationModel.dart';
import '../../Model/symptome.dart';


class Consutationrepository{
  String? urlApi= dotenv.env['API_URL'];
  Logger logger = Logger();

  Future<List<Maladie>> getConsultation(Symptomes symptome)async{
    logger.d("inside the request");

    final response = await  http.post(Uri.parse('http://192.168.8.198:3000/api/v1/diagnostic')
        ,headers:  {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body:jsonEncode(symptome.toJson())
    );

    if(response.statusCode == 200){
      List<dynamic> data = jsonDecode(response.body) ;
      List<Maladie> consultation = data.map((e)=> Maladie.fromJson(e)).toList() ;
      logger.d(consultation[0].toJson());
      logger.d(consultation[1].toJson());
      return consultation;
    }else{
      logger.d("erreur");

      return throw Exception("une erreur s'est produit ");
    }
  }
}
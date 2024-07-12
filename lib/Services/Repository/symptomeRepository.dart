
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';import 'package:http/http.dart' as http;

import 'package:medics/Model/consultationModel.dart';
import 'package:medics/Model/symptomeModel.dart';

class Symptomerepository{

  String? urlApi= dotenv.env['API_URL'];
  Logger logger = Logger();

  Future<List<SymptomeDetails>> getSymptomes()async{
    logger.d("inside the request");

    final response = await  http.get(Uri.parse('http://192.168.8.198:3000/api/v1/symptome'));

    if(response.statusCode == 200){
      List<dynamic> data = jsonDecode(response.body) ;
      List<SymptomeDetails> symptomes = data.map((e)=> SymptomeDetails.fromJson(e)).toList() ;

      for(SymptomeDetails elment in symptomes){
        logger.d(elment.toJson());
      }
      return symptomes;
    }else{
      logger.d("erreur");

      return throw Exception("une erreur s'est produit ");
    }
  }
}
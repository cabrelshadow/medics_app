import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:medics/Model/consultationModel.dart';
import 'package:medics/Model/symptome.dart';
import 'package:medics/Services/Repository/consutationRepository.dart';


//---------apiProviderConsultation------------
final apiConsultationProvider = Provider<Consutationrepository>((ref)=> Consutationrepository());
//---------ProviderSymptome------------
final symptomeListProvider = StateProvider<Symptomes>((ref)=>Symptomes(symptomes: ['frissons','fatigue']));
//---------apiProviderConsultation------------
final apiConsultationsProviderList = FutureProvider<List<Maladie>>((ref)=>ref.read(apiConsultationProvider).getConsultation(ref.watch(symptomeListProvider)));
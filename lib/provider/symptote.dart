import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:medics/Model/consultationModel.dart';
import 'package:medics/Model/symptome.dart';
import 'package:medics/Model/symptomeModel.dart';
import 'package:medics/Services/Repository/consutationRepository.dart';
import 'package:medics/Services/Repository/symptomeRepository.dart';


//---------apiProviderConsultation------------
final apiSymptomeProvider = Provider<Symptomerepository>((ref)=> Symptomerepository());
//---------apiProviderConsultation------------
final apiSymptomeProviderList = FutureProvider<List<SymptomeDetails>>((ref)=>ref.read(apiSymptomeProvider).getSymptomes());
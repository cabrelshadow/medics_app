



// Fournisseur de repository de consultation
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Model/consultationModel.dart';
import '../Model/symtomes.dart';
import '../Services/Repository/consutationRepository.dart';

final apiConsultationProvider = Provider<ConsultationRepository>((ref) => ConsultationRepository());

// Fournisseur de liste de symptômes
final symptomeListProvider = StateProvider<Symptomes>((ref) => Symptomes(symptomes: []));

// Fournisseur de liste de consultations
final apiConsultationsProviderList = FutureProvider<List<Maladie>>((ref) async {
  final symptomes = ref.watch(symptomeListProvider);
  return await ref.read(apiConsultationProvider).getConsultation(symptomes);
});

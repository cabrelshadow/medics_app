import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Model/consultationModel.dart';
import '../Model/symptome.dart';
import '../Services/Repository/consutationRepository.dart';




// Fournisseur de repository de consultation
final apiConsultationProvider = Provider<Consutationrepository>((ref) => Consutationrepository());

// Fournisseur de liste de symptômes
final symptomeListProvider = StateProvider<Symptomes>((ref) => Symptomes(symptomes: []));

// Fournisseur de liste de consultations
final apiConsultationsProviderList = FutureProvider<List<Maladie>>((ref) async {
  final symptomes = ref.watch(symptomeListProvider);
  return await ref.read(apiConsultationProvider).getConsultation(symptomes);
});

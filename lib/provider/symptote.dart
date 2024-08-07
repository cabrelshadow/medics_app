import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Model/symptomeModel.dart';
import '../Services/Repository/symptomeRepository.dart';

// Fournisseur de repository de symptômes
final apiSymptomeProvider = Provider<Symptomerepository>((ref) => Symptomerepository());

// Fournisseur de liste de symptômes
final apiSymptomeProviderList = FutureProvider<List<SymptomeDetails>>((ref) {
  return ref.read(apiSymptomeProvider).getSymptomes();
});

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/symptote.dart';

class SymptomeListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symptomeAsyncValue = ref.watch(apiSymptomeProviderList);

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Symptômes'),
      ),
      body: symptomeAsyncValue.when(
        data: (symptomes) => ListView.builder(
          itemCount: symptomes.length,
          itemBuilder: (context, index) {
            final symptome = symptomes[index];
            return ListTile(
              title: Text(symptome.label),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID Maladie: ${symptome.maladie}'),
                  Text('Créé le: ${symptome.createdAt.toLocal().toString()}'),
                  Text('Mis à jour le: ${symptome.updatedAt.toLocal().toString()}'),
                ],
              ),
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Erreur: ${error.toString()}')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medics/Views/consultation/result.dart';
import 'package:search_page/search_page.dart';

import '../../Model/symptomeModel.dart';
import '../../provider/symptote.dart';

class ConsultationView extends ConsumerStatefulWidget {
  const ConsultationView({super.key});
  @override
  _ConsultationViewState createState() => _ConsultationViewState();
}

class _ConsultationViewState extends ConsumerState<ConsultationView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final apiSymptomes = ref.watch(apiSymptomeProviderList);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchPage<SymptomeDetails>(
                  onQueryUpdate: print,
                  items: apiSymptomes.when(
                    data: (data) => data,
                    error: (error, stackTrace) => [],
                    loading: () => [],
                  ),
                  searchLabel: 'Recherche de symptômes',
                  suggestion: const Center(
                    child: Text('Recherchez un symptôme'),
                  ),
                  failure: const Center(
                    child: Text('Aucun symptôme trouvé :('),
                  ),
                  filter: (symptome) => [
                    symptome.label,
                    symptome.id.toString(),
                  ],
                  sort: (a, b) => a.label.compareTo(b.label),
                  builder: (symptome) => ListTile(
                    title: Text(symptome.label),
                    subtitle: Text('ID: ${symptome.id}'),
                    onTap: () {
                      // Print le symptôme sélectionné
                      print('Symptôme sélectionné: ${symptome.label}');

                      // Naviguer vers la page de résultats
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(symptome: symptome),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
        centerTitle: true,
        title: Text("Consultation"),
      ),
      body: apiSymptomes.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Text(
                'Aucun symptôme disponible.\nRecherchez des symptômes en utilisant la barre de recherche.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            return Center(
              child:Text("hey "),
            );
          }
        },
        error: (error, stackTrace) => Center(child: Text('Erreur: $error')),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

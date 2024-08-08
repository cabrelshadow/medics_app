import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:medics/Views/consultation/result.dart';
import 'package:search_page/search_page.dart';

import '../../Model/symptomeModel.dart';
import '../../constant/color_app.dart';
import '../../constant/image_string.dart';
import '../../provider/symptote.dart';
import '../assistance/assistance_chat.dart';

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

    return SafeArea(
      child: Scaffold(
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
                    suggestion:  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/image/recherche.json",width: 100,height: 100, backgroundLoading: false),
                          Text('Recherchez vos symptôme'),
                        ],
                      ),
                    ),
                    failure:  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/image/notfound.json",width: 100,height: 300, backgroundLoading: false),
                          Text('Aucun symptôme trouvé :(',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        ],
                      ),
                    ),
                    filter: (symptome) => [
                      symptome.label,
                      symptome.id.toString(),
                    ],
                    sort: (a, b) => a.label.compareTo(b.label),
                    builder: (symptome) => Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),

                        child: ListTile(

                         leading: Container(
                            width: 50,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.primary
                            ),
                           child: Image.asset(Applogo),
                          ),
                          title: Text(symptome.label),

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
                    ),
                  ),
                );
              },
              icon: Icon(Icons.search,size: 30,color: AppColor.primary,),
            ),
          ],
          centerTitle: true,
        title: Text("Consultation",style: TextStyle(color: AppColor.primary),),
        ),
        body: apiSymptomes.when(
          data: (data) {
            if (data.isEmpty) {
              return Center(
                child: Text(
                  'Aucun symptôme disponible.\nRecherchez des symptômes en utilisant la barre de recherche.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return Center(
                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Lottie.asset("assets/image/consult1.json",width: 300,height: 300, backgroundLoading: false),
                      Text("Rechercher les Symptômes que vous avez\n a fin de determiné de quoi vous souffrez",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15) ,),
                    ],
                  ),
                ),
              );
            }
          },
          error: (error, stackTrace) => Center(child: Text('Erreur: $error')),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
        floatingActionButton: AvatarGlow(
          glowColor: AppColor.primary,
          child:  FloatingActionButton(
            shape:CircleBorder(),
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton flottant
              Get.to(AssistanceChat());
            },
            child: Image.asset(chat,color: Colors.white,),
            backgroundColor: AppColor.primary, // Couleur de fond du bouton flottant
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

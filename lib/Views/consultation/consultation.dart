import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:logger/logger.dart';
import 'package:medics/Model/symptome.dart';
import 'package:medics/Services/Repository/consutationRepository.dart';
import 'package:medics/Services/Repository/symptomeRepository.dart';
import 'package:medics/provider/consultation.dart';
import 'package:medics/provider/symptote.dart';
import 'package:search_page/search_page.dart';

class ConsultationView extends ConsumerStatefulWidget {
  const ConsultationView({super.key});
  @override
  _ConsultationViewState createState() => _ConsultationViewState();
}


class _ConsultationViewState extends ConsumerState<ConsultationView> {


  Consutationrepository consultation = Consutationrepository();
  Symptomerepository symptome = Symptomerepository();
  Symptomes symptomes = Symptomes(symptomes: ['frissons','fatigue']);
  Logger logger = Logger();
  static const people = [
    Person('Mike', 'Barron', 64),
    Person('Todd', 'Black', 30),
    Person('Ahmad', 'Edwards', 55),
    Person('Anthony', 'Johnson', 67),
    Person('Annette', 'Brooks', 39),
  ];
  @override
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    consultation.getConsultation(symptomes);
  }

  @override
  Widget build(BuildContext context) {
    final apiConsultation = ref.watch(apiConsultationsProviderList);
    final apiSymptomes = ref.watch(apiSymptomeProviderList);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()=> showSearch(
        context: context,
        delegate: SearchPage(
          onQueryUpdate: print,
          items: people,
          searchLabel: 'Search people',
          suggestion: const Center(
            child: Text('Filter people by name, surname or age'),
          ),
          failure: const Center(
            child: Text('No person found :('),
          ),
          filter: (person) => [
            person.name,
            person.surname,
            person.age.toString(),
          ],
          sort: (a, b) => a.compareTo(b),
          builder: (person) => ListTile(
            title: Text(person.name),
            subtitle: Text(person.surname),
            trailing: Text('${person.age} yo'),
          ),
        )), icon: Icon(Icons.ice_skating_outlined))
        ],
        centerTitle: true,
        title: Text("Consultation"),

      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
              Container(
              child: apiSymptomes.when(data: (data){
                return   Text("data");
              }, error: (error, stackTrace) => Text('error: $error'), loading: (){
                return CircularProgressIndicator();
              }),
            ),
          
          ],
        ),
      )
    );
  }
}
class Person implements Comparable<Person> {
  final String name, surname;
  final num age;

  const Person(this.name, this.surname, this.age);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}
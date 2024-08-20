import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/Model/ApiModel.dart';
import 'package:medics/Views/maladie/result.dart';
import 'package:medics/Views/maladie/transition.dart';
import 'package:medics/constant/color_app.dart';
import '../../Services/Repository/prediction.dart';

class DiseasePredictorScreen extends StatefulWidget {
  @override
  _DiseasePredictorScreenState createState() => _DiseasePredictorScreenState();
}

class _DiseasePredictorScreenState extends State<DiseasePredictorScreen> {
  // TextEditingControllers pour les caractéristiques numériques
  final TextEditingController _tempController = TextEditingController();
  final TextEditingController _heartRateController = TextEditingController();
  final TextEditingController _respRateController = TextEditingController();

  // Valeurs booléennes pour les symptômes
  final List<bool?> _symptoms = List.filled(9, null);

  PredictionResponse? _result;
  int _currentStep = 0; // Variable pour gérer l'étape actuelle

  @override
  void dispose() {
    _tempController.dispose();
    _heartRateController.dispose();
    _respRateController.dispose();
    super.dispose();
  }


  void _predict() async {
    // Afficher la page de chargement
    Get.to(ProgressPage(), transition: Transition.fade);

    List<double> patientData = [
      double.tryParse(_tempController.text) ?? 0.0,
      double.tryParse(_heartRateController.text) ?? 0.0,
      double.tryParse(_respRateController.text) ?? 0.0,
      _symptoms[0] == true ? 1.0 : 0.0,
      _symptoms[1] == true ? 1.0 : 0.0,
      _symptoms[2] == true ? 1.0 : 0.0,
      _symptoms[3] == true ? 1.0 : 0.0,
      _symptoms[4] == true ? 1.0 : 0.0,
      _symptoms[5] == true ? 1.0 : 0.0,
      _symptoms[6] == true ? 1.0 : 0.0,
      _symptoms[7] == true ? 1.0 : 0.0,
      _symptoms[8] == true ? 1.0 : 0.0,
    ];

    PredictionResponse? result = await predictDisease(patientData);

    // Attendre 4 secondes avant de continuer
    await Future.delayed(Duration(seconds: 4));

    // Si la prédiction réussit, afficher la page des résultats
    if (result != null) {
      Get.off(ResultPage(result: result), transition: Transition.fade);
    } else {
      // Retourner en arrière et afficher un message d'erreur
      Get.back();
      Get.snackbar("Erreur", "La prédiction a échoué, veuillez réessayer.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analyse de symptome'),
        centerTitle: true,
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light().copyWith(primary: AppColor.primary)
        ),
        child: Stepper(
          currentStep: _currentStep,
          onStepTapped: (step) => setState(() => _currentStep = step),
          onStepContinue: () {
            if (_currentStep < _getSteps().length - 1) {
              setState(() => _currentStep += 1);
            } else {

               Get.to(ProgressPage());
               _predict();// Exécute la prédiction à la fin du Stepper
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep -= 1);
            }
          },
          steps: _getSteps(),
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            final isLastStep = _currentStep == _getSteps().length - 1;
            return Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(isLastStep ? 'Terminé' : 'Continuer'),
                  ),
                ),
                if (_currentStep > 0)
                  Expanded(
                    child: TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Retour'),
                    ),
                  ),
              ],
            );
          },

        ),
      ),
    );
  }

  List<Step> _getSteps() {
    return [
      // Étape 1 : Champs numériques
      Step(
        title: Text('Caractéristiques Numériques' ,style: TextStyle(color: AppColor.primary,fontWeight: FontWeight.bold),),
        content:Column(
          children: [
            TextField(
              controller: _tempController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Température corporelle (°C)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // Bordures arrondies
                  borderSide: BorderSide(
                    color: AppColor.primary, // Couleur verte
                    width: 2.0, // Épaisseur de la bordure
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: AppColor.primary, // Couleur verte lorsqu'il est focus
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Espace entre les champs
            TextField(
              controller: _heartRateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Fréquence cardiaque (bpm)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: AppColor.primary,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: AppColor.primary,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _respRateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Fréquence respiratoire (respirations/min)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: AppColor.primary,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: AppColor.primary,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ],
        )
        ,
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,

      ),
      // Étape 2 : Symptômes (1/2)
      Step(
        title: Text('Symptômes (1/2)',style: TextStyle(color: AppColor.primary,fontWeight: FontWeight.bold), ),
        content: Column(
          children: [
            _buildSymptomField('Douleur abdominale', 0),
            _buildSymptomField('Vomissements', 1),
            _buildSymptomField('Diarrhée', 2),
            _buildSymptomField('Maux de tête', 3),
            _buildSymptomField('Fatigue', 4),
          ],
        ),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      // Étape 3 : Symptômes (2/2) et résultats
      Step(
        title: Text('Symptômes (2/2)',style: TextStyle(color: AppColor.primary,fontWeight: FontWeight.bold),),
        content: Column(
          children: [
            _buildSymptomField('Douleurs musculaires', 5),
            _buildSymptomField('Perte d\'appétit', 6),
            _buildSymptomField('Éruption cutanée', 7),
            _buildSymptomField('Jaunisse', 8),
            SizedBox(height: 20),
            if (_result != null) ...[
              Text('Malaria: ${_result!.malaria}'),
              Text('Typhoïde: ${_result!.typhoid}'),
              Text('Conclusion: ${_result!.conclusion}'),
              if (_result!.doctor != null) ...[
                Text('Médecin recommandé: ${_result!.doctor!.name}'),
                Text('Spécialité: ${_result!.doctor!.specialty}'),
                Text('Contact: ${_result!.doctor!.contact}'),
              ],
              if (_result!.medication.isNotEmpty) ...[
                Text('Médicaments recommandés:'),
                for (var med in _result!.medication) Text(med),
              ],
            ],
          ],
        ),
        isActive: _currentStep >= 2,
        state: _currentStep == 2 ? StepState.indexed : StepState.disabled,
      ),
    ];
  }

  // Méthode pour créer un champ de saisie pour les symptômes
  Widget _buildSymptomField(String label, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Oui'),
                leading: Radio<bool?>(
                  value: true,
                  groupValue: _symptoms[index],
                  onChanged: (value) {
                    setState(() {
                      _symptoms[index] = value;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text('Non'),
                leading: Radio<bool?>(
                  value: false,
                  groupValue: _symptoms[index],
                  onChanged: (value) {
                    setState(() {
                      _symptoms[index] = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

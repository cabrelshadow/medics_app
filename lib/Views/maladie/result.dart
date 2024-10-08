import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:medics/Model/ApiModel.dart';
import 'package:medics/constant/color_app.dart';

class ResultPage extends StatelessWidget {
  final PredictionResponse result;

  ResultPage({required this.result});

  @override
  Widget build(BuildContext context) {
    // Déterminer quelle maladie a le pourcentage le plus élevé
    double malariaPercentage = double.tryParse(result.malaria) ?? 0;
    double typhoidPercentage = double.tryParse(result.typhoid) ?? 0;

    // Identifier la maladie avec le plus grand pourcentage
    bool isMalariaHighest = malariaPercentage > typhoidPercentage;

    return Scaffold(
      appBar: AppBar(
        title: Text('Résultats de l\'analyse'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (isMalariaHighest) ...[
              _buildResultCard(
                title: 'Malaria',
                value: result.malaria,
                color: Colors.orange,
                icon: Icons.coronavirus_outlined, // Icône d'erreur pour la maladie la plus élevée
              ),
              SizedBox(height: 16),
              _buildResultCard(
                title: 'Typhoïde',
                value: result.typhoid,
                color: Colors.red,
                icon: Icons.coronavirus_outlined,
              ),
            ] else ...[
              _buildResultCard(
                title: 'Typhoïde',
                value: result.typhoid,
                color: Colors.red,
                icon: Icons.coronavirus_outlined, // Icône d'erreur pour la maladie la plus élevée
              ),
              SizedBox(height: 16),
              _buildResultCard(
                title: 'Malaria',
                value: result.malaria,
                color: Colors.orange,
                icon: Icons.coronavirus_outlined,
              ),
            ],
            SizedBox(height: 16),
            _buildResultCard(
              title: 'Conclusion',
              value: result.conclusion,
              color: Colors.blue,
              icon: Icons.info,
            ),
            SizedBox(height: 16),
            if (result.doctor != null) ...[
              _buildDoctorCard(result.doctor!),
              SizedBox(height: 16),
            ],
            if (result.medication.isNotEmpty) ...[
              _buildMedicationCard(result.medication),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard({
    required String title,
    required String value,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(icon, color: color, size: 40),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard(Doctor doctor) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(Icons.person, color: Colors.green, size: 40),
        title: Text(
          'Médecin recommandé',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nom: ${doctor.name}', style: TextStyle(fontSize: 16)),
            Text('Spécialité: ${doctor.specialty}', style: TextStyle(fontSize: 16)),
            Text('Contact: ${doctor.contact}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationCard(List<String> medications) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Texte des médicaments recommandés
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Médicaments recommandés:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 8),
                  for (var med in medications)
                    Text(
                      med,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                ],
              ),
            ),
            // Bouton d'icône GPS
            AvatarGlow(
              glowColor: AppColor.primary,
              child: IconButton(
                icon: Icon(Icons.location_on),
                color: Colors.blueAccent,
                iconSize: 40,
                onPressed: () {
                  // Action à effectuer lors du clic sur le bouton
                  // Par exemple, vous pouvez ouvrir une carte ou afficher un itinéraire.
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

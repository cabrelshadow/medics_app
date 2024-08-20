// Classe pour représenter un médecin
class Doctor {
  final String name;
  final String specialty;
  final String contact;

  Doctor({
    required this.name,
    required this.specialty,
    required this.contact,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialty: json['specialty'],
      contact: json['contact'],
    );
  }
}

// Classe pour représenter la réponse de l'API
class PredictionResponse {
  final String malaria;
  final String typhoid;
  final String conclusion;
  final Doctor? doctor;
  final List<String> medication;

  PredictionResponse({
    required this.malaria,
    required this.typhoid,
    required this.conclusion,
    required this.doctor,
    required this.medication,
  });

  factory PredictionResponse.fromJson(Map<String, dynamic> json) {
    return PredictionResponse(
      malaria: json['malaria'],
      typhoid: json['typhoid'],
      conclusion: json['conclusion'],
      doctor: json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null,
      medication: List<String>.from(json['medication']),
    );
  }
}

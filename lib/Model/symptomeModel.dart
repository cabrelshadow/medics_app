class SymptomeDetails {
  int id;
  String label;
  int? maladie; // Peut être null
  DateTime createdAt;
  DateTime updatedAt;

  SymptomeDetails({
    required this.id,
    required this.label,
    this.maladie, // Peut être null
    required this.createdAt,
    required this.updatedAt,
  });

  factory SymptomeDetails.fromJson(Map<String, dynamic> json) {
    return SymptomeDetails(
      id: json['id'] ?? 0, // Valeur par défaut si null
      label: json['label'] ?? "", // Valeur par défaut si null
      maladie: json['maladie'], // Peut être null, donc pas de valeur par défaut
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()), // Valeur par défaut si null
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()), // Valeur par défaut si null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'maladie': maladie, // Peut être null, donc pas de conversion spéciale
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

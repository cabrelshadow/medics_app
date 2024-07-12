class SymptomeDetails {
  int id;
  String label;
  int maladie;
  DateTime createdAt;
  DateTime updatedAt;

  SymptomeDetails({
    required this.id,
    required this.label,
    required this.maladie,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SymptomeDetails.fromJson(Map<String, dynamic> json) {
    return SymptomeDetails(
      id: json['id'],
      label: json['label']?? "",
      maladie: json['maladie'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'maladie': maladie,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

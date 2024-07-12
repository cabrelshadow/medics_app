class Symptomes {
  List<String> symptomes;

  Symptomes({required this.symptomes});

  factory Symptomes.fromJson(Map<String, dynamic> json) {
    return Symptomes(
      symptomes: List<String>.from(json['symptomes']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symptomes': symptomes,
    };
  }
}
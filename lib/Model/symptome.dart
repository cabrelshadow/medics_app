class Symptomes {
  final List<String> symptomes;

  Symptomes({required this.symptomes});

  Map<String, dynamic> toJson() {
    return {
      'symptomes': symptomes,
    };
  }
}

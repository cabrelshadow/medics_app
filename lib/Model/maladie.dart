class Maladie {
  final String nom;
  final String description;

  Maladie({required this.nom, required this.description});

  factory Maladie.fromJson(Map<String, dynamic> json) {
    return Maladie(
      nom: json['nom'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'description': description,
    };
  }
}

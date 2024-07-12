class Maladie {
  int maladieId;
  String maladie;
  String medecin;
  int medecinId;
  String traitement;

  Maladie({
    required this.maladieId,
    required this.maladie,
    required this.medecin,
    required this.medecinId,
    required this.traitement,
  });

  factory Maladie.fromJson(Map<String, dynamic> json) {
    return Maladie(
      maladieId: json['maladie_id'],
      maladie: json['maladie'],
      medecin: json['medecin'],
      medecinId: json['medecin_id'],
      traitement: json['traitement'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maladie_id': maladieId,
      'maladie': maladie,
      'medecin': medecin,
      'medecin_id': medecinId,
      'traitement': traitement,
    };
  }
}

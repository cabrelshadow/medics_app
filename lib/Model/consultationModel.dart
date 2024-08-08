class Maladie {
  int? maladieId;
  String? maladie;
  int? medecinId;
  String? medecin;
  String? traitement;

  Maladie({
    this.maladieId,
    this.maladie,
    this.medecinId,
    this.medecin,
    this.traitement,
  });

  factory Maladie.fromJson(Map<String, dynamic> json) {
    return Maladie(
      maladieId: json['maladie_id'],
      maladie: json['maladie'],
      medecinId: json['medecin_id'],
      medecin: json['medecin'],
      traitement: json['traitement'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maladie_id': maladieId,
      'maladie': maladie,
      'medecin_id': medecinId,
      'medecin': medecin,
      'traitement': traitement,
    };
  }
}

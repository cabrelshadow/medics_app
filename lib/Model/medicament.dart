class Medicament {
  String nomMedicament;
  String categorieMedicament;
  String photoUrl;

  Medicament({required this.nomMedicament, required this.categorieMedicament, required this.photoUrl});

  Map<String, dynamic> toMap() {
    return {
      'nomMedicament': nomMedicament,
      'categorieMedicament': categorieMedicament,
      'photoUrl': photoUrl,
    };
  }
}

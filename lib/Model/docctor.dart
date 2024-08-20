class Doctor {
  final String name;
  final String specialty;
  final String contact;

  Doctor({required this.name, required this.specialty, required this.contact});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialty: json['specialty'],
      contact: json['contact'],
    );
  }
}

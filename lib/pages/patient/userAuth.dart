class User {
  final String patientName;
  final int age;
  final String address;
  final List<Medicine> medicines;
  final String additionalNotes;
  final String instructions;

  User({
    required this.patientName,
    required this.age,
    required this.address,
    required this.medicines,
    required this.additionalNotes,
    required this.instructions,
  });
}

class Medicine {
  final String name;
  final int dosage;
  final String details;

  Medicine({
    required this.name,
    required this.dosage,
    required this.details,
  });
}
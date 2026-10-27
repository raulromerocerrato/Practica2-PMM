class Persona {
  String fullName;
  String emailAddress;
  DateTime dateOfBirth;

  Persona({
    required this.fullName,
    required this.emailAddress,
    required this.dateOfBirth,
  });

  factory Persona.defaults() {
    return Persona(
      fullName: "Raúl Romero Cerrato", 
      emailAddress: "raulromero@gmail.com", 
      dateOfBirth: DateTime(2007,07,09)
    );
  }

  String get formatBirthDate {
    var day = dateOfBirth.day.toString().padLeft(2,'0');
    var month = dateOfBirth.month.toString().padLeft(2, '0');
    return '$day/$month/${dateOfBirth.year}';
  }
}
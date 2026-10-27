class Persona {
  String firstName;
  String lastName;
  String emailAddress;
  DateTime dateOfBirth;
  String password;

  Persona({
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.dateOfBirth,
    required this.password
  });

  factory Persona.defaults() {
    return Persona(
      firstName: "Raúl",
      lastName: "Romero",
      emailAddress: "raulromero@gmail.com", 
      dateOfBirth: DateTime(2007,07,09),
      password: "1234"
    );
  }

  String get fullName => '$firstName $lastName';

  String get formatBirthDate {
    return '${dateOfBirth.day}/${dateOfBirth.month}/${dateOfBirth.year}';
  }
}
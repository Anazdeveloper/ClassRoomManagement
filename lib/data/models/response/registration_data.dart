class RegistrationData {
  List<Registration> registrations;

  RegistrationData({
    required this.registrations,
  });

  factory RegistrationData.fromJson(Map<String, dynamic> json) => RegistrationData(
    registrations: List<Registration>.from(json["registrations"].map((x) => Registration.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "registrations": List<dynamic>.from(registrations.map((x) => x.toJson())),
  };
}

class Registration {
  int id;
  int student;
  int subject;

  Registration({
    required this.id,
    required this.student,
    required this.subject,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
    id: json["id"],
    student: json["student"],
    subject: json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student": student,
    "subject": subject,
  };
}

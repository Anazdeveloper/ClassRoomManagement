class RegistrationBody {
  final int student;
  final int subject;

  RegistrationBody({required this.student, required this.subject});

  Map<String, dynamic> toJson() =>
      {"student": student.toString(),
        "subject": subject.toString()
      };
}
import 'package:equatable/equatable.dart';

class NewRegistrationEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class Register extends NewRegistrationEvents {
  final int subjectId, studentId;

  Register({required this.subjectId, required this.studentId});
}
import 'package:class_room_management_hamon/data/models/response/student.dart';
import 'package:class_room_management_hamon/data/models/response/subjects.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:equatable/equatable.dart';

class RegistrationDetailsStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegDetailsInitialLoading extends RegistrationDetailsStates {

}

class DetailsFetched extends RegistrationDetailsStates {
  final Student studentDetails;
  final Subject subjectDetails;

  DetailsFetched({required this.studentDetails, required this.subjectDetails});

  @override
  List<Object?> get props => [studentDetails, subjectDetails];
}

class DetailsFetchingFailed extends RegistrationDetailsStates {
  final ApiError error;

  DetailsFetchingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

class DeletionInitiated extends RegistrationDetailsStates {}

class Deleted extends RegistrationDetailsStates {
  final String message;

  Deleted({required this.message});

  @override
  List<Object?> get props => [message];
}

class DeletionFailed extends RegistrationDetailsStates {
  final ApiError error;

  DeletionFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
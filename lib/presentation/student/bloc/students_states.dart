import 'package:class_room_management_hamon/data/models/response/student.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:equatable/equatable.dart';

class StudentsStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialLoading extends StudentsStates {}

class StudentsListFetched extends StudentsStates {
  final Students students;

  StudentsListFetched({required this.students});

  @override
  List<Object?> get props => [students];
}

class StudentsFetchingFailed extends StudentsStates {
  final ApiError error;

  StudentsFetchingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
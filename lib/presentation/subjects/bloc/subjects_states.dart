import 'package:class_room_management_hamon/data/models/response/subjects.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:equatable/equatable.dart';

class SubjectsStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialLoading extends SubjectsStates {}

class SubjectsFetched extends SubjectsStates {
  final Subjects subjects;

  SubjectsFetched({required this.subjects});

  @override
  List<Object?> get props => [subjects];
}

class SubjectsFetchingFailed extends SubjectsStates {
  final ApiError error;

  SubjectsFetchingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
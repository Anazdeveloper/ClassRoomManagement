import 'package:class_room_management_hamon/data/models/response/classroom_detail.dart';
import 'package:class_room_management_hamon/data/models/response/subjects.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:equatable/equatable.dart';

class ClassroomLayoutStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class ClassroomInitialLoading extends ClassroomLayoutStates {}

class ClassroomDetailsFetched extends ClassroomLayoutStates {
  final ClassroomDetail detail;
  final Subject ? fetchedSubject;

  ClassroomDetailsFetched({required this.detail, this.fetchedSubject});

  @override
  List<Object?> get props => [detail, fetchedSubject];
}

class ClassroomDetailFetchingFailed extends ClassroomLayoutStates {
  final ApiError error;

  ClassroomDetailFetchingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

class UpdateInitiated extends ClassroomLayoutStates {}

class Updated extends ClassroomLayoutStates {
  final String message;

  Updated({required this.message});

  @override
  List<Object?> get props => [message];
}

class UpdateFailed extends ClassroomLayoutStates {
  final ApiError error;

  UpdateFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
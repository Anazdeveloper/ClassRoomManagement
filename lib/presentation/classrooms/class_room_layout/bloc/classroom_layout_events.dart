import 'package:equatable/equatable.dart';

class ClassroomLayoutEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetClassroomDetails extends ClassroomLayoutEvents {
  final int id;

  GetClassroomDetails({required this.id});
}

class UpdateClassroomDetails extends ClassroomLayoutEvents {
  final int id;
  final int subjectId;

  UpdateClassroomDetails({required this.id, required this.subjectId});
}
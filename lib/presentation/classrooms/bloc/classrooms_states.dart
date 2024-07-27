import 'package:class_room_management_hamon/data/models/response/class_rooms.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:equatable/equatable.dart';

class ClassRoomsStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialLoading extends ClassRoomsStates {}

class ClassRoomsFetched extends ClassRoomsStates {
  final ClassRooms classRoomData;

  ClassRoomsFetched({required this.classRoomData});

  @override
  List<Object?> get props => [classRoomData];
}

class ClassRoomFetchingFailed extends ClassRoomsStates {
  final ApiError error;

  ClassRoomFetchingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
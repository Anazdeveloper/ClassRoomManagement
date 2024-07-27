import 'package:class_room_management_hamon/data/repos/classroom_repository.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/presentation/classrooms/bloc/classrooms_events.dart';
import 'package:class_room_management_hamon/presentation/classrooms/bloc/classrooms_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassRoomBloc extends Bloc<ClassRoomsEvents, ClassRoomsStates> {
  ClassRoomBloc(): super(InitialLoading()){
    on<GetClassrooms>((event, emit) async {
      try {
        emit(InitialLoading());
        final classRooms = await ClassRoomRepository().getClassRoomsList();
        emit(ClassRoomsFetched(classRoomData: classRooms));
      } catch(e) {
        if(e is ApiError) {
          emit(ClassRoomFetchingFailed(error: e));
        } else {
          print("Error: $e");
        }
      }
    });
  }
}
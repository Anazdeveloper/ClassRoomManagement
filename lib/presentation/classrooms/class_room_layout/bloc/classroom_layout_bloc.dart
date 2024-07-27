import 'package:class_room_management_hamon/data/repos/classroom_repository.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/presentation/classrooms/class_room_layout/bloc/classroom_layout_events.dart';
import 'package:class_room_management_hamon/presentation/classrooms/class_room_layout/bloc/classroom_layout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassroomLayoutBloc extends Bloc<ClassroomLayoutEvents, ClassroomLayoutStates> {
  ClassroomLayoutBloc(): super(ClassroomInitialLoading()) {
    on<GetClassroomDetails>((event, emit) async {
      try {
        emit(ClassroomInitialLoading());
        final detail = await ClassRoomRepository().getClassroomDetails(id: event.id);
        if(detail.subject != "") {
          final subject = await ClassRoomRepository().getSubjectDetails(id: detail.subject);
          emit(ClassroomDetailsFetched(detail: detail, fetchedSubject: subject));
        } else {
          emit(ClassroomDetailsFetched(detail: detail));
        }
      } catch(e) {
        if(e is ApiError) {
          emit(ClassroomDetailFetchingFailed(error: e));
        }
      }
    });

    on<UpdateClassroomDetails>((event, emit) async {
      try {
        emit(UpdateInitiated());
        final message = await ClassRoomRepository().updateClassroomDetails(id: event.id, subjectId: event.subjectId);
        emit(Updated(message: message));
      } catch(e) {
        if(e is ApiError) {
          emit(UpdateFailed(error: e));
        }
      }
    });

  }
}
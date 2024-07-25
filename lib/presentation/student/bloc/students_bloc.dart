import 'package:class_room_management_hamon/data/repos/student_repository.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/presentation/student/bloc/students_events.dart';
import 'package:class_room_management_hamon/presentation/student/bloc/students_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsBloc extends Bloc<StudentsEvents, StudentsStates> {
  StudentsBloc(): super(InitialLoading()) {
    on<GetStudents>((event, emit) async {
      try {
        emit(InitialLoading());
        final students = await StudentRepository().getStudentsList();
        emit(StudentsListFetched(students: students));
      } catch(e) {
        if(e is ApiError) {
          emit(StudentsFetchingFailed(error: e));
        } else {
          print("Error: $e");
        }
      }
    });
  }

}
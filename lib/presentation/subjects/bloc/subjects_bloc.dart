import 'package:class_room_management_hamon/data/repos/subject_repository.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/presentation/subjects/bloc/subjects_events.dart';
import 'package:class_room_management_hamon/presentation/subjects/bloc/subjects_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsBloc extends Bloc<SubjectsEvents, SubjectsStates> {
  SubjectsBloc(): super(InitialLoading()) {
    on<GetSubjects>((event, emit) async {
      try {
        emit(InitialLoading());
        final subjects = await SubjectRepository().getSubjectList();
        emit(SubjectsFetched(subjects: subjects));
      } catch(e) {
        if(e is ApiError) {
          emit(SubjectsFetchingFailed(error: e));
        } else {
          print("Error: $e");
        }
      }
    });
  }
}
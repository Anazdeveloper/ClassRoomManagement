import 'package:class_room_management_hamon/data/repos/registration_repository.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_details/bloc/registration_details_events.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_details/bloc/registration_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationDetailsBloc extends Bloc<RegistrationDetailsEvents, RegistrationDetailsStates> {
  RegistrationDetailsBloc(): super(RegDetailsInitialLoading()) {
    on<GetDetails>((event, emit) async {
      try {
        emit(RegDetailsInitialLoading());
        final subject = await RegistrationRepository().getSubject(id: event.registration.subject);
        final student = await RegistrationRepository().getStudent(id: event.registration.student);
        emit(DetailsFetched(studentDetails: student, subjectDetails: subject));
      } catch(e) {
        if(e is ApiError) {
          emit(DetailsFetchingFailed(error: e));
        }
      }
    });

    on<DeleteRegistration>((event, emit) async {
      try {
        emit(DeletionInitiated());
        final message = await RegistrationRepository().deleteRegistration(id: event.id);
        emit(Deleted(message: message));
      } catch(e) {
        if(e is ApiError) {
          emit(DeletionFailed(error: e));
        } else {
          print("DeletionFailed: $e");
        }
      }
    });
  }
}
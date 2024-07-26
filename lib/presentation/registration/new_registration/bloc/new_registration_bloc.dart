import 'package:class_room_management_hamon/data/repos/registration_repository.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/presentation/registration/new_registration/bloc/new_registration_events.dart';
import 'package:class_room_management_hamon/presentation/registration/new_registration/bloc/new_registration_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewRegistrationBloc extends Bloc<NewRegistrationEvents, NewRegistrationStates> {
  NewRegistrationBloc(): super(InitialLoading()) {
    on<Register>((event, emit) async {
      try {
        emit(InitialLoading());
        final message = await RegistrationRepository().register(subjectId: event.subjectId, studentId: event.studentId);
        emit(RegistrationSuccessful(message: message));
      } catch(e) {
        if(e is ApiError) {
          emit(RegistrationFailure(error: e));
        } else {
          print("Registration error: $e");
        }
      }
    });
  }
}
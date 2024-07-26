import 'package:class_room_management_hamon/data/repos/registration_repository.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_page/bloc/registration_page_events.dart';
import 'package:class_room_management_hamon/presentation/registration/registration_page/bloc/registration_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPageBloc extends Bloc<RegistrationPageEvents, RegistrationPageStates> {
  RegistrationPageBloc(): super(InitialLoading()) {
    on<GetRegistrationData>((event, emit) async {
      try {
        emit(InitialLoading());
        final data = await RegistrationRepository().getRegistrationData();

        if(data.registrations.isEmpty) {
          emit(RegistrationDataEmpty(message: "No Data"));
        } else {
          emit(RegistrationDataFetched(registrationData: data));
        }
      } catch(e) {
        if(e is ApiError) {
          emit(RegistrationDataFetchingFailed(error: e));
        }
      }
    });
  }
}
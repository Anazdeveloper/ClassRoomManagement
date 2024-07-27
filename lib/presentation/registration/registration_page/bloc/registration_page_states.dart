import 'package:class_room_management_hamon/data/models/response/registration_data.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:equatable/equatable.dart';

class RegistrationPageStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialLoading extends RegistrationPageStates {}

class RegistrationDataFetched extends RegistrationPageStates {
  final RegistrationData registrationData;

  RegistrationDataFetched({required this.registrationData});

  @override
  List<Object?> get props => [registrationData];
}

class RegistrationDataEmpty extends RegistrationPageStates {
  final String message;

  RegistrationDataEmpty({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegistrationDataFetchingFailed extends RegistrationPageStates {
  final ApiError error;

  RegistrationDataFetchingFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
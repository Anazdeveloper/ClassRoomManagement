import 'package:class_room_management_hamon/data/models/response/registration_data.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:equatable/equatable.dart';

class NewRegistrationStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialLoading extends NewRegistrationStates {}

class RegistrationSuccessful extends NewRegistrationStates {
  final String message;

  RegistrationSuccessful({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegistrationFailure extends NewRegistrationStates {
  final ApiError error;

  RegistrationFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
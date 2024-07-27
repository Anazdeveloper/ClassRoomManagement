import 'package:class_room_management_hamon/data/models/response/registration_data.dart';
import 'package:equatable/equatable.dart';

class RegistrationDetailsEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetDetails extends RegistrationDetailsEvents {
  final Registration registration;

  GetDetails({required this.registration});
}

class DeleteRegistration extends RegistrationDetailsEvents {
  final int id;

  DeleteRegistration({required this.id});

  @override
  List<Object?> get props => [id];
}
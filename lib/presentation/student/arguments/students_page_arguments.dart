import 'package:class_room_management_hamon/data/models/response/student.dart';

class StudentsPageArguments {
  final bool isSelection;
  final void Function(Student) ? selectStudent;

  StudentsPageArguments({required this.isSelection, this.selectStudent});
}
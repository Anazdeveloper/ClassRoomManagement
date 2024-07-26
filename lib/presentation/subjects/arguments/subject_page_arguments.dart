import 'package:class_room_management_hamon/data/models/response/subjects.dart';

class SubjectPageArguments {
  final bool isSelection;
  final void Function(Subject) ? selectSubject;

  SubjectPageArguments({required this.isSelection, this.selectSubject});
}
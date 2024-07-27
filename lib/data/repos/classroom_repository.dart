import 'dart:convert';

import 'package:class_room_management_hamon/data/models/response/class_rooms.dart';
import 'package:class_room_management_hamon/data/models/response/classroom_detail.dart';
import 'package:class_room_management_hamon/data/models/response/subjects.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/network/http_client.dart';
import 'package:class_room_management_hamon/network/urls.dart';
import 'package:http/http.dart' as http;

class ClassRoomRepository {
  static final ClassRoomRepository _instance = ClassRoomRepository._internal();
  final CRMHttpClient _crmHttpClient = CRMHttpClient();
  final apiKey = {"api_key" : 'E8cDF'};

  ClassRoomRepository._internal();

  factory ClassRoomRepository() {
    return _instance;
  }

  Future<ClassRooms> getClassRoomsList() async {
    final response = await _crmHttpClient.get(urlPath: Urls.classrooms, queryParameters: apiKey);

    if(response.success) {
      return ClassRooms.fromJson(response.result);
    }
    throw ApiError(title: "Failure", message: response.error);
  }

  Future<ClassroomDetail> getClassroomDetails({required int id}) async {
    final response = await _crmHttpClient.get(urlPath: "${Urls.classrooms}/$id", queryParameters: apiKey);

    if(response.success) {
      return ClassroomDetail.fromJson(response.result);
    }
    throw ApiError(title: "Failure", message: response.error);
  }

  Future<Subject> getSubjectDetails({required int id}) async {
    final response = await _crmHttpClient.get(urlPath: "${Urls.subjects}/$id", queryParameters: apiKey);

    if(response.success) {
      return Subject.fromJson(response.result);
    }
    throw ApiError(title: "Failure", message: response.error);
  }


  Future<String> updateClassroomDetails({required int id, required int subjectId}) async {
    final response = await http.patch(Uri.parse("${Urls.classrooms}/$id?api_key=E8cDF"),body: {"subject": subjectId.toString()});

    if(response.statusCode == 200) {
      return "Successfully Added";
    }
    throw ApiError(title: "Failure", message: jsonDecode(response.body)["error"]);
  }

}
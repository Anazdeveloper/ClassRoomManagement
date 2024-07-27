
import 'dart:convert';

import 'package:class_room_management_hamon/data/models/request/registration_body.dart';
import 'package:class_room_management_hamon/data/models/response/registration_data.dart';
import 'package:class_room_management_hamon/data/models/response/student.dart';
import 'package:class_room_management_hamon/data/models/response/subjects.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/network/http_client.dart';
import 'package:class_room_management_hamon/network/urls.dart';
import 'package:http/http.dart' as http;

class RegistrationRepository {
  static final RegistrationRepository _instance = RegistrationRepository._internal();
  final CRMHttpClient _crmHttpClient = CRMHttpClient();
  final apiKey = {"api_key" : 'E8cDF'};

  RegistrationRepository._internal();

  factory RegistrationRepository() {
    return _instance;
  }

  Future<RegistrationData> getRegistrationData() async {
    final response = await _crmHttpClient.get(urlPath: Urls.registration, queryParameters: apiKey);

    if(response.success) {
      return RegistrationData.fromJson(response.result);
    }
    throw ApiError(title: "Failure", message: response.error);
  }

  Future<String> register({required int subjectId, required int studentId}) async {
    final body = RegistrationBody(student: studentId, subject: subjectId).toJson();
    final response = await http.post(Uri.parse("${Urls.registration}/?api_key=E8cDF"),body: body);


    if(response.statusCode == 200) {
      print("Response: ${response.body}");
      return "Success";
    }
    throw ApiError(title: "Failure", message: jsonDecode(response.body)["error"]);
  }

  Future<Subject> getSubject({required int id}) async {
    final response = await _crmHttpClient.get(urlPath: "${Urls.subjects}/$id", queryParameters: apiKey);

    if(response.success) {
      return Subject.fromJson(response.result);
    }
    throw ApiError(title: "Failure", message: response.error);
  }

  Future<Student> getStudent({required int id}) async {
    final response = await _crmHttpClient.get(urlPath: "${Urls.students}/$id", queryParameters: apiKey);

    if(response.success) {
      return Student.fromJson(response.result);
    }
    throw ApiError(title: "Failure", message: response.error);
  }

  Future<String> deleteRegistration({required int id}) async {
    final response = await _crmHttpClient.delete(urlPath: "${Urls.registration}/$id", queryParameters: apiKey);

    if(response.success) {
      return response.result["message"];
    }
    throw ApiError(title: "Failure", message: response.error);
  }
}
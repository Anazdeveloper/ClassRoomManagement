
import 'dart:convert';

import 'package:class_room_management_hamon/data/models/request/registration_body.dart';
import 'package:class_room_management_hamon/data/models/response/registration_data.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/network/http_client.dart';
import 'package:class_room_management_hamon/network/urls.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

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
}
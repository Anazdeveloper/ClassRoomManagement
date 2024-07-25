import 'package:class_room_management_hamon/data/models/response/student.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/network/http_client.dart';
import 'package:class_room_management_hamon/network/urls.dart';

class StudentRepository {
  static final StudentRepository _instance = StudentRepository._internal();
  final CRMHttpClient _crmHttpClient = CRMHttpClient();
  final apiKey = {"api_key" : 'E8cDF'};

  StudentRepository._internal();

  factory StudentRepository() {
    return _instance;
  }

  Future<Students> getStudentsList() async {
    final response = await _crmHttpClient.get(urlPath: Urls.students, queryParameters: apiKey);

    if(response.success) {
      return Students.fromJson(response.result);
    }
    throw ApiError(title: "Failure", message: response.error);
  }
}
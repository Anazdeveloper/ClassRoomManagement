import 'package:class_room_management_hamon/data/models/response/subjects.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/network/http_client.dart';
import 'package:class_room_management_hamon/network/urls.dart';

class SubjectRepository {
  static final SubjectRepository _instance = SubjectRepository._internal();
  final CRMHttpClient _crmHttpClient = CRMHttpClient();
  final apiKey = {"api_key" : 'E8cDF'};

  SubjectRepository._internal();

  factory SubjectRepository() {
    return _instance;
  }

  Future<Subjects> getSubjectList() async {
    final response = await _crmHttpClient.get(urlPath: Urls.subjects, queryParameters: apiKey);

    if(response.success) {
      return Subjects.fromJson(response.result);
    }
    throw ApiError(title: "Failure", message: response.error);

  }
}
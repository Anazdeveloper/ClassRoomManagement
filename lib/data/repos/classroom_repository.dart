import 'package:class_room_management_hamon/data/models/response/class_rooms.dart';
import 'package:class_room_management_hamon/network/failures.dart';
import 'package:class_room_management_hamon/network/http_client.dart';
import 'package:class_room_management_hamon/network/urls.dart';

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
}
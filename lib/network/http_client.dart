import 'package:class_room_management_hamon/network/http_response.dart';
import 'package:dio/dio.dart';

class CRMHttpClient {
  static final CRMHttpClient _mInstance = CRMHttpClient._();
  final Dio _dio = Dio();

  factory CRMHttpClient() {
    return _mInstance;
  }

  CRMHttpClient._();

  Future<HttpResponse> post({urlPath, body, header, queryParameters}) async {
    try {
      Response response = await _dio.post(urlPath,
          data: body,
          queryParameters: queryParameters,
          options: Options(receiveDataWhenStatusError: true, headers: header, followRedirects: false));
      print("Api Response of $urlPath: $response");
      return HttpResponse.fromJson(response.data, true);
    } on DioException catch (e) {
      print(e.response);
      if (e.response?.statusCode == 301 || e.response?.statusCode == 308) {
        final redirectUrl = e.response?.headers.value('location');
        if (redirectUrl != null) {
          final response = await _dio.get(
            redirectUrl,
            options: Options(
              receiveDataWhenStatusError: true,
              headers: header,
            ),
          );
          print("Redirected response: $response");
          return HttpResponse.fromJson(response.data, true);
        }
      }
      return HttpResponse.withError(e.response?.data, false);
    }
  }

  Future<HttpResponse> get({urlPath, body, header, queryParameters}) async {
    try {
      Response response = await _dio.get(urlPath,
          queryParameters: queryParameters,
          options: Options(receiveDataWhenStatusError: true, headers: header));
      print("Api Response of $urlPath: $response");
      return HttpResponse.fromJson(response.data, true);
    } on DioException catch (e) {
      print(e.response);
      return HttpResponse.withError(e.response?.data, false);
    }
  }

  Future<HttpResponse> delete({urlPath, body, header, queryParameters}) async {
    try {
      Response response = await _dio.delete(urlPath,
          queryParameters: queryParameters,
          options: Options(receiveDataWhenStatusError: true, headers: header));
      print("Api Response of $urlPath: $response");
      return HttpResponse.fromJson(response.data, true);
    } on DioException catch (e) {
      print(e.response);
      return HttpResponse.withError(e.response?.data, false);
    }
  }
}

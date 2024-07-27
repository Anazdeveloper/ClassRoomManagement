class HttpResponse {
  final dynamic result;
  final bool success;
  final String ? error;

  HttpResponse({this.result, this.error, required this.success});

  HttpResponse.fromJson(Map<String, dynamic> json, this.success) :
      result = json,
      error = null;

  HttpResponse.withError(Map<String, dynamic> json, this.success):
      result = null,
      error = json["error"];
}
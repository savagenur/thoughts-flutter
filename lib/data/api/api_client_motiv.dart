import 'package:get/get.dart';

class ApiClientMotiv extends GetConnect implements GetxService {
  final String appBaseUrl;
  late final token;
  late Map<String, String> _mainHeaders;
  ApiClientMotiv({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = '';
    _mainHeaders = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token"
    };
  }

  Future<Response> getData(uri) async {
    Response response = await get(uri);
    try {
      if (response.statusCode == 200) {
        return response;
      }
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
    return Response(statusText: "Something is wrong");
  }
}

import 'package:get/get.dart';
import 'package:thoughts_flutter/data/api/api_client.dart';
import 'package:thoughts_flutter/utils/app_constants.dart';

class InspirationRepo extends GetConnect implements GetxService {
  final ApiClient apiClient;
  InspirationRepo({required this.apiClient});

  Future<Response> getData() async {
    return apiClient.getData(AppConstants.INSPIRATION_URL);
  }
}

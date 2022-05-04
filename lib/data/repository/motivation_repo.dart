import 'package:get/get.dart';
import 'package:thoughts_flutter/data/api/api_client.dart';
import 'package:thoughts_flutter/data/api/api_client_motiv.dart';
import 'package:thoughts_flutter/utils/app_constants.dart';

class MotivationRepo extends GetConnect implements GetxService {
  final ApiClientMotiv apiClient;

  MotivationRepo({required this.apiClient});

  Future<Response> getData() async {
    Response response = await apiClient.getData(AppConstants.MOTIV_URL);
    return response;
  }
}

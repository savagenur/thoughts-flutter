import 'package:get/get.dart';
import 'package:thoughts_flutter/data/api/api_client.dart';
import 'package:thoughts_flutter/utils/app_constants.dart';

class ThoughtOfDayRepo extends GetConnect implements GetxService {
  final ApiClient apiClient;

  ThoughtOfDayRepo({required this.apiClient});

  Future<Response> getData() async {
    Response response =
        await apiClient.getData(AppConstants.THOUGHT_OF_THE_DAY_URL);
    return response;
  }
}

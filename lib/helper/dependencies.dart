import 'package:get/get.dart';
import 'package:thoughts_flutter/data/api/api_client.dart';
import 'package:thoughts_flutter/data/api/api_client_motiv.dart';
import 'package:thoughts_flutter/data/controller/favorites_controller.dart';
import 'package:thoughts_flutter/data/controller/inspiration_controller.dart';
import 'package:thoughts_flutter/data/controller/motivation_controller.dart';
import 'package:thoughts_flutter/data/controller/thought_of_day_controller.dart';
import 'package:thoughts_flutter/data/repository/inspiration_repo.dart';
import 'package:thoughts_flutter/data/repository/motivation_repo.dart';
import 'package:thoughts_flutter/data/repository/thought_of_day_repo.dart';
import 'package:thoughts_flutter/utils/app_constants.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => ApiClientMotiv(appBaseUrl: AppConstants.BASE_MOTIV_URL));

  Get.lazyPut(() => InspirationRepo(apiClient: Get.find()));
  Get.lazyPut(() => ThoughtOfDayRepo(apiClient: Get.find()));
  Get.lazyPut(() => MotivationRepo(apiClient: Get.find()));

  Get.lazyPut(() => InspirationController(inspirationRepo: Get.find()));
  Get.lazyPut(() => ThoughtOfDayController(thoughtOfDayRepo: Get.find()));
  Get.lazyPut(() => MotivationController(motivationRepo: Get.find()));
  Get.lazyPut(() => FavoritesController());
}

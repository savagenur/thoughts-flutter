import 'package:get/get.dart';
import 'package:thoughts_flutter/data/repository/thought_of_day_repo.dart';
import 'package:thoughts_flutter/models/inspiration_model.dart';

class ThoughtOfDayController extends GetxController {
  final ThoughtOfDayRepo thoughtOfDayRepo;

  ThoughtOfDayController({required this.thoughtOfDayRepo});
  String _thought = '';
  String get thought => _thought;

  Future<void> getItem() async {
    Response response = await thoughtOfDayRepo.getData();
    if (response.statusCode == 200) {
      _thought = '';
      _thought += InspirationModel.fromJson(response.body[0]).quote! +
          " - " +
          InspirationModel.fromJson(response.body[0]).author!;
      // print("Got thought of the day");
      // print(_thought);

      update();
    }
  }
}

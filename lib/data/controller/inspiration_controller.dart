import 'package:get/get.dart';
import 'package:thoughts_flutter/data/repository/inspiration_repo.dart';
import 'package:thoughts_flutter/models/inspiration_model.dart';

class InspirationController extends GetxController {
  final InspirationRepo inspirationRepo;
   List<InspirationModel> _quotes = [];
  List<InspirationModel> get quotes => _quotes;

  InspirationController({required this.inspirationRepo});

  Future<void> getInspirationList() async {
    Response response = await inspirationRepo.getData();
    if (response.statusCode == 200) {
      _quotes = [];
      // var len = json.decode(response.body);
      // int res = (len as Map<String, dynamic>).length;

      for (int i = 0; i < 45; i++) {
        _quotes.add(InspirationModel.fromJson(response.body[i]));
      }
      update();
      // print("Got data");

      // print(_quotes.length);
      // print(_quotes);
    }
  }
}

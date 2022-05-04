import 'package:flutter/material.dart';
import 'package:thoughts_flutter/data/controller/favorites_controller.dart';
import 'package:thoughts_flutter/data/controller/inspiration_controller.dart';
import 'package:thoughts_flutter/data/controller/motivation_controller.dart';
import 'package:thoughts_flutter/data/controller/thought_of_day_controller.dart';
import 'package:thoughts_flutter/pages/favorites_page.dart';
import 'package:thoughts_flutter/pages/inspiration_page.dart';
import 'package:thoughts_flutter/pages/main_page.dart';
import 'package:thoughts_flutter/pages/motivation_page2.dart';
import 'package:thoughts_flutter/pages/pictures_page.dart';
import 'package:thoughts_flutter/pages/thought_of_day_page.dart';
import 'package:thoughts_flutter/pages/welcome_page.dart';
import 'package:get/get.dart';
import 'package:thoughts_flutter/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<InspirationController>().getInspirationList();
    Get.find<ThoughtOfDayController>().getItem();
    Get.find<MotivationController>().getPics();
    Get.find<FavoritesController>();
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: WelcomePage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

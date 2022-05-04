import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughts_flutter/data/controller/inspiration_controller.dart';
import 'package:thoughts_flutter/data/controller/thought_of_day_controller.dart';
import 'package:thoughts_flutter/widgets/app_bar.dart';
import 'package:thoughts_flutter/widgets/big_text.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';

class ThoughtOfDayPage extends StatefulWidget {
  const ThoughtOfDayPage({Key? key}) : super(key: key);

  @override
  State<ThoughtOfDayPage> createState() => _ThoughtOfDayPageState();
}

class _ThoughtOfDayPageState extends State<ThoughtOfDayPage> {
  @override
  Widget build(BuildContext context) {
    var quote = Get.find<ThoughtOfDayController>().thought;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar0(topic: "Thoughts of The Day"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image(
              alignment: Alignment(0, -1),
              image: AssetImage("assets/images/insBg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          GetBuilder<ThoughtOfDayController>(builder: (thoughtCont) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BigText(
                    text: thoughtCont.thought,
                    isShadow: true,
                    size: 40,
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

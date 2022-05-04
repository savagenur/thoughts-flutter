import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughts_flutter/routes/route_helper.dart';
import 'package:thoughts_flutter/widgets/big_text.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.mainPage);
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcome_page.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              bottom: 60,
              left: 50,
              right: 50,
              child: Center(child: BigText(text: "Stay Motivated!")),
            ),
            Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Center(
                    child: SmallText(
                  color: Color.fromARGB(255, 223, 225, 228),
                  text: "Tap anywhere to proceed >>>",
                )))
          ],
        ),
      ),
    );
  }
}

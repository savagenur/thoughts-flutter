import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughts_flutter/data/controller/motivation_controller.dart';
import 'package:thoughts_flutter/routes/route_helper.dart';
import 'package:thoughts_flutter/utils/app_colors.dart';
import 'package:thoughts_flutter/widgets/app_bar.dart';
import 'package:thoughts_flutter/widgets/big_text.dart';
import 'package:thoughts_flutter/widgets/main_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    List<String> topics = [
      'Inspiration',
      'Motivation',
      'Thoughts In Pics',
      'Favorites',
    ];

    List<String> imgs = [
      "assets/images/bgimg/bgins.png",
      "assets/images/bgimg/bgmot.jpg",
      "assets/images/bgimg/pics.jpg",
      "assets/images/bgimg/bgfav.png",
    ];

    late List routes = [
      Get.toNamed(RouteHelper.getInsPage()),
      Get.toNamed(RouteHelper.getInitial()),
      Get.toNamed(RouteHelper.getPicuresPage()),
      Get.toNamed(RouteHelper.getInitial()),
    ];

    // print(Get.mediaQuery)
    PageController _gridController = PageController();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar0(topic: "Thoughts"),
      ),
      body: Column(
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                    image: AssetImage("assets/images/back_img2.jpg"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 5,
            child: Container(color: Color.fromARGB(255, 40, 43, 46)),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getThoughtOfDayPage());
                },
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        // alignment: Alignment(-50, -100),
                        padding: EdgeInsets.only(top: 50),
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.8,
                            alignment: Alignment(0, -0.3),
                            image: AssetImage("assets/images/bgimg/bg1.jpg"),
                            fit: BoxFit.cover,
                          ),
                          // color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 85,
                      right: 50,
                      top: 25,
                      child: MainText(
                        text: "Thought of The Day",
                        size: 30,
                        color: Colors.white,
                        isShadow: true,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 350,
            child: GridView.count(
              controller: _gridController,
              // physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: EdgeInsets.symmetric(horizontal: 5),
              crossAxisCount: 2,
              children: List.generate(imgs.length, (index) {
                return GetBuilder<MotivationController>(
                    builder: (motivController) {
                  return GestureDetector(
                    onTap: () async {
                      if (index == 0) {
                        Get.toNamed(RouteHelper.insPage);
                      } else if (index == 1) {
                        Get.toNamed(RouteHelper.motivationPage);
                          await motivController.loadTrue();
                          await Future.delayed(Duration(seconds: 4));
                           await motivController.loadFalse();
                       

                        ;
                      } else if (index == 2) {
                        Get.toNamed(RouteHelper.picturesPage);
                      } else if (index == 3) {
                        Get.toNamed(RouteHelper.favoritesPage);
                      }
                      ;
                    },
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            height: 200,
                            width: 100,
                            // alignment: index==3?Alignment(0, -1):null,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(imgs[index]),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                          bottom: 3,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.appBarColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(2, 3),
                                      blurRadius: 3),
                                  BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(-2, 3))
                                ]),
                            child: Center(
                                child: BigText(
                              text: topics[index],
                              size: 20,
                            )),
                          ),
                        )
                      ],
                    ),
                  );
                });
              }),
            ),
          )
        ],
      ),
    );
  }
}

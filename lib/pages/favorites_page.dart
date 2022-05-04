import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughts_flutter/data/controller/favorites_controller.dart';
import 'package:thoughts_flutter/data/controller/motivation_controller.dart';
import 'package:thoughts_flutter/routes/route_helper.dart';
import 'package:thoughts_flutter/widgets/app_bar.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.85);

    return GetBuilder<FavoritesController>(builder: (favController) {
      return GetBuilder<MotivationController>(builder: (motivController) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: AppBar0(topic: "Favorites"),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: favController.favorites.isEmpty
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 100),
                        margin: EdgeInsets.symmetric(horizontal: 120),
                        child: Image.asset('assets/images/no_favorites.png'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SmallText(
                        text: "No Favorites",
                        size: 30,
                        color: Color.fromARGB(240, 255, 255, 255),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SmallText(
                        text: "Click the '+' button to get started",
                        size: 18,
                        color: Colors.white54,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: Color.fromARGB(255, 66, 64, 64),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: IconButton(
                            iconSize: 80,
                            onPressed: () async {
                              Get.toNamed(RouteHelper.motivationPage);
                              await motivController.loadTrue();
                              await Future.delayed(Duration(seconds: 4));
                              await motivController.loadFalse();
                            },
                            icon: Icon(
                              Icons.add,
                            )),
                      )
                    ],
                  )
                : ListView.builder(
                    controller: pageController,
                    itemCount: favController.favorites.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return Dialog(
                                        insetPadding: EdgeInsets.symmetric(
                                            vertical: 100, horizontal: 20),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,

                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: Center(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Container(
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          favController
                                                              .favorites[index],
                                                          fit: BoxFit.cover,
                                                        ))),
                                              )),
                                              // child: Container(
                                              //   margin: EdgeInsets.only(
                                              //       top: 10, left: 10, right: 10),
                                              //   width: 400,
                                              //   height: 600,
                                              //   decoration: BoxDecoration(
                                              //       image: DecorationImage(
                                              //           image: NetworkImage(motivController.pics[index].urls),
                                              //           fit: BoxFit.cover)),
                                              // ),
                                            ),
                                            
                                          ],
                                        ));
                                  });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: NetworkImage(
                                        favController.favorites[index]),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Positioned(
                              bottom: 10,
                              left: 20,
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  await favController.deleteItem(index);
                                },
                              ))
                        ],
                      );
                    }),
          ),
          floatingActionButton: favController.favorites.isEmpty
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FloatingActionButton(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 77, 74, 74),
                    child: Icon(Icons.add),
                    onPressed: () async {
                      Get.toNamed(RouteHelper.motivationPage);
                      await motivController.loadTrue();
                      await Future.delayed(Duration(seconds: 4));
                      await motivController.loadFalse();
                    },
                  )),
        );
      });
    });
  }
}

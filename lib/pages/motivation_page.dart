import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:thoughts_flutter/data/controller/favorites_controller.dart';
import 'package:thoughts_flutter/data/controller/motivation_controller.dart';
import 'package:thoughts_flutter/utils/app_colors.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/app_bar.dart';

class MotivationPage extends StatefulWidget {
  const MotivationPage({Key? key}) : super(key: key);

  @override
  State<MotivationPage> createState() => _PictursePageState();
}

class _PictursePageState extends State<MotivationPage> {
  @override
  Widget build(BuildContext context) {
    PageController _gridController = PageController();
    bool _favBool = false;

    var favoritesList = [];

    // List<String> imgs = [
    //   '1.jpg',
    //   '11.jpg',
    //   '12.jpg',
    //   '3.jpg',
    //   '4.jpg',
    //   '6.jpg',
    //   '7.jpg',
    //   '8.jpg',
    //   '9.jpg',
    //   'Be-Unique-Motivational-Wallpaper.jpg',
    //   'Believe-In-Your-Self-Wallpaper-886x1920.jpg',
    //   'Broken-Heart-Wallpaper-1080x2340.jpg',
    //   'hester-qiang-95t94hZTESw-unsplash.jpg',
    //   'pexels-binti-malu-1485657.jpg',
    //   'pexels-designecologist-887353.jpg',
    //   'pexels-eva-elijas-6956352.jpg',
    //   'pexels-lisa-fotios-1485548.jpg',
    //   'pexels-mikechie-esparagoza-1742370.jpg'
    // ];
    // _loadQuestions() async {
    //   await rootBundle
    //       .loadString('assets/images/motivImg/filenames.txt')
    //       .then((n) {
    //     for (String i in LineSplitter().convert(n)) {
    //       imgs.add(i.toString());
    //     }
    //     print(imgs.length);
    //   });
    // }
    // print(imgs.length);

    // print(imgs.length.toString());
    return GetBuilder<MotivationController>(builder: (motivController) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar0(topic: "Motivational Thoughts"),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          // width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            // child: Column(
            //   children: List.generate(imgs.length, (index) {
            //     return GestureDetector(
            //       // onTapCancel: (() {
            //       //   FocusManager.instance.primaryFocus?.unfocus();
            //       // }),
            //       onTap: () {
            //         showDialog(
            //             context: context,
            //             builder: (_) {
            //               return Dialog(
            //                   insetPadding: EdgeInsets.symmetric(
            //                       vertical: 100, horizontal: 20),
            //                   child: Column(
            //                     children: [
            //                       Flexible(
            //                         child: Container(
            //                           margin: EdgeInsets.only(
            //                               top: 10, left: 10, right: 10),
            //                           width: 400,
            //                           height: 600,
            //                           decoration: BoxDecoration(
            //                               image: DecorationImage(
            //                                   image: AssetImage(imgs[index]),
            //                                   fit: BoxFit.cover)),
            //                         ),
            //                       ),
            //                       // Container(
            //                       //   // color: Colors.black,
            //                       //   height: 60,
            //                       //   child: Container(
            //                       //     padding: EdgeInsets.only(right: 20),
            //                       //     decoration: BoxDecoration(),
            //                       //     child: Container(
            //                       //       child: ButtonBar(
            //                       //         children: [
            //                       //           IconButton(
            //                       //               hoverColor: Colors.yellow,
            //                       //               onPressed: ()  {
            //                       //                  Share.share("text");
            //                       //               },
            //                       //               icon: Icon(Icons.share),
            //                       //               color: Color.fromARGB(
            //                       //                   255, 12, 218, 19),
            //                       //               iconSize: 30),
            //                       //           SizedBox(
            //                       //             width: 20,
            //                       //           ),
            //                       //           IconButton(
            //                       //               hoverColor: Colors.yellow,
            //                       //               onPressed: () {},
            //                       //               icon: Icon(Icons.favorite),
            //                       //               color: Color.fromARGB(
            //                       //                   255, 12, 218, 19),
            //                       //               iconSize: 35),
            //                       //         ],
            //                       //       ),
            //                       //     ),
            //                       //   ),
            //                       // )
            //                     ],
            //                   ));
            //             });
            //       },
            //       child: index.isOdd
            //           ? Container(
            //               padding: EdgeInsets.all(10),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Container(
            //                     width: MediaQuery.of(context).size.width / 2 -
            //                         20,
            //                     child: Column(
            //                       children: [
            //                         ClipRRect(
            //                             borderRadius:
            //                                 BorderRadius.circular(20),
            //                             child: Image(
            //                               image: AssetImage(
            //                                 imgs[index],
            //                               ),
            //                               fit: BoxFit.cover,
            //                             ))
            //                       ],
            //                     ),
            //                   ),
            //                   Container(
            //                     width: MediaQuery.of(context).size.width / 2 -
            //                         20,
            //                     child: Column(
            //                       children: [
            //                         index == imgs.length - 1
            //                             ? Container()
            //                             : ClipRRect(
            //                                 borderRadius:
            //                                     BorderRadius.circular(20),
            //                                 child: Image(
            //                                     image: AssetImage(
            //                                         imgs[index + 1])),
            //                               )
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             )
            //           : Container(),
            //     );
            //   }),
            // ),

            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        children:
                            List.generate(motivController.pics.length, (index) {
                      return GetBuilder<FavoritesController>(
                          builder: (favController) {
                        return GestureDetector(
                          // onTapCancel: (() {
                          //   FocusManager.instance.primaryFocus?.unfocus();
                          // }),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return Dialog(
                                      insetPadding: EdgeInsets.symmetric(
                                          vertical: 100, horizontal: 20),
                                      child: Column(
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Center(
                                                child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Container(
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        motivController
                                                            .pics[index].urls,
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
                                          Container(
                                            // color: Colors.black,
                                            height: 80,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              decoration: BoxDecoration(
                                                  color: AppColors.appBarColor),
                                              child: Container(
                                                child: ButtonBar(
                                                  children: [
                                                    IconButton(
                                                        hoverColor:
                                                            Colors.yellow,
                                                        onPressed: () {
                                                          Share.share(
                                                              motivController
                                                                  .pics[index]
                                                                  .urls);
                                                        },
                                                        icon: Icon(Icons.share),
                                                        color: Color.fromARGB(
                                                            255, 12, 218, 19),
                                                        iconSize: 30),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    IconButton(
                                                        hoverColor:
                                                            Colors.yellow,
                                                        onPressed: () async {
                                                          await favController
                                                              .getFavorite(
                                                                  motivController
                                                                      .pics[
                                                                          index]
                                                                      .urls);
                                                          setState(() {
                                                            
                                                          });
                                                        },
                                                        icon: Icon(
                                                            Icons.favorite),
                                                        color: favController
                                                                .favoritesCheck(
                                                                    motivController
                                                                        .pics[
                                                                            index]
                                                                        .urls)
                                                            ? Colors.red
                                                            : Colors.green,
                                                        iconSize: 35),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                                });
                          },
                          child: index.isEven
                              ? Container(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      20,
                                  margin:
                                      index == motivController.pics.length - 1
                                          ? EdgeInsets.only(
                                              top: 10, right: 5, bottom: 10)
                                          : EdgeInsets.only(top: 10, right: 5),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image(
                                            image: NetworkImage(
                                              motivController.pics[index].urls,
                                            ),
                                            fit: BoxFit.cover,
                                          ))
                                    ],
                                  ),
                                )
                              : Container(),
                        );
                      });
                    })),
                    Column(
                        children:
                            List.generate(motivController.pics.length, (index) {
                      return GetBuilder<FavoritesController>(
                          builder: (favController) {
                        return GestureDetector(
                        // onTapCancel: (() {
                        //   FocusManager.instance.primaryFocus?.unfocus();
                        // }),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return Dialog(
                                      insetPadding: EdgeInsets.symmetric(
                                          vertical: 100, horizontal: 20),
                                      child: Column(
                                        children: [
                                          Flexible(
                                            flex: 2,
                                            child: Center(
                                                child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Container(
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        motivController
                                                            .pics[index].urls,
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
                                          Container(
                                            // color: Colors.black,
                                            height: 80,
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              decoration: BoxDecoration(
                                                  color: AppColors.appBarColor),
                                              child: Container(
                                                child: ButtonBar(
                                                  children: [
                                                    IconButton(
                                                        hoverColor:
                                                            Colors.yellow,
                                                        onPressed: () {
                                                          Share.share(
                                                              motivController
                                                                  .pics[index]
                                                                  .urls);
                                                        },
                                                        icon: Icon(Icons.share),
                                                        color: Color.fromARGB(
                                                            255, 12, 218, 19),
                                                        iconSize: 30),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    IconButton(
                                                        hoverColor:
                                                            Colors.yellow,
                                                        onPressed: () async {
                                                          await favController
                                                              .getFavorite(
                                                                  motivController
                                                                      .pics[
                                                                          index]
                                                                      .urls);
                                                          setState(() {
                                                            _favBool =
                                                                !_favBool;
                                                          });
                                                        },
                                                        icon: Icon(
                                                            Icons.favorite),
                                                        color: favController.favoritesCheck(motivController
                                                                        .pics[
                                                                            index]
                                                                        .urls)
                                                            ? Colors.red
                                                            : Colors.green,
                                                        iconSize: 35),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                              });
                        },
                        child: index.isOdd
                            ? Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                margin: index == motivController.pics.length - 1
                                    ? EdgeInsets.only(
                                        top: 10, left: 5, bottom: 10)
                                    : EdgeInsets.only(top: 10, left: 5),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: NetworkImage(
                                            motivController.pics[index].urls,
                                          ),
                                          fit: BoxFit.cover,
                                        ))
                                  ],
                                ),
                              )
                            : Column(),
                      );
                      });
                    }))
                  ],
                ),
                motivController.loadMore
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: CircularProgressIndicator())
                    : Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          child: Text(
                            'Load more',
                          ),
                          onPressed: () async {
                            await motivController.incrementPage();
                            print(motivController.loadMore);
                            await Future.delayed(Duration(milliseconds: 2500));
                            await motivController.loadFalse();
                            print(motivController.loadMore);
                            ;
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}

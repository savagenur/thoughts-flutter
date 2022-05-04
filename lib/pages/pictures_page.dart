import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/app_bar.dart';

class PicturesPage extends StatefulWidget {
  const PicturesPage({Key? key}) : super(key: key);

  @override
  State<PicturesPage> createState() => _PictursePageState();
}

class _PictursePageState extends State<PicturesPage> {
  @override
  Widget build(BuildContext context) {
    PageController _gridController = PageController();
    List<String> imgs = [
      "assets/images/img1.jpg",
      "assets/images/img2.jpg",
      "assets/images/img3.jpg",
      "assets/images/img4.jpg",
      "assets/images/img5.jpg",
      "assets/images/img6.jpg",
      "assets/images/img7.jpg",
      "assets/images/img8.jpg",
      "assets/images/img9.jpg",
      "assets/images/img10.png",
      "assets/images/img11.jpg",
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar0(topic: "Thoughts In Pics"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5),
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          controller: _gridController,
          // physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: EdgeInsets.symmetric(horizontal: 5),
          crossAxisCount: 2,
          children: List.generate(imgs.length, (index) {
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
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  width: 400,
                                  height: 600,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(imgs[index]),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Container(
                                // color: Colors.black,
                                height: 60,
                                child: Container(
                                  padding: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    child: ButtonBar(
                                      children: [
                                        IconButton(
                                            hoverColor: Colors.yellow,
                                            onPressed: ()  {
                                               Share.share("text");
                                            },
                                            icon: Icon(Icons.share),
                                            color: Color.fromARGB(
                                                255, 12, 218, 19),
                                            iconSize: 30),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconButton(
                                            hoverColor: Colors.yellow,
                                            onPressed: () {},
                                            icon: Icon(Icons.favorite),
                                            color: Color.fromARGB(
                                                255, 12, 218, 19),
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
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

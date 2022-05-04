import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/files.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:thoughts_flutter/data/controller/motivation_controller.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/app_bar.dart';

class MotivationPage2 extends StatefulWidget {
  const MotivationPage2({Key? key}) : super(key: key);

  @override
  State<MotivationPage2> createState() => _PictursePageState();
}

class _PictursePageState extends State<MotivationPage2> {
  @override
  Widget build(BuildContext context) {
    PageController _gridController = PageController();

    List<String> imgs = [];
    Future<List<String>> _loadQuestions() async {
      await rootBundle
          .loadString('assets/images/motivImg/filenames.txt')
          .then((n) {
        for (String i in LineSplitter().convert(n)) {
          imgs.add(i);
        }
      });
      print(imgs);
      return imgs;
    }


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar0(topic: "Motivational Thoughts"),
      ),
      body: GetBuilder<MotivationController>(builder: (motivController) {
        return Scaffold(
          body: Container(
            child: ListView.builder(
              itemCount: motivController.pics.length,
              itemBuilder: (context, index) {
                return index == motivController.pics.length - 1
                    ? Column(
                        children: [
                          Container(
                            child:
                                Image.network(motivController.pics[index].urls),
                          ),
                          motivController.loadMore
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  child: Text(
                                    'Load more',
                                  ),
                                  onPressed: () async {
                                    await motivController.incrementPage();
                                    print(motivController.loadMore);
                                    await Future.delayed(
                                        Duration(milliseconds: 2500));
                                    setState(() {
                                       motivController.loadFalse();
                                      print(motivController.loadMore);
                                    });
                                  },
                                )
                        ],
                      )
                    : Container(
                        child: Image.network(motivController.pics[index].urls),
                      );
              },
            ),
          ),
        );
      }),
    );
  }
}

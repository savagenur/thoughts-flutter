import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:thoughts_flutter/data/repository/motivation_repo.dart';
import 'package:thoughts_flutter/models/motivation_images_model.dart';
import 'package:http/http.dart' as http;
import 'package:thoughts_flutter/utils/dimensions.dart';

class MotivationController extends GetxController {
  

  final MotivationRepo motivationRepo;

  String apiKey = 'chkR2tOaSMxSUgaBKkizzHzmBTAX0uKqXvb6AB06hAs';
  int _page = Dimensions.randomPage.nextInt(50);
  int get page => _page;

  bool _loadMore = false;
  bool get loadMore => _loadMore;

  MotivationController({required this.motivationRepo});

  List<Results> _results = [];
  List<Results> get results => _results;

  List<Pics> _pics = [];
  List<Pics> get pics => _pics;

  Future<void> getResultsList() async {
    Response response = await motivationRepo.getData();
    if (response.statusCode == 200) {
      _results = [];
      _results.addAll(MotivationImages.fromJson(response.body).results);
    }
  }

  Future<void> getPics() async {
    await loadTrue();
    String url =
        'https://api.unsplash.com/search/photos?page=${_page}&query=motivational-quotes&client_id=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    _pics = [];
    List<dynamic> data = jsonData["results"];

    for (var u in data) {
      Pics pic = Pics(u['urls']['small']);
      _pics.add(pic);
    }
    // Same thing for page2
    await incrementPage();
    update();
    await loadFalse();
  }

  incrementPage() async {
    // await Future.delayed(Duration(milliseconds: 1500));
    _page++;
    String url =
        'https://api.unsplash.com/search/photos?page=${_page}&query=motivational-quotes&client_id=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);

    List<dynamic> data = jsonData["results"];

    for (var u in data) {
      Pics pic = Pics(u['urls']['small']);
      _pics.add(pic);
    }
    // print(data[0]['urls']['regular']);

    update();
    _loadMore = true;
    return _loadMore;
  }

  loadFalse() async {
    _loadMore = false;
    update();
  }

  loadTrue() async {
    _loadMore = true;
    update();
  }
}

class Pics {
  final String urls;

  Pics(this.urls);
}

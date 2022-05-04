import 'package:get/get.dart';
import 'package:thoughts_flutter/pages/favorites_page.dart';
import 'package:thoughts_flutter/pages/inspiration_page.dart';
import 'package:thoughts_flutter/pages/main_page.dart';
import 'package:thoughts_flutter/pages/motivation_page2.dart';
import 'package:thoughts_flutter/pages/pictures_page.dart';
import 'package:thoughts_flutter/pages/thought_of_day_page.dart';
import 'package:thoughts_flutter/pages/welcome_page.dart';

import '../pages/motivation_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String mainPage = '/main-page';
  static const String insPage = '/ins-page';
  static const String thoughtOfDayPage = '/thought-of-day-page';
  static const String picturesPage = '/pictures-page';
  static const String favoritesPage = '/favorites-page';
  static const String motivationPage = '/motivation-page';

  static String getInitial() => '$initial';
  static String getMainPage() => '$mainPage';
  static String getInsPage() => '$insPage';
  static String getThoughtOfDayPage() => '$thoughtOfDayPage';
  static String getPicuresPage() => '$picturesPage';
  static String getFavoritesPage() => '$favoritesPage';
  static String getMotivationPage() => '$motivationPage';

  static List<GetPage> routes = [
    GetPage(
        transition: Transition.fadeIn,
        name: initial,
        page: () {
          return WelcomePage();
        }),
    GetPage(
        name: mainPage,
        transition: Transition.rightToLeft,
        page: () {
          return MainPage();
        }),
    GetPage(
        transition: Transition.fadeIn,
        name: insPage,
        page: () {
          return InspirationPage();
        }),
    GetPage(
        transition: Transition.fadeIn,
        name: thoughtOfDayPage,
        page: () {
          return ThoughtOfDayPage();
        }),
    GetPage(
        transition: Transition.fadeIn,
        name: picturesPage,
        page: () {
          return PicturesPage();
        }),
    GetPage(
        transition: Transition.fadeIn,
        name: favoritesPage,
        page: () {
          return FavoritesPage();
        }),
    GetPage(
        transition: Transition.fadeIn,
        name: motivationPage,
        page: () {
          return MotivationPage();
        }),
  ];
}


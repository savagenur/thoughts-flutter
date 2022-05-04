import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuItems {
  static final List<MenuItem> itemsFirst = [
    itemSettings,
    itemShare,
  ];
  static final List<MenuItem> itemsSecond = [
    itemExit,
  ];

  static var itemSettings = MenuItem(text: "Settings", icon: Icons.settings);
  static var itemShare = MenuItem(text: "Share", icon: Icons.share);
  static var itemFav = MenuItem(text: "Favorites", icon: Icons.favorite);

  static var itemExit = MenuItem(text: "Exit", icon: Icons.logout);
}

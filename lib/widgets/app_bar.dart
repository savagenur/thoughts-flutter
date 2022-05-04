import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:thoughts_flutter/data/menu_items.dart';
import 'package:thoughts_flutter/models/menu_item.dart';
import 'package:thoughts_flutter/pages/favorites_page.dart';
import 'package:thoughts_flutter/pages/main_page.dart';
import 'package:thoughts_flutter/pages/settings/settings_page.dart';
import 'package:thoughts_flutter/pages/settings/share_page.dart';
import 'package:thoughts_flutter/pages/thought_of_day_page.dart';
import 'package:thoughts_flutter/pages/welcome_page.dart';
import 'package:thoughts_flutter/widgets/small_text.dart';

import '../utils/app_colors.dart';
import 'main_text.dart';

enum _MenuValues {
  settings,
  share,
  favorites,
  exit,
}

class AppBar0 extends StatelessWidget {
  final String topic;
  const AppBar0({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 44, 43, 43),
              offset: Offset(2, 2),
              blurRadius: 3),
          BoxShadow(
              color: Color.fromARGB(255, 28, 27, 27), offset: Offset(-2, 2))
        ],
        color: AppColors.appBarColor,
      ),
      height: 100,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MainText(text: topic),
            // Container(
            //     padding: EdgeInsets.only(top: 15),
            //     child: GestureDetector(
            //       onTap: () {

            //       },
            //       child: Icon(
            //         Icons.menu,
            //         size: 30,
            //       ),
            //     ))

            // PopupMenuButton<MenuItem>(

            //   padding: EdgeInsets.only(top: 15),
            //   iconSize: 30,
            //   itemBuilder: (context) => [
            //     ...MenuItems.itemsFirst.map(buildItem).toList(),
            //   ],
            // )

            PopupMenuButton<_MenuValues>(
                padding: EdgeInsets.only(top: 15),
                iconSize: 30,
                onSelected: (value) {
                  switch (value) {
                    case _MenuValues.settings:
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (c) => SettingsPage()));
                      break;
                    case _MenuValues.share:
                      Share.share('text');
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (builder) => SharePage()));
                      break;
                    case _MenuValues.favorites:
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (c) => FavoritesPage()));
                      break;
                    case _MenuValues.exit:
                      exit(0);
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                          value: _MenuValues.favorites,
                          child: Row(
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(
                                width: 10,
                              ),
                              SmallText(text: "Favorites"),
                            ],
                          )),
                      PopupMenuItem(
                          value: _MenuValues.settings,
                          child: Row(
                            children: [
                              Icon(Icons.settings),
                              SizedBox(
                                width: 10,
                              ),
                              SmallText(text: "Settings"),
                            ],
                          )),
                      PopupMenuItem(
                          value: _MenuValues.share,
                          child: Row(
                            children: [
                              Icon(Icons.share),
                              SizedBox(
                                width: 10,
                              ),
                              SmallText(text: "Share"),
                            ],
                          )),
                      PopupMenuDivider(),
                      PopupMenuItem(
                          value: _MenuValues.exit,
                          child: Row(
                            children: [
                              Icon(Icons.logout),
                              SizedBox(
                                width: 10,
                              ),
                              SmallText(text: "Exit"),
                            ],
                          )),
                    ])
          ],
        ),
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) {
    return PopupMenuItem(
      value: item,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(item.icon),
          SizedBox(
            width: 10,
          ),
          SmallText(text: item.text)
        ],
      ),
    );
  }
}
